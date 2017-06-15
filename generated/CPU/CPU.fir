;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit CPU : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip branch : UInt<1>, flip pc_src : UInt<32>, pc_next : UInt<32>, pc : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<5>("h015"))) @[ProgramCounter.scala 22:30]
    node _T_8 = add(pc_reg, UInt<1>("h01")) @[ProgramCounter.scala 23:35]
    node _T_9 = tail(_T_8, 1) @[ProgramCounter.scala 23:35]
    io.pc_next <= _T_9 @[ProgramCounter.scala 23:25]
    node _T_10 = mux(io.branch, io.pc_src, io.pc_next) @[ProgramCounter.scala 24:31]
    pc_reg <= _T_10 @[ProgramCounter.scala 24:25]
    io.pc <= pc_reg @[ProgramCounter.scala 25:25]
    
  module Decoder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst : UInt<32>, flip ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, rd : UInt<5>, imm : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_17 = bits(io.inst, 6, 0) @[Decoder.scala 27:32]
    io.ctrl.opcode <= _T_17 @[Decoder.scala 27:25]
    node _T_18 = bits(io.inst, 11, 7) @[Decoder.scala 28:40]
    io.rd <= _T_18 @[Decoder.scala 28:33]
    node _T_19 = bits(io.inst, 14, 12) @[Decoder.scala 29:32]
    io.ctrl.funct3 <= _T_19 @[Decoder.scala 29:25]
    node _T_20 = bits(io.inst, 19, 15) @[Decoder.scala 30:40]
    io.rs.rs1 <= _T_20 @[Decoder.scala 30:33]
    node _T_21 = bits(io.inst, 24, 20) @[Decoder.scala 31:40]
    io.rs.rs2 <= _T_21 @[Decoder.scala 31:33]
    node _T_22 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Decoder.scala 32:47]
    node _T_23 = bits(io.inst, 31, 25) @[Decoder.scala 32:58]
    node _T_25 = mux(_T_22, _T_23, UInt<7>("h00")) @[Decoder.scala 32:31]
    io.ctrl.funct7 <= _T_25 @[Decoder.scala 32:25]
    node _T_26 = eq(UInt<5>("h013"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_26 : @[Conditional.scala 29:59]
      node _T_28 = bits(io.inst, 31, 20) @[Decoder.scala 36:59]
      node _T_29 = cat(UInt<20>("h00"), _T_28) @[Cat.scala 30:58]
      io.imm <= _T_29 @[Decoder.scala 36:32]
      skip @[Conditional.scala 29:59]
    node _T_30 = eq(UInt<2>("h03"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_30 : @[Conditional.scala 29:59]
      node _T_32 = bits(io.inst, 31, 20) @[Decoder.scala 38:59]
      node _T_33 = cat(UInt<20>("h00"), _T_32) @[Cat.scala 30:58]
      io.imm <= _T_33 @[Decoder.scala 38:32]
      skip @[Conditional.scala 29:59]
    node _T_34 = eq(UInt<7>("h067"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_34 : @[Conditional.scala 29:59]
      node _T_36 = bits(io.inst, 31, 20) @[Decoder.scala 40:59]
      node _T_37 = cat(UInt<20>("h00"), _T_36) @[Cat.scala 30:58]
      io.imm <= _T_37 @[Decoder.scala 40:32]
      skip @[Conditional.scala 29:59]
    node _T_38 = eq(UInt<6>("h023"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_38 : @[Conditional.scala 29:59]
      node _T_40 = bits(io.inst, 31, 25) @[Decoder.scala 42:59]
      node _T_41 = bits(io.inst, 11, 7) @[Decoder.scala 42:72]
      node _T_42 = cat(UInt<20>("h00"), _T_40) @[Cat.scala 30:58]
      node _T_43 = cat(_T_42, _T_41) @[Cat.scala 30:58]
      io.imm <= _T_43 @[Decoder.scala 42:32]
      skip @[Conditional.scala 29:59]
    node _T_44 = eq(UInt<7>("h063"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_44 : @[Conditional.scala 29:59]
      node _T_46 = bits(io.inst, 31, 31) @[Decoder.scala 44:59]
      node _T_47 = bits(io.inst, 7, 7) @[Decoder.scala 44:69]
      node _T_48 = bits(io.inst, 30, 25) @[Decoder.scala 44:78]
      node _T_49 = bits(io.inst, 11, 8) @[Decoder.scala 44:91]
      node _T_50 = cat(_T_48, _T_49) @[Cat.scala 30:58]
      node _T_51 = cat(UInt<20>("h00"), _T_46) @[Cat.scala 30:58]
      node _T_52 = cat(_T_51, _T_47) @[Cat.scala 30:58]
      node _T_53 = cat(_T_52, _T_50) @[Cat.scala 30:58]
      io.imm <= _T_53 @[Decoder.scala 44:32]
      skip @[Conditional.scala 29:59]
    node _T_54 = eq(UInt<6>("h037"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_54 : @[Conditional.scala 29:59]
      node _T_56 = bits(io.inst, 31, 12) @[Decoder.scala 46:59]
      node _T_57 = cat(UInt<12>("h00"), _T_56) @[Cat.scala 30:58]
      io.imm <= _T_57 @[Decoder.scala 46:32]
      skip @[Conditional.scala 29:59]
    node _T_58 = eq(UInt<5>("h017"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_58 : @[Conditional.scala 29:59]
      node _T_60 = bits(io.inst, 31, 12) @[Decoder.scala 48:59]
      node _T_61 = cat(UInt<12>("h00"), _T_60) @[Cat.scala 30:58]
      io.imm <= _T_61 @[Decoder.scala 48:32]
      skip @[Conditional.scala 29:59]
    node _T_62 = eq(UInt<7>("h06f"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_62 : @[Conditional.scala 29:59]
      node _T_64 = bits(io.inst, 31, 31) @[Decoder.scala 50:59]
      node _T_65 = bits(io.inst, 19, 12) @[Decoder.scala 50:69]
      node _T_66 = bits(io.inst, 20, 20) @[Decoder.scala 50:82]
      node _T_67 = bits(io.inst, 30, 21) @[Decoder.scala 50:92]
      node _T_69 = cat(_T_66, _T_67) @[Cat.scala 30:58]
      node _T_70 = cat(_T_69, UInt<1>("h00")) @[Cat.scala 30:58]
      node _T_71 = cat(UInt<11>("h00"), _T_64) @[Cat.scala 30:58]
      node _T_72 = cat(_T_71, _T_65) @[Cat.scala 30:58]
      node _T_73 = cat(_T_72, _T_70) @[Cat.scala 30:58]
      io.imm <= _T_73 @[Decoder.scala 50:32]
      skip @[Conditional.scala 29:59]
    
  module Control : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_30 = neq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 23:51]
    io.EX.alu_sel <= _T_30 @[Control.scala 23:33]
    node _T_31 = neq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 24:51]
    io.EX.dst_sel <= _T_31 @[Control.scala 24:33]
    node _T_32 = bits(io.ctrl.funct7, 5, 5) @[Control.scala 26:76]
    node _T_33 = mux(io.EX.alu_sel, UInt<1>("h00"), _T_32) @[Control.scala 26:39]
    io.EX.alu_op.alt <= _T_33 @[Control.scala 26:33]
    io.EX.alu_op.func <= io.ctrl.funct3 @[Control.scala 27:33]
    io.EX.opcode <= io.ctrl.opcode @[Control.scala 28:33]
    io.MEM.func <= io.ctrl.funct3 @[Control.scala 30:33]
    node _T_34 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 31:51]
    io.MEM.read <= _T_34 @[Control.scala 31:33]
    node _T_35 = eq(io.ctrl.opcode, UInt<6>("h023")) @[Control.scala 32:51]
    io.MEM.write <= _T_35 @[Control.scala 32:33]
    node _T_36 = eq(io.ctrl.opcode, UInt<7>("h063")) @[Control.scala 33:51]
    io.MEM.branch <= _T_36 @[Control.scala 33:33]
    io.WB.rd_mem <= io.MEM.read @[Control.scala 35:33]
    node _T_37 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 36:51]
    node _T_38 = eq(io.ctrl.opcode, UInt<5>("h013")) @[Control.scala 36:75]
    node _T_39 = or(_T_37, _T_38) @[Control.scala 36:57]
    node _T_40 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 36:99]
    node _T_41 = or(_T_39, _T_40) @[Control.scala 36:81]
    io.WB.reg_w <= _T_41 @[Control.scala 36:33]
    
  module Registers : 
    input clock : Clock
    input reset : UInt<1>
    output io : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip reg_w : UInt<1>, flip rd : UInt<5>, flip res : UInt<32>, flip op : {flip op1 : UInt<32>, flip op2 : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem x : UInt<32>[32] @[Registers.scala 24:16]
    infer mport _T_15 = x[UInt<1>("h00")], clock
    _T_15 <= UInt<1>("h00") @[Registers.scala 27:12]
    when io.reg_w : @[Registers.scala 28:21]
      infer mport _T_16 = x[io.rd], clock
      _T_16 <= io.res @[Registers.scala 28:32]
      skip @[Registers.scala 28:21]
    node _T_17 = neq(io.res, UInt<1>("h00")) @[Registers.scala 30:39]
    node _T_18 = and(io.reg_w, _T_17) @[Registers.scala 30:28]
    node _T_19 = eq(io.rd, io.rs.rs1) @[Registers.scala 30:59]
    node fwd_rs1 = and(_T_18, _T_19) @[Registers.scala 30:49]
    node _T_20 = neq(io.res, UInt<1>("h00")) @[Registers.scala 31:39]
    node _T_21 = and(io.reg_w, _T_20) @[Registers.scala 31:28]
    node _T_22 = eq(io.rd, io.rs.rs2) @[Registers.scala 31:59]
    node fwd_rs2 = and(_T_21, _T_22) @[Registers.scala 31:49]
    infer mport _T_23 = x[io.rs.rs1], clock
    node _T_24 = mux(fwd_rs1, io.res, _T_23) @[Registers.scala 33:21]
    io.op.op1 <= _T_24 @[Registers.scala 33:15]
    infer mport _T_25 = x[io.rs.rs2], clock
    node _T_26 = mux(fwd_rs2, io.res, _T_25) @[Registers.scala 34:21]
    io.op.op2 <= _T_26 @[Registers.scala 34:15]
    
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip opcode : UInt<7>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, zero : UInt<1>, branch : UInt<1>, res : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node shamt = bits(io.op.op2, 4, 0) @[ALU.scala 28:20]
    node _T_10 = sub(io.op.op1, io.op.op2) @[ALU.scala 33:47]
    node _T_11 = asUInt(_T_10) @[ALU.scala 33:47]
    node _T_12 = tail(_T_11, 1) @[ALU.scala 33:47]
    node _T_13 = add(io.op.op1, io.op.op2) @[ALU.scala 33:58]
    node _T_14 = tail(_T_13, 1) @[ALU.scala 33:58]
    node _T_15 = mux(io.alu_op.alt, _T_12, _T_14) @[ALU.scala 33:27]
    node _T_16 = dshl(io.op.op1, shamt) @[ALU.scala 34:29]
    node _T_17 = lt(io.op.op1, io.op.op2) @[ALU.scala 36:29]
    node _T_18 = xor(io.op.op1, io.op.op2) @[ALU.scala 37:29]
    node _T_19 = dshr(io.op.op1, shamt) @[ALU.scala 38:53]
    node _T_20 = mux(io.alu_op.alt, UInt<1>("h00"), _T_19) @[ALU.scala 38:27]
    node _T_21 = or(io.op.op1, io.op.op2) @[ALU.scala 39:29]
    node _T_22 = eq(UInt<3>("h06"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_23 = mux(_T_22, _T_21, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_24 = eq(UInt<3>("h05"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_25 = mux(_T_24, _T_20, _T_23) @[Mux.scala 46:16]
    node _T_26 = eq(UInt<3>("h04"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_27 = mux(_T_26, _T_18, _T_25) @[Mux.scala 46:16]
    node _T_28 = eq(UInt<2>("h03"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_29 = mux(_T_28, _T_17, _T_27) @[Mux.scala 46:16]
    node _T_30 = eq(UInt<1>("h01"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_31 = mux(_T_30, _T_16, _T_29) @[Mux.scala 46:16]
    node _T_32 = eq(UInt<1>("h00"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_33 = mux(_T_32, _T_15, _T_31) @[Mux.scala 46:16]
    node _T_34 = add(io.op.op1, io.op.op2) @[ALU.scala 41:29]
    node _T_35 = tail(_T_34, 1) @[ALU.scala 41:29]
    node _T_36 = dshl(io.op.op1, shamt) @[ALU.scala 42:29]
    node _T_37 = lt(io.op.op1, io.op.op2) @[ALU.scala 44:29]
    node _T_38 = xor(io.op.op1, io.op.op2) @[ALU.scala 45:29]
    node _T_39 = dshr(io.op.op1, shamt) @[ALU.scala 46:53]
    node _T_40 = mux(io.alu_op.alt, UInt<1>("h00"), _T_39) @[ALU.scala 46:27]
    node _T_41 = or(io.op.op1, io.op.op2) @[ALU.scala 47:29]
    node _T_42 = eq(UInt<3>("h06"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_43 = mux(_T_42, _T_41, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_44 = eq(UInt<3>("h05"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_45 = mux(_T_44, _T_40, _T_43) @[Mux.scala 46:16]
    node _T_46 = eq(UInt<3>("h04"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_47 = mux(_T_46, _T_38, _T_45) @[Mux.scala 46:16]
    node _T_48 = eq(UInt<2>("h03"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_49 = mux(_T_48, _T_37, _T_47) @[Mux.scala 46:16]
    node _T_50 = eq(UInt<1>("h01"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_51 = mux(_T_50, _T_36, _T_49) @[Mux.scala 46:16]
    node _T_52 = eq(UInt<1>("h00"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_53 = mux(_T_52, _T_35, _T_51) @[Mux.scala 46:16]
    node _T_54 = add(io.op.op1, io.op.op2) @[ALU.scala 48:19]
    node _T_55 = tail(_T_54, 1) @[ALU.scala 48:19]
    node _T_56 = add(io.op.op1, io.op.op2) @[ALU.scala 49:19]
    node _T_57 = tail(_T_56, 1) @[ALU.scala 49:19]
    node _T_58 = sub(io.op.op1, io.op.op2) @[ALU.scala 50:19]
    node _T_59 = asUInt(_T_58) @[ALU.scala 50:19]
    node _T_60 = tail(_T_59, 1) @[ALU.scala 50:19]
    node _T_61 = eq(UInt<7>("h063"), io.opcode) @[Mux.scala 46:19]
    node _T_62 = mux(_T_61, _T_60, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_63 = eq(UInt<6>("h023"), io.opcode) @[Mux.scala 46:19]
    node _T_64 = mux(_T_63, _T_57, _T_62) @[Mux.scala 46:16]
    node _T_65 = eq(UInt<2>("h03"), io.opcode) @[Mux.scala 46:19]
    node _T_66 = mux(_T_65, _T_55, _T_64) @[Mux.scala 46:16]
    node _T_67 = eq(UInt<5>("h013"), io.opcode) @[Mux.scala 46:19]
    node _T_68 = mux(_T_67, _T_53, _T_66) @[Mux.scala 46:16]
    node _T_69 = eq(UInt<6>("h033"), io.opcode) @[Mux.scala 46:19]
    node _T_70 = mux(_T_69, _T_33, _T_68) @[Mux.scala 46:16]
    io.res <= _T_70 @[ALU.scala 30:12]
    node _T_71 = eq(io.res, UInt<1>("h00")) @[ALU.scala 62:23]
    io.zero <= _T_71 @[ALU.scala 62:13]
    
  module DataMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {mem : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, res : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem data_mem : UInt<8>[512] @[DataMemory.scala 25:27]
    when io.mem.write : @[DataMemory.scala 27:29]
      node _T_11 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_11 : @[Conditional.scala 29:59]
        node _T_12 = bits(io.op.op1, 8, 0)
        infer mport _T_13 = data_mem[_T_12], clock
        node _T_14 = bits(io.op.op2, 7, 0) @[DataMemory.scala 30:65]
        _T_13 <= _T_14 @[DataMemory.scala 30:53]
        skip @[Conditional.scala 29:59]
      node _T_15 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_15 : @[Conditional.scala 29:59]
        node _T_16 = bits(io.op.op1, 8, 0)
        infer mport _T_17 = data_mem[_T_16], clock
        node _T_18 = bits(io.op.op2, 7, 0) @[DataMemory.scala 32:71]
        _T_17 <= _T_18 @[DataMemory.scala 32:59]
        node _T_20 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 33:52]
        node _T_21 = tail(_T_20, 1) @[DataMemory.scala 33:52]
        node _T_22 = bits(_T_21, 8, 0)
        infer mport _T_23 = data_mem[_T_22], clock
        node _T_24 = bits(io.op.op2, 15, 8) @[DataMemory.scala 33:71]
        _T_23 <= _T_24 @[DataMemory.scala 33:59]
        skip @[Conditional.scala 29:59]
      node _T_25 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_25 : @[Conditional.scala 29:59]
        node _T_26 = bits(io.op.op1, 8, 0)
        infer mport _T_27 = data_mem[_T_26], clock
        node _T_28 = bits(io.op.op2, 7, 0) @[DataMemory.scala 35:71]
        _T_27 <= _T_28 @[DataMemory.scala 35:59]
        node _T_30 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 36:52]
        node _T_31 = tail(_T_30, 1) @[DataMemory.scala 36:52]
        node _T_32 = bits(_T_31, 8, 0)
        infer mport _T_33 = data_mem[_T_32], clock
        node _T_34 = bits(io.op.op2, 15, 8) @[DataMemory.scala 36:71]
        _T_33 <= _T_34 @[DataMemory.scala 36:59]
        node _T_36 = add(io.op.op1, UInt<2>("h02")) @[DataMemory.scala 37:52]
        node _T_37 = tail(_T_36, 1) @[DataMemory.scala 37:52]
        node _T_38 = bits(_T_37, 8, 0)
        infer mport _T_39 = data_mem[_T_38], clock
        node _T_40 = bits(io.op.op2, 23, 16) @[DataMemory.scala 37:71]
        _T_39 <= _T_40 @[DataMemory.scala 37:59]
        node _T_42 = add(io.op.op1, UInt<2>("h03")) @[DataMemory.scala 38:52]
        node _T_43 = tail(_T_42, 1) @[DataMemory.scala 38:52]
        node _T_44 = bits(_T_43, 8, 0)
        infer mport _T_45 = data_mem[_T_44], clock
        node _T_46 = bits(io.op.op2, 31, 24) @[DataMemory.scala 38:71]
        _T_45 <= _T_46 @[DataMemory.scala 38:59]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 27:29]
    when io.mem.read : @[DataMemory.scala 42:28]
      node _T_47 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_47 : @[Conditional.scala 29:59]
        node _T_48 = bits(io.op.op1, 8, 0)
        infer mport _T_49 = data_mem[_T_48], clock
        io.res <= _T_49 @[DataMemory.scala 45:40]
        skip @[Conditional.scala 29:59]
      node _T_50 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_50 : @[Conditional.scala 29:59]
        node _T_52 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 47:66]
        node _T_53 = tail(_T_52, 1) @[DataMemory.scala 47:66]
        node _T_54 = bits(_T_53, 8, 0)
        infer mport _T_55 = data_mem[_T_54], clock
        node _T_56 = bits(io.op.op1, 8, 0)
        infer mport _T_57 = data_mem[_T_56], clock
        node _T_58 = cat(_T_55, _T_57) @[Cat.scala 30:58]
        io.res <= _T_58 @[DataMemory.scala 47:40]
        skip @[Conditional.scala 29:59]
      node _T_59 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_59 : @[Conditional.scala 29:59]
        node _T_61 = add(io.op.op1, UInt<2>("h03")) @[DataMemory.scala 50:66]
        node _T_62 = tail(_T_61, 1) @[DataMemory.scala 50:66]
        node _T_63 = bits(_T_62, 8, 0)
        infer mport _T_64 = data_mem[_T_63], clock
        node _T_66 = add(io.op.op1, UInt<2>("h02")) @[DataMemory.scala 51:74]
        node _T_67 = tail(_T_66, 1) @[DataMemory.scala 51:74]
        node _T_68 = bits(_T_67, 8, 0)
        infer mport _T_69 = data_mem[_T_68], clock
        node _T_71 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 52:78]
        node _T_72 = tail(_T_71, 1) @[DataMemory.scala 52:78]
        node _T_73 = bits(_T_72, 8, 0)
        infer mport _T_74 = data_mem[_T_73], clock
        node _T_75 = bits(io.op.op1, 8, 0)
        infer mport _T_76 = data_mem[_T_75], clock
        node _T_77 = cat(_T_74, _T_76) @[Cat.scala 30:58]
        node _T_78 = cat(_T_64, _T_69) @[Cat.scala 30:58]
        node _T_79 = cat(_T_78, _T_77) @[Cat.scala 30:58]
        io.res <= _T_79 @[DataMemory.scala 50:40]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 42:28]
    node _T_81 = eq(io.mem.read, UInt<1>("h00")) @[DataMemory.scala 42:28]
    when _T_81 : @[DataMemory.scala 56:22]
      io.res <= UInt<1>("h00") @[DataMemory.scala 56:31]
      skip @[DataMemory.scala 56:22]
    
  module ForwardingUnit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip reg_w_mem : UInt<1>, flip reg_w_wb : UInt<1>, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd_mem : UInt<5>, flip rd_wb : UInt<5>, fwd_rs1 : UInt<2>, fwd_rs2 : UInt<2>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_10 = neq(io.rd_mem, UInt<1>("h00")) @[ForwardingUnit.scala 26:42]
    node _T_11 = and(io.reg_w_mem, _T_10) @[ForwardingUnit.scala 26:28]
    node _T_12 = eq(io.rd_mem, io.rs.rs1) @[ForwardingUnit.scala 26:66]
    node _T_13 = and(_T_11, _T_12) @[ForwardingUnit.scala 26:52]
    when _T_13 : @[ForwardingUnit.scala 26:82]
      io.fwd_rs1 <= UInt<2>("h02") @[ForwardingUnit.scala 27:28]
      skip @[ForwardingUnit.scala 26:82]
    node _T_14 = neq(io.rd_wb, UInt<1>("h00")) @[ForwardingUnit.scala 28:47]
    node _T_15 = and(io.reg_w_wb, _T_14) @[ForwardingUnit.scala 28:34]
    node _T_16 = eq(io.rd_wb, io.rs.rs1) @[ForwardingUnit.scala 28:70]
    node _T_17 = and(_T_15, _T_16) @[ForwardingUnit.scala 28:57]
    node _T_19 = eq(_T_13, UInt<1>("h00")) @[ForwardingUnit.scala 26:82]
    node _T_20 = and(_T_19, _T_17) @[ForwardingUnit.scala 28:86]
    when _T_20 : @[ForwardingUnit.scala 28:86]
      io.fwd_rs1 <= UInt<1>("h01") @[ForwardingUnit.scala 29:28]
      skip @[ForwardingUnit.scala 28:86]
    node _T_22 = eq(_T_13, UInt<1>("h00")) @[ForwardingUnit.scala 26:82]
    node _T_24 = eq(_T_17, UInt<1>("h00")) @[ForwardingUnit.scala 28:86]
    node _T_25 = and(_T_22, _T_24) @[ForwardingUnit.scala 28:86]
    when _T_25 : @[ForwardingUnit.scala 30:22]
      io.fwd_rs1 <= UInt<1>("h00") @[ForwardingUnit.scala 31:28]
      skip @[ForwardingUnit.scala 30:22]
    node _T_26 = neq(io.rd_mem, UInt<1>("h00")) @[ForwardingUnit.scala 34:42]
    node _T_27 = and(io.reg_w_mem, _T_26) @[ForwardingUnit.scala 34:28]
    node _T_28 = eq(io.rd_mem, io.rs.rs2) @[ForwardingUnit.scala 34:66]
    node _T_29 = and(_T_27, _T_28) @[ForwardingUnit.scala 34:52]
    when _T_29 : @[ForwardingUnit.scala 34:82]
      io.fwd_rs2 <= UInt<2>("h02") @[ForwardingUnit.scala 35:28]
      skip @[ForwardingUnit.scala 34:82]
    node _T_30 = neq(io.rd_wb, UInt<1>("h00")) @[ForwardingUnit.scala 36:47]
    node _T_31 = and(io.reg_w_wb, _T_30) @[ForwardingUnit.scala 36:34]
    node _T_32 = eq(io.rd_wb, io.rs.rs2) @[ForwardingUnit.scala 36:70]
    node _T_33 = and(_T_31, _T_32) @[ForwardingUnit.scala 36:57]
    node _T_35 = eq(_T_29, UInt<1>("h00")) @[ForwardingUnit.scala 34:82]
    node _T_36 = and(_T_35, _T_33) @[ForwardingUnit.scala 36:86]
    when _T_36 : @[ForwardingUnit.scala 36:86]
      io.fwd_rs2 <= UInt<1>("h01") @[ForwardingUnit.scala 37:28]
      skip @[ForwardingUnit.scala 36:86]
    node _T_38 = eq(_T_29, UInt<1>("h00")) @[ForwardingUnit.scala 34:82]
    node _T_40 = eq(_T_33, UInt<1>("h00")) @[ForwardingUnit.scala 36:86]
    node _T_41 = and(_T_38, _T_40) @[ForwardingUnit.scala 36:86]
    when _T_41 : @[ForwardingUnit.scala 38:22]
      io.fwd_rs2 <= UInt<1>("h00") @[ForwardingUnit.scala 39:28]
      skip @[ForwardingUnit.scala 38:22]
    
  module DetectHazardUnit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip rs2_ex : UInt<5>, flip memRead : UInt<1>, stall : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_7 = eq(io.rs2_ex, io.rs1_id) @[DetectHazardUnit.scala 24:47]
    node _T_8 = eq(io.rs2_ex, io.rs2_id) @[DetectHazardUnit.scala 24:76]
    node _T_9 = or(_T_7, _T_8) @[DetectHazardUnit.scala 24:62]
    node _T_10 = and(io.memRead, _T_9) @[DetectHazardUnit.scala 24:32]
    io.stall <= _T_10 @[DetectHazardUnit.scala 24:18]
    
  module Tx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, txd : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg data : UInt<9>, clock with : (reset => (reset, UInt<9>("h01ff"))) @[UART.scala 92:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 93:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 94:28]
    node _T_15 = eq(state, UInt<4>("h00")) @[UART.scala 96:27]
    io.enq.ready <= _T_15 @[UART.scala 96:18]
    node _T_16 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_16 : @[Conditional.scala 29:59]
      when io.enq.valid : @[UART.scala 100:33]
        node _T_18 = cat(io.enq.bits, UInt<1>("h00")) @[Cat.scala 30:58]
        data <= _T_18 @[UART.scala 101:23]
        ticks <= UInt<1>("h00") @[UART.scala 102:23]
        state <= UInt<4>("h0b") @[UART.scala 103:23]
        skip @[UART.scala 100:33]
      skip @[Conditional.scala 29:59]
    node _T_19 = eq(UInt<4>("h01"), state) @[Conditional.scala 29:28]
    node _T_20 = eq(UInt<4>("h02"), state) @[Conditional.scala 29:28]
    node _T_21 = eq(UInt<4>("h03"), state) @[Conditional.scala 29:28]
    node _T_22 = eq(UInt<4>("h04"), state) @[Conditional.scala 29:28]
    node _T_23 = eq(UInt<4>("h05"), state) @[Conditional.scala 29:28]
    node _T_24 = eq(UInt<4>("h06"), state) @[Conditional.scala 29:28]
    node _T_25 = eq(UInt<4>("h07"), state) @[Conditional.scala 29:28]
    node _T_26 = eq(UInt<4>("h08"), state) @[Conditional.scala 29:28]
    node _T_27 = eq(UInt<4>("h09"), state) @[Conditional.scala 29:28]
    node _T_28 = eq(UInt<4>("h0a"), state) @[Conditional.scala 29:28]
    node _T_29 = eq(UInt<4>("h0b"), state) @[Conditional.scala 29:28]
    node _T_30 = or(_T_19, _T_20) @[Conditional.scala 29:53]
    node _T_31 = or(_T_30, _T_21) @[Conditional.scala 29:53]
    node _T_32 = or(_T_31, _T_22) @[Conditional.scala 29:53]
    node _T_33 = or(_T_32, _T_23) @[Conditional.scala 29:53]
    node _T_34 = or(_T_33, _T_24) @[Conditional.scala 29:53]
    node _T_35 = or(_T_34, _T_25) @[Conditional.scala 29:53]
    node _T_36 = or(_T_35, _T_26) @[Conditional.scala 29:53]
    node _T_37 = or(_T_36, _T_27) @[Conditional.scala 29:53]
    node _T_38 = or(_T_37, _T_28) @[Conditional.scala 29:53]
    node _T_39 = or(_T_38, _T_29) @[Conditional.scala 29:53]
    when _T_39 : @[Conditional.scala 29:59]
      node _T_40 = eq(ticks, UInt<9>("h01b2")) @[UART.scala 108:25]
      when _T_40 : @[UART.scala 108:39]
        node _T_42 = shr(data, 1) @[UART.scala 109:43]
        node _T_43 = cat(UInt<1>("h01"), _T_42) @[Cat.scala 30:58]
        data <= _T_43 @[UART.scala 109:23]
        ticks <= UInt<1>("h00") @[UART.scala 110:23]
        node _T_45 = sub(state, UInt<1>("h01")) @[UART.scala 111:32]
        node _T_46 = asUInt(_T_45) @[UART.scala 111:32]
        node _T_47 = tail(_T_46, 1) @[UART.scala 111:32]
        state <= _T_47 @[UART.scala 111:23]
        skip @[UART.scala 108:39]
      node _T_49 = eq(_T_40, UInt<1>("h00")) @[UART.scala 108:39]
      when _T_49 : @[UART.scala 112:26]
        node _T_51 = add(ticks, UInt<1>("h01")) @[UART.scala 113:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 113:32]
        ticks <= _T_52 @[UART.scala 113:23]
        skip @[UART.scala 112:26]
      skip @[Conditional.scala 29:59]
    node _T_53 = bits(data, 0, 0) @[UART.scala 117:19]
    io.txd <= _T_53 @[UART.scala 117:12]
    
  module UART : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, valid : UInt<1>, txd : UInt<1>, r0 : UInt<8>, r1 : UInt<8>, r2 : UInt<8>, r3 : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst tx of Tx @[UART.scala 42:20]
    tx.io is invalid
    tx.clock <= clock
    tx.reset <= reset
    wire _T_15 : UInt<8>[4] @[UART.scala 45:26]
    _T_15 is invalid @[UART.scala 45:26]
    _T_15[0] <= UInt<8>("h00") @[UART.scala 45:26]
    _T_15[1] <= UInt<8>("h00") @[UART.scala 45:26]
    _T_15[2] <= UInt<8>("h00") @[UART.scala 45:26]
    _T_15[3] <= UInt<8>("h00") @[UART.scala 45:26]
    reg q : UInt<8>[4], clock with : (reset => (reset, _T_15)) @[UART.scala 45:22]
    reg ptr : UInt<2>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 46:22]
    reg cnt : UInt<2>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 47:22]
    node _T_53 = add(ptr, cnt) @[UART.scala 48:38]
    node _T_54 = tail(_T_53, 1) @[UART.scala 48:38]
    reg i : UInt<4>, clock with : (reset => (reset, _T_54)) @[UART.scala 48:22]
    node _T_55 = add(ptr, cnt) @[UART.scala 50:14]
    node _T_56 = tail(_T_55, 1) @[UART.scala 50:14]
    i <= _T_56 @[UART.scala 50:7]
    io.r0 <= q[UInt<1>("h00")] @[UART.scala 52:11]
    io.r1 <= q[UInt<1>("h01")] @[UART.scala 53:11]
    io.r2 <= q[UInt<2>("h02")] @[UART.scala 54:11]
    io.r3 <= q[UInt<2>("h03")] @[UART.scala 55:11]
    node _T_74 = neq(io.in, UInt<1>("h00")) @[UART.scala 57:17]
    node _T_76 = neq(cnt, UInt<3>("h04")) @[UART.scala 57:32]
    node _T_77 = and(_T_74, _T_76) @[UART.scala 57:25]
    when _T_77 : @[UART.scala 57:41]
      node _T_81 = bits(i, 1, 0)
      q[_T_81] <= io.in @[UART.scala 58:14]
      node _T_83 = add(cnt, UInt<1>("h01")) @[UART.scala 59:21]
      node _T_84 = tail(_T_83, 1) @[UART.scala 59:21]
      cnt <= _T_84 @[UART.scala 59:14]
      skip @[UART.scala 57:41]
    node _T_86 = neq(cnt, UInt<1>("h00")) @[UART.scala 62:34]
    node _T_87 = and(tx.io.enq.ready, _T_86) @[UART.scala 62:27]
    when _T_87 : @[UART.scala 62:43]
      tx.io.enq.bits <= q[ptr] @[UART.scala 63:24]
      node _T_92 = sub(cnt, UInt<1>("h01")) @[UART.scala 64:20]
      node _T_93 = asUInt(_T_92) @[UART.scala 64:20]
      node _T_94 = tail(_T_93, 1) @[UART.scala 64:20]
      cnt <= _T_94 @[UART.scala 64:13]
      node _T_96 = add(ptr, UInt<1>("h01")) @[UART.scala 66:20]
      node _T_97 = tail(_T_96, 1) @[UART.scala 66:20]
      ptr <= _T_97 @[UART.scala 66:13]
      skip @[UART.scala 62:43]
    node _T_99 = neq(cnt, UInt<1>("h00")) @[UART.scala 69:28]
    tx.io.enq.valid <= _T_99 @[UART.scala 69:21]
    node _T_101 = neq(io.in, UInt<1>("h00")) @[UART.scala 72:18]
    node _T_103 = neq(cnt, UInt<1>("h00")) @[UART.scala 72:33]
    node _T_104 = or(_T_101, _T_103) @[UART.scala 72:26]
    node _T_105 = and(_T_104, tx.io.enq.ready) @[UART.scala 72:42]
    when _T_105 : @[UART.scala 72:62]
      io.valid <= UInt<1>("h00") @[UART.scala 73:18]
      skip @[UART.scala 72:62]
    node _T_107 = eq(_T_105, UInt<1>("h00")) @[UART.scala 72:62]
    when _T_107 : @[UART.scala 74:18]
      io.valid <= tx.io.enq.ready @[UART.scala 75:18]
      skip @[UART.scala 74:18]
    io.txd <= tx.io.txd @[UART.scala 78:13]
    
  module PipelineIF_ID : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {flip pc_next : UInt<32>, flip inst : UInt<32>}, flip out : {flip pc_next : UInt<32>, flip inst : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_12 : {flip pc_next : UInt<32>, flip inst : UInt<32>}, clock @[Pipeline.scala 20:34]
    _T_12.inst <= io.in.inst @[Pipeline.scala 20:34]
    _T_12.pc_next <= io.in.pc_next @[Pipeline.scala 20:34]
    io.out.inst <= _T_12.inst @[Pipeline.scala 20:24]
    io.out.pc_next <= _T_12.pc_next @[Pipeline.scala 20:24]
    
  module PipelineID_EX : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}, flip out : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_76 : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}, clock @[Pipeline.scala 29:34]
    _T_76.pc_next <= io.in.pc_next @[Pipeline.scala 29:34]
    _T_76.imm <= io.in.imm @[Pipeline.scala 29:34]
    _T_76.rd <= io.in.rd @[Pipeline.scala 29:34]
    _T_76.rs.rs2 <= io.in.rs.rs2 @[Pipeline.scala 29:34]
    _T_76.rs.rs1 <= io.in.rs.rs1 @[Pipeline.scala 29:34]
    _T_76.op.op2 <= io.in.op.op2 @[Pipeline.scala 29:34]
    _T_76.op.op1 <= io.in.op.op1 @[Pipeline.scala 29:34]
    _T_76.EX.alu_op.alt <= io.in.EX.alu_op.alt @[Pipeline.scala 29:34]
    _T_76.EX.alu_op.func <= io.in.EX.alu_op.func @[Pipeline.scala 29:34]
    _T_76.EX.dst_sel <= io.in.EX.dst_sel @[Pipeline.scala 29:34]
    _T_76.EX.alu_sel <= io.in.EX.alu_sel @[Pipeline.scala 29:34]
    _T_76.EX.opcode <= io.in.EX.opcode @[Pipeline.scala 29:34]
    _T_76.MEM.func <= io.in.MEM.func @[Pipeline.scala 29:34]
    _T_76.MEM.read <= io.in.MEM.read @[Pipeline.scala 29:34]
    _T_76.MEM.write <= io.in.MEM.write @[Pipeline.scala 29:34]
    _T_76.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 29:34]
    _T_76.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 29:34]
    _T_76.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 29:34]
    io.out.pc_next <= _T_76.pc_next @[Pipeline.scala 29:24]
    io.out.imm <= _T_76.imm @[Pipeline.scala 29:24]
    io.out.rd <= _T_76.rd @[Pipeline.scala 29:24]
    io.out.rs.rs2 <= _T_76.rs.rs2 @[Pipeline.scala 29:24]
    io.out.rs.rs1 <= _T_76.rs.rs1 @[Pipeline.scala 29:24]
    io.out.op.op2 <= _T_76.op.op2 @[Pipeline.scala 29:24]
    io.out.op.op1 <= _T_76.op.op1 @[Pipeline.scala 29:24]
    io.out.EX.alu_op.alt <= _T_76.EX.alu_op.alt @[Pipeline.scala 29:24]
    io.out.EX.alu_op.func <= _T_76.EX.alu_op.func @[Pipeline.scala 29:24]
    io.out.EX.dst_sel <= _T_76.EX.dst_sel @[Pipeline.scala 29:24]
    io.out.EX.alu_sel <= _T_76.EX.alu_sel @[Pipeline.scala 29:24]
    io.out.EX.opcode <= _T_76.EX.opcode @[Pipeline.scala 29:24]
    io.out.MEM.func <= _T_76.MEM.func @[Pipeline.scala 29:24]
    io.out.MEM.read <= _T_76.MEM.read @[Pipeline.scala 29:24]
    io.out.MEM.write <= _T_76.MEM.write @[Pipeline.scala 29:24]
    io.out.MEM.branch <= _T_76.MEM.branch @[Pipeline.scala 29:24]
    io.out.WB.rd_mem <= _T_76.WB.rd_mem @[Pipeline.scala 29:24]
    io.out.WB.reg_w <= _T_76.WB.reg_w @[Pipeline.scala 29:24]
    
  module PipelineEX_MEM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>}, flip out : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_48 : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>}, clock @[Pipeline.scala 38:34]
    _T_48.pc_next <= io.in.pc_next @[Pipeline.scala 38:34]
    _T_48.rd <= io.in.rd @[Pipeline.scala 38:34]
    _T_48.op.op2 <= io.in.op.op2 @[Pipeline.scala 38:34]
    _T_48.op.op1 <= io.in.op.op1 @[Pipeline.scala 38:34]
    _T_48.MEM.func <= io.in.MEM.func @[Pipeline.scala 38:34]
    _T_48.MEM.read <= io.in.MEM.read @[Pipeline.scala 38:34]
    _T_48.MEM.write <= io.in.MEM.write @[Pipeline.scala 38:34]
    _T_48.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 38:34]
    _T_48.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 38:34]
    _T_48.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 38:34]
    _T_48.zero <= io.in.zero @[Pipeline.scala 38:34]
    io.out.pc_next <= _T_48.pc_next @[Pipeline.scala 38:24]
    io.out.rd <= _T_48.rd @[Pipeline.scala 38:24]
    io.out.op.op2 <= _T_48.op.op2 @[Pipeline.scala 38:24]
    io.out.op.op1 <= _T_48.op.op1 @[Pipeline.scala 38:24]
    io.out.MEM.func <= _T_48.MEM.func @[Pipeline.scala 38:24]
    io.out.MEM.read <= _T_48.MEM.read @[Pipeline.scala 38:24]
    io.out.MEM.write <= _T_48.MEM.write @[Pipeline.scala 38:24]
    io.out.MEM.branch <= _T_48.MEM.branch @[Pipeline.scala 38:24]
    io.out.WB.rd_mem <= _T_48.WB.rd_mem @[Pipeline.scala 38:24]
    io.out.WB.reg_w <= _T_48.WB.reg_w @[Pipeline.scala 38:24]
    io.out.zero <= _T_48.zero @[Pipeline.scala 38:24]
    
  module PipelineMEM_WB : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}, flip out : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_24 : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}, clock @[Pipeline.scala 47:34]
    _T_24.rd <= io.in.rd @[Pipeline.scala 47:34]
    _T_24.mem_res <= io.in.mem_res @[Pipeline.scala 47:34]
    _T_24.alu_res <= io.in.alu_res @[Pipeline.scala 47:34]
    _T_24.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 47:34]
    _T_24.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 47:34]
    io.out.rd <= _T_24.rd @[Pipeline.scala 47:24]
    io.out.mem_res <= _T_24.mem_res @[Pipeline.scala 47:24]
    io.out.alu_res <= _T_24.alu_res @[Pipeline.scala 47:24]
    io.out.WB.rd_mem <= _T_24.WB.rd_mem @[Pipeline.scala 47:24]
    io.out.WB.reg_w <= _T_24.WB.reg_w @[Pipeline.scala 47:24]
    
  module CPU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {txd : UInt<1>, r0 : UInt<8>, r1 : UInt<8>, r2 : UInt<8>, r3 : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem instMem : UInt<32>[65] @[Program.scala 29:38]
    infer mport _T_53 = instMem[UInt<1>("h00")], clock
    _T_53 <= UInt<32>("h0464c457f") @[Program.scala 34:35]
    infer mport _T_56 = instMem[UInt<1>("h01")], clock
    _T_56 <= UInt<32>("h010101") @[Program.scala 34:35]
    infer mport _T_59 = instMem[UInt<2>("h02")], clock
    _T_59 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_62 = instMem[UInt<2>("h03")], clock
    _T_62 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_65 = instMem[UInt<3>("h04")], clock
    _T_65 <= UInt<32>("h0f30002") @[Program.scala 34:35]
    infer mport _T_68 = instMem[UInt<3>("h05")], clock
    _T_68 <= UInt<32>("h01") @[Program.scala 34:35]
    infer mport _T_71 = instMem[UInt<3>("h06")], clock
    _T_71 <= UInt<32>("h010054") @[Program.scala 34:35]
    infer mport _T_74 = instMem[UInt<3>("h07")], clock
    _T_74 <= UInt<32>("h034") @[Program.scala 34:35]
    infer mport _T_77 = instMem[UInt<4>("h08")], clock
    _T_77 <= UInt<32>("h01dc") @[Program.scala 34:35]
    infer mport _T_80 = instMem[UInt<4>("h09")], clock
    _T_80 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_83 = instMem[UInt<4>("h0a")], clock
    _T_83 <= UInt<32>("h0200034") @[Program.scala 34:35]
    infer mport _T_86 = instMem[UInt<4>("h0b")], clock
    _T_86 <= UInt<32>("h0280001") @[Program.scala 34:35]
    infer mport _T_89 = instMem[UInt<4>("h0c")], clock
    _T_89 <= UInt<32>("h050006") @[Program.scala 34:35]
    infer mport _T_92 = instMem[UInt<4>("h0d")], clock
    _T_92 <= UInt<32>("h01") @[Program.scala 34:35]
    infer mport _T_95 = instMem[UInt<4>("h0e")], clock
    _T_95 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_98 = instMem[UInt<4>("h0f")], clock
    _T_98 <= UInt<32>("h010000") @[Program.scala 34:35]
    infer mport _T_101 = instMem[UInt<5>("h010")], clock
    _T_101 <= UInt<32>("h010000") @[Program.scala 34:35]
    infer mport _T_104 = instMem[UInt<5>("h011")], clock
    _T_104 <= UInt<32>("h0cc") @[Program.scala 34:35]
    infer mport _T_107 = instMem[UInt<5>("h012")], clock
    _T_107 <= UInt<32>("h0cc") @[Program.scala 34:35]
    infer mport _T_110 = instMem[UInt<5>("h013")], clock
    _T_110 <= UInt<32>("h05") @[Program.scala 34:35]
    infer mport _T_113 = instMem[UInt<5>("h014")], clock
    _T_113 <= UInt<32>("h01000") @[Program.scala 34:35]
    infer mport _T_116 = instMem[UInt<5>("h015")], clock
    _T_116 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_119 = instMem[UInt<5>("h016")], clock
    _T_119 <= UInt<32>("h040100313") @[Program.scala 34:35]
    infer mport _T_122 = instMem[UInt<5>("h017")], clock
    _T_122 <= UInt<32>("h06800293") @[Program.scala 34:35]
    infer mport _T_125 = instMem[UInt<5>("h018")], clock
    _T_125 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_128 = instMem[UInt<5>("h019")], clock
    _T_128 <= UInt<32>("h06500293") @[Program.scala 34:35]
    infer mport _T_131 = instMem[UInt<5>("h01a")], clock
    _T_131 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_134 = instMem[UInt<5>("h01b")], clock
    _T_134 <= UInt<32>("h06c00293") @[Program.scala 34:35]
    infer mport _T_137 = instMem[UInt<5>("h01c")], clock
    _T_137 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_140 = instMem[UInt<5>("h01d")], clock
    _T_140 <= UInt<32>("h06c00293") @[Program.scala 34:35]
    infer mport _T_143 = instMem[UInt<5>("h01e")], clock
    _T_143 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_146 = instMem[UInt<5>("h01f")], clock
    _T_146 <= UInt<32>("h06f00293") @[Program.scala 34:35]
    infer mport _T_149 = instMem[UInt<6>("h020")], clock
    _T_149 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_152 = instMem[UInt<6>("h021")], clock
    _T_152 <= UInt<32>("h02000293") @[Program.scala 34:35]
    infer mport _T_155 = instMem[UInt<6>("h022")], clock
    _T_155 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_158 = instMem[UInt<6>("h023")], clock
    _T_158 <= UInt<32>("h07700293") @[Program.scala 34:35]
    infer mport _T_161 = instMem[UInt<6>("h024")], clock
    _T_161 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_164 = instMem[UInt<6>("h025")], clock
    _T_164 <= UInt<32>("h06f00293") @[Program.scala 34:35]
    infer mport _T_167 = instMem[UInt<6>("h026")], clock
    _T_167 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_170 = instMem[UInt<6>("h027")], clock
    _T_170 <= UInt<32>("h07200293") @[Program.scala 34:35]
    infer mport _T_173 = instMem[UInt<6>("h028")], clock
    _T_173 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_176 = instMem[UInt<6>("h029")], clock
    _T_176 <= UInt<32>("h06c00293") @[Program.scala 34:35]
    infer mport _T_179 = instMem[UInt<6>("h02a")], clock
    _T_179 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_182 = instMem[UInt<6>("h02b")], clock
    _T_182 <= UInt<32>("h06400293") @[Program.scala 34:35]
    infer mport _T_185 = instMem[UInt<6>("h02c")], clock
    _T_185 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_188 = instMem[UInt<6>("h02d")], clock
    _T_188 <= UInt<32>("h02100293") @[Program.scala 34:35]
    infer mport _T_191 = instMem[UInt<6>("h02e")], clock
    _T_191 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_194 = instMem[UInt<6>("h02f")], clock
    _T_194 <= UInt<32>("h0a00293") @[Program.scala 34:35]
    infer mport _T_197 = instMem[UInt<6>("h030")], clock
    _T_197 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_200 = instMem[UInt<6>("h031")], clock
    _T_200 <= UInt<32>("h0d00293") @[Program.scala 34:35]
    infer mport _T_203 = instMem[UInt<6>("h032")], clock
    _T_203 <= UInt<32>("h0530023") @[Program.scala 34:35]
    infer mport _T_206 = instMem[UInt<6>("h033")], clock
    _T_206 <= UInt<32>("h08067") @[Program.scala 34:35]
    infer mport _T_209 = instMem[UInt<6>("h034")], clock
    _T_209 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_212 = instMem[UInt<6>("h035")], clock
    _T_212 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_215 = instMem[UInt<6>("h036")], clock
    _T_215 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_218 = instMem[UInt<6>("h037")], clock
    _T_218 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_221 = instMem[UInt<6>("h038")], clock
    _T_221 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_224 = instMem[UInt<6>("h039")], clock
    _T_224 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_227 = instMem[UInt<6>("h03a")], clock
    _T_227 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_230 = instMem[UInt<6>("h03b")], clock
    _T_230 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_233 = instMem[UInt<6>("h03c")], clock
    _T_233 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_236 = instMem[UInt<6>("h03d")], clock
    _T_236 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_239 = instMem[UInt<6>("h03e")], clock
    _T_239 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_242 = instMem[UInt<6>("h03f")], clock
    _T_242 <= UInt<32>("h00") @[Program.scala 34:35]
    infer mport _T_245 = instMem[UInt<7>("h040")], clock
    _T_245 <= UInt<32>("h00") @[Program.scala 34:35]
    inst counter of ProgramCounter @[CPU.scala 61:29]
    counter.io is invalid
    counter.clock <= clock
    counter.reset <= reset
    inst decoder of Decoder @[CPU.scala 62:29]
    decoder.io is invalid
    decoder.clock <= clock
    decoder.reset <= reset
    inst control of Control @[CPU.scala 63:29]
    control.io is invalid
    control.clock <= clock
    control.reset <= reset
    inst regs of Registers @[CPU.scala 64:29]
    regs.io is invalid
    regs.clock <= clock
    regs.reset <= reset
    inst alu of ALU @[CPU.scala 65:29]
    alu.io is invalid
    alu.clock <= clock
    alu.reset <= reset
    inst dataMem of DataMemory @[CPU.scala 66:29]
    dataMem.io is invalid
    dataMem.clock <= clock
    dataMem.reset <= reset
    inst fwdUnit of ForwardingUnit @[CPU.scala 67:29]
    fwdUnit.io is invalid
    fwdUnit.clock <= clock
    fwdUnit.reset <= reset
    inst hazardUnit of DetectHazardUnit @[CPU.scala 68:29]
    hazardUnit.io is invalid
    hazardUnit.clock <= clock
    hazardUnit.reset <= reset
    inst uart of UART @[CPU.scala 69:29]
    uart.io is invalid
    uart.clock <= clock
    uart.reset <= reset
    inst IF_ID of PipelineIF_ID @[CPU.scala 73:29]
    IF_ID.io is invalid
    IF_ID.clock <= clock
    IF_ID.reset <= reset
    inst ID_EX of PipelineID_EX @[CPU.scala 74:29]
    ID_EX.io is invalid
    ID_EX.clock <= clock
    ID_EX.reset <= reset
    inst EX_MEM of PipelineEX_MEM @[CPU.scala 75:29]
    EX_MEM.io is invalid
    EX_MEM.clock <= clock
    EX_MEM.reset <= reset
    inst MEM_WB of PipelineMEM_WB @[CPU.scala 76:29]
    MEM_WB.io is invalid
    MEM_WB.clock <= clock
    MEM_WB.reset <= reset
    node _T_247 = eq(regs.io.op.op1, regs.io.op.op2) @[CPU.scala 81:74]
    node _T_248 = and(control.io.MEM.branch, _T_247) @[CPU.scala 81:55]
    node _T_250 = eq(uart.io.valid, UInt<1>("h00")) @[CPU.scala 81:98]
    node _T_251 = or(_T_248, _T_250) @[CPU.scala 81:95]
    counter.io.branch <= _T_251 @[CPU.scala 81:29]
    node _T_252 = add(IF_ID.io.out.pc_next, decoder.io.imm) @[CPU.scala 82:72]
    node _T_253 = tail(_T_252, 1) @[CPU.scala 82:72]
    node _T_255 = sub(EX_MEM.io.out.pc_next, UInt<1>("h01")) @[CPU.scala 82:112]
    node _T_256 = asUInt(_T_255) @[CPU.scala 82:112]
    node _T_257 = tail(_T_256, 1) @[CPU.scala 82:112]
    node _T_258 = mux(uart.io.valid, _T_253, _T_257) @[CPU.scala 82:35]
    counter.io.pc_src <= _T_258 @[CPU.scala 82:29]
    IF_ID.io.in.pc_next <= counter.io.pc_next @[CPU.scala 84:29]
    node _T_259 = bits(counter.io.pc, 6, 0)
    read mport _T_260 = instMem[_T_259], clock
    IF_ID.io.in.inst <= _T_260 @[CPU.scala 85:29]
    decoder.io.inst <= IF_ID.io.out.inst @[CPU.scala 89:29]
    regs.io.rs.rs2 <= decoder.io.rs.rs2 @[CPU.scala 90:29]
    regs.io.rs.rs1 <= decoder.io.rs.rs1 @[CPU.scala 90:29]
    node _T_261 = mux(uart.io.valid, decoder.io.ctrl.opcode, UInt<1>("h00")) @[CPU.scala 95:35]
    control.io.ctrl.opcode <= _T_261 @[CPU.scala 95:29]
    node _T_262 = mux(uart.io.valid, decoder.io.ctrl.funct3, UInt<1>("h00")) @[CPU.scala 96:35]
    control.io.ctrl.funct3 <= _T_262 @[CPU.scala 96:29]
    node _T_263 = mux(uart.io.valid, decoder.io.ctrl.funct7, UInt<1>("h00")) @[CPU.scala 97:35]
    control.io.ctrl.funct7 <= _T_263 @[CPU.scala 97:29]
    ID_EX.io.in.WB.rd_mem <= control.io.WB.rd_mem @[CPU.scala 99:29]
    ID_EX.io.in.WB.reg_w <= control.io.WB.reg_w @[CPU.scala 99:29]
    ID_EX.io.in.MEM.func <= control.io.MEM.func @[CPU.scala 100:29]
    ID_EX.io.in.MEM.read <= control.io.MEM.read @[CPU.scala 100:29]
    ID_EX.io.in.MEM.write <= control.io.MEM.write @[CPU.scala 100:29]
    ID_EX.io.in.MEM.branch <= control.io.MEM.branch @[CPU.scala 100:29]
    ID_EX.io.in.EX.alu_op.alt <= control.io.EX.alu_op.alt @[CPU.scala 101:29]
    ID_EX.io.in.EX.alu_op.func <= control.io.EX.alu_op.func @[CPU.scala 101:29]
    ID_EX.io.in.EX.dst_sel <= control.io.EX.dst_sel @[CPU.scala 101:29]
    ID_EX.io.in.EX.alu_sel <= control.io.EX.alu_sel @[CPU.scala 101:29]
    ID_EX.io.in.EX.opcode <= control.io.EX.opcode @[CPU.scala 101:29]
    ID_EX.io.in.pc_next <= IF_ID.io.out.pc_next @[CPU.scala 102:29]
    ID_EX.io.in.op.op2 <= regs.io.op.op2 @[CPU.scala 103:29]
    ID_EX.io.in.op.op1 <= regs.io.op.op1 @[CPU.scala 103:29]
    ID_EX.io.in.imm <= decoder.io.imm @[CPU.scala 104:29]
    ID_EX.io.in.rs.rs2 <= decoder.io.rs.rs2 @[CPU.scala 105:29]
    ID_EX.io.in.rs.rs1 <= decoder.io.rs.rs1 @[CPU.scala 105:29]
    ID_EX.io.in.rd <= decoder.io.rd @[CPU.scala 106:29]
    fwdUnit.io.rs.rs2 <= ID_EX.io.out.rs.rs2 @[CPU.scala 110:29]
    fwdUnit.io.rs.rs1 <= ID_EX.io.out.rs.rs1 @[CPU.scala 110:29]
    fwdUnit.io.rd_mem <= EX_MEM.io.out.rd @[CPU.scala 111:29]
    fwdUnit.io.rd_wb <= MEM_WB.io.out.rd @[CPU.scala 112:29]
    fwdUnit.io.reg_w_mem <= EX_MEM.io.out.WB.reg_w @[CPU.scala 113:29]
    fwdUnit.io.reg_w_wb <= MEM_WB.io.out.WB.reg_w @[CPU.scala 114:29]
    alu.io.opcode <= ID_EX.io.out.EX.opcode @[CPU.scala 116:29]
    alu.io.alu_op.alt <= ID_EX.io.out.EX.alu_op.alt @[CPU.scala 117:29]
    alu.io.alu_op.func <= ID_EX.io.out.EX.alu_op.func @[CPU.scala 117:29]
    node _T_264 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_265 = mux(_T_264, ID_EX.io.out.op.op1, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_266 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_267 = mux(_T_266, regs.io.res, _T_265) @[Mux.scala 46:16]
    node _T_268 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_269 = mux(_T_268, EX_MEM.io.out.op.op1, _T_267) @[Mux.scala 46:16]
    alu.io.op.op1 <= _T_269 @[CPU.scala 119:19]
    node _T_270 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, EX_MEM.io.out.op.op1) @[CPU.scala 125:23]
    node _T_271 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, regs.io.res) @[CPU.scala 126:23]
    node _T_272 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.op.op2) @[CPU.scala 127:23]
    node _T_273 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_274 = mux(_T_273, _T_272, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_275 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_276 = mux(_T_275, _T_271, _T_274) @[Mux.scala 46:16]
    node _T_277 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_278 = mux(_T_277, _T_270, _T_276) @[Mux.scala 46:16]
    alu.io.op.op2 <= _T_278 @[CPU.scala 124:19]
    EX_MEM.io.in.pc_next <= ID_EX.io.out.pc_next @[CPU.scala 129:29]
    EX_MEM.io.in.WB.rd_mem <= ID_EX.io.out.WB.rd_mem @[CPU.scala 131:29]
    EX_MEM.io.in.WB.reg_w <= ID_EX.io.out.WB.reg_w @[CPU.scala 131:29]
    EX_MEM.io.in.MEM.func <= ID_EX.io.out.MEM.func @[CPU.scala 132:29]
    EX_MEM.io.in.MEM.read <= ID_EX.io.out.MEM.read @[CPU.scala 132:29]
    EX_MEM.io.in.MEM.write <= ID_EX.io.out.MEM.write @[CPU.scala 132:29]
    EX_MEM.io.in.MEM.branch <= ID_EX.io.out.MEM.branch @[CPU.scala 132:29]
    EX_MEM.io.in.op.op2 <= ID_EX.io.out.op.op2 @[CPU.scala 133:29]
    EX_MEM.io.in.zero <= alu.io.zero @[CPU.scala 135:29]
    EX_MEM.io.in.op.op1 <= alu.io.res @[CPU.scala 136:29]
    node _T_279 = mux(ID_EX.io.out.EX.dst_sel, ID_EX.io.out.rd, ID_EX.io.out.rs.rs2) @[CPU.scala 138:35]
    EX_MEM.io.in.rd <= _T_279 @[CPU.scala 138:29]
    dataMem.io.mem.func <= EX_MEM.io.out.MEM.func @[CPU.scala 142:29]
    dataMem.io.mem.read <= EX_MEM.io.out.MEM.read @[CPU.scala 142:29]
    dataMem.io.mem.write <= EX_MEM.io.out.MEM.write @[CPU.scala 142:29]
    dataMem.io.mem.branch <= EX_MEM.io.out.MEM.branch @[CPU.scala 142:29]
    dataMem.io.op.op2 <= EX_MEM.io.out.op.op2 @[CPU.scala 143:29]
    dataMem.io.op.op1 <= EX_MEM.io.out.op.op1 @[CPU.scala 143:29]
    MEM_WB.io.in.WB.rd_mem <= EX_MEM.io.out.WB.rd_mem @[CPU.scala 145:29]
    MEM_WB.io.in.WB.reg_w <= EX_MEM.io.out.WB.reg_w @[CPU.scala 145:29]
    MEM_WB.io.in.rd <= EX_MEM.io.out.rd @[CPU.scala 146:29]
    MEM_WB.io.in.mem_res <= dataMem.io.res @[CPU.scala 147:29]
    MEM_WB.io.in.alu_res <= EX_MEM.io.out.op.op1 @[CPU.scala 148:29]
    regs.io.rd <= MEM_WB.io.out.rd @[CPU.scala 152:29]
    regs.io.reg_w <= MEM_WB.io.out.WB.reg_w @[CPU.scala 153:29]
    node _T_280 = mux(MEM_WB.io.out.WB.rd_mem, MEM_WB.io.out.mem_res, MEM_WB.io.out.alu_res) @[CPU.scala 154:35]
    regs.io.res <= _T_280 @[CPU.scala 154:29]
    node _T_282 = eq(dataMem.io.op.op1, UInt<11>("h0401")) @[CPU.scala 158:56]
    node _T_283 = and(EX_MEM.io.out.MEM.write, _T_282) @[CPU.scala 158:35]
    when _T_283 : @[CPU.scala 158:68]
      uart.io.in <= dataMem.io.op.op2 @[CPU.scala 159:20]
      skip @[CPU.scala 158:68]
    node _T_285 = eq(_T_283, UInt<1>("h00")) @[CPU.scala 158:68]
    when _T_285 : @[CPU.scala 160:18]
      uart.io.in <= UInt<1>("h00") @[CPU.scala 161:20]
      skip @[CPU.scala 160:18]
    io.txd <= uart.io.txd @[CPU.scala 164:12]
    io.r0 <= uart.io.r0 @[CPU.scala 168:11]
    io.r1 <= uart.io.r1 @[CPU.scala 169:11]
    io.r2 <= uart.io.r2 @[CPU.scala 170:11]
    io.r3 <= uart.io.r3 @[CPU.scala 171:11]
    
