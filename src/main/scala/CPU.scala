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
        val value       = Flipped(new Collection.value_io)
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
    
    // IF/ID-------------------------------------------------------
    
    decoder.io.inst     := Reg(next = instMem.read(io.instAddr))
    registers.io.RDsel  := Reg(next = Reg(next = decoder.io.RDsel))
    registers.io.select := decoder.io.select

    // ID/EX-------------------------------------------------------

    alu.io.ctrl         := Reg(next = decoder.io.ctrl)
    alu.io.value        := Reg(next = registers.io.value)

    // EX/MEM------------------------------------------------------

    // MEM/WB------------------------------------------------------

    registers.io.RD     := Reg(next = alu.io.RD)

    // out
    io.RD               := registers.io.RD
    io.value            := registers.io.value
    
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

