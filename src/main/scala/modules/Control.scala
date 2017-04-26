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

	io.EX.alu_sel 		:= !(io.ctrl.opcode === BRANCH || io.ctrl.opcode === R)
	io.EX.dst_sel 		:= !(io.ctrl.opcode === LOAD)

	val funct7 			 = Mux(io.EX.alu_sel, ZERO, io.ctrl.funct7) 
	io.EX.aluOp.alt  	:= funct7 === 32.U
	io.EX.aluOp.func 	:= io.ctrl.funct3
	io.EX.opcode 		:= io.ctrl.opcode	

	io.MEM.func 		:= io.ctrl.funct3
	io.MEM.read 		:= io.ctrl.opcode === LOAD 
	io.MEM.write 		:= io.ctrl.opcode === STORE 
	io.MEM.branch		:= io.ctrl.opcode === BRANCH 
	
	io.WB.memToReg 	 	:= io.MEM.read 
	io.WB.regWrite 	 	:= io.ctrl.opcode === R || io.ctrl.opcode === I || io.ctrl.opcode === LOAD 
}