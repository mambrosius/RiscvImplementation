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
        

        // test signals -----------------------

        val r0 = Output(UInt(BYTE_W))
        val r1 = Output(UInt(BYTE_W))
        val r2 = Output(UInt(BYTE_W))
        val r3 = Output(UInt(BYTE_W))

        val inst = Output(UInt(WORD_W))

        val pc      = Output(UInt(WORD_W))
        val stall   = Output(Bool())
        val rs1_id  = Output(UInt(RS_W))
        val rs2_id  = Output(UInt(RS_W))
        val rd_ex   = Output(UInt(RD_W))
        val mem_r   = Output(Bool())
        val read    = Output(Bool())

        /*
        // Program counter
        val pc      = Output(UInt(WORD_W))
        val pc_next = Output(UInt(WORD_W)) 
        
        // Decoder
        
        val opcode  = Output(UInt(WORD_W))
        val imm     = Output(UInt(WORD_W))
        val op1     = Output(UInt(WORD_W))
        val op2     = Output(UInt(WORD_W))
        val rd      = Output(UInt(5.W))
        
        // Control
        val alu_sel = Output(Bool())
        val valid   = Output(Bool())
        val branch  = Output(Bool()) 
        val fwd1    = Output(UInt(2.W))
        val fwd2    = Output(UInt(2.W))

        // ALU 
        val alu_src = Output(UInt(WORD_W))   
        val zero    = Output(Bool())
        */
    })  
 
    // modules ------------------------------------------------------------------------------------------
    
    val instMem     = Module(new InstructionMemory)
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
    
    //counter.io.pc_src     := IF_ID.io.out.pc_next + decoder.io.imm.SB
    //counter.io.branch     := (control.io.MEM.branch && (regs.io.op.op1 === regs.io.op.op2)) || !uart.io.valid
    counter.io.stall        := hazardUnit.io.stall
    counter.io.branch       := EX_MEM.io.out.zero && EX_MEM.io.out.MEM.branch
    //counter.io.pc_src     := Mux(uart.io.valid, IF_ID.io.out.pc_next + decoder.io.imm, EX_MEM.io.out.pc_next - 1.U)
    counter.io.pc_src       := EX_MEM.io.out.pc_src 
    instMem.io.pc           := counter.io.pc

    IF_ID.io.stall          := hazardUnit.io.stall
    IF_ID.io.in.pc_next     := counter.io.pc_next
    IF_ID.io.in.inst        := instMem.io.inst

    // ID -----------------------------------------------------------------------------------------------

    decoder.io.inst         := IF_ID.io.out.inst
    regs.io.rs              := decoder.io.rs
    
    hazardUnit.io.rs_id     := decoder.io.rs
    hazardUnit.io.rd_ex     := ID_EX.io.out.rd 
    hazardUnit.io.mem_r     := ID_EX.io.out.MEM.read

    control.io.stall        := hazardUnit.io.stall
    control.io.ctrl         := decoder.io.ctrl

    ID_EX.io.in.WB          := control.io.WB
    ID_EX.io.in.MEM         := control.io.MEM
    ID_EX.io.in.EX          := control.io.EX
    ID_EX.io.in.pc_next     := IF_ID.io.out.pc_next
    ID_EX.io.in.op          := regs.io.op
    ID_EX.io.in.imm         := decoder.io.imm
    ID_EX.io.in.rs          := decoder.io.rs
    ID_EX.io.in.rd          := decoder.io.rd
    
    // EX -----------------------------------------------------------------------------------------------

    fwdUnit.io.rs           := ID_EX.io.out.rs
    fwdUnit.io.rd_mem       := EX_MEM.io.out.rd
    fwdUnit.io.rd_wb        := MEM_WB.io.out.rd 
    fwdUnit.io.reg_w_mem    := EX_MEM.io.out.WB.reg_w 
    fwdUnit.io.reg_w_wb     := MEM_WB.io.out.WB.reg_w

    alu.io.opcode           := ID_EX.io.out.EX.opcode
    alu.io.alu_op           := ID_EX.io.out.EX.alu_op
    
    alu.io.op.op1 := MuxLookup(fwdUnit.io.fwd_rs1, ZERO, Array(
        FWD_EX  -> EX_MEM.io.out.op.op1, 
        FWD_MEM -> regs.io.res,
        ZERO    -> ID_EX.io.out.op.op1))

    alu.io.op.op2 := MuxLookup(fwdUnit.io.fwd_rs2, ZERO, Array(
        FWD_EX  -> Mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, EX_MEM.io.out.op.op1), 
        FWD_MEM -> Mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, regs.io.res),
        ZERO    -> Mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.op.op2)))
 
    EX_MEM.io.in.pc_src     := ID_EX.io.out.pc_next + (ID_EX.io.out.imm << 2)
    EX_MEM.io.in.WB         := ID_EX.io.out.WB
    EX_MEM.io.in.MEM        := ID_EX.io.out.MEM
    EX_MEM.io.in.op.op2     := ID_EX.io.out.op.op2 
    EX_MEM.io.in.zero       := alu.io.zero
    EX_MEM.io.in.op.op1     := alu.io.res
    
    EX_MEM.io.in.rd         := ID_EX.io.out.rd

    // MEM ----------------------------------------------------------------------------------------------

    dataMem.io.mem          := EX_MEM.io.out.MEM
    dataMem.io.op           := EX_MEM.io.out.op 
   
    MEM_WB.io.in.WB         := EX_MEM.io.out.WB
    MEM_WB.io.in.rd         := EX_MEM.io.out.rd
    MEM_WB.io.in.mem_res    := dataMem.io.res
    MEM_WB.io.in.alu_res    := EX_MEM.io.out.op.op1

    // WB -----------------------------------------------------------------------------------------------

    regs.io.rd              := MEM_WB.io.out.rd
    regs.io.reg_w           := MEM_WB.io.out.WB.reg_w
    regs.io.res             := Mux(MEM_WB.io.out.WB.rd_mem, MEM_WB.io.out.mem_res, MEM_WB.io.out.alu_res)

    // UART ---------------------------------------------------------------------------------------------

    when (EX_MEM.io.out.MEM.write && dataMem.io.op.op1 === 1025.U) { // add to constants
        uart.io.in := dataMem.io.op.op2
    } .otherwise {
        uart.io.in := ZERO
    }

    io.txd := uart.io.txd
    
    // test signals -------------------------------------------------------------------------------------
    
    io.r0 := uart.io.r0 
    io.r1 := uart.io.r1
    io.r2 := uart.io.r2
    io.r3 := uart.io.r3

    io.inst  := instMem.io.inst
    
    io.pc     := counter.io.pc
    io.stall  := hazardUnit.io.stall
    io.rs1_id := decoder.io.rs.rs1
    io.rs2_id := decoder.io.rs.rs2
    io.rd_ex  := ID_EX.io.out.rd
    io.mem_r  := ID_EX.io.out.MEM.read

    io.read   := control.io.MEM.read
    /*
    io.pc       := counter.io.pc
    
    io.pc_next  := counter.io.pc_next

    io.opcode   := ID_EX.io.out.EX.opcode
    io.rd       := regs.io.rd

    io.valid    := uart.io.valid
    io.branch   := counter.io.branch 
    
    io.imm      := decoder.io.imm
    io.alu_sel  := ID_EX.io.out.EX.alu_sel

    io.fwd1     := fwdUnit.io.fwd_rs1
    io.fwd2     := fwdUnit.io.fwd_rs2

    io.op1      := ID_EX.io.out.op.op1
    io.op2      := ID_EX.io.out.op.op2
    
    io.zero     := EX_MEM.io.out.zero    
    */
}

object CPU extends App { 
    chisel3.Driver.execute(args, () => new CPU)
}