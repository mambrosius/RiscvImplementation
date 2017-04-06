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
import utils._

class DataMemory extends Module {
 
	val io = IO(new Bundle {
		val mem = new Collection.MEM
		val rs 	= new Collection.rs
		val rd 	= Output(UInt(Constant.WORD_SIZE))
	})

	val dataMem = Mem(Constant.MEM_SIZE * 4, Constant.BYTE)
	io.rd := Mux(io.mem.op.read, dataMem(io.rs.rs1), Constant.ZERO)
	when (io.mem.op.write) { dataMem(io.rs.rs1) := io.rs.rs2 }
}
