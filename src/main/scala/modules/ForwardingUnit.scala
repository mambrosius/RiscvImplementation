// ForwardingUnit -- contains control circuit for forwarding
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Version: 0.1 (April 2017)

package modules

import chisel3._
import utils.Constants._
import utils.Collection._

class ForwardingUnit extends Module {

	val io = IO(new Bundle {
		val reg_w_mem = Input(Bool())
		val reg_w_wb  = Input(Bool())
		val rs 		  = new RS 
		val rd_mem 	  = Input(UInt(RD_W))
		val rd_wb 	  = Input(UInt(RD_W))
		val fwd_rs1   = Output(UInt(2.W))
		val fwd_rs2   = Output(UInt(2.W))
	})
	
	when (io.reg_w_mem && (io.rd_mem =/= ZERO) && (io.rd_mem === io.rs.rs1)) {
		io.fwd_rs1 := FWD_EX
	} .elsewhen (io.reg_w_wb && (io.rd_wb =/= ZERO) && (io.rd_wb === io.rs.rs1)) { 
		io.fwd_rs1 := FWD_MEM
	} .otherwise {
		io.fwd_rs1 := ZERO		
	}

	when (io.reg_w_mem && (io.rd_mem =/= ZERO) && (io.rd_mem === io.rs.rs2)) {
		io.fwd_rs2 := FWD_EX
	} .elsewhen (io.reg_w_wb && (io.rd_wb =/= ZERO) && (io.rd_wb === io.rs.rs2)) {
		io.fwd_rs2 := FWD_MEM
	} .otherwise {
		io.fwd_rs2 := ZERO
	}
}