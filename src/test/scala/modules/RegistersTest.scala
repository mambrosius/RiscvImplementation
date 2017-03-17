// RegistersTest -- test bench for Registers.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.Registers

class RegistersTest(c: Registers) extends PeekPokeTester(c) {

	poke(c.io.select.RS1, 0.U)	
	poke(c.io.select.RS2, 1.U)
	
	poke(c.io.RDsel, 2.U)
	poke(c.io.RD, 43.U)

	expect(c.io.value.RS1, 0.U)
	expect(c.io.value.RS2, 0.U)

	step(1)

	poke(c.io.select.RS1, 2.U)	
	poke(c.io.select.RS2, 5.U)
	
	poke(c.io.RDsel, 8.U)
	poke(c.io.RD, 15.U)

	expect(c.io.value.RS1, 43.U)
	expect(c.io.value.RS2, 0.U)

	step(1)

	poke(c.io.select.RS1, 8.U)	
	poke(c.io.select.RS2, 2.U)
	
	poke(c.io.RDsel, 4.U)
	poke(c.io.RD, 30.U)

	expect(c.io.value.RS1, 14.U)
	expect(c.io.value.RS2, 42.U)
	
}

object RegistersTest extends App {
	iotesters.Driver.execute(args, () => new Registers) {
		c => new RegistersTest(c)
	}
}