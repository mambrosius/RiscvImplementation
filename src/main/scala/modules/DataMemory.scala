// DataMemory -- contains the processors memory
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

// have to be synchroeous

package modules

import chisel3._
import utils.Constant

class DataMemory extends Module {
 
	val io = IO(new Bundle {
		val load	= Input(Bool())
		val store 	= Input(Bool())
		val R1		= Input(UInt(Constant.WORD_SIZE))
		val R2		= Input(UInt(Constant.WORD_SIZE))
		val RD		= Output(UInt(Constant.WORD_SIZE))
	})

	val dataMem = Mem(Constant.MEM_SIZE, UInt(Constant.WORD_SIZE))

	when (io.load) {

		io.RD := dataMem(io.R1)

	} .otherwise {

		io.RD := Constant.ZERO
	}

	when (io.store) {

		dataMem(io.R2) := io.R1
	}
}
