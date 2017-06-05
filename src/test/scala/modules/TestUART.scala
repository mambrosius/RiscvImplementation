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

    for (i <- 0 until 20) {
      
        //expect(dut.io.tick_cnt, 100000.U)
        step(1)  
    }

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
		c => new TestUART(c)		
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