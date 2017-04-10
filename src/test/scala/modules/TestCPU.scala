// TestCPU -- test bench for CPU.scala
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester
import modules._
import utils.Constants._

class TestCPU(c: CPU) extends PeekPokeTester(c) {
	
	for (i <- 0 until 20) {
		step(1)	

		//expect(c.io.imm_sb, 0.U)
		expect(c.io.rd, 0.U)
		expect(c.io.pc, 0.U)
		// expect(c.io.pc_next, 0.U)
		//expect(c.io.inst, 0.U)
		//expect(c.io.imm_i, 0.U)
		//expect(c.io.zero, FALSE)
		//expect(c.io.branch, FALSE)
		//expect(c.io.alu_src, FALSE)
		//expect(c.io.alu_res, 0.U)
		//expect(c.io.opcode, 0.U)
		//expect(c.io.rs.rs1, 1.U)
		//expect(c.io.rs.rs2, 0.U)
	}

	/*
	step(5)
	expect(c.io.rd, 33.U)
	step(1)
	expect(c.io.rd, 513.U)
	//step(1)
	//expect(c.io.rs.rs1, 513.U)
	//expect(c.io.rs.rs2, 33.U)
	step(4)
	expect(c.io.rd, 256.U)
	step(1)
	expect(c.io.rd, 132.U)
	*/
	/*
	for (i <- 0 until 10) {
		step(1)	
		expect(c.io.rd, 2.U)
	}*/
	
	// Note : Why cant i add two UInts as updatable index..
	/*
	poke(c.io.reset, false.B)

	for (i <- 0 until 10) {
		poke(c.io.instAddr, i)
		step(1)	
		expect(c.io.inst, 69633.asUInt(32.W) + i.asUInt(32.W))
	}
	*/
}

object TestCPU extends App {
	iotesters.Driver.execute(args, () => new CPU) {
		c => new TestCPU(c)		
	}
}