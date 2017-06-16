// InstructioMemoryTest -- test bench for DataMemory.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.InstructionMemory

class InstructionMemoryTest(dut: InstructionMemory) extends PeekPokeTester(dut) {
	
	for (i <- 84 to 128 by 4) {
		poke(dut.io.pc, i)
		expect(dut.io.inst, 1000000000)
	}
}

object InstructionMemoryTest extends App {
	iotesters.Driver.execute(args, () => new InstructionMemory) {
		dut => new InstructionMemoryTest(dut)
	}	
}