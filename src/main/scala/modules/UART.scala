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

class UartIO() extends Bundle {
  val enq = Decoupled(UInt(8.W))
  val deq = Flipped(Decoupled(UInt(8.W)))
}

class UART extends Module {

    val io = IO(new Bundle {

        val ctl = Flipped(new UartIO())
        val rxd = Input(Bool())
        val txd = Output(Bool())
        //val deq = Decoupled(UInt(BYTE_SIZE))
        //val enq = Flipped(Decoupled(UInt(BYTE_SIZE)))
    })

    val tx = Module(new BufferedTx)
    val rx = Module(new BufferedRx)

    tx.io.txd <> io.txd
    rx.io.rxd <> io.rxd
    tx.io.enq <> io.ctl.enq
    rx.io.deq <> io.ctl.deq

    /*
    rx.io.rxd   := io.rxd
    tx.io.enq   := io.enq
    io.deq      := rx.io.deq
    io.txd      := tx.io.txd
    */
}



class Tx extends Module {
    val io = IO(new Bundle {
        val enq  = Flipped(Decoupled(UInt(BYTE_SIZE)))       
        val txd  = Output(Bool())
    })

    val TICK_MAX  = (FREQ/BAUD).U 
    
    val idle :: sending = Enum(11)  // 2 or 1 stop bit?

    val data      = RegInit(UInt(9.W), "b111111111".U) 
    val ticks     = RegInit(UInt(WORD_SIZE), ZERO)
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
        val deq = Decoupled(UInt(BYTE_SIZE))
    })

    val TICK_MAX  = (FREQ/BAUD).U 
    val TICK_HALF = TICK_MAX/2.U 

    val idle :: stop :: reading = Enum(11)  

    val data      = RegInit(UInt(9.W), "b000000000".U) 
    val ticks     = RegInit(UInt(WORD_SIZE), TICK_HALF)
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

class BufferedTx extends Module {
    val io = IO(new Bundle {    
        val enq = Flipped(Decoupled(UInt(BYTE_SIZE)))
        val cnt = Output(UInt(6.W))
        val txd = Output(Bool())
    })
    
    // move entries (16) to Constant.scala
    val queue1 = Module(new Queue(UInt(8.W), 16)) 
    val queue2 = Module(new Queue(UInt(8.W), 16)) 
    val tx     = Module(new Tx)

    queue1.io.enq <> io.enq
    queue2.io.enq <> queue1.io.deq
    tx.io.enq     <> queue2.io.deq
    io.txd        <> tx.io.txd
    io.cnt        <> queue1.io.count
}

class BufferedRx extends Module {
    val io = IO(new Bundle {
        val rxd = Input(Bool())
        val deq = Decoupled(UInt(BYTE_SIZE))
        val cnt = Output(UInt(6.W))
    })
    
    // move entries (16) to Constant.scala
    val queue = Module(new Queue(UInt(BYTE_SIZE), 16)) 
    val rx    = Module(new Rx)

    queue.io.enq <> rx.io.deq
    io.deq       <> queue.io.deq
    io.rxd       <> rx.io.rxd
    io.cnt       <> queue.io.count
}


//  following is from: 
// (https://github.com/schoeberl/chisel-examples/blob/master/examples/src/main/scala/uart/Uart.scala)
//  Send 'hello'.  
/* 
class Sender(frequency: Int, baudRate: Int) extends Module {
  val io = new Bundle {
    val txd = Bits(OUTPUT, 1)    
  }
  
  val tx = Module(new BufferedTx(frequency, baudRate))
  
  io.txd := tx.io.txd
  
  // This is not super elegant
  val hello = Array[Bits](Bits('H'), Bits('e'), Bits('l'), Bits('l'), Bits('o'))
  val text = Vec[Bits](hello)

  val cntReg = Reg(init = UInt(0, 3))
  
  tx.io.channel.data := text(cntReg)
  tx.io.channel.valid := cntReg =/= UInt(5)
  
  when (tx.io.channel.ready && cntReg =/= UInt(5)) {
    cntReg := cntReg + UInt(1)
  }
}
*/