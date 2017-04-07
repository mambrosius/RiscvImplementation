// DecoderTest -- test bench for Decoder.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.Decoder

class DecoderTest(c: Decoder) extends PeekPokeTester(c) {
	
	poke(c.io.inst, "b_0000000_00000_00011_000_10001_0011001".asUInt(32.W))

	expect(c.io.field.ctrl.opcode, 25.U)
	expect(c.io.field.sel.rs.rs1, 3.U)
}

object DecoderTest extends App {
	iotesters.Driver.execute(args, () => new Decoder) {
		c => new DecoderTest(c)
	}
}