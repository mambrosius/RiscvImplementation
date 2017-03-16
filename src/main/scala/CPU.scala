// CPU -- for test and later for complete implementation 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import chisel3._
import chisel3.util._
import modules._
import utils._

class CPU extends Module {
    
    val io = IO(new Bundle {
        val instAddr    = Output(UInt(Constant.WORD_SIZE))
        val RD 	        = Output(UInt(Constant.WORD_SIZE))
        val RS1         = Output(UInt(Constant.WORD_SIZE))
        val RS2         = Output(UInt(Constant.WORD_SIZE))
    }) 

    // modules
    val pc              = Module(new ProgramCounter)
    val decoder         = Module(new Decoder)
    val registers       = Module(new Registers)
    val alu             = Module(new ALU)
    val dataMem         = Module(new DataMemory)

    // program
    val instMem         = utils.Bin.read

    // in
    pc.io.reset         := false.B
    io.instAddr         := pc.io.count
    
    // wiring
    decoder.io.inst     := Reg(next = instMem.read(io.instAddr))
    
    // IF/ID-------------------------------------------------------

    registers.io.RS1sel := decoder.io.RS1sel
    registers.io.RS2sel := decoder.io.RS2sel
    registers.io.RDsel  := Reg(next = Reg(next = decoder.io.RDsel))

    // ID/EX-------------------------------------------------------

    alu.io.opcode       := Reg(next = decoder.io.opcode)
    alu.io.funct3       := Reg(next = decoder.io.funct3)
    alu.io.funct7       := Reg(next = decoder.io.funct7)
    alu.io.imm12        := Reg(next = decoder.io.imm12)
    alu.io.RS1          := Reg(next = registers.io.RS1)
    alu.io.RS2          := Reg(next = registers.io.RS2)
    
    // EX/MEM------------------------------------------------------


    // MEM/WB------------------------------------------------------

    registers.io.RD     := Reg(next = alu.io.RD)

    // out
    io.RD  := registers.io.RD
    io.RS1 := registers.io.RS1
    io.RS2 := registers.io.RS2
    
    /* note---------------------------------------------------------
    find way to use Pipe() interface, instead of Reg(next = x)  
    val ifid            = Module(new Pipe(UInt(Constant.WORD_SIZE)))
    ifid.io.enq.bits    := pc.io.count
    io.instAddr         := ifid.io.deq.bits
    --------------------------------------------------------------*/
}

object CPU extends App { 

    chisel3.Driver.execute(args: Array[String], () => new CPU)
}

