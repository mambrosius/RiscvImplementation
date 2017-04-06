// DataMemoryTest -- test bench for DataMemory.scala
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules.DataMemory

class DataMemoryTest(c: DataMemory) extends PeekPokeTester(c) {
	
	poke(c.io.mem.op.read, false.B)
	poke(c.io.mem.op.write, true.B)
	poke(c.io.rs.rs1, 3.U)
	poke(c.io.rs.rs2, 17.U)

	step(1)

	poke(c.io.mem.op.read, false.B)
	poke(c.io.mem.op.write, true.B)
	poke(c.io.rs.rs1, 1.U)
	poke(c.io.rs.rs2, 3.U)

	step(1)

	poke(c.io.mem.op.read, true.B)
	poke(c.io.mem.op.write, false.B)
	poke(c.io.rs.rs1, 3.U)
	poke(c.io.rs.rs2, 0.U)

	expect(c.io.rd, 17.U)

	step(1)

	poke(c.io.mem.op.read, true.B)
	poke(c.io.mem.op.write, false.B)
	poke(c.io.rs.rs1, 0.U)
	poke(c.io.rs.rs2, 0.U)

	expect(c.io.rd, 0.U)

	step(1)

	poke(c.io.mem.op.read, true.B)
	poke(c.io.mem.op.write, false.B)
	poke(c.io.rs.rs1, 1.U)
	poke(c.io.rs.rs2, 0.U)

	expect(c.io.rd, 3.U)
}

object DataMemoryTest extends App {
	iotesters.Driver.execute(args, () => new DataMemory) {
		c => new DataMemoryTest(c)
	}	
}