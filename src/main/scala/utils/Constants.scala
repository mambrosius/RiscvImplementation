// Constant -- contains project constants
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package utils

import chisel3._

object Constants {

	// program --------------------------------------------

	val PROGRAM  = "bin/reverse.hex"

	// attributes -----------------------------------------

	val MEM_D 	 = 512
	val BAUD 	 = 115200
	val FREQ 	 = 50000000
	
	val RX_ADDR  = 495.U
	val RX_CNT   = 511.U
	val TX_ADDR  = 512.U

	// constants ------------------------------------------

	val ZERO	 = 0.U
	val START 	 = 80.U
	val TRUE	 = true.B
	val FALSE 	 = false.B
	
	val RS_W 	 = 5.W
	val RD_W 	 = 5.W
	val OPCODE_W = 7.W
	val FUNCT3_W = 3.W
	val FUNCT7_W = 7.W
	val BYTE_W	 = 8.W
	val WORD_W 	 = 32.W

	val FWD_EX	 = "b10".U
	val FWD_MEM	 = "b01".U

	// opcodes --------------------------------------------

	val L  		= "h03".U 	// load
	val I  		= "h13".U 	// immediate
	val S  		= "h23".U 	// store
	val R  		= "h33".U 	// register
	val B 		= "h63".U	// branch
	val LUI   	= "h37".U 	// load upper imm
	val AUIPC 	= "h17".U 	// add upper imm to pc
	val JALR  	= "h67".U 	// jump and link register
	val JAL   	= "h6f".U 	// jump and link
	val SYNCH	= "h0f".U   // fence

	// funct3 ---------------------------------------------
 
	val LB  	= "b000".U  // load byte		
	val LH  	= "b001".U 	// load halfword
	val LW    	= "b010".U 	// load word
	val LBU   	= "b100".U 	// load byte unsigned
	val LHU   	= "b101".U  // load half unsigned
	 
	val SB    	= "b000".U 	// store byte	
	val SH    	= "b001".U	// store halfword 
	val SW    	= "b010".U  // store word	
		 
	val SLL   	= "b001".U 	// shift left
	val SRL   	= "b101".U 	// shift right
	val SRA   	= "b101".U 	// shift right arithmetic 
	
	val ADD   	= "b000".U 	// arithmetic add   
	val SUB   	= "b000".U	// arithmetic sub	
	 
	val XOR   	= "b100".U 	// logical xor		
	val OR    	= "b110".U	// logical or	
	val AND   	= "b111".U 	// logical and
	 
	val SLT   	= "b010".U 	// set less than
	val SLTU  	= "b011".U 	// set less than unsigned	
	
	val BEQ   	= "b000".U  // branch if equal  
	val BNE   	= "b001".U 	// branch if not equal 
	val BLT   	= "b100".U  // branch if less than 
	val BGE   	= "b101".U  // branch if greater or equal 
	val BLTU  	= "b110".U  // blt unsigned 
	val BGEU  	= "b111".U  // bge unsigned
	
	val FENCE 	= "hf".U 	// synch thread
	val FENCE_I = "hf".U 	// synch instruction and data

	//-----------------------------------------------------
}