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
		val ctrl  = new CTRL
		val stall = Input(Bool())
		val WB 	  = Flipped(new WB)
		val MEM   = Flipped(new MEM)
		val EX 	  = Flipped(new EX)
	})

	io.EX.alu_sel 		:= Mux(io.stall, ZERO, io.ctrl.opcode =/= R)

	io.EX.alu_op.alt  	:= Mux(io.stall, ZERO, io.ctrl.funct7(5))
	io.EX.alu_op.func 	:= Mux(io.stall, ZERO, io.ctrl.funct3)
	io.EX.opcode 		:= Mux(io.stall, ZERO, io.ctrl.opcode)	

	io.MEM.func 		:= Mux(io.stall, ZERO, io.ctrl.funct3)
	io.MEM.read 		:= Mux(io.stall, ZERO, io.ctrl.opcode === L) 
	io.MEM.write 		:= Mux(io.stall, ZERO, io.ctrl.opcode === S)
	io.MEM.branch		:= Mux(io.stall, ZERO, io.ctrl.opcode === B)
	
	io.WB.rd_mem 	 	:= Mux(io.stall, ZERO, io.MEM.read) 
	io.WB.reg_w 	 	:= Mux(io.stall, ZERO, io.ctrl.opcode === R || 
							   io.ctrl.opcode === I || io.ctrl.opcode === L) 
}