// Hello -- 
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			BSc Electro, Technical University of Denmark 
//
// Version:	0.1 (January 2017)

package modules

import chisel3._

class Hello extends Module {

	val io = IO(new Bundle{

		val out = Output(UInt(8.W))
	})

	io.out := 42.U
}