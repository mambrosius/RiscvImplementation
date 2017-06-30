// UART -- serial port, RS232 standard 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 1.0 (May 2017)
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
        val rxd    = Input(Bool())
        val in     = Input(UInt(BYTE_W))
        val out    = Output(UInt(BYTE_W))
        val txd    = Output(Bool())
        val tx_req = Output(Bool())
    })

    val rx  = Module(new Rx)
    val tx  = Module(new Tx)
    val reg = RegInit(UInt(BYTE_W), ZERO)
    
    rx.io.rxd := io.rxd
    tx.io.enq.valid := reg =/= ZERO

    when (reg === ZERO) {
        when (io.in =/= ZERO) { reg := io.in }
    } .elsewhen (tx.io.enq.ready) {
        tx.io.enq.bits := reg
    } .otherwise {
        reg := ZERO   
    }

    io.tx_req := !tx.io.enq.ready ||  (reg =/= ZERO && tx.io.enq.ready) 
    io.txd    := tx.io.txd 
    io.out    := rx.io.deq.bits
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

    val data      = RegInit(UInt(9.W), "b111111111".U) 
    val ticks     = RegInit(UInt(WORD_W), TICK_HALF)
    val state     = RegInit(idle)
    val valid     = RegInit(Bool(), TRUE)

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

    when (valid && (data(7, 0) =/= ZERO)) {
        io.deq.bits  := data(7, 0)
        data := ZERO
    } .otherwise {
        io.deq.bits  := ZERO
    }
}