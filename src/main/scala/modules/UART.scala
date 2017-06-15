// UART -- serial port, RS232 standard 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (May 2017)
//
// modified from: 
//  https://github.com/nyuichi/chisel-uart/blob/master/src/main/scala/Uart.scala

package modules

import chisel3._
import chisel3.util._
import utils.Constants._

object UART extends App { 
    chisel3.Driver.execute(args, () => new UART)
}

class UART extends Module {

    val io = IO(new Bundle {
        //val rxd = Input(Bool())
        //val deq = Decoupled(UInt(BYTE_SIZE))
        
        val in    = Input(UInt(BYTE_W))
        val valid = Output(Bool())
        val txd   = Output(Bool())
        
        // test -----------------------------

        //val data = Output(UInt(BYTE_SIZE))
        //val cnt  = Output(UInt(5.W))
        
        val r0 = Output(UInt(BYTE_W))
        val r1 = Output(UInt(BYTE_W))
        val r2 = Output(UInt(BYTE_W))
        val r3 = Output(UInt(BYTE_W))
    })

    val tx = Module(new Tx)
    //val rx = Module(new BufferedRx)

    val q   = RegInit(Vec(Seq.fill(4)(0.asUInt(BYTE_W))))
    val ptr = RegInit(UInt(2.W), ZERO)
    val cnt = RegInit(UInt(2.W), ZERO)
    val i   = RegInit(UInt(4.W), ptr + cnt)

    i := ptr + cnt
    
    io.r0 := q(0.U)
    io.r1 := q(1.U)
    io.r2 := q(2.U)
    io.r3 := q(3.U)

    when (io.in =/= 0.U && cnt =/= 4.U) {    
        q(i) := io.in
        cnt  := cnt + 1.U
    }

    when (tx.io.enq.ready && cnt =/= 0.U) {
        tx.io.enq.bits := q(ptr)
        cnt := cnt - 1.U
        // q(ptr) := 0.U
        ptr := ptr + 1.U    
    } 

    tx.io.enq.valid := cnt =/= 0.U


    when ((io.in =/= 0.U || cnt =/= 0.U) && tx.io.enq.ready) {
        io.valid := FALSE
    } .otherwise {
        io.valid := tx.io.enq.ready    
    }

    io.txd  <> tx.io.txd    
    //io.data := q(ptr)
}

class Tx extends Module {
    val io = IO(new Bundle {
        val enq  = Flipped(Decoupled(UInt(BYTE_W)))       
        val txd  = Output(Bool())
    })

    val TICK_MAX  = (FREQ/BAUD).U 
    
    val idle :: sending = Enum(12)

    val data      = RegInit(UInt(9.W), "b111111111".U) 
    val ticks     = RegInit(UInt(WORD_W), ZERO)
    val state     = RegInit(idle)

    io.enq.ready := state === idle

    switch (state) {
        is (idle) {
            when (io.enq.valid) {
                data  := Cat(io.enq.bits, "b0".U)
                ticks := ZERO
                state := sending.last
            }   
        } 
        
        is (sending) {
            when (ticks === TICK_MAX) {
                data  := Cat("b1".U, data >> 1)
                ticks := ZERO
                state := state - 1.U
            } .otherwise {
                ticks := ticks + 1.U
            }
        }
    }
    io.txd := data(0)
}

class Rx extends Module {
    val io = IO(new Bundle {
        val rxd = Input(Bool())
        val deq = Decoupled(UInt(BYTE_W))
    })

    val TICK_MAX  = (FREQ/BAUD).U 
    val TICK_HALF = TICK_MAX/2.U 

    val idle :: stop :: reading = Enum(11)  

    val data      = RegInit(UInt(9.W), "b000000000".U) 
    val ticks     = RegInit(UInt(WORD_W), TICK_HALF)
    val state     = RegInit(idle)
    val valid     = RegInit(Bool(), FALSE)

    when (valid && io.deq.ready) {
        valid := FALSE
    }

    switch (state) {
        is (idle) {
            when (io.rxd === ZERO) {
                when (ticks != ZERO) {
                    ticks := ticks - 1.U
                } .otherwise {
                    ticks := TICK_MAX
                    state := reading.last
                    valid := FALSE
                }
            }
        }
    
        is (reading) {
            when (ticks === ZERO) {
                data  := Cat(io.rxd, data >> 1)
                ticks := TICK_MAX
                state := state - 1.U
            } .otherwise {
                ticks := ticks - 1.U
            }
        }
    
        is (stop) {
            when (ticks === TICK_HALF) {
                ticks := ticks - 1.U
                state := idle
                valid := TRUE
            } .otherwise {
                ticks := ticks - 1.U
            }
        }
    }

    io.deq.valid := valid
    io.deq.bits  := data(7, 0)
}

/*
class BufferedTx extends Module {
    val io = IO(new Bundle {    
        val enq = Flipped(Decoupled(UInt(BYTE_SIZE)))
        val cnt = Output(UInt(6.W))
        val txd = Output(Bool())
    })
    
    val q  = Module(new Queue(UInt(BYTE_SIZE), 16)) // move entries (16) to Constant.scala
    val tx = Module(new Tx)

    q.io.enq  <> io.enq
    tx.io.enq <> q.io.deq
    io.txd    <> tx.io.txd
    io.cnt    <> q.io.count
} */

class BufferedRx extends Module {
    val io = IO(new Bundle {
        val rxd = Input(Bool())
        val deq = Decoupled(UInt(BYTE_W))
        val cnt = Output(UInt(6.W))
    })
    
    val queue = Module(new Queue(UInt(BYTE_W), 16)) // move entries (16) to Constant.scala
    val rx    = Module(new Rx)

    queue.io.enq <> rx.io.deq
    io.deq       <> queue.io.deq
    io.rxd       <> rx.io.rxd
    io.cnt       <> queue.io.count
}