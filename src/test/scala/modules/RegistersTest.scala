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

	poke(c.io.regSel.rs.RS1, 0.U)	
	poke(c.io.regSel.rs.RS2, 1.U)
	
	poke(c.io.regSel.RD, 2.U)
	poke(c.io.regVal.RD, 43.U)

	expect(c.io.regVal.rs.RS1, 0.U)
	expect(c.io.regVal.rs.RS2, 0.U)

	step(1)

	poke(c.io.regSel.rs.RS1, 2.U)	
	poke(c.io.regSel.rs.RS2, 5.U)
	
	poke(c.io.regSel.RD, 8.U)
	poke(c.io.regVal.RD, 15.U)

	expect(c.io.regVal.rs.RS1, 43.U)
	expect(c.io.regVal.rs.RS2, 0.U)

	step(1)

	poke(c.io.regSel.rs.RS1, 8.U)	
	poke(c.io.regSel.rs.RS2, 2.U)
	
	poke(c.io.regSel.RD, 4.U)
	poke(c.io.regVal.RD, 30.U)

	expect(c.io.regVal.rs.RS1, 14.U)
	expect(c.io.regVal.rs.RS2, 42.U)
	
}

object RegistersTest extends App {
	iotesters.Driver.execute(args, () => new Registers) {
		c => new RegistersTest(c)
	}
}