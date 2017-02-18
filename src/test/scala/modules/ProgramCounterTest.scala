// ProgramCounterTest -- test bench for ProgramCounter.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (January 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.ProgramCounter

class ProgramCounterTest(c: ProgramCounter) extends PeekPokeTester(c) {

	poke(c.io.reset, false.B)

	for (i <- 0 until 10) {
		expect(c.io.count, i)
		step(1)			
	}

	poke(c.io.reset, true.B)

	for (i <- 0 until 10) {
		step(1)	
		expect(c.io.count, 0)
	}
}

object ProgramCounterTest extends App {

	iotesters.Driver.execute(args, () => new ProgramCounter) {

		c => new ProgramCounterTest(c)
	}
}