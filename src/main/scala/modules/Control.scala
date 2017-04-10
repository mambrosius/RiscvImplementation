// Control -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (March 2017)

package modules

import chisel3._
import utils.Constants._
import utils.Collection._

class Control extends Module {

	val io = IO(new Bundle {
		val ctrl = new CTRL
		val WB 	 = Flipped(new WB)
		val MEM  = Flipped(new MEM)
		val EX 	 = Flipped(new EX)
	})

	io.EX.alu_src 	 	:= io.ctrl.opcode === I
	val funct7 		  	 = Mux(io.EX.alu_src, ZERO, io.ctrl.funct7) 
	io.EX.aluOp.alt  	:= funct7 === 32.U
	io.EX.aluOp.func 	:= io.ctrl.funct3
	io.EX.opcode 		:= io.ctrl.opcode	

	io.MEM.op.read 		:= io.ctrl.opcode === LOAD 
	io.MEM.op.write 	:= io.ctrl.opcode === STORE 
	io.MEM.branch		:= io.ctrl.opcode === BRANCH 
	
	io.WB.memToReg 	 	:= io.MEM.op.read 
	io.WB.regWrite 	 	:= TRUE 
}