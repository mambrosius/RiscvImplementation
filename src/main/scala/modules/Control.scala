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

	io.EX.alu_sel 		:= io.ctrl.opcode =/= R
	io.EX.dst_sel 		:= io.ctrl.opcode =/= L

	io.EX.alu_op.alt  	:= Mux(io.EX.alu_sel, FALSE, io.ctrl.funct7(5))
	io.EX.alu_op.func 	:= io.ctrl.funct3
	io.EX.opcode 		:= io.ctrl.opcode	

	io.MEM.func 		:= io.ctrl.funct3
	io.MEM.read 		:= io.ctrl.opcode === L 
	io.MEM.write 		:= io.ctrl.opcode === S 
	io.MEM.branch		:= io.ctrl.opcode === B 
	
	io.WB.rd_mem 	 	:= io.MEM.read 
	io.WB.reg_w 	 	:= io.ctrl.opcode === R || io.ctrl.opcode === I || io.ctrl.opcode === L 
}