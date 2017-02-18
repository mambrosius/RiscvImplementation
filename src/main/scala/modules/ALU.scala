// ALU -- contains the arithmetic operations
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package modules

import chisel3._
import utils.Constant

class ALU extends Module {
    
    val io = IO(new Bundle {
        val opcode = Input(UInt(7.W))
    	val RS1     = Input(UInt(Constant.WORD_SIZE.W))
    	val RS2     = Input(UInt(Constant.WORD_SIZE.W))
        val imm    = Input(UInt(Constant.WORD_SIZE.W))
    	val result = Output(UInt(Constant.WORD_SIZE.W))
    }) 

    when (io.opcode === 0.U) {
        io.result := io.RS1 + io.RS2  // ADD RS1 and RS2
    } .elsewhen (io.opcode === 1.U) {
        io.result := io.RS1 + io.imm  // ADDI RS1 and immediate
    } .elsewhen (io.opcode === 2.U) {
        io.result := io.RS1 - io.RS2  // SUB RS2 from RS1
    } .elsewhen (io.opcode === 3.U) {
        io.result := io.RS1 << 2     // SLL RS1 by RS2
    } .elsewhen (io.opcode === 4.U) {
        io.result := io.RS1 >> 2     // SRL RS1 by RS2
    } .otherwise {
        io.result := io.RS1          // pass RS1
    }

    // Make the switch statement work
    /*
    switch (io.opcode) {

        is(0.U) {
            io.out := io.RS1 + io.RS2     // ADD/ ADDI RS1 and RS2/ immediate
        } 
        is(1.U) {
            io.out := io.RS1 - io.RS2     // SUB RS2 from RS1
        } 
        is(2.U) {
            io.out := io.RS1 << io.RS2    // SLL RS1 by RS2
        } 
        is(3.U) {
            io.out := io.RS1 >> io.RS2    // SRL RS1 by RS2
        }
    }
    */
}