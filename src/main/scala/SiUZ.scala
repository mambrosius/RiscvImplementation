// CPU -- top level of SiUZ 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 1.0 (February 2017)

import chisel3._
import chisel3.util._
import modules._
import utils._
import utils.Constants._
import utils.Collection._

class SiUZ extends Module {
    
    val io = IO(new Bundle {

        val rxd     = Input(Bool())
        val txd     = Output(Bool())
        val branch  = Output(Bool())
        val rx_out  = Output(UInt(BYTE_W))
        val rx_cnt  = Output(UInt(BYTE_W))
        
        // test signals -----------------------
        /*
        val pc      = Output(UInt(WORD_W))
        
        val branch_t = Output(UInt(WORD_W))
        val rx_in   = Input(UInt(BYTE_W))

        val fwd1    = Output(UInt(2.W))
        val fwd2    = Output(UInt(2.W))
              
        val op1     = Output(UInt(WORD_W))
        val op2     = Output(UInt(WORD_W))
        val imm     = Output(UInt(WORD_W))
        val func    = Output(UInt(BYTE_W))
        val res     = Output(UInt(WORD_W))
        
        val inst    = Output(UInt(WORD_W))
        val reg     = Output(UInt(BYTE_W))
        val data    = Output(UInt(BYTE_W))

        val pc      = Output(UInt(WORD_W))
        val stall   = Output(Bool())
        val rs1_id  = Output(UInt(RS_W))
        val rs2_id  = Output(UInt(RS_W))
        val rd_ex   = Output(UInt(RD_W))
        val mem_r   = Output(Bool())
        val read    = Output(Bool())
        
        val tx_req  = Output(Bool())

        val res     = Output(UInt(WORD_W))
        val reg_w   = Output(Bool())
        val rdy   = Output(Bool())

        val op1     = Output(UInt(WORD_W))
        val op2     = Output(UInt(WORD_W))

        val w_data  = Output(UInt(WORD_W))

        val fwd1    = Output(UInt(2.W))
        val fwd2    = Output(UInt(2.W))
        
        val alu_sel = Output(Bool())
        val alu_res = Output(UInt(WORD_W))
        val pc_src  = Output(UInt(WORD_W))
        
        val stall   = Output(Bool())
        
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
 
    // modules --------------------------------------------------------------------------------
    
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
    
    // pipes ----------------------------------------------------------------------------------
    
    val IF_ID       = Module(new Pipeline.IF_ID)
    val ID_EX       = Module(new Pipeline.ID_EX)
    val EX_MEM      = Module(new Pipeline.EX_MEM)
    val MEM_WB      = Module(new Pipeline.MEM_WB)
    
    // IF -------------------------------------------------------------------------------------
    
    counter.io.stall        := hazardUnit.io.stall || io.branch
    counter.io.src_sel      := control.io.jump || io.branch || dataMem.io.tx =/= ZERO
    counter.io.pc_src       := Mux(dataMem.io.tx =/= ZERO, 
        EX_MEM.io.out.pc_next, ID_EX.io.out.pc_next + (decoder.io.imm << 1))
    
    instMem.io.pc           := counter.io.pc

    IF_ID.io.stall          := hazardUnit.io.stall 
    IF_ID.io.in.pc_next     := counter.io.pc_next
    IF_ID.io.in.inst        := instMem.io.inst

    // ID -------------------------------------------------------------------------------------

    decoder.io.inst         := IF_ID.io.out.inst
    regs.io.rs              := decoder.io.rs
    
    hazardUnit.io.rs_id     := decoder.io.rs
    hazardUnit.io.rd_ex     := ID_EX.io.out.rd 
    hazardUnit.io.mem_r     := ID_EX.io.out.MEM.read
    hazardUnit.io.tx_req    := uart.io.tx_req
    
    control.io.flush        := hazardUnit.io.stall || io.branch
    control.io.ctrl         := decoder.io.ctrl

    when (decoder.io.ctrl.opcode === B) {    
        val compare = regs.io.op.op1 - regs.io.op.op2
        io.branch := MuxLookup(decoder.io.ctrl.funct3, FALSE, Array(
            BEQ  -> (compare === ZERO),
            BNE  -> (compare =/= ZERO), 
            BLT  -> (compare(31)), 
            BGE  -> (!compare(31)),
            BLTU -> (regs.io.op.op1 < regs.io.op.op2),
            BGEU -> (regs.io.op.op1 >= regs.io.op.op2)       
        ))
    } .otherwise {
        io.branch := FALSE
    }

    ID_EX.io.in.WB          := control.io.WB
    ID_EX.io.in.MEM         := control.io.MEM
    ID_EX.io.in.EX          := control.io.EX
    ID_EX.io.in.pc_next     := IF_ID.io.out.pc_next
    ID_EX.io.in.op          := regs.io.op
    ID_EX.io.in.imm         := decoder.io.imm
    ID_EX.io.in.rs          := decoder.io.rs
    ID_EX.io.in.rd          := decoder.io.rd

    // EX -------------------------------------------------------------------------------------

    fwdUnit.io.rs           := ID_EX.io.out.rs
    fwdUnit.io.rd_mem       := EX_MEM.io.out.rd
    fwdUnit.io.rd_wb        := MEM_WB.io.out.rd 
    fwdUnit.io.reg_w_mem    := EX_MEM.io.out.WB.reg_w 
    fwdUnit.io.reg_w_wb     := MEM_WB.io.out.WB.reg_w

    alu.io.alu_ctrl         := ID_EX.io.out.EX.alu_ctrl
    
    alu.io.op.op1 := MuxLookup(fwdUnit.io.fwd_rs1, ZERO, Array(
        FWD_EX  -> EX_MEM.io.out.op.op1, 
        FWD_MEM -> regs.io.res,
        ZERO    -> ID_EX.io.out.op.op1))

    val op2 = MuxLookup(fwdUnit.io.fwd_rs2, ZERO, Array(
        FWD_EX  -> EX_MEM.io.out.op.op1, 
        FWD_MEM -> regs.io.res,
        ZERO    -> ID_EX.io.out.op.op2))
    alu.io.op.op2 := Mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, op2)

    EX_MEM.io.in.MEM.write  := Mux(uart.io.tx_req, FALSE, ID_EX.io.out.MEM.write)
    EX_MEM.io.in.MEM.read   := Mux(uart.io.tx_req, FALSE, ID_EX.io.out.MEM.read)
    EX_MEM.io.in.MEM.func   := Mux(uart.io.tx_req, 0.asUInt(FUNCT3_W), ID_EX.io.out.MEM.func)
    EX_MEM.io.in.WB.reg_w   := Mux(uart.io.tx_req, FALSE, ID_EX.io.out.WB.reg_w)
    EX_MEM.io.in.WB.rd_mem  := Mux(uart.io.tx_req, FALSE, ID_EX.io.out.WB.rd_mem)

    EX_MEM.io.in.op.op2     := op2
    EX_MEM.io.in.op.op1     := alu.io.res    
    EX_MEM.io.in.pc_next    := ID_EX.io.out.pc_next
    EX_MEM.io.in.rd         := ID_EX.io.out.rd

    // MEM ------------------------------------------------------------------------------------

    dataMem.io.mem          := EX_MEM.io.out.MEM
    dataMem.io.op           := EX_MEM.io.out.op 
    dataMem.io.tx_req       := uart.io.tx_req
   
    MEM_WB.io.in.WB         := EX_MEM.io.out.WB
    MEM_WB.io.in.rd         := EX_MEM.io.out.rd
    MEM_WB.io.in.mem_res    := dataMem.io.res
    MEM_WB.io.in.alu_res    := EX_MEM.io.out.op.op1

    // WB -------------------------------------------------------------------------------------

    regs.io.rd    := MEM_WB.io.out.rd
    regs.io.reg_w := MEM_WB.io.out.WB.reg_w
    regs.io.res   := Mux(MEM_WB.io.out.WB.rd_mem, MEM_WB.io.out.mem_res, MEM_WB.io.out.alu_res)

    // UART -----------------------------------------------------------------------------------

    uart.io.rxd   := io.rxd
    dataMem.io.rx := uart.io.out 
    uart.io.in    := dataMem.io.tx
    io.txd        := uart.io.txd

    io.rx_cnt     := dataMem.io.rx_cnt

    // test signals ---------------------------------------------------------------------------

    val rx_out = RegInit(UInt(BYTE_W), ZERO)
    when (dataMem.io.rx_out =/= ZERO) { rx_out := dataMem.io.rx_out }
    io.rx_out := rx_out

    /*
    io.fwd1     := fwdUnit.io.fwd_rs1
    io.fwd2     := fwdUnit.io.fwd_rs2

    io.op1    := alu.io.op.op1
    io.op2    := alu.io.op.op2 
    io.imm    := decoder.io.imm
    io.func   := decoder.io.ctrl.funct3
    io.res    := alu.io.res
    
    io.branch := Mux(uart.io.tx_req, FALSE, ID_EX.io.out.MEM.branch)
    io.zero   := alu.io.zero

    io.data   := dataMem.io.tx 
    io.inst   := instMem.io.inst
    
    io.pc     := counter.io.pc
    io.stall  := hazardUnit.io.stall
    io.rs1_id := decoder.io.rs.rs1
    io.rs2_id := decoder.io.rs.rs2
    io.rd_ex  := ID_EX.io.out.rd
    io.mem_r  := ID_EX.io.out.MEM.read

    io.read   := control.io.MEM.read
    io.reg    := uart.io.reg
    io.tx_req   := uart.io.tx_req

    io.res      := Mux(MEM_WB.io.out.WB.rd_mem, MEM_WB.io.out.mem_res, MEM_WB.io.out.alu_res)
    io.reg_w    := MEM_WB.io.out.WB.reg_w

    io.fwd1     := fwdUnit.io.fwd_rs1
    io.fwd2     := fwdUnit.io.fwd_rs2
    io.alu_sel  := ID_EX.io.out.EX.alu_sel
    io.alu_res  := EX_MEM.io.out.op.op1

    io.pc_src   := EX_MEM.io.out.pc_src 
    io.w_data   := op2

    io.stall    := hazardUnit.io.stall
    
    io.pc       := counter.io.pc
    
    io.pc_next  := counter.io.pc_next

    io.opcode   := ID_EX.io.out.EX.opcode
    io.rd       := regs.io.rd

    io.valid    := uart.io.valid
    io.branch   := counter.io.branch 
    
    io.imm      := decoder.io.imm
    io.alu_sel  := ID_EX.io.out.EX.alu_sel

    io.op1      := ID_EX.io.out.op.op1
    io.op2      := ID_EX.io.out.op.op2
    
    io.zero     := EX_MEM.io.out.zero    
    */
}

object SiUZ extends App { 
    chisel3.Driver.execute(args, () => new SiUZ)
}