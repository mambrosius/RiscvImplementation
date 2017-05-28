// UART -- serial port, RS232 standard 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (May 2017)
//
// modified from: 
//  https://github.com/nyuichi/chisel-uart/blob/master/src/main/scala/Uart.scala

import chisel3._
import chisel3.util._

object UART extends App { 
    chisel3.Driver.execute(args, () => new UART)
}

class UART extends Module {

    val io = IO(new Bundle {
        val rxd = Input(Bool())
        val txd = Output(Bool())
        val enq = Decoupled(UInt(8.W))
        val deq = Flipped(Decoupled(UInt(8.W)))
    })

    val tx = Module(new BufferedTx)
    val rx = Module(new BufferedRx)

    tx.io.txd <> io.txd
    rx.io.rxd <> io.rxd
    tx.io.enq <> io.deq
    rx.io.deq <> io.enq
}

class Tx extends Module {
    val io = IO(new Bundle {
        val enq  = Flipped(Decoupled(UInt(8.W)))       
        val txd  = Output(Bool())
    })

    val FREQ      = 50000000        // TODO: Add to Constant.scala
    val BAUD      = 300          // TODO: Add to Constant.scala
    val TICK_MAX  = (FREQ/BAUD).U 
    
    val idle :: sending = Enum(11)  // 2 or 1 stop bit?

    val data      = RegInit(UInt(9.W), "b111111111".U) 
    val ticks     = RegInit(UInt(32.W), 0.U)
    val state     = RegInit(idle)

    io.enq.ready := state === idle

    switch (state) {
        is (idle) {
            when (io.enq.valid) {
                data  := Cat(io.enq.bits, "b0".U)
                ticks := 0.U
                state := sending.last
            }   
        } 
        
        is (sending) {
            when (ticks === TICK_MAX) {
                data  := Cat("b1".U, data >> 1)
                ticks := 0.U
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
        val deq = Decoupled(UInt(8.W))
    })

    val FREQ      = 50000000     // TODO: Add to Constant.scala
    val BAUD      = 300          // TODO: Add to Constant.scala
    val TICK_MAX  = (FREQ/BAUD).U 
    val TICK_HALF = TICK_MAX/2.U 

    val idle :: stop :: reading = Enum(11)  

    val data      = RegInit(UInt(9.W), "b000000000".U) 
    val ticks     = RegInit(UInt(32.W), TICK_HALF)
    val state     = RegInit(idle)
    val valid     = RegInit(Bool(), false.B)

    when (valid && io.deq.ready) {
        valid := false.B
    }

    switch (state) {
        is (idle) {
            when (io.rxd === 0.U) {
                when (ticks != 0.U) {
                    ticks := ticks - 1.U
                } .otherwise {
                    ticks := TICK_MAX
                    state := reading.last
                    valid := false.B
                }
            }
        }
    
        is (reading) {
            when (ticks === 0.U) {
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
                valid := true.B
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
        val enq = Flipped(Decoupled(UInt(8.W)))
        val cnt = Output(UInt(6.W))
        val txd = Output(Bool())
    })
    
    // move entries (16) to Constant.scala
    val queue = Module(new Queue(UInt(8.W), 16)) 
    val tx    = Module(new Tx)

    queue.io.enq <> io.enq
    tx.io.enq    <> queue.io.deq
    io.txd       <> tx.io.txd
    io.cnt       <> queue.io.count
}

class BufferedRx extends Module {
    val io = IO(new Bundle {
        val rxd = Input(Bool())
        val deq = Decoupled(UInt(8.W))
        val cnt = Output(UInt(6.W))
    })
    
    // move entries (16) to Constant.scala
    val queue = Module(new Queue(UInt(8.W), 16)) 
    val rx    = Module(new Rx)

    queue.io.enq <> rx.io.deq
    io.deq       <> queue.io.deq
    io.rxd       <> rx.io.rxd
    io.cnt       <> queue.io.count
}



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
















class BufferedTxTester(dut: BufferedTx) extends Tester(dut) {

  step(2)
  poke(dut.io.channel.valid, 1)
  poke(dut.io.channel.data, 'A')
  // now we have a buffer, keep valid only a single cycle
  step(1)
  poke(dut.io.channel.valid, 0)
  poke(dut.io.channel.data, 0)
  step(40)
  poke(dut.io.channel.valid, 1)
  poke(dut.io.channel.data, 'B')
  step(1)
  poke(dut.io.channel.valid, 0)
  poke(dut.io.channel.data, 0)
  step(30)
}

object BufferedTxTester {
  def main(args: Array[String]): Unit = {
    chiselMainTest(Array[String]("--backend", "c", "--compile", "--test",
      "--genHarness", "--vcd", "--targetDir", "generated"),
      () => Module(new BufferedTx(10000, 3000))) {
        c => new BufferedTxTester(c)
      }
  }
}

class SenderTester(dut: Sender) extends Tester(dut) {
  step(300)
}



object SenderTester {
  def main(args: Array[String]): Unit = {
    chiselMainTest(Array[String]("--backend", "v", "--compile", "--test",
      "--genHarness", "--vcd", "--targetDir", "generated"),
      () => Module(new Sender(10000, 3000))) {
        c => new SenderTester(c)
      }
  }
}

object SenderMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array[String]("--backend", "v", "--targetDir", "generated"),
      () => Module(new Sender(50000000, 115200)))
  }
}

object TxMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array[String]("--backend", "v", "--targetDir", "generated"),
      () => Module(new Tx(50000000, 9600)))
  }
}

 
class Echo extends Module {
  val io = new Bundle {
    val txd = Bits(OUTPUT, 1) 
    val rxd = Bits(INPUT, 1)
  }
  
  io.txd := io.rxd 
}

object EchoMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array("--backend", "v", "--targetDir", "generated"),
      () => Module(new Echo()))
  }
}
*/