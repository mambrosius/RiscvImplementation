// MainTest -- test bench for Main.scala
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

import chisel3._
import chisel3.iotesters.PeekPokeTester

class MainTest(c: Main) extends PeekPokeTester(c) {

	poke(c.io.in, 4)
	step(1)	
	expect(c.io.out, 4100.U)
}

object MainTest extends App {

	iotesters.Driver.execute(args, () => new Main) {

		c => new MainTest(c)		
	}
}