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
		val flush = Input(Bool())
		val WB 	  = Flipped(new WB)
		val MEM   = Flipped(new MEM)
		val EX 	  = Flipped(new EX)
		val jump  = Output(Bool())
	})

	io.jump 			 := Mux(io.flush, ZERO, io.ctrl.opcode === JAL)

	io.EX.alu_sel 		 := Mux(io.flush, ZERO, io.ctrl.opcode =/= R) 
	io.EX.alu_ctrl.alt   := Mux(io.flush, ZERO, io.ctrl.funct7(5))
	io.EX.alu_ctrl.func  := Mux(io.flush, ZERO, io.ctrl.funct3)
	io.EX.alu_ctrl.flush := io.flush

	io.MEM.func 		 := Mux(io.flush, ZERO, io.ctrl.funct3)
	io.MEM.read 		 := Mux(io.flush, ZERO, io.ctrl.opcode === L) 
	io.MEM.write 		 := Mux(io.flush, ZERO, io.ctrl.opcode === S)
	
	io.WB.rd_mem 	 	 := Mux(io.flush, ZERO, io.MEM.read) 
	io.WB.reg_w 	 	 := Mux(io.flush, ZERO, io.ctrl.opcode === R || 
								io.ctrl.opcode === I || io.ctrl.opcode === L) 
}