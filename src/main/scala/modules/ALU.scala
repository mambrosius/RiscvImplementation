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
        val opcode = Input(UInt(OPCODE_W))
        val alu_op = new ALU_OP
        val op     = new OP   
        val res    = Output(UInt(WORD_W))
    })

    val op1   = io.op.op1
    val op2   = io.op.op2
    val shamt = op2(4, 0) 
    
    io.res := MuxLookup(io.opcode, ZERO, Array(

        R -> MuxLookup(io.alu_op.func, ZERO, Array(
            ADD     -> Mux(io.alu_op.alt, op1 - op2, op1 + op2), 
            SLL     -> (op1 << shamt),
            //SLT   -> ZERO,
            SLTU    -> (op1 < op2),
            XOR     -> (op1 ^ op2),
            SRL     -> Mux(io.alu_op.alt, ZERO, op1 >> shamt),
            OR      -> (op1 | op2))),
        I -> MuxLookup(io.alu_op.func, ZERO, Array(
            ADD     -> (op1 + op2), 
            SLL     -> (op1 << shamt),
            //SLT   -> ZERO,
            SLTU    -> (op1 < op2),
            XOR     -> (op1 ^ op2),
            SRL     -> Mux(io.alu_op.alt, ZERO, op1 >> shamt),
            OR      -> (op1 | op2))),
        L -> (op1 + op2), 
        S -> (op1 + op2)      
    )) 
}