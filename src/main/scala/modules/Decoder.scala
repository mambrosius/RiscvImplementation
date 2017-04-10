// Decoder -- module that decodes intructions 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils.Constants._
import utils.Collection._

class Decoder extends Module {
	
	val io = IO(new Bundle {
		val inst 	= Input(UInt(WORD_SIZE))
		val ctrl 	= Flipped(new CTRL)
		val sel 	= Flipped(new SEL)
		val imm 	= Flipped(new IMM)
	})
	
	val inst = io.inst

	io.ctrl.opcode 	:= inst(6,0)
	io.sel.rd 		:= inst(11,7)
	io.ctrl.funct3 	:= inst(14,12)
	io.sel.rs.rs1  	:= inst(19,15)
	io.sel.rs.rs2  	:= inst(24,20)
	io.ctrl.funct7 	:= inst(31,25)	

	io.imm.I 		:= inst(31,20)	
	io.imm.U 		:= inst(31,12)
	io.imm.S 		:= Cat(inst(31,25), inst(11,7))
	io.imm.SB 		:= Cat(inst(31), inst(7), inst(30,25), inst(11,8))
	io.imm.UJ 		:= Cat(inst(31), inst(19,12), inst(20), inst(30,21)) 
}