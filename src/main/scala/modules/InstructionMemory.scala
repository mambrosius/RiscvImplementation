// InstructionMemory -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Version: 1.0 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils._
import utils.Constants._
import utils.Collection._

class InstructionMemory extends Module { 

	val io = IO(new Bundle{
		val pc   = Input(UInt(WORD_W))
		val inst = Output(UInt(WORD_W))
	})

    val rom  = Program.read 
    io.inst := Cat(rom.read(io.pc + 3.U), rom.read(io.pc + 2.U), rom.read(io.pc + 1.U), rom.read(io.pc))
}