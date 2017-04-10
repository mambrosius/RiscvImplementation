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
		val rs 	= new RS
		val rd 	= Output(UInt(WORD_SIZE))
	})

	val dataMem = Mem(MEM_SIZE * 4, UInt(BYTE_SIZE))
	io.rd := Mux(io.mem.op.read, dataMem(io.rs.rs1), ZERO)
	when (io.mem.op.write) { dataMem(io.rs.rs1) := io.rs.rs2 }
}
