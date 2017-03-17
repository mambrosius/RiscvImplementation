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

	poke(c.io.store, true.B)
	poke(c.io.load, false.B)
	poke(c.io.regVal.rs.RS1, 23.U)
	poke(c.io.regVal.rs.RS2, 3.U)

	step(1)

	poke(c.io.store, false.B)
	poke(c.io.load, true.B)
	poke(c.io.regVal.rs.RS1, 2.U)
	poke(c.io.regVal.rs.RS2, 0.U)

	expect(c.io.regVal.RD, 0.U)
}

object DataMemoryTest extends App {
	iotesters.Driver.execute(args, () => new DataMemory) {
		c => new DataMemoryTest(c)
	}	
}