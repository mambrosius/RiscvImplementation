// DataMemoryTest -- test bench for DataMemory.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.DataMemory

class DataMemoryTest(dut: DataMemory) extends PeekPokeTester(dut) {
	/*
	poke(dut.io.mem.read, false)
	poke(dut.io.mem.write, true)
	poke(dut.io.mem.func, 2)

	poke(dut.io.reg.rs.rs1, 3)
	poke(dut.io.reg.rs.rs2, 524578)

	step(1)

	poke(dut.io.mem.read, true)
	poke(dut.io.mem.write, false)
	poke(dut.io.mem.func, 2)
	
	poke(dut.io.reg.rs.rs1, 3)
	expect(dut.io.reg.rd, 2)

	step(1)
	*/
}

object DataMemoryTest extends App {
	iotesters.Driver.execute(args, () => new DataMemory) {
		dut => new DataMemoryTest(dut)
	}	
}