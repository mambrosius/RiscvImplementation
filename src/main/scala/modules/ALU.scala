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
        val ctrl  = new Collection.ctrl
        val reg   = new Collection.reg
        val imm12 = Input(UInt(Constant.WORD_SIZE)) // temp
    })

    val rs1   = io.reg.rs.rs1
    val rs2   = io.reg.rs.rs2
    val shamt = io.imm12(4, 0) 

    io.reg.rd := MuxLookup(io.ctrl.opcode, Constant.ZERO, Array(

        Constant.R_FORMAT   -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.ADD    -> MuxLookup(io.ctrl.funct7, Constant.ZERO, Array(
                Constant.ZERO   -> (rs1 + rs2),
                32.U            -> (rs1 - rs2))),
            Constant.SLL    -> (rs1 << shamt),
            //Constant.SLT    -> Constant.ZERO,
            Constant.SLTU   -> (rs1 < rs2),
            Constant.XOR    -> (rs1 ^ rs2),
            Constant.SRL    -> MuxLookup(io.ctrl.funct7, Constant.ZERO, Array(
                Constant.ZERO   -> (rs1 >> shamt),
                32.U            -> (Constant.ZERO))),
            Constant.OR     -> (rs1 | rs2))),

        Constant.I_FORMAT   -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array( 
            Constant.ADDI   -> (rs1 + io.imm12), 
            Constant.SLLI   -> (rs1 << shamt),
            //Constant.SLTI -> Constant.ZERO,
            Constant.SLTIU  -> (rs1 < io.imm12),
            Constant.XORI   -> (rs1 ^ io.imm12),
            Constant.SRLI   -> MuxLookup(io.ctrl.funct7, Constant.ZERO, Array( 
                Constant.ZERO   -> (rs1 >> shamt),
                32.U            -> (Constant.ZERO))),
            Constant.ORI    -> (rs1 | io.imm12)))
        /*
        ,Constant.BRANCH    -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.BNE    -> Constant.ZERO,
            Constant.BLT    -> Constant.ZERO,
            Constant.BGE    -> Constant.ZERO,
            Constant.BLTU   -> Constant.ZERO,
            Constant.BGEU   -> Constant.ZERO,
            ))
        */

        , Constant.STORE    -> rs1,
          Constant.LOAD     -> rs1  

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
        ))
}