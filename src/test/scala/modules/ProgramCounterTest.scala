// ProgramCounterTest -- test bench for ProgramCounter.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (January 2017)

import modules._
import chisel3._
import chisel3.iotesters.PeekPokeTester

class ProgramCounterTest(c: ProgramCounter) extends PeekPokeTester(c) {

	poke(c.io.res, false)

	for (i <- 1 until 10) {

		step(1)
		expect(c.io.instAddr, i * 4)	
	}
}

object ProgramCounter extends App {

	iotesters.Driver.execute(args, () => new ProgramCounter) {

		c => new ProgramCounterTest(c)
	}
}