// Main -- for test and later for complete implementation 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import utils._
import chisel3._

class Main extends Module {
    
    val io = IO(new Bundle {
        val in  = Input(UInt(32.W))
        val out = Output(UInt(32.W))
    }) 

    val testReg = Reg(UInt(io.out.getWidth.W))
    val instructionMem = utils.Bin.read()

    testReg := instructionMem(io.in)
    io.out := testReg    
}

object Main extends App { 

    chisel3.Driver.execute(args: Array[String], () => new Main)
}