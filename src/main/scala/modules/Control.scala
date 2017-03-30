// Control -- 
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (March 2017)

package modules

import chisel3._
import utils._

class Control extends Module {

	val io = IO(new Bundle {
		val ctrl = new Collection.ctrl
		val EX 	 = Flipped(new Collection.EX)
		val M 	 = Flipped(new Collection.M)
		val WB 	 = Flipped(new Collection.WB)
	})

	io.EX.ctrl := io.ctrl
	io.M.memRead  := Mux(io.ctrl.opcode === Constant.LOAD, true.B, false.B)
	io.M.memWrite := Mux(io.ctrl.opcode === Constant.STORE, true.B, false.B)

	io.WB.memToReg := Mux(io.ctrl.opcode === Constant.LOAD, true.B, false.B)
	io.WB.regWrite := true.B 
}