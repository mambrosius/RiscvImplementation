// CPU -- for test and later for complete implementation 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import chisel3._
import modules._
import utils._

class CPU extends Module {
    
    val io = IO(new Bundle {
    	val reset       = Input(Bool())
        val instAddr    = Output(UInt(Constant.WORD_SIZE.W))
        val RD 	        = Output(UInt(Constant.WORD_SIZE.W))
        val RS1         = Output(UInt(Constant.WORD_SIZE.W))
        val RS2         = Output(UInt(Constant.WORD_SIZE.W))
    }) 

    // modules
    val pc              = Module(new ProgramCounter())
    val decoder         = Module(new Decoder())
    val registers       = Module(new Registers())
    val alu             = Module(new ALU())
    val dataMem         = Module(new DataMemory())

    // program
    val instMem         = utils.Bin.read

    // in
    io.instAddr         := pc.io.count
    
    // wiring
    pc.io.reset         := io.reset 
    
    decoder.io.inst     := instMem.read(io.instAddr)

    registers.io.RDsel  := decoder.io.RDsel
    registers.io.RS1sel := decoder.io.RS1sel
    registers.io.RS2sel := decoder.io.RS2sel
    registers.io.dataIn := alu.io.RD

    alu.io.opcode       := decoder.io.opcode
    alu.io.funct3       := decoder.io.funct3
    alu.io.funct7       := decoder.io.funct7
    alu.io.imm12        := decoder.io.imm12
    alu.io.RS1          := registers.io.RS1
    alu.io.RS2          := registers.io.RS2

    // out
    io.RD  := registers.io.dataIn
    io.RS1 := registers.io.RS1
    io.RS2 := registers.io.RS2
}

object CPU extends App { 

    chisel3.Driver.execute(args: Array[String], () => new CPU)
}

