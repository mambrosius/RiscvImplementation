// Hello -- simple module for test
//
// Author: 	Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//			BSc Electro, Technical University of Denmark 
//
// Version:	0.1 (January 2017)

import chisel3._
import chisel3.iotesters.{PeekPokeTester, Driver}

class Hello extends Module {

	val io = IO(new Bundle{

		val out = Output(UInt(8.W))
	})

	io.out := 42.U
}

class HelloTester(c: Hello) extends PeekPokeTester(c) {
  
	step(1)
	expect(c.io.out, 42)
}


// Generate the Verilog code by invoking chiselMain() in the main()
object Hello extends App {

	iotesters.Driver.execute(args, () => new Hello) {

		c => new HelloTester(c)
	}
}
