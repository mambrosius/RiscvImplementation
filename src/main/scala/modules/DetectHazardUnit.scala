// DetectHazardUnit -- contains control circuit for hazard detecting 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical Univevalueity of Denmark, DTU Compute
//
// Version: 0.1 (April 2017)

package modules

import chisel3._
import utils.Constants._
import utils.Collection._

class DetectHazardUnit extends Module {

	val io = IO(new Bundle{
		val rs1_id 	= Input(UInt(RS_W))
		val rs2_id 	= Input(UInt(RS_W))
		val rs2_ex 	= Input(UInt(RS_W))
		val memRead = Input(Bool())
		val stall 	= Output(Bool())
	})

	io.stall := io.memRead && ((io.rs2_ex === io.rs1_id) || (io.rs2_ex === io.rs2_id))
}