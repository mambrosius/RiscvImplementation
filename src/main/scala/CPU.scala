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

    io.instAddr         := pc.io.pc

    // IF/ID-----------------------------------------------------------------------------------------
    
    IF_ID.io.in.pc_next := pc.io.pc_next
    IF_ID.io.in.inst    := instMem.read(io.instAddr)

    decoder.io.inst     := IF_ID.io.out.inst

    regs.io.sel.rs      := decoder.io.field.sel.rs
    control.io.ctrl     := decoder.io.field.ctrl

    // ID/EX-----------------------------------------------------------------------------------------

    ID_EX.io.in.WB      := control.io.WB
    ID_EX.io.in.MEM     := control.io.MEM
    ID_EX.io.in.EX      := control.io.EX
    ID_EX.io.in.pc_next := IF_ID.io.out.pc_next
    ID_EX.io.in.rs      := regs.io.reg.rs
    ID_EX.io.in.imm_i   := decoder.io.field.imm.I
    ID_EX.io.in.imm_sb  := decoder.io.field.imm.SB // temp
    ID_EX.io.in.rd_sel  := decoder.io.field.sel.rd
    
    alu.io.aluOp        := ID_EX.io.out.EX.aluOp
    alu.io.reg.rs.rs1   := ID_EX.io.out.rs.rs1
    alu.io.reg.rs.rs2   := Mux(ID_EX.io.out.EX.alu_src, ID_EX.io.out.imm_i, ID_EX.io.out.rs.rs2)
    
    // EX/MEM----------------------------------------------------------------------------------------

    EX_MEM.io.in.WB     := ID_EX.io.out.WB
    EX_MEM.io.in.MEM    := ID_EX.io.out.MEM
    EX_MEM.io.in.pc_next:= (ID_EX.io.out.pc_next + ID_EX.io.out.imm_sb)
    EX_MEM.io.in.zero   := alu.io.zero
    EX_MEM.io.in.rd     := alu.io.reg.rd
    EX_MEM.io.in.rs2    := ID_EX.io.out.rs.rs2 
    EX_MEM.io.in.rd_sel := ID_EX.io.out.rd_sel

    dataMem.io.mem.op   := EX_MEM.io.out.MEM.op
    dataMem.io.rs.rs1   := EX_MEM.io.out.rd 
    dataMem.io.rs.rs2   := EX_MEM.io.out.rs2
    pc.io.branch        := EX_MEM.io.out.MEM.branch & EX_MEM.io.out.zero
    pc.io.pc_src        := EX_MEM.io.out.pc_next

    // MEM/WB----------------------------------------------------------------------------------------

    MEM_WB.io.in.WB     := EX_MEM.io.out.WB
    MEM_WB.io.in.rd_mem := dataMem.io.rd
    MEM_WB.io.in.rd_alu := EX_MEM.io.out.rd
    MEM_WB.io.in.rd_sel := EX_MEM.io.out.rd_sel

    regs.io.sel.rd      := MEM_WB.io.out.rd_sel
    regs.io.reg.rd      := Mux(MEM_WB.io.out.WB.memToReg, MEM_WB.io.out.rd_mem, MEM_WB.io.out.rd_alu)

    // out-------------------------------------------------------------------------------------------
    
    io.rd       := regs.io.reg.rd
    io.rs.rs1   := ID_EX.io.in.rs.rs1
    io.rs.rs2   := ID_EX.io.in.rs.rs2             
}

object CPU extends App { 
    chisel3.Driver.execute(args: Array[String], () => new CPU)
}

