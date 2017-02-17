// Bin -- contains a helper function, for reading instruction files
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package utils

import chisel3._
import scala.io.Source._
import java.io.FileNotFoundException

object Bin {

	def read() : Mem[UInt] = {

		val source = try {

			fromFile("bin/program.bin") // program source

		} catch {

			case e: FileNotFoundException => throw new Exception("No such file..")
		} 

		val programLines 	= source.getLines.toArray 				// array of instruction stings
    	val instructionMem 	= Mem(programLines.length, UInt(32.W)) 	// instruction memory as UInt

    	// converts the instruction elements into UInt
		for (i <- 0 to programLines.length - 1) {	// until or to ??

    		instructionMem(i) := {"h" + programLines(i)}.asUInt(32.W)
    	} 

    	source.close
    	instructionMem 
	}
}