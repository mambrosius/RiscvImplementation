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

			fromFile(PROGRAM)

		} catch {
			case e: FileNotFoundException => 
			throw new Exception("No such file..")
		} 

		val programLines 	= source.getLines.toArray 				
    	val instructionMem 	= Mem(programLines.length * 4, UInt(BYTE_W)) 	

    	// converts the instruction elements into UInt
		for (i <- 0 to programLines.length - 1) {
			val base = i * 4
			val instruction = {"h" + programLines(i)}.U (WORD_W)
			instructionMem(base)   		:= instruction(7,0)
			instructionMem(base + 1) 	:= instruction(15,8)
			instructionMem(base + 2) 	:= instruction(23,16)
			instructionMem(base + 3) 	:= instruction(31,24)

    		//instructionMem(i) := {"h" + programLines(i)}.U (WORD_W)
    	} 

    	source.close
    	instructionMem 
	}
}