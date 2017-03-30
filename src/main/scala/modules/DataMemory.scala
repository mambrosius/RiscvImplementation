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
		val M 	= new Collection.M
		val rs 	= new Collection.rs
		val rd 	= Output(UInt(Constant.WORD_SIZE))
	})

	val dataMem = Mem(Constant.MEM_SIZE, UInt(Constant.WORD_SIZE))
	io.rd := Mux(io.M.memRead, dataMem(io.rs.rs1), Constant.ZERO)
	when (io.M.memWrite) { dataMem(io.rs.rs1) := io.rs.rs2 }
}
