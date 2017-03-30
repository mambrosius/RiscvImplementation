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

	poke(c.io.sel.rs.rs1, 0.U)	
	poke(c.io.sel.rs.rs2, 1.U)
	
	poke(c.io.sel.rd, 2.U)
	poke(c.io.reg.rd, 43.U)

	expect(c.io.reg.rs.rs1, 0.U)
	expect(c.io.reg.rs.rs2, 0.U)

	step(1)

	poke(c.io.sel.rs.rs1, 2.U)	
	poke(c.io.sel.rs.rs2, 5.U)
	
	poke(c.io.sel.rd, 8.U)
	poke(c.io.reg.rd, 15.U)

	expect(c.io.reg.rs.rs1, 43.U)
	expect(c.io.reg.rs.rs2, 0.U)

	step(1)

	poke(c.io.sel.rs.rs1, 8.U)	
	poke(c.io.sel.rs.rs2, 2.U)
	
	poke(c.io.sel.rd, 4.U)
	poke(c.io.reg.rd, 30.U)

	expect(c.io.reg.rs.rs1, 14.U)
	expect(c.io.reg.rs.rs2, 42.U)
	
}

object RegistersTest extends App {
	iotesters.Driver.execute(args, () => new Registers) {
		c => new RegistersTest(c)
	}
}