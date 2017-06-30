// ALU -- contains the arithmetic operations
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Version: 1.0 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils.Constants._
import utils.Collection._

class ALU extends Module {

    val io = IO(new Bundle {
        val op       = new OP 
        val alu_ctrl = new ALU_CTRL
        val res      = Output(UInt(WORD_W))
    })

    val op1     = io.op.op1
    val op2     = io.op.op2
    val shamt   = io.op.op2(4, 0) 
    val compare = op1 - op2
    
    val res = Mux(io.alu_ctrl.mem, op1 + op2, MuxLookup(io.alu_ctrl.func, ZERO, Array(
        ADD     -> Mux(io.alu_ctrl.alt, op1 - op2, op1 + op2),  // ADD / ADDI / SUB
        SLL     -> (op1 << shamt),                              // SLL / SLLI
        SLT     -> compare(31),                                 // SLT / SLTI
        SLTU    -> (op1 < op2),                                 // SLTU / SLTIU
        XOR     -> (op1 ^ op2),                                 // XOR / XORI
        SRL     -> Mux(io.alu_ctrl.alt, 
                   Cat(Fill(31, op1(31)), op1),                 // SRA & I
                   (op1 >> shamt)),                             // SRL & I 
        OR      -> (op1 | op2),                                 // OR / ORI
        AND     -> (op1 & op2)                                  // AND / ANDI
    )))

    io.res := Mux(io.alu_ctrl.flush, ZERO, res)
}