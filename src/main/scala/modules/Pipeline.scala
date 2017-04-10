// Pipeline -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import chisel3._
import chisel3.util._
import utils.Collection._

object Pipeline {
 	
	class IF_ID extends Module {

		val io = IO(new Bundle {
			val in 	= new IF_ID_io
			val out = Flipped(new IF_ID_io)
		})
		
		io.out := Reg(next = io.in)
	}
	
	class ID_EX extends Module {
		
		val io = IO(new Bundle {
			val in  = new ID_EX_io
			val out = Flipped(new ID_EX_io) 
		})
		
		io.out := Reg(next = io.in)
	}

	class EX_MEM extends Module {

		val io = IO(new Bundle {
			val in  = new EX_MEM_io
			val out = Flipped(new EX_MEM_io) 
		})

		io.out := Reg(next = io.in)
	}

	class MEM_WB extends Module {

		val io = IO(new Bundle {
			val in  = new MEM_WB_io
			val out = Flipped(new MEM_WB_io) 
		})

		io.out := Reg(next = io.in)
	}
}