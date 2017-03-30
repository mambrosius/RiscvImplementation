//  Collection -- contains signal bundles
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (March 2017)

package utils

import chisel3._
import chisel3.util._
//import utils

object Collection {

	class F extends Bundle {
		// format fields //--------------------
		val sel 			= new sel
		val ctrl 			= new ctrl
    	val imm5 	 		= Input(UInt(5.W))
    	val imm7 	 		= Input(UInt(7.W))
    	val imm12  	 		= Input(UInt(12.W))
    	val imm20    		= Input(UInt(20.W))
    	// unique for SB //--------------------
    	val SB = new Bundle {
    		val imm4_1 		= Input(UInt(4.W))
    		val imm10_5 	= Input(UInt(6.W))
    		val imm11 		= Input(UInt(1.W))
    		val imm12 		= Input(UInt(1.W))}
    	// unique for UJ //--------------------
    	val UJ = new Bundle {
    		val imm10_1 	= Input(UInt(10.W))
    		val imm11 		= Input(UInt(1.W))
    		val imm19_12	= Input(UInt(8.W))
    		val imm20 		= Input(UInt(1.W))
    	}
    }

	class ctrl extends Bundle {
		val opcode 			= Input(UInt(7.W))
		val funct3 			= Input(UInt(3.W))
		val funct7 			= Input(UInt(7.W))
	}

	class rs extends Bundle {
		val rs1 = Input(UInt(Constant.WORD_SIZE))
		val rs2 = Input(UInt(Constant.WORD_SIZE))
	}

	class reg extends Bundle {
		val rs = new rs
		val rd = Output(UInt(Constant.WORD_SIZE))
	}
	
	class sel extends Bundle {
		val rs = new Bundle {
			val rs1 = Input(UInt(5.W))
			val rs2 = Input(UInt(5.W))}
		val rd = Input(UInt(5.W))
	}

	class ID_EX_io extends Bundle {
		val pc   	= Input(UInt(Constant.WORD_SIZE))
		val imm12 	= Input(UInt(Constant.WORD_SIZE))
		val rd_sel 	= Input(UInt(5.W))
		val rs 		= new rs
		val EX 		= new EX
		val M 		= new M
		val WB 		= new WB
	}

	class EX_MEM_io extends Bundle {
		val pc   	= Input(UInt(Constant.WORD_SIZE))
		val rd   	= Input(UInt(Constant.WORD_SIZE))
		val rd_sel 	= Input(UInt(5.W))
		val M 		= new M
		val WB 		= new WB
	}

	class MEM_WB_io extends Bundle {
		val WB 		= new WB
		val rd_sel 	= Input(UInt(5.W))
		val rd_alu  = Input(UInt(Constant.WORD_SIZE))
		val rd_mem 	= Input(UInt(Constant.WORD_SIZE))
	}

	class EX extends Bundle {
		val ctrl 	= new ctrl
		//val regDst  = Output()
		//val alu_src = Output(UInt(7.W)) // should be Bool()
		//val aluOp  = new Bundle {}
	}

	class M extends Bundle {
		val memWrite = Input(Bool())
		val memRead  = Input(Bool())
		//val branch   = Input()
	}

	class WB extends Bundle {
		val regWrite = Input(Bool())
		val memToReg = Input(Bool())
	}
}

