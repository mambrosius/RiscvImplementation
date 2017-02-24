// Registers -- contains the registers
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils.Constant

class Registers extends Module {
    
    val io = IO(new Bundle {
    	val RDsel  = Input(UInt(5.W))
    	val RS1sel = Input(UInt(5.W))
    	val RS2sel = Input(UInt(5.W))
    	val dataIn = Input(UInt(Constant.WORD_SIZE.W))
    	val RS1    = Output(UInt(Constant.WORD_SIZE.W))
    	val RS2    = Output(UInt(Constant.WORD_SIZE.W))
    }) 

    // generates a vector of 32 bit UInt registers initialized to zero
    val x =  Reg(init = Vec(Seq.fill(32)(0.asUInt(Constant.WORD_SIZE.W))))

    x(io.RDsel) := io.dataIn

    // out
	io.RS1 := x(io.RS1sel)
	io.RS2 := x(io.RS2sel)	
}