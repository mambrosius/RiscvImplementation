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

class TestCPU(dut: CPU) extends PeekPokeTester(dut) {

	//new ComTest(dut);
		
	for (i <- 0 until 50) {
		
		expect(dut.io.pc, "h1000".U)
		expect(dut.io.inst, 10000000)
		expect(dut.io.stall, 2)
		expect(dut.io.rs1_id, 2)
		expect(dut.io.rs2_id, 2)
		expect(dut.io.rd_ex, 2)
		expect(dut.io.mem_r, 2)
		expect(dut.io.read, 2)

		//expect(dut.io.txd, 2.U)
		
		//expect(dut.io.valid, FALSE)
		//expect(dut.io.data, 0.U)
		/*
		expect(dut.io.r0 , 2.U)
		expect(dut.io.r1 , 2.U)
		expect(dut.io.r2 , 2.U)
		expect(dut.io.r3 , 2.U)
		*/

		/*
		expect(dut.io.alu_res, 10.U)
		expect(dut.io.alu_op1, 10.U)
		expect(dut.io.alu_op2, 10.U)
		expect(dut.io.imm, 10.U)
		*/
		//expect(dut.io.alu_sel, 2.U)
		//expect(dut.io.opcode, 1000.U)
		//expect(dut.io.rd, 1000.U)
		//expect(dut.io.fwd1, 5.U)
		//expect(dut.io.fwd2, 5.U)

		step(1) // 434
	}





	/*
	for (i <- 0 until 20) {
		step(1)	

		//expect(c.io.imm_sb, 0.U)
		
		expect(c.io.rd_exMem, 2.U)
		expect(c.io.rd_memWb, 2.U)
		expect(c.io.dst_exMem, 6.U)
		expect(c.io.dst_memWb, 6.U)
		//expect(c.io.regWrite_exMem, 6.U)
		//expect(c.io.regWrite_memWb, 6.U)
		
		//expect(c.io.rd_sel, 6.U)

		//expect(c.io.fwd_rs1, 6.U)
		//expect(c.io.rs1, 2.U)
		expect(c.io.op1, 2.U)
		//expect(c.io.sel_rs1, 6.U)
		expect(c.io.memRead, 2.U)
		expect(c.io.memWrite, 2.U)
		expect(c.io.memRes, 2.U)
		expect(c.io.wData, 2.U)

		//expect(c.io.fwd_rs2, 6.U)
		//expect(c.io.rs2, 2.U)
		//expect(c.io.alu_src, 2.U)
		//expect(c.io.op2, 2.U)
		//expect(c.io.sel_rs2, 6.U)
		//expect(c.io.rs1_ifId, 2.U)
		//expect(c.io.rs2_ifId, 2.U)
		//expect(c.io.alu_sel, 2.U)
		//expect(c.io.pc, 0.U)
		//expect(c.io.pc_next, 0.U)
		//expect(c.io.inst, 0.U)
		//expect(c.io.imm_i, 0.U)
		//expect(c.io.zero, FALSE)
		//expect(c.io.branch, FALSE)
		//expect(c.io.alu_src, FALSE)
		//expect(c.io.alu_res, 0.U)
		//expect(c.io.opcode, 0.U)
		//expect(c.io.rs.rs1, 1.U)
		//expect(c.io.rs.rs2, 0.U)
	}*/

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
}

// this test is made for the hello.hex program
/*
class ComTest(dut: CPU) extends PeekPokeTester(dut) {

	for (i <- 0 until 50) {
		
		expect(dut.io.pc, i + 21)
		//expect(dut.io.txd, 0)
		expect(dut.io.aPrint, 0)
		//expect(dut.io.memW, FALSE)
		step(1)

		//expect(dut.io.rd_memWb, 40.U)
	}

	reset()
	expect(dut.io.pc, 21)
}
*/
object TestCPU extends App {
	iotesters.Driver.execute(args, () => new CPU) {
		dut => new TestCPU(dut)		
	}
}