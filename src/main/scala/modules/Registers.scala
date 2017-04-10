// Registers -- contains the registers
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils.Constants._
import utils.Collection._

class Registers extends Module {
    
    val io = IO(new Bundle {
        val sel   = new SEL
        val reg   = Flipped(new REG)
    }) 

    // generates a vector of 32 bit UInt registers initialized to zero
    val x =  Reg(init = Vec(Seq.fill(32)(0.asUInt(WORD_SIZE))))

    x(io.sel.rd)  := io.reg.rd

    // out
    io.reg.rs.rs1 := x(io.sel.rs.rs1)
    io.reg.rs.rs2 := x(io.sel.rs.rs2)	
}