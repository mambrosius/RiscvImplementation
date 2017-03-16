// ALU -- contains the arithmetic operations
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils.Constant

class ALU extends Module {
    
    val io = IO(new Bundle {
        val funct3 = Input(UInt(3.W))
        val opcode = Input(UInt(7.W))
        val funct7 = Input(UInt(7.W))
        val imm12  = Input(UInt(12.W))
    	val RS1    = Input(UInt(Constant.WORD_SIZE))
    	val RS2    = Input(UInt(Constant.WORD_SIZE))
    	val RD     = Output(UInt(Constant.WORD_SIZE))
    }) 

    val shamt = io.imm12(4, 0) // used for logical shift operations 

    io.RD := MuxLookup(io.opcode, Constant.ZERO, Array(

        Constant.R_FORMAT   -> MuxLookup(io.funct3, Constant.ZERO, Array(
            Constant.ADD    -> MuxLookup(io.funct7, Constant.ZERO, Array(
                Constant.ZERO   -> (io.RS1 + io.RS2),
                32.U            -> (io.RS1 - io.RS2))),
            Constant.SLL    -> (io.RS1 << io.RS2(4, 0)),
            //Constant.SLT    -> Constant.ZERO,
            Constant.SLTU   -> (io.RS1 < io.RS2),
            Constant.XOR    -> (io.RS1 ^ io.RS2),
            Constant.SRL    -> MuxLookup(io.funct7, Constant.ZERO, Array(
                Constant.ZERO   -> (io.RS1 >> io.RS2(4, 0)),
                32.U            -> (Constant.ZERO))),
            Constant.OR     -> (io.RS1 | io.RS2))),

        Constant.I_FORMAT   -> MuxLookup(io.funct3, Constant.ZERO, Array( 
            Constant.ADDI   -> (io.RS1 + io.imm12), 
            Constant.SLLI   -> (io.RS1 << shamt),
            //Constant.SLTI -> Constant.ZERO,
            Constant.SLTIU  -> (io.RS1 < io.imm12),
            Constant.XORI   -> (io.RS1 ^ io.imm12),
            Constant.SRLI   -> MuxLookup(io.funct7, Constant.ZERO, Array( 
                Constant.ZERO   -> (io.RS1 >> io.RS2(4, 0)),
                32.U            -> (Constant.ZERO))),
            Constant.ORI    -> (io.RS1 | io.imm12)))
        /*
        ,Constant.BRANCH    -> MuxLookup(io.funct3, Constant.ZERO, Array(
            Constant.BNE    -> Constant.ZERO,
            Constant.BLT    -> Constant.ZERO,
            Constant.BGE    -> Constant.ZERO,
            Constant.BLTU   -> Constant.ZERO,
            Constant.BGEU   -> Constant.ZERO,
            ))
        *//*
        ,Constant.STORE     -> MuxLookup(io.funct3, Constant.ZERO, Array(
            Constant.SB     -> Constant.ZERO,
            Constant.SH     -> Constant.ZERO,
            Constant.SW     -> Constant.ZERO,
        *//*
        ,Constant.LOAD      -> MuxLookup(io.funct3, Constant.ZERO, Array(
            Constant.LB     -> Constant.ZERO,
            Constant.LH     -> Constant.ZERO,
            Constant.LW     -> Constant.ZERO,
            Constant.LBU    -> Constant.ZERO,
            Constant.LHU    -> Constant.ZERO,
        */
        ))
}