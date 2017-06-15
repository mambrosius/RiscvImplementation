// Bin -- contains a helper function, for reading instruction files
//
// Author:  Morten Ambrosius Andreasen (s141227@student.dtu.dk)
//          Technical University of Denmark, DTU Compute
//
// Version: 0.1 (February 2017)

package utils

import chisel3._
import scala.io.Source._
import utils.Constants._
import java.io.FileNotFoundException

object Program {

	def read() : Mem[UInt] = {

		val source = try {

			fromFile("bin/reverse.hex")

		} catch {
			case e: FileNotFoundException => 
			throw new Exception("No such file..")
		} 

		val programLines 	= source.getLines.toArray 				
    	val instructionMem 	= Mem(programLines.length, UInt(WORD_W)) 	

    	// converts the instruction elements into UInt
		for (i <- 0 to programLines.length - 1) {

    		instructionMem(i) := {"h" + programLines(i)}.U (WORD_W)
    	} 

    	source.close
    	instructionMem 
	}
}