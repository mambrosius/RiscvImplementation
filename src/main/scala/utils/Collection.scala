//  Collection -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (March 2017)

package utils

import chisel3._

object Collection {

	class ctrl_io extends Bundle {
    	val opcode = Input(UInt(7.W))
    	val funct3 = Input(UInt(3.W))
    	val funct7 = Input(UInt(7.W))
    	val imm12  = Input(UInt(12.W))
	} 

	class value_io extends Bundle {
		val RS1    = Input(UInt(Constant.WORD_SIZE))
    	val RS2    = Input(UInt(Constant.WORD_SIZE))
	}

	class select_io extends Bundle {
		val RS1 = Input(UInt(5.W))
    	val RS2 = Input(UInt(5.W))
	}
}

