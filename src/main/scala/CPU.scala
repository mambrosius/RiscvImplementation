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
import utils.Constants._
import utils.Collection._

class CPU extends Module {
    
    val io = IO(new Bundle {

        val txd = Output(Bool())
        //val pc  = Output(UInt(WORD_SIZE))

        // test signals

        //val valid = Output(Bool())

        //val data   = Output(UInt(BYTE_SIZE))
        val r0 = Output(UInt(BYTE_SIZE))
        val r1 = Output(UInt(BYTE_SIZE))
        val r2 = Output(UInt(BYTE_SIZE))
        val r3 = Output(UInt(BYTE_SIZE))
    
        /*  
        val rd_memWb = Output(UInt(WORD_SIZE))
        val aPrint   = Output(UInt(8.W))
        val memW     = Output(Bool())
        val wData   = Output(UInt(WORD_SIZE))
        val branch  = Output(Bool())   
        val pc_next = Output(UInt(WORD_SIZE)) 
        val inst    = Output(UInt(WORD_SIZE))
        val opcode  = Output(UInt(WORD_SIZE))
        val imm_i   = Output(UInt(WORD_SIZE))
        val imm_sb  = Output(UInt(WORD_SIZE))  
        val alu_sel = Output(Bool())
        val fwd_rs1 = Output(UInt(2.W))
        val fwd_rs2 = Output(UInt(2.W))
        val rs1      = Output(UInt(WORD_SIZE))
        val rs2      = Output(UInt(WORD_SIZE))
        val alu_src  = Output(UInt(WORD_SIZE))
        val op1      = Output(UInt(WORD_SIZE))
        val op2      = Output(UInt(WORD_SIZE))
        val rd_exMem = Output(UInt(WORD_SIZE))
        val zero     = Output(Bool())
        val alu_res  = Output(UInt(WORD_SIZE))
        val rs1_ifId = Output(UInt(WORD_SIZE))
        val rs2_ifId = Output(UInt(WORD_SIZE))
        val rd_sel    = Output(UInt(5.W))
        val sel_rs1   = Output(UInt(5.W))
        val sel_rs2   = Output(UInt(5.W))
        val dst_exMem = Output(UInt(5.W))
        val dst_memWb = Output(UInt(5.W))
        val regWrite_exMem = Output(Bool())
        val regWrite_memWb = Output(Bool())
        val memRead   = Output(Bool())
        val memWrite  = Output(Bool())
        val memRes    = Output(UInt(WORD_SIZE)) 
        */
    })  
 
    // program ------------------------------------------------------------------------------------------
    
    val instMem     = Bin.read    
    
    // modules ------------------------------------------------------------------------------------------
    
    val counter     = Module(new ProgramCounter)
    val decoder     = Module(new Decoder)
    val control     = Module(new Control)
    val regs        = Module(new Registers)
    val alu         = Module(new ALU)
    val dataMem     = Module(new DataMemory)
    val fwdUnit     = Module(new ForwardingUnit)
    val hazardUnit  = Module(new DetectHazardUnit)

    val uart        = Module(new UART)
    
    // pipes --------------------------------------------------------------------------------------------
    
    val IF_ID       = Module(new Pipeline.IF_ID)
    val ID_EX       = Module(new Pipeline.ID_EX)
    val EX_MEM      = Module(new Pipeline.EX_MEM)
    val MEM_WB      = Module(new Pipeline.MEM_WB)
    
    // IF -----------------------------------------------------------------------------------------------
    
    IF_ID.io.in.pc_next     := counter.io.pc_next
    IF_ID.io.in.inst        := instMem.read(counter.io.pc)

    // ID -----------------------------------------------------------------------------------------------

    decoder.io.inst         := IF_ID.io.out.inst
    regs.io.sel.rs          := decoder.io.sel.rs
    
    //control.io.ctrl       := decoder.io.ctrl
    control.io.ctrl.opcode  := Mux(uart.io.valid, decoder.io.ctrl.opcode, ZERO) // test signal 
    control.io.ctrl.funct3  := Mux(uart.io.valid, decoder.io.ctrl.funct3, ZERO) // test signal 
    control.io.ctrl.funct7  := Mux(uart.io.valid, decoder.io.ctrl.funct7, ZERO) // test signal 

    counter.io.branch       := (regs.io.reg.rs.rs1 === regs.io.reg.rs.rs2 && control.io.MEM.branch) || !uart.io.valid
    //counter.io.pc_src     := IF_ID.io.out.pc_next + decoder.io.imm.SB
    counter.io.pc_src       := Mux(uart.io.valid, IF_ID.io.out.pc_next + decoder.io.imm.SB, EX_MEM.io.out.pc_next - 1.U)

    ID_EX.io.in.WB          := control.io.WB
    ID_EX.io.in.MEM         := control.io.MEM
    ID_EX.io.in.EX          := control.io.EX
    ID_EX.io.in.pc_next     := IF_ID.io.out.pc_next
    ID_EX.io.in.rs          := regs.io.reg.rs
    
    ID_EX.io.in.imm         := Mux(control.io.MEM.write, decoder.io.imm.S, decoder.io.imm.I)
    ID_EX.io.in.sel         := decoder.io.sel
    
    // EX -----------------------------------------------------------------------------------------------

