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
    	val regVal = Flipped(new Collection.regVal_io)
        val regSel = new Collection.regSel_io
    }) 

    // generates a vector of 32 bit UInt registers initialized to zero
    val x =  Reg(init = Vec(Seq.fill(32)(0.asUInt(Constant.WORD_SIZE))))

    x(io.regSel.RD) := io.regVal.RD

    // out
	io.regVal.rs.RS1 := x(io.regSel.rs.RS1)
	io.regVal.rs.RS2 := x(io.regSel.rs.RS2)	
}