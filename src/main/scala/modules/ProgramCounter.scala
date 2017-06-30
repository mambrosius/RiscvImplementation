// ProgramCounter -- contains the PC module
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	1.0 (January 2017)

package modules

import chisel3._
import utils.Constants._

class ProgramCounter extends Module {
	
	val io = IO(new Bundle {
		val src_sel  = Input(Bool())
		val stall 	 = Input(Bool())
		val pc_src	 = Input(UInt(WORD_W))
		val pc_next  = Output(UInt(WORD_W))
		val pc 		 = Output(UInt(WORD_W))
	}) 

	val pc_reg  = RegInit(UInt(WORD_W), START) 
	
	io.pc_next 	:= Mux(io.stall, pc_reg, pc_reg + 4.U)
	pc_reg 		:= Mux(io.src_sel, io.pc_src, io.pc_next)
	io.pc 		:= pc_reg 
}