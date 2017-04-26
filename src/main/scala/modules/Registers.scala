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
        val sel   	 = new SEL
        val reg   	 = Flipped(new REG)
        val regWrite = Input(Bool())
    }) 

    val X = Mem(32, UInt(WORD_SIZE))
    when (io.regWrite) { X(io.sel.rd) := io.reg.rd }
    
    val fwd_rs1 = io.regWrite && (io.reg.rd =/= ZERO) && (io.sel.rd === io.sel.rs.rs1)
    val fwd_rs2 = io.regWrite && (io.reg.rd =/= ZERO) && (io.sel.rd === io.sel.rs.rs2)

    io.reg.rs.rs1 := Mux(fwd_rs1, io.reg.rd, X(io.sel.rs.rs1))
    io.reg.rs.rs2 := Mux(fwd_rs2, io.reg.rd, X(io.sel.rs.rs2))
}