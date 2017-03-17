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

    val io = IO(
        new Bundle {
        val ctrl   = new Collection.ctrl_io
        val value  = new Collection.value_io
    	val RD     = Output(UInt(Constant.WORD_SIZE))
    }) 

    val shamt = io.ctrl.imm12(4, 0) // used for logical shift operations 

    io.RD := MuxLookup(io.ctrl.opcode, Constant.ZERO, Array(

        Constant.R_FORMAT   -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.ADD    -> MuxLookup(io.ctrl.funct7, Constant.ZERO, Array(
                Constant.ZERO   -> (io.value.RS1 + io.value.RS2),
                32.U            -> (io.value.RS1 - io.value.RS2))),
            Constant.SLL    -> (io.value.RS1 << io.value.RS2(4, 0)),
            //Constant.SLT    -> Constant.ZERO,
            Constant.SLTU   -> (io.value.RS1 < io.value.RS2),
            Constant.XOR    -> (io.value.RS1 ^ io.value.RS2),
            Constant.SRL    -> MuxLookup(io.ctrl.funct7, Constant.ZERO, Array(
                Constant.ZERO   -> (io.value.RS1 >> io.value.RS2(4, 0)),
                32.U            -> (Constant.ZERO))),
            Constant.OR     -> (io.value.RS1 | io.value.RS2))),

        Constant.I_FORMAT   -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array( 
            Constant.ADDI   -> (io.value.RS1 + io.ctrl.imm12), 
            Constant.SLLI   -> (io.value.RS1 << shamt),
            //Constant.SLTI -> Constant.ZERO,
            Constant.SLTIU  -> (io.value.RS1 < io.ctrl.imm12),
            Constant.XORI   -> (io.value.RS1 ^ io.ctrl.imm12),
            Constant.SRLI   -> MuxLookup(io.ctrl.funct7, Constant.ZERO, Array( 
                Constant.ZERO   -> (io.value.RS1 >> io.value.RS2(4, 0)),
                32.U            -> (Constant.ZERO))),
            Constant.ORI    -> (io.value.RS1 | io.ctrl.imm12)))
        /*
        ,Constant.BRANCH    -> MuxLookup(io.ctrl.funct3, Constant.ZERO, Array(
            Constant.BNE    -> Constant.ZERO,
            Constant.BLT    -> Constant.ZERO,
            Constant.BGE    -> Constant.ZERO,
            Constant.BLTU   -> Constant.ZERO,
            Constant.BGEU   -> Constant.ZERO,
            ))
        *//*
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