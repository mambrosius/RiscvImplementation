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
		val regWrite_exMem  = Input(Bool())
		val regWrite_memWb 	= Input(Bool())
		val sel_rs1			= Input(UInt(5.W))
		val sel_rs2 		= Input(UInt(5.W))
		val dst_exMem 		= Input(UInt(5.W))
		val dst_memWb 		= Input(UInt(5.W))
		val fwd_rs1 		= Output(UInt(2.W))
		val fwd_rs2 		= Output(UInt(2.W))
	})
	
	when (io.regWrite_exMem && (io.dst_exMem =/= ZERO) && (io.dst_exMem === io.sel_rs1)) {
		io.fwd_rs1 := FWD_EX
	} .elsewhen (io.regWrite_memWb && (io.dst_memWb =/= ZERO) && (io.dst_memWb === io.sel_rs1)) { 
		io.fwd_rs1 := FWD_MEM
	} .otherwise {
		io.fwd_rs1 := ZERO		
	}

	when (io.regWrite_exMem && (io.dst_exMem =/= ZERO) && (io.dst_exMem === io.sel_rs2)) {
		io.fwd_rs2 := FWD_EX
	} .elsewhen (io.regWrite_memWb && (io.dst_memWb =/= ZERO) && (io.dst_memWb === io.sel_rs2)) {
		io.fwd_rs2 := FWD_MEM
	} .otherwise {
		io.fwd_rs2 := ZERO
	}
}