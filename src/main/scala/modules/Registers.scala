// Registers -- contains the registers
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 1.0 (February 2017)

package modules

import chisel3._
import utils.Constants._
import utils.Collection._

class Registers extends Module {
    
    val io = IO(new Bundle {
        val rs    = new RS
        val reg_w = Input(Bool())
        val rd    = Input(UInt(RD_W))
        val res   = Input(UInt(WORD_W))
        val op    = Flipped(new OP)
    }) 

    val x = RegInit(Vec(Seq.fill(32)(0.asUInt(WORD_W))))

    val fwd_rs1 = io.reg_w && (io.res =/= ZERO) && (io.rd === io.rs.rs1)
    val fwd_rs2 = io.reg_w && (io.res =/= ZERO) && (io.rd === io.rs.rs2)
    
    x(ZERO)   := ZERO
     
    io.op.op1 := Mux(fwd_rs1, io.res, x(io.rs.rs1))
    io.op.op2 := Mux(fwd_rs2, io.res, x(io.rs.rs2))

    when (io.reg_w) { x(io.rd) := io.res }
}