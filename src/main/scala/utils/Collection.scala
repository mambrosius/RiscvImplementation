//  Collection -- contains signal bundles
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (March 2017)

package utils

import chisel3._
import chisel3.util._
import utils.Constants._

object Collection {

	class CTRL extends Bundle {
		val opcode 	= Input(UInt(OPCODE_W))
		val funct3 	= Input(UInt(FUNCT3_W))
		val funct7 	= Input(UInt(FUNCT7_W))
	}

	class RS extends Bundle {
		val rs1 = Input(UInt(RS_W))
		val rs2 = Input(UInt(RS_W))
	}

	class OP extends Bundle {
		val op1 = Input(UInt(WORD_W))
		val op2 = Input(UInt(WORD_W))
	}

	class IF_ID_io extends Bundle {
		val pc_next = Input(UInt(WORD_W))
		val inst 	= Input(UInt(WORD_W))
	}

	class ID_EX_io extends Bundle {
		val WB 		= new WB
		val MEM 	= new MEM
		val EX 		= new EX
		val op 		= new OP
		val rs 	 	= new RS
		val rd 		= Input(UInt(RD_W))
		val imm 	= Input(UInt(WORD_W))
		val pc_next = Input(UInt(WORD_W))
	}

	class EX_MEM_io extends Bundle {
		val WB 		 = new WB
		val MEM 	 = new MEM
		val op 		 = new OP 
		val rd 		 = Input(UInt(RD_W))
		val pc_next  = Input(UInt(WORD_W))
	}

	class MEM_WB_io extends Bundle {
		val WB 		= new WB
		val alu_res = Input(UInt(WORD_W))
		val mem_res = Input(UInt(WORD_W))
		val rd 		= Input(UInt(RD_W))
	}

	class EX extends Bundle {
		val opcode 	= Input(UInt(OPCODE_W))
		val alu_sel = Input(Bool())
		val alu_op  = new ALU_OP 
	}

	class MEM extends Bundle {
		val write 	= Input(Bool())
		val read  	= Input(Bool())
		val func 	= Input(UInt(FUNCT3_W))
	}

	class WB extends Bundle {
		val reg_w   = Input(Bool())
		val rd_mem 	= Input(Bool())
	}

	class ALU_OP extends Bundle {
		val func = Input(UInt(FUNCT3_W))
		val alt  = Input(Bool())
	}
}