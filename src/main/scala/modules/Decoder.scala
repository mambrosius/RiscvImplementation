// Decoder -- module that decodes intructions 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils._

class Decoder extends Module {
	
	val io = IO(new Bundle {
		val inst 	= Input(UInt(Constant.WORD_SIZE))
		val field 	= Flipped(new Collection.field)
	})
	
	// S imm
	val imm4_0 	 = io.inst(11,7) 
	val imm11_5	 = io.inst(31,25)
	// SB imm 	 
	val imm4_1 	 = io.inst(11,8) 
	val imm10_5  = io.inst(30,25)
	val imm11_sb = io.inst(7)
	val imm12 	 = io.inst(31)
	// UJ imm	 
	val imm10_1  = io.inst(30,21) 
	val imm11_uj = io.inst(20)
	val imm19_12 = io.inst(19,12)
	val imm20 	 = io.inst(31)

	io.field.ctrl.opcode := io.inst(6,0)
	io.field.sel.rd		 := io.inst(11,7)
	io.field.ctrl.funct3 := io.inst(14,12)
	io.field.sel.rs.rs1  := io.inst(19,15)
	io.field.sel.rs.rs2  := io.inst(24,20)
	io.field.ctrl.funct7 := io.inst(31,25)	

	io.field.imm.I 		 := io.inst(31,20)	
	io.field.imm.U 		 := io.inst(31,12)
	io.field.imm.S 		 := Cat(imm11_5, imm4_0)
	io.field.imm.SB 	 := Cat(Cat(imm12, imm11_sb), Cat(imm10_5, imm4_1))
	io.field.imm.UJ 	 := Cat(Cat(imm20, imm19_12), Cat(imm11_uj, imm10_1)) 

	//--------------------------------
	
	//io.field.imm5		 := io.inst(11,7) 
	//io.field.imm7		 := io.inst(31,25)
	//io.field.imm12	 := io.inst(31,20)
	//io.field.imm20 	 := io.inst(31,12)
	
	//--------------------------------
	//io.field.SB.imm4_1 	 := io.inst(11,8) 
	//io.field.SB.imm10_5  := io.inst(30,30)
	//io.field.SB.imm11 	 := io.inst(7)
	//io.field.SB.imm12 	 := io.inst(31)
	
	//--------------------------------
	//io.field.UJ.imm10_1  := io.inst(30,21) 
	//io.field.UJ.imm11 	 := io.inst(20)
	//io.field.UJ.imm19_12 := io.inst(19,12)
	//io.field.UJ.imm20 	 := io.inst(31) 
	//--------------------------------
}