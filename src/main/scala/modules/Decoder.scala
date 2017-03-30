// Decoder -- module that decodes intructions 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils._

class Decoder extends Module {
	
	val io = IO(new Bundle {
		val inst = Input(UInt(Constant.WORD_SIZE))
		val F 	 = Flipped(new Collection.F)
	})
	
	//--------------------------------
	io.F.ctrl.opcode := io.inst(6,0)
	io.F.sel.rd		 := io.inst(11,7)
	io.F.ctrl.funct3 := io.inst(14,12)
	io.F.sel.rs.rs1  := io.inst(19,15)
	io.F.sel.rs.rs2  := io.inst(24,20)
	io.F.ctrl.funct7 := io.inst(31,25)
	io.F.imm5		 := io.inst(11,7) 
	io.F.imm7		 := io.inst(31,25)
	io.F.imm12	 	 := io.inst(31,20)
	io.F.imm20 		 := io.inst(31,12)
	//--------------------------------
	io.F.SB.imm4_1 	 := io.inst(11,8) 
	io.F.SB.imm10_5  := io.inst(30,30)
	io.F.SB.imm11 	 := io.inst(7)
	io.F.SB.imm12 	 := io.inst(31) 
	//--------------------------------
	io.F.UJ.imm10_1  := io.inst(30,21) 
	io.F.UJ.imm11 	 := io.inst(20)
	io.F.UJ.imm19_12 := io.inst(19,12)
	io.F.UJ.imm20 	 := io.inst(31) 
	//--------------------------------
}