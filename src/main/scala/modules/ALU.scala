// ALU -- contains the arithmetic operations
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Vevalueion: 0.1 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils._

class ALU extends Module {

    val io = IO(new Bundle {
        val aluOp = new Collection.aluOp
        val reg   = new Collection.reg
        val zero  = Output(Bool())
    })

    val rs1   = io.reg.rs.rs1
    val op2   = io.reg.rs.rs2
    val shamt = op2(4, 0) 

    io.reg.rd := MuxLookup(io.aluOp.func, Constant.ZERO, Array(
        Constant.ADD    -> Mux(io.aluOp.alt, rs1 - op2, rs1 + op2), 
        Constant.SLL    -> (rs1 << shamt),
        //Constant.SLT  -> Constant.ZERO,
        Constant.SLTU   -> (rs1 < op2),
        Constant.XOR    -> (rs1 ^ op2),
        Constant.SRL    -> Mux(io.aluOp.alt, Constant.ZERO, rs1 >> shamt),
        Constant.OR     -> (rs1 | op2),
        Constant.STORE  -> rs1,
        Constant.LOAD   -> rs1))

    io.zero := Mux(io.reg.rd === 0.U, true.B, false.B)


        /*
        ,Constant.BRANCH    -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.BNE    -> Constant.ZERO,
            Constant.BLT    -> Constant.ZERO,
            Constant.BGE    -> Constant.ZERO,
            Constant.BLTU   -> Constant.ZERO,
            Constant.BGEU   -> Constant.ZERO,
            ))
        */
        /*
        , Constant.STORE    -> rs1,
          Constant.LOAD     -> rs1  
        */
        /*
        ,Constant.STORE     -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.SB     -> Constant.ZERO,
            Constant.SH     -> Constant.ZERO,
            Constant.SW     -> Constant.ZERO,
        *//*
        ,Constant.LOAD      -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.LB     -> Constant.ZERO,
            Constant.LH     -> Constant.ZERO,
            Constant.LW     -> Constant.ZERO,
            Constant.LBU    -> Constant.ZERO,
            Constant.LHU    -> Constant.ZERO,
        */
        //))
}