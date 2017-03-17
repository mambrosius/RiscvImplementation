// Registers -- contains the registers
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils._

class Registers extends Module {
    
    val io = IO(new Bundle {
    	val RDsel  = Input(UInt(5.W))
    	val RD     = Input(UInt(Constant.WORD_SIZE))
    	val value  = Flipped(new Collection.value_io)
        val select = new Collection.select_io
    }) 

    // generates a vector of 32 bit UInt registers initialized to zero
    val x =  Reg(init = Vec(Seq.fill(32)(0.asUInt(Constant.WORD_SIZE))))

    x(io.RDsel) := io.RD

    // out
	io.value.RS1 := x(io.select.RS1)
	io.value.RS2 := x(io.select.RS2)	
}