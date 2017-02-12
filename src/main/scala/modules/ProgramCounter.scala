// ProgramCounter -- contains the PC module
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			Technical University of Denmark, DTU Compute
//
// Version:	0.1 (January 2017)

package modules

import chisel3._

class ProgramCounter extends Module {
	
	val io = IO(new Bundle {

		val res 		= Input(Bool())
		val instAddr 	= Output(UInt(32.W))
	}) 

	val pc = Reg(init = 0.asUInt(io.instAddr.getWidth.W))  
	
	pc := Mux(io.res, 0.U, pc + 1.U) 
	io.instAddr := pc
}

object ProgramCounter extends App {
	
	chisel3.Driver.execute(args, () => new ProgramCounter)
}
