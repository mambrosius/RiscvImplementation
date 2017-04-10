// ProgramCounter -- contains the PC module
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (January 2017)

package modules

import chisel3._
import utils.Constants._

class ProgramCounter extends Module {
	
	val io = IO(new Bundle {
		val branch 	= Input(Bool())
		val pc_src 	= Input(UInt(WORD_SIZE))
		val pc_next = Output(UInt(WORD_SIZE))
		val pc 		= Output(UInt(WORD_SIZE))
	}) 

	val pc_reg 	= Reg(init = 0.U (WORD_SIZE))
	
	io.pc_next 	:= pc_reg + 1.U;
	pc_reg 		:= Mux(io.branch, io.pc_src, io.pc_next)
	io.pc 		:= pc_reg 
}