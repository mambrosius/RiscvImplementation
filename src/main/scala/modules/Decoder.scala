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
		val inst 	= Input(UInt(WORD_W))
		val ctrl 	= Flipped(new CTRL)
		val rs 		= Flipped(new RS)
		val rd 		= Output(UInt(RD_W))
		val imm 	= Output(UInt(WORD_W))
	})
	
	val inst = io.inst

	io.ctrl.opcode 	:= inst(6,0)
	io.rd 			:= inst(11,7)
	io.ctrl.funct3 	:= inst(14,12)
	io.rs.rs1  		:= inst(19,15)
	io.rs.rs2  		:= inst(24,20)
	io.ctrl.funct7 	:= Mux(io.ctrl.opcode === R, inst(31,25), 0.asUInt(FUNCT7_W))

	switch (io.ctrl.opcode) {
		is (I) { 
			io.imm := Cat(0.asUInt(20.W), inst(31, 20))}
		is (L) { 
			io.imm := Cat(0.asUInt(20.W), inst(31, 20))}
		is (JALR) { 
			io.imm := Cat(0.asUInt(20.W), inst(31, 20))}	
		is (S) { 
			io.imm := Cat(0.asUInt(20.W), inst(31,25), inst(11,7))}
		is (B) { 
			io.imm := Cat(0.asUInt(20.W), inst(31), inst(7), inst(30,25), inst(11,8))}
		is (LUI) { 
			io.imm := Cat(0.asUInt(12.W), inst(31,12))}
		is (AUIPC) { 
			io.imm := Cat(0.asUInt(12.W), inst(31,12))}
		is (JAL) {
			io.imm := Cat(0.asUInt(11.W), inst(31), inst(19,12), inst(20), inst(30,21), 0.asUInt(1.W))
		}
	}
}