// TestALU -- test bench for ALU.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.ALU

class TestALU(dut: ALU) extends PeekPokeTester(dut) {
	
	poke(dut.io.alu_ctrl.func, "b101".U)
	//poke(dut.io.alu_ctrl.mem, false.B)
	poke(dut.io.alu_ctrl.alt, false.B)
	poke(dut.io.alu_ctrl.flush, false.B)

	poke(dut.io.op.op1, 1073741824.U)
	poke(dut.io.op.op2, 2.U)

	expect(dut.io.res, 34.U)

}

object TestALU extends App {
 	iotesters.Driver.execute(args, () => new ALU) {
		dut => new TestALU(dut)
	}	
}