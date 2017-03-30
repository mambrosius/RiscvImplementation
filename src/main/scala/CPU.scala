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
        val rd          = Output(UInt(Constant.WORD_SIZE))
        val rs          = Flipped(new Collection.rs)
    }) 

    // program
    val instMem         = utils.Bin.read    

    // modules
    val pc              = Module(new ProgramCounter)
    val decoder         = Module(new Decoder)
    val control         = Module(new Control)
    val regs            = Module(new Registers)
    val alu             = Module(new ALU)
    val dataMem         = Module(new DataMemory)

    // pipes
    val IF_ID           = Module(new Pipeline.IF_ID)
    val ID_EX           = Module(new Pipeline.ID_EX)
    val EX_MEM          = Module(new Pipeline.EX_MEM)
    val MEM_WB          = Module(new Pipeline.MEM_WB)

    // in--------------------------------------------

    pc.io.reset         := false.B
    io.instAddr         := pc.io.count

    // IF/ID-----------------------------------------
    
    IF_ID.io.in.inst    := instMem.read(io.instAddr)
    
    regs.io.sel.rs      := decoder.io.F.sel.rs
    control.io.ctrl     := decoder.io.F.ctrl

    decoder.io.inst     := IF_ID.io.out.inst
   
    // ID/EX-----------------------------------------

    ID_EX.io.in.EX      := control.io.EX
    ID_EX.io.in.M       := control.io.M
    ID_EX.io.in.WB      := control.io.WB
    ID_EX.io.in.rd_sel  := decoder.io.F.sel.rd
    ID_EX.io.in.imm12   := decoder.io.F.imm12
    ID_EX.io.in.rs      := regs.io.reg.rs

    alu.io.ctrl         := ID_EX.io.out.EX.ctrl
    alu.io.imm12        := ID_EX.io.out.imm12
    alu.io.reg.rs       := ID_EX.io.out.rs

    // EX/MEM----------------------------------------

    EX_MEM.io.in.rd     := alu.io.reg.rd
    EX_MEM.io.in.M      := ID_EX.io.out.M
    EX_MEM.io.in.WB     := ID_EX.io.out.WB
    EX_MEM.io.in.rd_sel := ID_EX.io.out.rd_sel

    dataMem.io.M        := EX_MEM.io.out.M
    dataMem.io.rs.rs1   := EX_MEM.io.out.rd 
    dataMem.io.rs.rs2   := ID_EX.io.out.rs.rs2

    // MEM/WB----------------------------------------

    MEM_WB.io.in.WB     := EX_MEM.io.out.WB
    MEM_WB.io.in.rd_sel := EX_MEM.io.out.rd_sel
    MEM_WB.io.in.rd_alu := EX_MEM.io.out.rd
    MEM_WB.io.in.rd_mem := dataMem.io.rd

    regs.io.sel.rd      := MEM_WB.io.out.rd_sel
    val memToReg         = MEM_WB.io.out.WB.memToReg
    val rd_alu           = MEM_WB.io.out.rd_alu
    val rd_mem           = MEM_WB.io.out.rd_mem
    
    regs.io.reg.rd      := Mux(memToReg, rd_mem, rd_alu)

    // out-------------------------------------------
    
    io.rd       := regs.io.reg.rd
    io.rs.rs1   := ID_EX.io.in.rs.rs1 // regs.io.reg.rs.rs1
    io.rs.rs2   := ID_EX.io.in.rs.rs2             
}

object CPU extends App { 
    chisel3.Driver.execute(args: Array[String], () => new CPU)
}

