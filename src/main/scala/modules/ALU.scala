// ALU -- contains the arithmetic operations
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils.Constants._
import utils.Collection._

class ALU extends Module {

    val io = IO(new Bundle {
        val aluOp  = new ALU_OP
        val reg    = new REG
        val opcode = Input(UInt(7.W))
        val zero   = Output(Bool())
        val branch = Output(Bool())
    })

    val rs1   = io.reg.rs.rs1
    val op2   = io.reg.rs.rs2
    val shamt = op2(4, 0) 
    
    io.reg.rd := MuxLookup(io.opcode, ZERO, Array(

        R -> MuxLookup(io.aluOp.func, ZERO, Array(
            ADD     -> Mux(io.aluOp.alt, rs1 - op2, rs1 + op2), 
            SLL     -> (rs1 << shamt),
            //SLT   -> ZERO,
            SLTU    -> (rs1 < op2),
            XOR     -> (rs1 ^ op2),
            SRL     -> Mux(io.aluOp.alt, ZERO, rs1 >> shamt),
            OR      -> (rs1 | op2))),
        I -> MuxLookup(io.aluOp.func, ZERO, Array(
            ADD     -> (rs1 + op2), 
            SLL     -> (rs1 << shamt),
            //SLT   -> ZERO,
            SLTU    -> (rs1 < op2),
            XOR     -> (rs1 ^ op2),
            SRL     -> Mux(io.aluOp.alt, ZERO, rs1 >> shamt),
            OR      -> (rs1 | op2))),
        LOAD -> (rs1 + op2),
        /*MuxLookup(io.aluOp.func, ZERO, Array(
            LB     -> ZERO,
            LH     -> ZERO,
            LW     -> ZERO,
            LBU    -> ZERO,
            LHU    -> ZERO,
        ))*/ 
        STORE -> rs1,
        /*MuxLookup(io.aluOp.func, ZERO, Array(
            SB     -> ZERO,
            SH     -> ZERO,
            SW     -> ZERO,
        ))*/ 
        BRANCH -> (rs1 - op2)
        /*MuxLookup(io.aluOp.func, FALSE, Array(
            BEQ     -> (rs1 - op2),
            BNE     -> (rs1 != op2),
            BLT     -> (rs1 < op2),
            BGE     -> (rs1 > op2)
            BLTU  ->
            BGEU  ->
        ))*/        
    ))

    io.zero := io.reg.rd === ZERO    
    
    /*
    io.reg.rd := MuxLookup(io.aluOp.func, ZERO, Array(
        ADD     -> Mux(io.aluOp.alt, rs1 - op2, rs1 + op2), 
        SLL     -> (rs1 << shamt),
        //SLT   -> ZERO,
        SLTU    -> (rs1 < op2),
        XOR     -> (rs1 ^ op2),
        SRL     -> Mux(io.aluOp.alt, ZERO, rs1 >> shamt),
        OR      -> (rs1 | op2),
        
        STORE   -> rs1,
        LOAD    -> rs1
        //,BRANCH -> (rs1 - op2)
        ))

    io.zero := io.reg.rd === ZERO
    */
}