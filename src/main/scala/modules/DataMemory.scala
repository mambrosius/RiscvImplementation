// DataMemory -- contains the processors memory
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 1.0 (February 2017)

package modules

import chisel3._
import chisel3.util._
import utils.Constants._
import utils.Collection._

class DataMemory extends Module {
 
	val io = IO(new Bundle {
		val op  	= new OP
		val mem 	= new MEM
		val tx_req  = Input(Bool())
		val rx 		= Input(UInt(BYTE_W))
		val tx  	= Output(UInt(BYTE_W))
		val res 	= Output(UInt(WORD_W))

		val rx_out  = Output(UInt(BYTE_W))
		val rx_cnt  = Output(UInt(BYTE_W))	
	})

	val data_mem = Mem(MEM_D, 0.U (BYTE_W))
	val rx_out   = RegInit(UInt(BYTE_W), ZERO)

	when (io.mem.write) {
		switch(io.mem.func) {
			is (SB) {
				data_mem(io.op.op1) := io.op.op2(7,0)}	
			is (SH) {
				data_mem(io.op.op1)       := io.op.op2(7,0)
				data_mem(io.op.op1 + 1.U) := io.op.op2(15,8)} 
			is (SW) {
				data_mem(io.op.op1) 	  := io.op.op2(7,0)
				data_mem(io.op.op1 + 1.U) := io.op.op2(15,8)
				data_mem(io.op.op1 + 2.U) := io.op.op2(23,16)
				data_mem(io.op.op1 + 3.U) := io.op.op2(31,24)} 
		}
	} 

	when (io.mem.read) {	
		switch(io.mem.func) {
			is (LB) {
				val sbyte = data_mem(io.op.op1)
				io.res 	 := Cat(Fill(24, sbyte(7)), sbyte)}
			is (LBU) {
				io.res   := Cat("h000000".U, data_mem(io.op.op1))}
			is (LH) {
				val sbyte = data_mem(io.op.op1 + 1.U)
				io.res 	 := Cat(Fill(16, sbyte(7)), sbyte, data_mem(io.op.op1))} 
			is (LHU) {
				io.res 	 := Cat("h0000".U,
								data_mem(io.op.op1 + 1.U), data_mem(io.op.op1))}
			is (LW) {
				io.res 	 := Cat(data_mem(io.op.op1 + 3.U), data_mem(io.op.op1 + 2.U),  
							    data_mem(io.op.op1 + 1.U), data_mem(io.op.op1))
			}
		}
	} .otherwise { io.res := ZERO }

	io.tx := Mux((io.op.op1 === TX_ADDR) && !io.tx_req, io.op.op2, ZERO)
	//io.tx := Mux(io.op.op1 === TX_ADDR, io.op.op2, ZERO)

	when (io.rx =/= ZERO) {
		data_mem(RX_CNT) := data_mem(RX_CNT) + 1.U
		data_mem(RX_ADDR + data_mem(RX_CNT)  + 1.U) := io.rx
		rx_out := io.rx
	}	

	io.rx_cnt := data_mem(RX_CNT)
	io.rx_out := rx_out
}
