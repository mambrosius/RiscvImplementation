// Decoder -- module that decodes intructions 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils._

class Decoder() extends Module {

	val io = IO(new Bundle {
		val inst 	 = Input(UInt(Constant.WORD_SIZE))
		val regSel 	 = Flipped(new Collection.regSel_io)
		val ctrl	 = Flipped(new Collection.ctrl_io)
	})

	io.ctrl.opcode 	 := io.inst(6, 0)
	io.regSel.RD	 := io.inst(11, 7)
	io.ctrl.funct3	 := io.inst(14, 12)
	io.regSel.rs.RS1 := io.inst(19, 15)
	io.regSel.rs.RS2 := io.inst(24, 20)
	io.ctrl.funct7	 := io.inst(31, 25)
	io.ctrl.imm12	 := io.inst(31, 20)
}