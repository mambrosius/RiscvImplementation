// TestCPU -- test bench for CPU.scala
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules._

class TestCPU(c: CPU) extends PeekPokeTester(c) {

	poke(c.io.reset, false.B)
	
	expect(c.io.RD, 18.U)
	step(1)
	expect(c.io.RD, 20.U)
	step(1)
	expect(c.io.RD, 60.U)
	step(1)
	expect(c.io.RD, 86.U)
	
	// Note : Why cant i add two UInts as updatable index..
	/*
	poke(c.io.reset, false.B)

	for (i <- 0 until 10) {
		poke(c.io.instAddr, i)
		step(1)	
		expect(c.io.inst, 69633.asUInt(32.W) + i.asUInt(32.W))
	}
	*/
}

object TestCPU extends App {

	iotesters.Driver.execute(args, () => new CPU) {

		c => new TestCPU(c)		
	}
}