// TestCPU -- test bench for CPU.scala
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import modules._
import chisel3._
import chisel3.iotesters.PeekPokeTester

class TestCPU(c: CPU) extends PeekPokeTester(c) {

	poke(c.io.reset, false.B)

	expect(c.io.inst, 69632.U)
	step(1)
	expect(c.io.inst, 69633.U)
	step(1)
	expect(c.io.inst, 69634.U)
	step(1)
	expect(c.io.inst, 69635.U)
	step(1)
	expect(c.io.inst, 69636.U)	

	// Note : Why cant i add two UInts as updatable index..
	/*
	poke(c.io.reset, false.B)

	for (i <- 0 until 10) {
		poke(c.io.instAddr, i)
		step(1)	
		expect(c.io.count, 69633.U + i.U)
	}
	*/
}

object TestCPU extends App {

	iotesters.Driver.execute(args, () => new CPU) {

		c => new TestCPU(c)		
	}
}