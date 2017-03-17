// DataMemory -- contains the processors memory
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

// have to be synchroeous

package modules

import chisel3._
import utils._

class DataMemory extends Module {
 
	val io = IO(new Bundle {
		val load	= Input(Bool())
		val store 	= Input(Bool())
		val RD		= Output(UInt(Constant.WORD_SIZE))
		val value	= new Collection.value_io
	})

	val dataMem = Mem(Constant.MEM_SIZE, UInt(Constant.WORD_SIZE))

	io.RD 					:= MuxCase(Constant.ZERO, io.load  -> dataMem(io.value.RS1))
	dataMem(io.value.RS2) 	:= MuxCase(Constant.ZERO, io.store -> io.value.RS1)
}