    fwdUnit.io.sel_rs1          := ID_EX.io.out.sel.rs.rs1
    fwdUnit.io.sel_rs2          := ID_EX.io.out.sel.rs.rs2
    fwdUnit.io.dst_exMem        := EX_MEM.io.out.dst
    fwdUnit.io.dst_memWb        := MEM_WB.io.out.dst 
    fwdUnit.io.regWrite_exMem   := EX_MEM.io.out.WB.regWrite
    fwdUnit.io.regWrite_memWb   := MEM_WB.io.out.WB.regWrite

    alu.io.opcode               := ID_EX.io.out.EX.opcode
    alu.io.aluOp                := ID_EX.io.out.EX.aluOp
    
    alu.io.reg.rs.rs1 := MuxLookup(fwdUnit.io.fwd_rs1, ZERO, Array(
        FWD_EX  -> EX_MEM.io.out.aluRes, 
        FWD_MEM -> regs.io.reg.rd,
        ZERO    -> ID_EX.io.out.rs.rs1))

    alu.io.reg.rs.rs2 := MuxLookup(fwdUnit.io.fwd_rs2, 5.U, Array(
        FWD_EX  -> EX_MEM.io.out.aluRes, 
        FWD_MEM -> regs.io.reg.rd,
        ZERO    -> Mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.rs.rs2)))

    
    EX_MEM.io.in.pc_next    := ID_EX.io.out.pc_next
    
    EX_MEM.io.in.WB         := ID_EX.io.out.WB
    EX_MEM.io.in.MEM        := ID_EX.io.out.MEM
    EX_MEM.io.in.zero       := alu.io.zero
    EX_MEM.io.in.aluRes     := alu.io.reg.rd
    EX_MEM.io.in.op2        := alu.io.reg.rs.rs2 

    EX_MEM.io.in.dst        := Mux(ID_EX.io.out.EX.dst_sel, ID_EX.io.out.sel.rd, ID_EX.io.out.sel.rs.rs2)

    // MEM ----------------------------------------------------------------------------------------------

    dataMem.io.mem          := EX_MEM.io.out.MEM
    dataMem.io.reg.rs.rs1   := EX_MEM.io.out.aluRes 
    dataMem.io.reg.rs.rs2   := EX_MEM.io.out.op2
   
    MEM_WB.io.in.WB         := EX_MEM.io.out.WB
    MEM_WB.io.in.rd_mem     := dataMem.io.reg.rd
    MEM_WB.io.in.rd_alu     := EX_MEM.io.out.aluRes
    MEM_WB.io.in.dst        := EX_MEM.io.out.dst

    // WB -----------------------------------------------------------------------------------------------

    regs.io.sel.rd          := MEM_WB.io.out.dst
    regs.io.regWrite        := MEM_WB.io.out.WB.regWrite
    regs.io.reg.rd          := Mux(MEM_WB.io.out.WB.memToReg, MEM_WB.io.out.rd_mem, MEM_WB.io.out.rd_alu)

    // UART ---------------------------------------------------------------------------------------------

    when (EX_MEM.io.out.MEM.write && dataMem.io.reg.rs.rs1 === 1025.U) { // add to constants
        uart.io.in := dataMem.io.reg.rs.rs2(7,0)
    } .otherwise {
        uart.io.in := ZERO
    }

    io.txd := uart.io.txd
    //io.pc  := counter.io.pc

    io.r0 := uart.io.r0 
    io.r1 := uart.io.r1
    io.r2 := uart.io.r2
    io.r3 := uart.io.r3
   
    // test signals -------------------------------------------------------------------------------------

    //io.valid := uart.io.valid

    /*
    io.pc       := counter.io.pc
    io.pc_next  := counter.io.pc_next
    io.inst     := instMem.read(io.pc)
    io.branch   := counter.io.branch 
    io.opcode   := ID_EX.io.out.EX.opcode
    io.imm_i    := decoder.io.imm.I
    io.imm_sb   := decoder.io.imm.SB
    io.fwd_rs1  := fwdUnit.io.fwd_rs1
    io.fwd_rs2  := fwdUnit.io.fwd_rs2
    io.rs1      := ID_EX.io.out.rs.rs1
    io.rs2      := ID_EX.io.out.rs.rs2
    io.alu_src  := Mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.rs.rs2)
    io.op1      := alu.io.reg.rs.rs1
    io.op2      := alu.io.reg.rs.rs2
    io.rd_exMem := EX_MEM.io.out.aluRes
   
    io.zero      := EX_MEM.io.out.zero
    io.alu_res   := alu.io.reg.rd  
    io.alu_sel   := ID_EX.io.out.EX.alu_sel
    io.rd_sel    := ID_EX.io.out.sel.rd
    io.sel_rs1   := ID_EX.io.out.sel.rs.rs1
    io.sel_rs2   := ID_EX.io.out.sel.rs.rs2
    io.dst_exMem := EX_MEM.io.out.dst
    io.dst_memWb := MEM_WB.io.out.dst 
    io.regWrite_exMem := EX_MEM.io.out.WB.regWrite
    io.regWrite_memWb := MEM_WB.io.out.WB.regWrite 
    io.memRead   := EX_MEM.io.out.MEM.read
    io.memWrite  := EX_MEM.io.out.MEM.write
    io.memRes    := dataMem.io.reg.rd
    io.wData     := EX_MEM.io.out.op2 
    */
}

object CPU extends App { 
    chisel3.Driver.execute(args, () => new CPU)
}