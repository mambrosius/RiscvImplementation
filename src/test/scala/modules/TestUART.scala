// TestUART -- test bench for UART.scala
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (May 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules._

class TestUART(dut: UART) extends PeekPokeTester(dut) {
    
    val integer = 

    poke(dut.io.in, 3.U)

    for (i <- 0 until 20) {
        //expect(dut.io.valid, false.B)
        //expect(dut.io.data, 2.U)
        expect(dut.io.txd, 2.U)
        step(434)    
    }

    /*
    step(1)
    poke(dut.io.enq.bits, 104.U)
    step(1)
    poke(dut.io.enq.bits, 104.U)
    poke(dut.io.enq.bits, 0.U)
    expect(dut.io.cnt, 1.U) 
    expect(dut.io.valid, true.B) // := q.io.
    step(1)
    poke(dut.io.enq.bits, 0.U)
    expect(dut.io.cnt, 2.U) 
    expect(dut.io.valid, false.B) // := q.io.
    step(1)
    poke(dut.io.enq.bits, 0.U)
    expect(dut.io.cnt, 2.U) 

    step(1)
    poke(dut.io.enq.bits, 0.U)
    expect(dut.io.cnt, 2.U) 

    step(1)
    poke(dut.io.enq.bits, 0.U)
    expect(dut.io.cnt, 2.U) 

    step(1)
    poke(dut.io.enq.bits, 0.U)
    expect(dut.io.cnt, 2.U) 
    step(1)
    */
    /*    
    for (i <- 0 until 10) {
        expect(dut.io.cnt, 17.U) 
        expect(dut.io.valid, true.B) // := q.io.
        step(1)
    }*/

    /*
    
    expect(dut.io.bits_in, 101.U)
    expect(dut.io.i, 101.U)
    step(1)
    expect(dut.io.cnt, 1.U)
    poke(dut.io.in, 101.U)
    expect(dut.io.i, 101.U)
    step(1)
    expect(dut.io.cnt, 2.U)
    poke(dut.io.in, 108.U)
    expect(dut.io.i, 101.U)
    step(1)
    expect(dut.io.cnt, 3.U)
    poke(dut.io.in, 0.U)
    expect(dut.io.i, 101.U)
    step(1)
    expect(dut.io.cnt, 3.U)
    expect(dut.io.i, 101.U)

    step(4782)
    expect(dut.io.rdy, false.B)
    expect(dut.io.cnt, 4.U)
    expect(dut.io.bits, 104.U)
    expect(dut.io.i, 101.U)

    step(1)
    expect(dut.io.rdy, true.B)
    expect(dut.io.cnt, 2.U)
    expect(dut.io.bits, 104.U)
    */
    /*
    
    expect(dut.io.ptr, 10.U)
    expect(dut.io.txd, 2.U)
    expect(dut.io.rdy, true.B)
    expect(dut.io.bits, 0.U)
    step(1)
    poke(dut.io.in, 101.U)
    expect(dut.io.cnt, 10.U)
    expect(dut.io.ptr, 10.U)
    expect(dut.io.txd, 2.U)
    expect(dut.io.rdy, true.B)
    expect(dut.io.bits, 0.U)
    step(1)
    poke(dut.io.in, 0.U)

    step(432) 
    */
    /*
    for (i <- 0 until 10000) {
      
      expect(dut.io.cnt, 10.U)
      expect(dut.io.ptr, 10.U)
      expect(dut.io.txd, 2.U)
      expect(dut.io.bits, 0.U)
      
      expect(dut.io.rdy, false.B)
      step(1)
      
    }*/


    /*
    poke(dut.io.ctl.enq.valid, true.B)
    poke(dut.io.ctl.enq.bits, 104.U)

    poke(dut.io.enq.bits, 104.U)
    //poke(dut.io.enq.valid, true.B)
    expect(dut.io.tx_rdy, true.B)
    expect(dut.io.ticks, 434.U)
    step(434)
    poke(dut.io.enq.bits, 101.U)
    //step(2)
    //poke(dut.io.enq.bits, 0.U)
    //expect(dut.io.tx_rdy, false.B)
    //step(432)
    for (i <- 0 until 40) {
      expect(dut.io.txd, 2.U)
      expect(dut.io.tx_rdy, false.B)
      step(434)
    }

    */
    

    //poke(dut.io.enq.bits, 104.U)
    //poke(dut.io.enq.valid, true.B)
    


    /*
    for (i <- 0 until 20) {
        
        //expect(dut.io.cnt, 10.U)
        //expect(dut.io.queued, 0)
        //expect(dut.io.tx_rdy, false.B)
        step(1)  
        //poke(dut.io.ctl.enq.bits, 0.U)
    }
    */
    /*
    step(2)
    poke(dut.io.channel.valid, 1)
    poke(dut.io.channel.data, 'A')
    step(4)
    poke(dut.io.channel.valid, 0)
    poke(dut.io.channel.data, 0)
    step(40)
    poke(dut.io.channel.valid, 1)
    poke(dut.io.channel.data, 'B')
    step(4)
    poke(dut.io.channel.valid, 0)
    poke(dut.io.channel.data, 0)
    step(30)
    */
}

object TestUART extends App {
	iotesters.Driver.execute(args, () => new UART) {
		dut => new TestUART(dut)		
	}
}

/*

class TxTester(dut: Tx) extends Tester(dut) {

  step(2)
  poke(dut.io.channel.valid, 1)
  poke(dut.io.channel.data, 'A')
  step(4)
  poke(dut.io.channel.valid, 0)
  poke(dut.io.channel.data, 0)
  step(40)
  poke(dut.io.channel.valid, 1)
  poke(dut.io.channel.data, 'B')
  step(4)
  poke(dut.io.channel.valid, 0)
  poke(dut.io.channel.data, 0)
  step(30)
}

object TxTester {
  def main(args: Array[String]): Unit = {
    chiselMainTest(Array[String]("--backend", "c", "--compile", "--test",
      "--genHarness", "--vcd", "--targetDir", "generated"),
      () => Module(new Tx(10000, 3000))) {
        c => new TxTester(c)
      }
  }



}*/