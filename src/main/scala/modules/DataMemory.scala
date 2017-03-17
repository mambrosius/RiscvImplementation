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
		val load	= Input(Bool())
		val store 	= Input(Bool())
		val regVal	= new Collection.regVal_io
	})

	val dataMem = Mem(Constant.MEM_SIZE, UInt(Constant.WORD_SIZE))

	//io.RD 					:= MuxCase(Constant.ZERO, io.load  -> (dataMem(io.regVal.RS1)))
	//dataMem(io.regVal.RS2) 	:= MuxCase(Constant.ZERO, io.store -> io.regVal.RS1)
}
