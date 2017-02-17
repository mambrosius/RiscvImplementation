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
		val reset = Input(Bool())
		val count = Output(UInt(32.W))
	}) 

	val countReg = Reg(init = 0.asUInt(io.count.getWidth.W))
	
	// reg
	countReg := Mux(io.reset, 0.U, countReg + 1.U)
	
	// out
	io.count := countReg
}

object ProgramCounter extends App {
	
	chisel3.Driver.execute(args, () => new ProgramCounter)
}

