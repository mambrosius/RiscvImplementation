// Constant -- contains project constants
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package utils

import chisel3._

object Constant {

	val ZERO		=	 0.U
	val WORD_SIZE 	=   32.W
	val MEM_SIZE 	= 1024
	val BYTE		= UInt(8.W)

	// opcodes (RV32I)
	//---------------------
	val LOAD	 	=   3.U
	val SYNCH	 	=  15.U
	val I  			=  19.U
	val STORE 	 	=  35.U
	val R 			=  51.U
	val BRANCH 	 	=  99.U
	// Loads 
	val LB    		=   0.U
	val LH    		=   1.U
	val LW    		=   2.U
	val LBU   		=   4.U
	val LHU   		=   5.U
	// Stores 
	val SB    		=   0.U
	val SH    		=   1.U
	val SW    		=   2.U
	// Shifts		 
	val SLL   		=   1.U 
	val SLLI  		=   1.U 
	val SRL   		=   5.U 
	val SRLI  		=   5.U 
	val SRA   		=   5.U 
	val SRAI  		=   6.U 
	// Arithmetic 
	val ADD   		=   0.U  
	val ADDI  		=   0.U   
	val SUB   		=   0.U
	val LUI   		=  55.U
	val AUIPC 		=  23.U
	// Logical 
	val XOR   		=   4.U  
	val XORI  		=   4.U 
	val OR    		=   6.U  
	val ORI   		=   6.U 
	val AND   		=   7.U
	val ANDI  		=   7.U 
	// Compare 
	val SLT   		=   2.U
	val SLTI  		=   2.U 
	val SLTU  		=   3.U
	val SLTIU 		=   3.U 
	// Branches 
	val BEQ   		=   0.U 
	val BNE   		=   1.U
	val BLT   		=   4.U
	val BGE   		=   5.U
	val BLTU  		=   6.U
	val BGEU  		=   7.U
	// Jump and link
	val JAL   		= 111.U
	val JALR  		= 103.U
	// Synch
	val FENCE 		=  15.U
	val FENCE_I 	=  15.U
	// System
	val SCALL       = null
	val SBREAK      = null
	// Counters 
	val RDCYCLE     = null
	val RDCYCLEH    = null
	val RDTIME      = null
	val RDTIMEH     = null
	val RDINSTRET   = null
	val RDINSTRETH  = null
	//---------------------
}