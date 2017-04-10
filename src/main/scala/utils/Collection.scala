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

	class FIELD extends Bundle {
		val sel  = new SEL
		val ctrl = new CTRL
		val imm  = new Bundle {
			val I 	= Input(UInt(12.W))
			val S 	= Input(UInt(12.W)) 
			val SB 	= Input(UInt(12.W))
			val U 	= Input(UInt(20.W))
			val UJ 	= Input(UInt(20.W))
		}
    }

	class CTRL extends Bundle {
		val opcode 	= Input(UInt(7.W))
		val funct3 	= Input(UInt(3.W))
		val funct7 	= Input(UInt(7.W))
	}

	class RS extends Bundle {
		val rs1 = Input(UInt(WORD_SIZE))
		val rs2 = Input(UInt(WORD_SIZE))
	}

	class REG extends Bundle {
		val rs = new RS
		val rd = Output(UInt(WORD_SIZE))
	}
	
	class SEL extends Bundle {
		val rs = new Bundle {
			val rs1 = Input(UInt(5.W))
			val rs2 = Input(UInt(5.W))}
		val rd = Input(UInt(5.W))
	}

	class IF_ID_io extends Bundle {
		val pc_next = Input(UInt(WORD_SIZE))
		val inst 	= Input(UInt(WORD_SIZE))
	}

	class ID_EX_io extends Bundle {
		val WB 		= new WB
		val MEM 	= new MEM
		val EX 		= new EX
		val pc_next = Input(UInt(WORD_SIZE))
		val imm_i 	= Input(UInt(WORD_SIZE))
		val rd_sel 	= Input(UInt(5.W))
		val rs 		= new RS	
	}

	class EX_MEM_io extends Bundle {
		val WB 		= new WB
		val MEM 	= new MEM
		val zero 	= Input(Bool())
		val pc_next = Input(UInt(WORD_SIZE))
		val rd   	= Input(UInt(WORD_SIZE))
		val rs2   	= Input(UInt(WORD_SIZE))
		val rd_sel 	= Input(UInt(5.W))
	}

	class MEM_WB_io extends Bundle {
		val WB 		= new WB
		val rd_sel 	= Input(UInt(5.W))
		val rd_alu  = Input(UInt(WORD_SIZE))
		val rd_mem 	= Input(UInt(WORD_SIZE))
	}

	class EX extends Bundle {
		val opcode 	= Input(UInt(7.W))
		val alu_src = Input(Bool())
		val aluOp  	= new ALU_OP 
	}

	class MEM extends Bundle {
		val op 		= new MEM_OP
		val branch  = Input(Bool())
	}

	class MEM_OP extends Bundle {
		val write 	= Input(Bool())
		val read  	= Input(Bool())
	}

	class WB extends Bundle {
		val regWrite = Input(Bool())
		val memToReg = Input(Bool())
	}

	class ALU_OP extends Bundle {
		val func = Input(UInt(3.W))
		val alt  = Input(Bool())
	}
}