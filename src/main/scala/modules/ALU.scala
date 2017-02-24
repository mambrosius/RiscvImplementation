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
    	val RS1    = Input(UInt(Constant.WORD_SIZE.W))
    	val RS2    = Input(UInt(Constant.WORD_SIZE.W))
    	val RD     = Output(UInt(Constant.WORD_SIZE.W))
    }) 

    when (io.opcode === Constant.R_FORMAT) {

        when (io.funct3 === Constant.ADD) {
            when (io.funct7 === 0.U) { io.RD := io.RS1 + io.RS2 } 
            .otherwise { io.RD := io.RS1 - io.RS2 }} 
        /* 
        .elsewhen (io.funct3 === Constant.SLL)  { io.RD := (io.RS1 << io.RS2) }
        .elsewhen (io.funct3 === Constant.SLT)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.SLTU) { io.RD := null } 
        */
        .elsewhen (io.funct3 === Constant.XOR) { io.RD := io.RS1 ^ io.RS2 }
        /*
        .elsewhen (io.funct3 === Constant.SRL) {
            when (io.funct7 === 0.U) { io.RD := null } 
            .otherwise { io.RD := null }} 
        */
        .elsewhen (io.funct3 === Constant.OR)  { io.RD := io.RS1 | io.RS2 }
        .otherwise { io.RD := 0.U }
        

    } .elsewhen (io.opcode === Constant.I_FORMAT) {

        when (io.funct3 === Constant.ADDI) { io.RD := io.RS1 + io.imm12 }
        /*
        .elsewhen (io.funct3 === Constant.SLLI)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.SLTI)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.SLTIU) { io.RD := null } 
        */
        .elsewhen (io.funct3 === Constant.XORI) { io.RD := io.RS1 ^ io.imm12 }
        /*
        .elsewhen (io.funct3 === Constant.SRLI)  {
            when (io.funct7 === 0.U) { io.RD := null } 
            .otherwise { io.RD := null }}
        */     
        .elsewhen (io.funct3 === Constant.ORI)  { io.RD := io.RS1 | io.imm12 } 
        .otherwise { io.RD := 0.U }
        
    } /* .elsewhen (io.opcode === Constant.BRANCH) {

        when (io.funct3 === Constant.BEQ) { io.RD := null } 
        .elsewhen (io.funct3 === Constant.BNE)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.BLT)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.BGE)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.BLTU) { io.RD := null } 
        .elsewhen (io.funct3 === Constant.BGEU) { io.RD := null } 
        .otherwise { io.RD := null }
        

    } *//* .elsewhen (io.opcode === Constant.STORE) {

        when (io.funct3 === Constant.SB) { io.RD := null } 
        .elsewhen (io.funct3 === Constant.SH) { io.RD := null } 
        .elsewhen (io.funct3 === Constant.SW) { io.RD := null } 
        .otherwise { io.RD := null }

    } *//* .elsewhen (io.opcode === Constant.LOAD) {

        when (io.funct3 === Constant.LB) { io.RD := null } 
        .elsewhen (io.funct3 === Constant.LH)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.LW)  { io.RD := null } 
        .elsewhen (io.funct3 === Constant.LBU) { io.RD := null } 
        .elsewhen (io.funct3 === Constant.LHU) { io.RD := null } 
        .otherwise { io.RD := null }
    } 
   
    */// note: make try using case statement instead 
}