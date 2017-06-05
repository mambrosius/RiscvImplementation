// DataMemory -- contains the processors memory
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

// have to be synchroeous

package modules

import chisel3._
import chisel3.util._
import utils.Constants._
import utils.Collection._

class DataMemory extends Module {
 
	val io = IO(new Bundle {
		val mem = new MEM
		val reg = new REG
	})

	// note: check SeqMem()
	val dataMem = Mem(MEM_SIZE, 0.U (WORD_SIZE))
	
	when (io.mem.write) {
		switch(io.mem.func) {
			is (LB) {
				dataMem(io.reg.rs.rs1) := io.reg.rs.rs2(7,0)} 
			is (LH) {
				dataMem(io.reg.rs.rs1) := io.reg.rs.rs2(15,0)} 
			is (LW) {
				dataMem(io.reg.rs.rs1) := io.reg.rs.rs2}
		}
	}	

	when (io.mem.read) {
		
		val rdata = dataMem(io.reg.rs.rs1)

		switch(io.mem.func) {
			is (SB) {
				io.reg.rd  := rdata(7,0)}
			is (SH) {
				io.reg.rd  := rdata(15,0)}
			is (SW) {
				io.reg.rd  := rdata}
		}
	}



	/*
	when (io.mem.write) {
		switch(io.mem.func) {
			is (LB) {
				dataMem.write(io.reg.rs.rs1, io.reg.rs.rs2(7,0))} 
			is (LH) {
				dataMem.write(io.reg.rs.rs1, io.reg.rs.rs2(7,0))
				dataMem.write(io.reg.rs.rs1 + 1.U, io.reg.rs.rs2(15,8))} 
			is (LW) {
				dataMem.write(io.reg.rs.rs1, io.reg.rs.rs2(7,0))
				dataMem.write(io.reg.rs.rs1 + 1.U, io.reg.rs.rs2(15,8))
				dataMem.write(io.reg.rs.rs1 + 2.U, io.reg.rs.rs2(23,16))
				dataMem.write(io.reg.rs.rs1 + 3.U, io.reg.rs.rs2(31,24))}
		}
	}
	
	when (io.mem.read) {
		switch(io.mem.func) {
			is (SB) {
				io.reg.rd  := Cat(Fill(24, 0.U), dataMem.read(io.reg.rs.rs1))}
			is (SH) {
				val byte1 	= dataMem.read(io.reg.rs.rs1)
				val byte2 	= dataMem.read(io.reg.rs.rs1 + 1.U)
				io.reg.rd  := Cat(Fill(16, 0.U), byte2, byte1)} 
			is (SW) {
				val byte1 	= dataMem.read(io.reg.rs.rs1)
				val byte2 	= dataMem.read(io.reg.rs.rs1 + 1.U)
				val byte3 	= dataMem.read(io.reg.rs.rs1 + 2.U)
				val byte4 	= dataMem.read(io.reg.rs.rs1 + 3.U)
				io.reg.rd  := Cat(byte4, byte3, byte2, byte1)}
		}
	}
	*/
}
