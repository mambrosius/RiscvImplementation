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
    	val reset    = Input(Bool())
        val instAddr = Output(UInt(Constant.WORD_SIZE.W))
        val regVal 	 = Output(UInt(Constant.WORD_SIZE.W))
    }) 

    // modules
    val programCounter  = Module(new ProgramCounter())
    val decoder         = Module(new Decoder())
    val registers       = Module(new Registers())
    val alu             = Module(new ALU())
    val dataMem         = Module(new DataMemory())

    val instMem = utils.Bin.read

    // in
    io.instAddr := programCounter.io.count
    
    // wiring
    programCounter.io.reset := io.reset 
    
    decoder.io.inst     := instMem.read(io.instAddr)

    registers.io.RDsel  := decoder.io.RDsel
    registers.io.RS1sel := decoder.io.RS1sel
    registers.io.RS2sel := decoder.io.RS2sel
    registers.io.dataIn := alu.io.result

    alu.io.opcode       := decoder.io.opcode
    alu.io.imm          := decoder.io.imm
    alu.io.RS1          := registers.io.RS1
    alu.io.RS2          := registers.io.RS2

    // out
    io.regVal := registers.io.RS1
}

object CPU extends App { 

    chisel3.Driver.execute(args: Array[String], () => new CPU)
}

