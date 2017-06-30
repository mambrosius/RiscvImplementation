// Decoder -- module that decodes intructions 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 1.0 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils.Constants._
import utils.Collection._

class Decoder extends Module {
	
	val io = IO(new Bundle {
		val inst 	= Input(UInt(WORD_W))
		val ctrl 	= Flipped(new CTRL)
		val rs 		= Flipped(new RS)
		val rd 		= Output(UInt(RD_W))
		val imm 	= Output(UInt(WORD_W))
	})
	
	io.ctrl.opcode 	:= io.inst(6,0)
	io.rd 			:= io.inst(11,7)
	io.ctrl.funct3 	:= io.inst(14,12)
	io.rs.rs1  		:= io.inst(19,15)
	io.rs.rs2  		:= Mux(io.ctrl.opcode === I || io.ctrl.opcode === L, 0.asUInt(RS_W), io.inst(24,20))
	io.ctrl.funct7 	:= Mux(io.ctrl.opcode === R, io.inst(31,25), 0.asUInt(FUNCT7_W))

	val sign = Mux(io.inst(31), "hfffff".asUInt(20.W), "h00000".asUInt(20.W)) 

	switch (io.ctrl.opcode) {
		is (R) {
			io.imm := 0.asUInt(WORD_W)}
		is (I) { 
			io.imm := Cat(sign, io.inst(31, 20))}
		is (L) { 
			io.imm := Cat(sign, io.inst(31, 20))}
		is (JALR) { 
			io.imm := Cat(sign, io.inst(31, 20))}	
		is (S) { 
			io.imm := Cat(sign, io.inst(31,25), io.inst(11,7))}
		is (B) { 
			io.imm := Cat(sign, io.inst(31), io.inst(7), io.inst(30,25), io.inst(11,8))}
		is (LUI) { 
			io.imm := Cat(sign(11,0), io.inst(31,12))}
		is (AUIPC) { 
			io.imm := Cat(sign(11,0), io.inst(31,12))}
		is (JAL) {
			io.imm := Cat(sign(11,0), io.inst(31), io.inst(19,12), io.inst(20), io.inst(30,21))
		}
	}
}