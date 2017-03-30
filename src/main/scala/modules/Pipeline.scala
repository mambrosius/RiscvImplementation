// Pipeline -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package utils

import chisel3._
import chisel3.util._
import utils._

object Pipeline {
 	
	class IF_ID extends Module {

		val io = IO(new Bundle {
			val in 	= new Bundle {
				val inst = Input(UInt(Constant.WORD_SIZE))
				val pc 	 = Input(UInt(Constant.WORD_SIZE))}
			val out = Flipped(in)
		})
		
		io.out := Reg(next = io.in)
	}
	
	class ID_EX extends Module {
		
		val io = IO(new Bundle {
			val in  = new Collection.ID_EX_io
			val out = Flipped(new Collection.ID_EX_io) 
		})
		
		io.out := Reg(next = io.in)
	}

	class EX_MEM extends Module {

		val io = IO(new Bundle {
			val in  = new Collection.EX_MEM_io
			val out = Flipped(new Collection.EX_MEM_io) 
		})

		io.out := Reg(next = io.in)
	}

	class MEM_WB extends Module {

		val io = IO(new Bundle {
			val in  = new Collection.MEM_WB_io
			val out = Flipped(new Collection.MEM_WB_io) 
		})

		io.out := Reg(next = io.in)
	}
}