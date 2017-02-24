// Decoder -- module that decodes intructions 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils.Constant

class Decoder() extends Module {

	val io = IO(new Bundle {
		val inst 	= Input(UInt(Constant.WORD_SIZE.W))
		val opcode 	= Output(UInt(7.W))
		val RDsel	= Output(UInt(5.W))
		val RS1sel	= Output(UInt(5.W))
		val RS2sel	= Output(UInt(5.W))
		val funct3	= Output(UInt(3.W))
		val funct7	= Output(UInt(7.W))
		val imm12	= Output(UInt(12.W))
	})

	io.opcode 	:= io.inst(6, 0)
	io.RDsel	:= io.inst(11, 7)
	io.funct3	:= io.inst(14, 12)
	io.RS1sel 	:= io.inst(19, 15)
	io.RS2sel	:= io.inst(24, 20)
	io.funct7	:= io.inst(31, 25)
	io.imm12	:= io.inst(31, 20)
}