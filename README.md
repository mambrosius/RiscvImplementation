# RISC-V Implementation

This repo contains an ongoing project on designing and implementing a RISC-V core on a FPGA. 

The design will target the base integer instructions, RV32I. Later the design is possible extended further, to include some instruction extensions like the RVM. The target FPGA for the current project is the Altera DE2-115. 

This project is written in the Chisel construction language, developed at UC Berkeley (https://chisel.eecs.berkeley.edu/index.html). Chisel is a toolchain containing Chisel 3 based on Scala, FIRRTL and Verilator, which introduce a higher abstraction level to the hardware development.   

To use this design either fork the project or clone it from here:

    git clone https://github.com/mambrosius/RiscvImplementation.git
    cd RiscvImplementation

# Quickstart

To get started you have to acquire the sbt, FIRRTL, and Verilator. 

## Installation

The installation guide can be found in the follwing links:

	sbt: 		http://www.scala-sbt.org/0.13/docs/Setup.html
	FIRRTL: 	https://github.com/ucb-bar/firrtl
	Verilatior: https://www.veripool.org/projects/verilator/wiki/Installing

### Mac users

If you are Mac user, Homebrew is recommended for installing sbt and Verilator. 

	brew: http://brew.sh

## Project Hierarchy

	Project Name
		> src
			> main
				> scala
					<scala main files or subfolders>
			> test
				> scala
					<scala test files or subfolders>
		build.sbt

## Compilation

To compile scala files with sbt, go to the home directory in the terminal and type:

	sbt run-main <SCALA_FILE>

To run chisel tests with sbt, typ:

	sbt test:run-main <SCALA_FILE>

# Note

This file will be updated as the project proceeds.