// DetectHazardUnit -- contains control circuit for hazard detecting 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Version: 1.0 (April 2017)

package modules

import chisel3._
import utils.Constants._
import utils.Collection._

class DetectHazardUnit extends Module {

	val io = IO(new Bundle{
		val rs_id 	= new RS
		val rd_ex 	= Input(UInt(RS_W))
		val mem_r 	= Input(Bool())
		val tx_req  = Input(Bool())
		val stall 	= Output(Bool())
	})

	io.stall := (io.mem_r && ((io.rd_ex === io.rs_id.rs1) || (io.rd_ex === io.rs_id.rs2))) || io.tx_req
}