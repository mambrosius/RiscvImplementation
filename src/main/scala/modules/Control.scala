// Control -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (March 2017)

package modules

import chisel3._
import utils._

class Control extends Module {

	val io = IO(new Bundle {
		val ctrl = new Collection.ctrl
		val WB 	 = Flipped(new Collection.WB)
		val MEM  = Flipped(new Collection.MEM)
		val EX 	 = Flipped(new Collection.EX)
	})

	io.EX.alu_src 	 	:= Mux(io.ctrl.opcode === Constant.R, false.B, true.B)
	val funct7 		  	 = Mux(io.EX.alu_src, 0.U, io.ctrl.funct7) 
	io.EX.aluOp.alt  	:= Mux(funct7 === 32.U, true.B, false.B)
	io.EX.aluOp.func 	:= io.ctrl.funct3	

	io.MEM.branch		:= Mux(io.ctrl.opcode === Constant.BRANCH, true.B, false.B)
	io.MEM.op.read 		:= Mux(io.ctrl.opcode === Constant.LOAD, true.B, false.B)
	io.MEM.op.write 	:= Mux(io.ctrl.opcode === Constant.STORE, true.B, false.B)

	io.WB.memToReg 	 	:= Mux(io.ctrl.opcode === Constant.LOAD, true.B, false.B)
	io.WB.regWrite 	 	:= true.B 
}