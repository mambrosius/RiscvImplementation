// Main -- for test and later for complete implementation 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import utils._
import modules._
import chisel3._

class CPU extends Module {
    
    val io = IO(new Bundle {
    	val reset    = Input(Bool())
        val instAddr = Output(UInt(32.W))
        val inst 	 = Output(UInt(32.W))
    }) 

    val programCounter = Module(new ProgramCounter())
    val instMem = utils.Bin.read

    // in
    io.instAddr := programCounter.io.count
    
    // out
    programCounter.io.reset := io.reset 
    io.inst := instMem.read(io.instAddr)
}

object CPU extends App { 

    chisel3.Driver.execute(args: Array[String], () => new CPU)
}

