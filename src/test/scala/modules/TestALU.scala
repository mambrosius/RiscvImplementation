// TestALU -- test bench for ALU.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.ALU

class TestALU(c: ALU) extends PeekPokeTester(c) {
	/*
	poke(c.io.aluOp.func, 99.U)
	poke(c.io.aluOp.alt, false.B)
	poke(c.io.reg.rs.rs1, 32.U)
	poke(c.io.reg.rs.rs2, 2.U)

	expect(c.io.reg.rd, 33.U)

	*/
}

object TestALU extends App {
 	iotesters.Driver.execute(args, () => new ALU) {
		c => new TestALU(c)
	}	
}