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
    node _T_9 = add(pc_reg, UInt<1>("h01")) @[ProgramCounter.scala 23:35]
    node _T_10 = tail(_T_9, 1) @[ProgramCounter.scala 23:35]
    io.pc_next <= _T_10 @[ProgramCounter.scala 23:25]
    node _T_11 = mux(io.branch, io.pc_src, io.pc_next) @[ProgramCounter.scala 24:31]
    pc_reg <= _T_11 @[ProgramCounter.scala 24:25]
    io.pc <= pc_reg @[ProgramCounter.scala 25:25]
    
  module Decoder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst : UInt<32>, flip ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip sel : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>}, flip imm : {flip I : UInt<12>, flip S : UInt<12>, flip SB : UInt<12>, flip U : UInt<20>, flip UJ : UInt<20>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_28 = bits(io.inst, 6, 0) @[Decoder.scala 26:32]
    io.ctrl.opcode <= _T_28 @[Decoder.scala 26:25]
    node _T_29 = bits(io.inst, 11, 7) @[Decoder.scala 27:40]
    io.sel.rd <= _T_29 @[Decoder.scala 27:33]
    node _T_30 = bits(io.inst, 14, 12) @[Decoder.scala 28:32]
    io.ctrl.funct3 <= _T_30 @[Decoder.scala 28:25]
    node _T_31 = bits(io.inst, 19, 15) @[Decoder.scala 29:32]
    io.sel.rs.rs1 <= _T_31 @[Decoder.scala 29:25]
    node _T_32 = bits(io.inst, 24, 20) @[Decoder.scala 30:32]
    io.sel.rs.rs2 <= _T_32 @[Decoder.scala 30:25]
    node _T_33 = bits(io.inst, 31, 25) @[Decoder.scala 31:32]
    io.ctrl.funct7 <= _T_33 @[Decoder.scala 31:25]
    node _T_34 = bits(io.inst, 31, 20) @[Decoder.scala 33:40]
    io.imm.I <= _T_34 @[Decoder.scala 33:33]
    node _T_35 = bits(io.inst, 31, 12) @[Decoder.scala 34:40]
    io.imm.U <= _T_35 @[Decoder.scala 34:33]
    node _T_36 = bits(io.inst, 31, 25) @[Decoder.scala 35:44]
    node _T_37 = bits(io.inst, 11, 7) @[Decoder.scala 35:57]
    node _T_38 = cat(_T_36, _T_37) @[Cat.scala 30:58]
    io.imm.S <= _T_38 @[Decoder.scala 35:33]
    node _T_39 = bits(io.inst, 31, 31) @[Decoder.scala 36:44]
    node _T_40 = bits(io.inst, 7, 7) @[Decoder.scala 36:54]
    node _T_41 = bits(io.inst, 30, 25) @[Decoder.scala 36:63]
    node _T_42 = bits(io.inst, 11, 8) @[Decoder.scala 36:76]
    node _T_43 = cat(_T_41, _T_42) @[Cat.scala 30:58]
    node _T_44 = cat(_T_39, _T_40) @[Cat.scala 30:58]
    node _T_45 = cat(_T_44, _T_43) @[Cat.scala 30:58]
    io.imm.SB <= _T_45 @[Decoder.scala 36:33]
    node _T_46 = bits(io.inst, 31, 31) @[Decoder.scala 37:44]
    node _T_47 = bits(io.inst, 19, 12) @[Decoder.scala 37:54]
    node _T_48 = bits(io.inst, 20, 20) @[Decoder.scala 37:67]
    node _T_49 = bits(io.inst, 30, 21) @[Decoder.scala 37:77]
    node _T_50 = cat(_T_48, _T_49) @[Cat.scala 30:58]
    node _T_51 = cat(_T_46, _T_47) @[Cat.scala 30:58]
    node _T_52 = cat(_T_51, _T_50) @[Cat.scala 30:58]
    io.imm.UJ <= _T_52 @[Decoder.scala 37:33]
    
  module Control : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, flip MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, aluOp : {flip func : UInt<3>, flip alt : UInt<1>}}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_30 = eq(io.ctrl.opcode, UInt<7>("h063")) @[Control.scala 23:53]
    node _T_31 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 23:82]
    node _T_32 = or(_T_30, _T_31) @[Control.scala 23:64]
    node _T_34 = eq(_T_32, UInt<1>("h00")) @[Control.scala 23:36]
    io.EX.alu_sel <= _T_34 @[Control.scala 23:33]
    node _T_35 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 24:53]
    node _T_37 = eq(_T_35, UInt<1>("h00")) @[Control.scala 24:36]
    io.EX.dst_sel <= _T_37 @[Control.scala 24:33]
    node funct7 = mux(io.EX.alu_sel, UInt<1>("h00"), io.ctrl.funct7) @[Control.scala 26:47]
    node _T_39 = eq(funct7, UInt<6>("h020")) @[Control.scala 27:43]
    io.EX.aluOp.alt <= _T_39 @[Control.scala 27:33]
    io.EX.aluOp.func <= io.ctrl.funct3 @[Control.scala 28:33]
    io.EX.opcode <= io.ctrl.opcode @[Control.scala 29:33]
    io.MEM.func <= io.ctrl.funct3 @[Control.scala 31:33]
    node _T_40 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 32:51]
    io.MEM.read <= _T_40 @[Control.scala 32:33]
    node _T_41 = eq(io.ctrl.opcode, UInt<6>("h023")) @[Control.scala 33:51]
    io.MEM.write <= _T_41 @[Control.scala 33:33]
    node _T_42 = eq(io.ctrl.opcode, UInt<7>("h063")) @[Control.scala 34:51]
    io.MEM.branch <= _T_42 @[Control.scala 34:33]
    io.WB.memToReg <= io.MEM.read @[Control.scala 36:33]
    node _T_43 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 37:51]
    node _T_44 = eq(io.ctrl.opcode, UInt<5>("h013")) @[Control.scala 37:75]
    node _T_45 = or(_T_43, _T_44) @[Control.scala 37:57]
    node _T_46 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 37:99]
    node _T_47 = or(_T_45, _T_46) @[Control.scala 37:81]
    io.WB.regWrite <= _T_47 @[Control.scala 37:33]
    
  module Registers : 
    input clock : Clock
    input reset : UInt<1>
    output io : {sel : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>}, flip reg : {rs : {flip rs1 : UInt<32>, flip rs2 : UInt<32>}, rd : UInt<32>}, flip regWrite : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem x : UInt<32>[32] @[Registers.scala 22:16]
    when io.regWrite : @[Registers.scala 23:24]
      infer mport _T_15 = x[io.sel.rd], clock
      _T_15 <= io.reg.rd @[Registers.scala 23:39]
      skip @[Registers.scala 23:24]
    node _T_16 = neq(io.reg.rd, UInt<1>("h00")) @[Registers.scala 25:45]
    node _T_17 = and(io.regWrite, _T_16) @[Registers.scala 25:31]
    node _T_18 = eq(io.sel.rd, io.sel.rs.rs1) @[Registers.scala 25:69]
    node fwd_rs1 = and(_T_17, _T_18) @[Registers.scala 25:55]
    node _T_19 = neq(io.reg.rd, UInt<1>("h00")) @[Registers.scala 26:45]
    node _T_20 = and(io.regWrite, _T_19) @[Registers.scala 26:31]
    node _T_21 = eq(io.sel.rd, io.sel.rs.rs2) @[Registers.scala 26:69]
    node fwd_rs2 = and(_T_20, _T_21) @[Registers.scala 26:55]
    infer mport _T_22 = x[io.sel.rs.rs1], clock
    node _T_23 = mux(fwd_rs1, io.reg.rd, _T_22) @[Registers.scala 28:25]
    io.reg.rs.rs1 <= _T_23 @[Registers.scala 28:19]
    infer mport _T_24 = x[io.sel.rs.rs2], clock
    node _T_25 = mux(fwd_rs2, io.reg.rd, _T_24) @[Registers.scala 29:25]
    io.reg.rs.rs2 <= _T_25 @[Registers.scala 29:19]
    
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {aluOp : {flip func : UInt<3>, flip alt : UInt<1>}, reg : {rs : {flip rs1 : UInt<32>, flip rs2 : UInt<32>}, rd : UInt<32>}, flip opcode : UInt<7>, zero : UInt<1>, branch : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node shamt = bits(io.reg.rs.rs2, 4, 0) @[ALU.scala 27:20]
    node _T_10 = sub(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 32:46]
    node _T_11 = asUInt(_T_10) @[ALU.scala 32:46]
    node _T_12 = tail(_T_11, 1) @[ALU.scala 32:46]
    node _T_13 = add(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 32:57]
    node _T_14 = tail(_T_13, 1) @[ALU.scala 32:57]
    node _T_15 = mux(io.aluOp.alt, _T_12, _T_14) @[ALU.scala 32:27]
    node _T_16 = dshl(io.reg.rs.rs1, shamt) @[ALU.scala 33:29]
    node _T_17 = lt(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 35:29]
    node _T_18 = xor(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 36:29]
    node _T_19 = dshr(io.reg.rs.rs1, shamt) @[ALU.scala 37:52]
    node _T_20 = mux(io.aluOp.alt, UInt<1>("h00"), _T_19) @[ALU.scala 37:27]
    node _T_21 = or(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 38:29]
    node _T_22 = eq(UInt<3>("h06"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_23 = mux(_T_22, _T_21, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_24 = eq(UInt<3>("h05"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_25 = mux(_T_24, _T_20, _T_23) @[Mux.scala 46:16]
    node _T_26 = eq(UInt<3>("h04"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_27 = mux(_T_26, _T_18, _T_25) @[Mux.scala 46:16]
    node _T_28 = eq(UInt<2>("h03"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_29 = mux(_T_28, _T_17, _T_27) @[Mux.scala 46:16]
    node _T_30 = eq(UInt<1>("h01"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_31 = mux(_T_30, _T_16, _T_29) @[Mux.scala 46:16]
    node _T_32 = eq(UInt<1>("h00"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_33 = mux(_T_32, _T_15, _T_31) @[Mux.scala 46:16]
    node _T_34 = add(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 40:29]
    node _T_35 = tail(_T_34, 1) @[ALU.scala 40:29]
    node _T_36 = dshl(io.reg.rs.rs1, shamt) @[ALU.scala 41:29]
    node _T_37 = lt(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 43:29]
    node _T_38 = xor(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 44:29]
    node _T_39 = dshr(io.reg.rs.rs1, shamt) @[ALU.scala 45:52]
    node _T_40 = mux(io.aluOp.alt, UInt<1>("h00"), _T_39) @[ALU.scala 45:27]
    node _T_41 = or(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 46:29]
    node _T_42 = eq(UInt<3>("h06"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_43 = mux(_T_42, _T_41, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_44 = eq(UInt<3>("h05"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_45 = mux(_T_44, _T_40, _T_43) @[Mux.scala 46:16]
    node _T_46 = eq(UInt<3>("h04"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_47 = mux(_T_46, _T_38, _T_45) @[Mux.scala 46:16]
    node _T_48 = eq(UInt<2>("h03"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_49 = mux(_T_48, _T_37, _T_47) @[Mux.scala 46:16]
    node _T_50 = eq(UInt<1>("h01"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_51 = mux(_T_50, _T_36, _T_49) @[Mux.scala 46:16]
    node _T_52 = eq(UInt<1>("h00"), io.aluOp.func) @[Mux.scala 46:19]
    node _T_53 = mux(_T_52, _T_35, _T_51) @[Mux.scala 46:16]
    node _T_54 = add(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 47:22]
    node _T_55 = tail(_T_54, 1) @[ALU.scala 47:22]
    node _T_56 = sub(io.reg.rs.rs1, io.reg.rs.rs2) @[ALU.scala 61:24]
    node _T_57 = asUInt(_T_56) @[ALU.scala 61:24]
    node _T_58 = tail(_T_57, 1) @[ALU.scala 61:24]
    node _T_59 = eq(UInt<7>("h063"), io.opcode) @[Mux.scala 46:19]
    node _T_60 = mux(_T_59, _T_58, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_61 = eq(UInt<6>("h023"), io.opcode) @[Mux.scala 46:19]
    node _T_62 = mux(_T_61, io.reg.rs.rs1, _T_60) @[Mux.scala 46:16]
    node _T_63 = eq(UInt<2>("h03"), io.opcode) @[Mux.scala 46:19]
    node _T_64 = mux(_T_63, _T_55, _T_62) @[Mux.scala 46:16]
    node _T_65 = eq(UInt<5>("h013"), io.opcode) @[Mux.scala 46:19]
    node _T_66 = mux(_T_65, _T_53, _T_64) @[Mux.scala 46:16]
    node _T_67 = eq(UInt<6>("h033"), io.opcode) @[Mux.scala 46:19]
    node _T_68 = mux(_T_67, _T_33, _T_66) @[Mux.scala 46:16]
    io.reg.rd <= _T_68 @[ALU.scala 29:15]
    node _T_69 = eq(io.reg.rd, UInt<1>("h00")) @[ALU.scala 72:26]
    io.zero <= _T_69 @[ALU.scala 72:13]
    
  module DataMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {mem : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, reg : {rs : {flip rs1 : UInt<32>, flip rs2 : UInt<32>}, rd : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem dataMem : UInt<32>[1024] @[DataMemory.scala 25:26]
    when io.mem.write : @[DataMemory.scala 27:29]
      node _T_11 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_11 : @[Conditional.scala 29:59]
        node _T_12 = bits(io.reg.rs.rs1, 9, 0)
        infer mport _T_13 = dataMem[_T_12], clock
        node _T_14 = bits(io.reg.rs.rs2, 7, 0) @[DataMemory.scala 30:72]
        _T_13 <= _T_14 @[DataMemory.scala 30:56]
        skip @[Conditional.scala 29:59]
      node _T_15 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_15 : @[Conditional.scala 29:59]
        node _T_16 = bits(io.reg.rs.rs1, 9, 0)
        infer mport _T_17 = dataMem[_T_16], clock
        node _T_18 = bits(io.reg.rs.rs2, 15, 0) @[DataMemory.scala 32:72]
        _T_17 <= _T_18 @[DataMemory.scala 32:56]
        skip @[Conditional.scala 29:59]
      node _T_19 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_19 : @[Conditional.scala 29:59]
        node _T_20 = bits(io.reg.rs.rs1, 9, 0)
        infer mport _T_21 = dataMem[_T_20], clock
        _T_21 <= io.reg.rs.rs2 @[DataMemory.scala 34:56]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 27:29]
    when io.mem.read : @[DataMemory.scala 38:28]
      node _T_22 = bits(io.reg.rs.rs1, 9, 0)
      infer mport _T_23 = dataMem[_T_22], clock
      node _T_24 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_24 : @[Conditional.scala 29:59]
        node _T_25 = bits(_T_23, 7, 0) @[DataMemory.scala 44:52]
        io.reg.rd <= _T_25 @[DataMemory.scala 44:44]
        skip @[Conditional.scala 29:59]
      node _T_26 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_26 : @[Conditional.scala 29:59]
        node _T_27 = bits(_T_23, 15, 0) @[DataMemory.scala 46:52]
        io.reg.rd <= _T_27 @[DataMemory.scala 46:44]
        skip @[Conditional.scala 29:59]
      node _T_28 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_28 : @[Conditional.scala 29:59]
        io.reg.rd <= _T_23 @[DataMemory.scala 48:44]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 38:28]
    
  module ForwardingUnit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip regWrite_exMem : UInt<1>, flip regWrite_memWb : UInt<1>, flip sel_rs1 : UInt<5>, flip sel_rs2 : UInt<5>, flip dst_exMem : UInt<5>, flip dst_memWb : UInt<5>, fwd_rs1 : UInt<2>, fwd_rs2 : UInt<2>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_10 = neq(io.dst_exMem, UInt<1>("h00")) @[ForwardingUnit.scala 27:50]
    node _T_11 = and(io.regWrite_exMem, _T_10) @[ForwardingUnit.scala 27:33]
    node _T_12 = eq(io.dst_exMem, io.sel_rs1) @[ForwardingUnit.scala 27:77]
    node _T_13 = and(_T_11, _T_12) @[ForwardingUnit.scala 27:60]
    when _T_13 : @[ForwardingUnit.scala 27:94]
      io.fwd_rs1 <= UInt<2>("h02") @[ForwardingUnit.scala 28:28]
      skip @[ForwardingUnit.scala 27:94]
    node _T_14 = neq(io.dst_memWb, UInt<1>("h00")) @[ForwardingUnit.scala 29:57]
    node _T_15 = and(io.regWrite_memWb, _T_14) @[ForwardingUnit.scala 29:40]
    node _T_16 = eq(io.dst_memWb, io.sel_rs1) @[ForwardingUnit.scala 29:84]
    node _T_17 = and(_T_15, _T_16) @[ForwardingUnit.scala 29:67]
    node _T_19 = eq(_T_13, UInt<1>("h00")) @[ForwardingUnit.scala 27:94]
    node _T_20 = and(_T_19, _T_17) @[ForwardingUnit.scala 29:101]
    when _T_20 : @[ForwardingUnit.scala 29:101]
      io.fwd_rs1 <= UInt<1>("h01") @[ForwardingUnit.scala 30:28]
      skip @[ForwardingUnit.scala 29:101]
    node _T_22 = eq(_T_13, UInt<1>("h00")) @[ForwardingUnit.scala 27:94]
    node _T_24 = eq(_T_17, UInt<1>("h00")) @[ForwardingUnit.scala 29:101]
    node _T_25 = and(_T_22, _T_24) @[ForwardingUnit.scala 29:101]
    when _T_25 : @[ForwardingUnit.scala 31:22]
      io.fwd_rs1 <= UInt<1>("h00") @[ForwardingUnit.scala 32:28]
      skip @[ForwardingUnit.scala 31:22]
    node _T_26 = neq(io.dst_exMem, UInt<1>("h00")) @[ForwardingUnit.scala 35:50]
    node _T_27 = and(io.regWrite_exMem, _T_26) @[ForwardingUnit.scala 35:33]
    node _T_28 = eq(io.dst_exMem, io.sel_rs2) @[ForwardingUnit.scala 35:77]
    node _T_29 = and(_T_27, _T_28) @[ForwardingUnit.scala 35:60]
    when _T_29 : @[ForwardingUnit.scala 35:94]
      io.fwd_rs2 <= UInt<2>("h02") @[ForwardingUnit.scala 36:28]
      skip @[ForwardingUnit.scala 35:94]
    node _T_30 = neq(io.dst_memWb, UInt<1>("h00")) @[ForwardingUnit.scala 37:57]
    node _T_31 = and(io.regWrite_memWb, _T_30) @[ForwardingUnit.scala 37:40]
    node _T_32 = eq(io.dst_memWb, io.sel_rs2) @[ForwardingUnit.scala 37:84]
    node _T_33 = and(_T_31, _T_32) @[ForwardingUnit.scala 37:67]
    node _T_35 = eq(_T_29, UInt<1>("h00")) @[ForwardingUnit.scala 35:94]
    node _T_36 = and(_T_35, _T_33) @[ForwardingUnit.scala 37:101]
    when _T_36 : @[ForwardingUnit.scala 37:101]
      io.fwd_rs2 <= UInt<1>("h01") @[ForwardingUnit.scala 38:28]
      skip @[ForwardingUnit.scala 37:101]
    node _T_38 = eq(_T_29, UInt<1>("h00")) @[ForwardingUnit.scala 35:94]
    node _T_40 = eq(_T_33, UInt<1>("h00")) @[ForwardingUnit.scala 37:101]
    node _T_41 = and(_T_38, _T_40) @[ForwardingUnit.scala 37:101]
    when _T_41 : @[ForwardingUnit.scala 39:22]
      io.fwd_rs2 <= UInt<1>("h00") @[ForwardingUnit.scala 40:28]
      skip @[ForwardingUnit.scala 39:22]
    
  module DetectHazardUnit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip rs2_ex : UInt<5>, flip memRead : UInt<1>, stall : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_7 = eq(io.rs2_ex, io.rs1_id) @[DetectHazardUnit.scala 24:46]
    node _T_8 = and(io.memRead, _T_7) @[DetectHazardUnit.scala 24:32]
    node _T_9 = eq(io.rs2_ex, io.rs2_id) @[DetectHazardUnit.scala 24:75]
    node _T_10 = or(_T_8, _T_9) @[DetectHazardUnit.scala 24:61]
    io.stall <= _T_10 @[DetectHazardUnit.scala 24:18]
    
  module Tx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, txd : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg data : UInt<9>, clock with : (reset => (reset, UInt<9>("h01ff"))) @[UART.scala 93:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 94:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 95:28]
    node _T_15 = eq(state, UInt<4>("h00")) @[UART.scala 97:27]
    io.enq.ready <= _T_15 @[UART.scala 97:18]
    node _T_16 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_16 : @[Conditional.scala 29:59]
      when io.enq.valid : @[UART.scala 101:33]
        node _T_18 = cat(io.enq.bits, UInt<1>("h00")) @[Cat.scala 30:58]
        data <= _T_18 @[UART.scala 102:23]
        ticks <= UInt<1>("h00") @[UART.scala 103:23]
        state <= UInt<4>("h0b") @[UART.scala 104:23]
        skip @[UART.scala 101:33]
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
      node _T_40 = eq(ticks, UInt<9>("h01b2")) @[UART.scala 109:25]
      when _T_40 : @[UART.scala 109:39]
        node _T_42 = shr(data, 1) @[UART.scala 110:43]
        node _T_43 = cat(UInt<1>("h01"), _T_42) @[Cat.scala 30:58]
        data <= _T_43 @[UART.scala 110:23]
        ticks <= UInt<1>("h00") @[UART.scala 111:23]
        node _T_45 = sub(state, UInt<1>("h01")) @[UART.scala 112:32]
        node _T_46 = asUInt(_T_45) @[UART.scala 112:32]
        node _T_47 = tail(_T_46, 1) @[UART.scala 112:32]
        state <= _T_47 @[UART.scala 112:23]
        skip @[UART.scala 109:39]
      node _T_49 = eq(_T_40, UInt<1>("h00")) @[UART.scala 109:39]
      when _T_49 : @[UART.scala 113:26]
        node _T_51 = add(ticks, UInt<1>("h01")) @[UART.scala 114:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 114:32]
        ticks <= _T_52 @[UART.scala 114:23]
        skip @[UART.scala 113:26]
      skip @[Conditional.scala 29:59]
    node _T_53 = bits(data, 0, 0) @[UART.scala 118:19]
    io.txd <= _T_53 @[UART.scala 118:12]
    
  module UART : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, valid : UInt<1>, txd : UInt<1>, r0 : UInt<8>, r1 : UInt<8>, r2 : UInt<8>, r3 : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst tx of Tx @[UART.scala 43:20]
    tx.io is invalid
    tx.clock <= clock
    tx.reset <= reset
    wire _T_15 : UInt<8>[4] @[UART.scala 46:26]
    _T_15 is invalid @[UART.scala 46:26]
    _T_15[0] <= UInt<8>("h00") @[UART.scala 46:26]
    _T_15[1] <= UInt<8>("h00") @[UART.scala 46:26]
    _T_15[2] <= UInt<8>("h00") @[UART.scala 46:26]
    _T_15[3] <= UInt<8>("h00") @[UART.scala 46:26]
    reg q : UInt<8>[4], clock with : (reset => (reset, _T_15)) @[UART.scala 46:22]
    reg ptr : UInt<2>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 47:22]
    reg cnt : UInt<2>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 48:22]
    node _T_55 = add(ptr, cnt) @[UART.scala 49:38]
    node _T_56 = tail(_T_55, 1) @[UART.scala 49:38]
    reg i : UInt<4>, clock with : (reset => (reset, _T_56)) @[UART.scala 49:22]
    node _T_57 = add(ptr, cnt) @[UART.scala 51:14]
    node _T_58 = tail(_T_57, 1) @[UART.scala 51:14]
    i <= _T_58 @[UART.scala 51:7]
    io.r0 <= q[UInt<1>("h00")] @[UART.scala 53:11]
    io.r1 <= q[UInt<1>("h01")] @[UART.scala 54:11]
    io.r2 <= q[UInt<2>("h02")] @[UART.scala 55:11]
    io.r3 <= q[UInt<2>("h03")] @[UART.scala 56:11]
    node _T_76 = neq(io.in, UInt<1>("h00")) @[UART.scala 58:17]
    node _T_78 = neq(cnt, UInt<3>("h04")) @[UART.scala 58:32]
    node _T_79 = and(_T_76, _T_78) @[UART.scala 58:25]
    when _T_79 : @[UART.scala 58:41]
      node _T_83 = bits(i, 1, 0)
      q[_T_83] <= io.in @[UART.scala 59:14]
      node _T_85 = add(cnt, UInt<1>("h01")) @[UART.scala 60:21]
      node _T_86 = tail(_T_85, 1) @[UART.scala 60:21]
      cnt <= _T_86 @[UART.scala 60:14]
      skip @[UART.scala 58:41]
    node _T_88 = neq(cnt, UInt<1>("h00")) @[UART.scala 63:34]
    node _T_89 = and(tx.io.enq.ready, _T_88) @[UART.scala 63:27]
    when _T_89 : @[UART.scala 63:43]
      tx.io.enq.bits <= q[ptr] @[UART.scala 64:24]
      node _T_94 = sub(cnt, UInt<1>("h01")) @[UART.scala 65:20]
      node _T_95 = asUInt(_T_94) @[UART.scala 65:20]
      node _T_96 = tail(_T_95, 1) @[UART.scala 65:20]
      cnt <= _T_96 @[UART.scala 65:13]
      node _T_98 = add(ptr, UInt<1>("h01")) @[UART.scala 67:20]
      node _T_99 = tail(_T_98, 1) @[UART.scala 67:20]
      ptr <= _T_99 @[UART.scala 67:13]
      skip @[UART.scala 63:43]
    node _T_101 = neq(cnt, UInt<1>("h00")) @[UART.scala 70:28]
    tx.io.enq.valid <= _T_101 @[UART.scala 70:21]
    node _T_103 = neq(io.in, UInt<1>("h00")) @[UART.scala 73:18]
    node _T_105 = neq(cnt, UInt<1>("h00")) @[UART.scala 73:33]
    node _T_106 = or(_T_103, _T_105) @[UART.scala 73:26]
    node _T_107 = and(_T_106, tx.io.enq.ready) @[UART.scala 73:42]
    when _T_107 : @[UART.scala 73:62]
      io.valid <= UInt<1>("h00") @[UART.scala 74:18]
      skip @[UART.scala 73:62]
    node _T_109 = eq(_T_107, UInt<1>("h00")) @[UART.scala 73:62]
    when _T_109 : @[UART.scala 75:18]
      io.valid <= tx.io.enq.ready @[UART.scala 76:18]
      skip @[UART.scala 75:18]
    io.txd <= tx.io.txd @[UART.scala 79:13]
    
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
    output io : {in : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, aluOp : {flip func : UInt<3>, flip alt : UInt<1>}}, rs : {flip rs1 : UInt<32>, flip rs2 : UInt<32>}, sel : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>}, flip pc_next : UInt<32>, flip imm : UInt<32>}, flip out : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, aluOp : {flip func : UInt<3>, flip alt : UInt<1>}}, rs : {flip rs1 : UInt<32>, flip rs2 : UInt<32>}, sel : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>}, flip pc_next : UInt<32>, flip imm : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_76 : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, aluOp : {flip func : UInt<3>, flip alt : UInt<1>}}, rs : {flip rs1 : UInt<32>, flip rs2 : UInt<32>}, sel : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>}, flip pc_next : UInt<32>, flip imm : UInt<32>}, clock @[Pipeline.scala 29:34]
    _T_76.imm <= io.in.imm @[Pipeline.scala 29:34]
    _T_76.pc_next <= io.in.pc_next @[Pipeline.scala 29:34]
    _T_76.sel.rd <= io.in.sel.rd @[Pipeline.scala 29:34]
    _T_76.sel.rs.rs2 <= io.in.sel.rs.rs2 @[Pipeline.scala 29:34]
    _T_76.sel.rs.rs1 <= io.in.sel.rs.rs1 @[Pipeline.scala 29:34]
    _T_76.rs.rs2 <= io.in.rs.rs2 @[Pipeline.scala 29:34]
    _T_76.rs.rs1 <= io.in.rs.rs1 @[Pipeline.scala 29:34]
    _T_76.EX.aluOp.alt <= io.in.EX.aluOp.alt @[Pipeline.scala 29:34]
    _T_76.EX.aluOp.func <= io.in.EX.aluOp.func @[Pipeline.scala 29:34]
    _T_76.EX.dst_sel <= io.in.EX.dst_sel @[Pipeline.scala 29:34]
    _T_76.EX.alu_sel <= io.in.EX.alu_sel @[Pipeline.scala 29:34]
    _T_76.EX.opcode <= io.in.EX.opcode @[Pipeline.scala 29:34]
    _T_76.MEM.func <= io.in.MEM.func @[Pipeline.scala 29:34]
    _T_76.MEM.read <= io.in.MEM.read @[Pipeline.scala 29:34]
    _T_76.MEM.write <= io.in.MEM.write @[Pipeline.scala 29:34]
    _T_76.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 29:34]
    _T_76.WB.memToReg <= io.in.WB.memToReg @[Pipeline.scala 29:34]
    _T_76.WB.regWrite <= io.in.WB.regWrite @[Pipeline.scala 29:34]
    io.out.imm <= _T_76.imm @[Pipeline.scala 29:24]
    io.out.pc_next <= _T_76.pc_next @[Pipeline.scala 29:24]
    io.out.sel.rd <= _T_76.sel.rd @[Pipeline.scala 29:24]
    io.out.sel.rs.rs2 <= _T_76.sel.rs.rs2 @[Pipeline.scala 29:24]
    io.out.sel.rs.rs1 <= _T_76.sel.rs.rs1 @[Pipeline.scala 29:24]
    io.out.rs.rs2 <= _T_76.rs.rs2 @[Pipeline.scala 29:24]
    io.out.rs.rs1 <= _T_76.rs.rs1 @[Pipeline.scala 29:24]
    io.out.EX.aluOp.alt <= _T_76.EX.aluOp.alt @[Pipeline.scala 29:24]
    io.out.EX.aluOp.func <= _T_76.EX.aluOp.func @[Pipeline.scala 29:24]
    io.out.EX.dst_sel <= _T_76.EX.dst_sel @[Pipeline.scala 29:24]
    io.out.EX.alu_sel <= _T_76.EX.alu_sel @[Pipeline.scala 29:24]
    io.out.EX.opcode <= _T_76.EX.opcode @[Pipeline.scala 29:24]
    io.out.MEM.func <= _T_76.MEM.func @[Pipeline.scala 29:24]
    io.out.MEM.read <= _T_76.MEM.read @[Pipeline.scala 29:24]
    io.out.MEM.write <= _T_76.MEM.write @[Pipeline.scala 29:24]
    io.out.MEM.branch <= _T_76.MEM.branch @[Pipeline.scala 29:24]
    io.out.WB.memToReg <= _T_76.WB.memToReg @[Pipeline.scala 29:24]
    io.out.WB.regWrite <= _T_76.WB.regWrite @[Pipeline.scala 29:24]
    
  module PipelineEX_MEM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip zero : UInt<1>, flip pc_next : UInt<32>, flip aluRes : UInt<32>, flip op2 : UInt<32>, flip dst : UInt<5>}, flip out : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip zero : UInt<1>, flip pc_next : UInt<32>, flip aluRes : UInt<32>, flip op2 : UInt<32>, flip dst : UInt<5>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_48 : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip zero : UInt<1>, flip pc_next : UInt<32>, flip aluRes : UInt<32>, flip op2 : UInt<32>, flip dst : UInt<5>}, clock @[Pipeline.scala 38:34]
    _T_48.dst <= io.in.dst @[Pipeline.scala 38:34]
    _T_48.op2 <= io.in.op2 @[Pipeline.scala 38:34]
    _T_48.aluRes <= io.in.aluRes @[Pipeline.scala 38:34]
    _T_48.pc_next <= io.in.pc_next @[Pipeline.scala 38:34]
    _T_48.zero <= io.in.zero @[Pipeline.scala 38:34]
    _T_48.MEM.func <= io.in.MEM.func @[Pipeline.scala 38:34]
    _T_48.MEM.read <= io.in.MEM.read @[Pipeline.scala 38:34]
    _T_48.MEM.write <= io.in.MEM.write @[Pipeline.scala 38:34]
    _T_48.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 38:34]
    _T_48.WB.memToReg <= io.in.WB.memToReg @[Pipeline.scala 38:34]
    _T_48.WB.regWrite <= io.in.WB.regWrite @[Pipeline.scala 38:34]
    io.out.dst <= _T_48.dst @[Pipeline.scala 38:24]
    io.out.op2 <= _T_48.op2 @[Pipeline.scala 38:24]
    io.out.aluRes <= _T_48.aluRes @[Pipeline.scala 38:24]
    io.out.pc_next <= _T_48.pc_next @[Pipeline.scala 38:24]
    io.out.zero <= _T_48.zero @[Pipeline.scala 38:24]
    io.out.MEM.func <= _T_48.MEM.func @[Pipeline.scala 38:24]
    io.out.MEM.read <= _T_48.MEM.read @[Pipeline.scala 38:24]
    io.out.MEM.write <= _T_48.MEM.write @[Pipeline.scala 38:24]
    io.out.MEM.branch <= _T_48.MEM.branch @[Pipeline.scala 38:24]
    io.out.WB.memToReg <= _T_48.WB.memToReg @[Pipeline.scala 38:24]
    io.out.WB.regWrite <= _T_48.WB.regWrite @[Pipeline.scala 38:24]
    
  module PipelineMEM_WB : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, flip rd_alu : UInt<32>, flip rd_mem : UInt<32>, flip dst : UInt<5>}, flip out : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, flip rd_alu : UInt<32>, flip rd_mem : UInt<32>, flip dst : UInt<5>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_24 : {WB : {flip regWrite : UInt<1>, flip memToReg : UInt<1>}, flip rd_alu : UInt<32>, flip rd_mem : UInt<32>, flip dst : UInt<5>}, clock @[Pipeline.scala 47:34]
    _T_24.dst <= io.in.dst @[Pipeline.scala 47:34]
    _T_24.rd_mem <= io.in.rd_mem @[Pipeline.scala 47:34]
    _T_24.rd_alu <= io.in.rd_alu @[Pipeline.scala 47:34]
    _T_24.WB.memToReg <= io.in.WB.memToReg @[Pipeline.scala 47:34]
    _T_24.WB.regWrite <= io.in.WB.regWrite @[Pipeline.scala 47:34]
    io.out.dst <= _T_24.dst @[Pipeline.scala 47:24]
    io.out.rd_mem <= _T_24.rd_mem @[Pipeline.scala 47:24]
    io.out.rd_alu <= _T_24.rd_alu @[Pipeline.scala 47:24]
    io.out.WB.memToReg <= _T_24.WB.memToReg @[Pipeline.scala 47:24]
    io.out.WB.regWrite <= _T_24.WB.regWrite @[Pipeline.scala 47:24]
    
  module CPU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {txd : UInt<1>, r0 : UInt<8>, r1 : UInt<8>, r2 : UInt<8>, r3 : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem instMem : UInt<32>[60] @[Bin.scala 29:38]
    infer mport _T_52 = instMem[UInt<1>("h00")], clock
    _T_52 <= UInt<32>("h0464c457f") @[Bin.scala 34:35]
    infer mport _T_55 = instMem[UInt<1>("h01")], clock
    _T_55 <= UInt<32>("h010101") @[Bin.scala 34:35]
    infer mport _T_58 = instMem[UInt<2>("h02")], clock
    _T_58 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_61 = instMem[UInt<2>("h03")], clock
    _T_61 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_64 = instMem[UInt<3>("h04")], clock
    _T_64 <= UInt<32>("h0f30002") @[Bin.scala 34:35]
    infer mport _T_67 = instMem[UInt<3>("h05")], clock
    _T_67 <= UInt<32>("h01") @[Bin.scala 34:35]
    infer mport _T_70 = instMem[UInt<3>("h06")], clock
    _T_70 <= UInt<32>("h010054") @[Bin.scala 34:35]
    infer mport _T_73 = instMem[UInt<3>("h07")], clock
    _T_73 <= UInt<32>("h034") @[Bin.scala 34:35]
    infer mport _T_76 = instMem[UInt<4>("h08")], clock
    _T_76 <= UInt<32>("h01dc") @[Bin.scala 34:35]
    infer mport _T_79 = instMem[UInt<4>("h09")], clock
    _T_79 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_82 = instMem[UInt<4>("h0a")], clock
    _T_82 <= UInt<32>("h0200034") @[Bin.scala 34:35]
    infer mport _T_85 = instMem[UInt<4>("h0b")], clock
    _T_85 <= UInt<32>("h0280001") @[Bin.scala 34:35]
    infer mport _T_88 = instMem[UInt<4>("h0c")], clock
    _T_88 <= UInt<32>("h050006") @[Bin.scala 34:35]
    infer mport _T_91 = instMem[UInt<4>("h0d")], clock
    _T_91 <= UInt<32>("h01") @[Bin.scala 34:35]
    infer mport _T_94 = instMem[UInt<4>("h0e")], clock
    _T_94 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_97 = instMem[UInt<4>("h0f")], clock
    _T_97 <= UInt<32>("h010000") @[Bin.scala 34:35]
    infer mport _T_100 = instMem[UInt<5>("h010")], clock
    _T_100 <= UInt<32>("h010000") @[Bin.scala 34:35]
    infer mport _T_103 = instMem[UInt<5>("h011")], clock
    _T_103 <= UInt<32>("h0cc") @[Bin.scala 34:35]
    infer mport _T_106 = instMem[UInt<5>("h012")], clock
    _T_106 <= UInt<32>("h0cc") @[Bin.scala 34:35]
    infer mport _T_109 = instMem[UInt<5>("h013")], clock
    _T_109 <= UInt<32>("h05") @[Bin.scala 34:35]
    infer mport _T_112 = instMem[UInt<5>("h014")], clock
    _T_112 <= UInt<32>("h01000") @[Bin.scala 34:35]
    infer mport _T_115 = instMem[UInt<5>("h015")], clock
    _T_115 <= UInt<32>("h040100313") @[Bin.scala 34:35]
    infer mport _T_118 = instMem[UInt<5>("h016")], clock
    _T_118 <= UInt<32>("h06800293") @[Bin.scala 34:35]
    infer mport _T_121 = instMem[UInt<5>("h017")], clock
    _T_121 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_124 = instMem[UInt<5>("h018")], clock
    _T_124 <= UInt<32>("h06500293") @[Bin.scala 34:35]
    infer mport _T_127 = instMem[UInt<5>("h019")], clock
    _T_127 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_130 = instMem[UInt<5>("h01a")], clock
    _T_130 <= UInt<32>("h06c00293") @[Bin.scala 34:35]
    infer mport _T_133 = instMem[UInt<5>("h01b")], clock
    _T_133 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_136 = instMem[UInt<5>("h01c")], clock
    _T_136 <= UInt<32>("h06c00293") @[Bin.scala 34:35]
    infer mport _T_139 = instMem[UInt<5>("h01d")], clock
    _T_139 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_142 = instMem[UInt<5>("h01e")], clock
    _T_142 <= UInt<32>("h06f00293") @[Bin.scala 34:35]
    infer mport _T_145 = instMem[UInt<5>("h01f")], clock
    _T_145 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_148 = instMem[UInt<6>("h020")], clock
    _T_148 <= UInt<32>("h02000293") @[Bin.scala 34:35]
    infer mport _T_151 = instMem[UInt<6>("h021")], clock
    _T_151 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_154 = instMem[UInt<6>("h022")], clock
    _T_154 <= UInt<32>("h07700293") @[Bin.scala 34:35]
    infer mport _T_157 = instMem[UInt<6>("h023")], clock
    _T_157 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_160 = instMem[UInt<6>("h024")], clock
    _T_160 <= UInt<32>("h06f00293") @[Bin.scala 34:35]
    infer mport _T_163 = instMem[UInt<6>("h025")], clock
    _T_163 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_166 = instMem[UInt<6>("h026")], clock
    _T_166 <= UInt<32>("h07200293") @[Bin.scala 34:35]
    infer mport _T_169 = instMem[UInt<6>("h027")], clock
    _T_169 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_172 = instMem[UInt<6>("h028")], clock
    _T_172 <= UInt<32>("h06c00293") @[Bin.scala 34:35]
    infer mport _T_175 = instMem[UInt<6>("h029")], clock
    _T_175 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_178 = instMem[UInt<6>("h02a")], clock
    _T_178 <= UInt<32>("h06400293") @[Bin.scala 34:35]
    infer mport _T_181 = instMem[UInt<6>("h02b")], clock
    _T_181 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_184 = instMem[UInt<6>("h02c")], clock
    _T_184 <= UInt<32>("h02100293") @[Bin.scala 34:35]
    infer mport _T_187 = instMem[UInt<6>("h02d")], clock
    _T_187 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_190 = instMem[UInt<6>("h02e")], clock
    _T_190 <= UInt<32>("h0a00293") @[Bin.scala 34:35]
    infer mport _T_193 = instMem[UInt<6>("h02f")], clock
    _T_193 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_196 = instMem[UInt<6>("h030")], clock
    _T_196 <= UInt<32>("h0d00293") @[Bin.scala 34:35]
    infer mport _T_199 = instMem[UInt<6>("h031")], clock
    _T_199 <= UInt<32>("h0532023") @[Bin.scala 34:35]
    infer mport _T_202 = instMem[UInt<6>("h032")], clock
    _T_202 <= UInt<32>("h08067") @[Bin.scala 34:35]
    infer mport _T_205 = instMem[UInt<6>("h033")], clock
    _T_205 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_208 = instMem[UInt<6>("h034")], clock
    _T_208 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_211 = instMem[UInt<6>("h035")], clock
    _T_211 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_214 = instMem[UInt<6>("h036")], clock
    _T_214 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_217 = instMem[UInt<6>("h037")], clock
    _T_217 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_220 = instMem[UInt<6>("h038")], clock
    _T_220 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_223 = instMem[UInt<6>("h039")], clock
    _T_223 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_226 = instMem[UInt<6>("h03a")], clock
    _T_226 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_229 = instMem[UInt<6>("h03b")], clock
    _T_229 <= UInt<32>("h00") @[Bin.scala 34:35]
    inst counter of ProgramCounter @[CPU.scala 75:29]
    counter.io is invalid
    counter.clock <= clock
    counter.reset <= reset
    inst decoder of Decoder @[CPU.scala 76:29]
    decoder.io is invalid
    decoder.clock <= clock
    decoder.reset <= reset
    inst control of Control @[CPU.scala 77:29]
    control.io is invalid
    control.clock <= clock
    control.reset <= reset
    inst regs of Registers @[CPU.scala 78:29]
    regs.io is invalid
    regs.clock <= clock
    regs.reset <= reset
    inst alu of ALU @[CPU.scala 79:29]
    alu.io is invalid
    alu.clock <= clock
    alu.reset <= reset
    inst dataMem of DataMemory @[CPU.scala 80:29]
    dataMem.io is invalid
    dataMem.clock <= clock
    dataMem.reset <= reset
    inst fwdUnit of ForwardingUnit @[CPU.scala 81:29]
    fwdUnit.io is invalid
    fwdUnit.clock <= clock
    fwdUnit.reset <= reset
    inst hazardUnit of DetectHazardUnit @[CPU.scala 82:29]
    hazardUnit.io is invalid
    hazardUnit.clock <= clock
    hazardUnit.reset <= reset
    inst uart of UART @[CPU.scala 84:29]
    uart.io is invalid
    uart.clock <= clock
    uart.reset <= reset
    inst IF_ID of PipelineIF_ID @[CPU.scala 88:29]
    IF_ID.io is invalid
    IF_ID.clock <= clock
    IF_ID.reset <= reset
    inst ID_EX of PipelineID_EX @[CPU.scala 89:29]
    ID_EX.io is invalid
    ID_EX.clock <= clock
    ID_EX.reset <= reset
    inst EX_MEM of PipelineEX_MEM @[CPU.scala 90:29]
    EX_MEM.io is invalid
    EX_MEM.clock <= clock
    EX_MEM.reset <= reset
    inst MEM_WB of PipelineMEM_WB @[CPU.scala 91:29]
    MEM_WB.io is invalid
    MEM_WB.clock <= clock
    MEM_WB.reset <= reset
    IF_ID.io.in.pc_next <= counter.io.pc_next @[CPU.scala 95:29]
    node _T_231 = bits(counter.io.pc, 5, 0)
    read mport _T_232 = instMem[_T_231], clock
    IF_ID.io.in.inst <= _T_232 @[CPU.scala 96:29]
    decoder.io.inst <= IF_ID.io.out.inst @[CPU.scala 100:29]
    regs.io.sel.rs.rs2 <= decoder.io.sel.rs.rs2 @[CPU.scala 101:29]
    regs.io.sel.rs.rs1 <= decoder.io.sel.rs.rs1 @[CPU.scala 101:29]
    node _T_233 = mux(uart.io.valid, decoder.io.ctrl.opcode, UInt<1>("h00")) @[CPU.scala 104:35]
    control.io.ctrl.opcode <= _T_233 @[CPU.scala 104:29]
    node _T_234 = mux(uart.io.valid, decoder.io.ctrl.funct3, UInt<1>("h00")) @[CPU.scala 105:35]
    control.io.ctrl.funct3 <= _T_234 @[CPU.scala 105:29]
    node _T_235 = mux(uart.io.valid, decoder.io.ctrl.funct7, UInt<1>("h00")) @[CPU.scala 106:35]
    control.io.ctrl.funct7 <= _T_235 @[CPU.scala 106:29]
    node _T_236 = eq(regs.io.reg.rs.rs1, regs.io.reg.rs.rs2) @[CPU.scala 108:52]
    node _T_237 = and(_T_236, control.io.MEM.branch) @[CPU.scala 108:75]
    node _T_239 = eq(uart.io.valid, UInt<1>("h00")) @[CPU.scala 108:104]
    node _T_240 = or(_T_237, _T_239) @[CPU.scala 108:101]
    counter.io.branch <= _T_240 @[CPU.scala 108:29]
    node _T_241 = add(IF_ID.io.out.pc_next, decoder.io.imm.SB) @[CPU.scala 110:72]
    node _T_242 = tail(_T_241, 1) @[CPU.scala 110:72]
    node _T_244 = sub(EX_MEM.io.out.pc_next, UInt<1>("h01")) @[CPU.scala 110:115]
    node _T_245 = asUInt(_T_244) @[CPU.scala 110:115]
    node _T_246 = tail(_T_245, 1) @[CPU.scala 110:115]
    node _T_247 = mux(uart.io.valid, _T_242, _T_246) @[CPU.scala 110:35]
    counter.io.pc_src <= _T_247 @[CPU.scala 110:29]
    ID_EX.io.in.WB.memToReg <= control.io.WB.memToReg @[CPU.scala 112:29]
    ID_EX.io.in.WB.regWrite <= control.io.WB.regWrite @[CPU.scala 112:29]
    ID_EX.io.in.MEM.func <= control.io.MEM.func @[CPU.scala 113:29]
    ID_EX.io.in.MEM.read <= control.io.MEM.read @[CPU.scala 113:29]
    ID_EX.io.in.MEM.write <= control.io.MEM.write @[CPU.scala 113:29]
    ID_EX.io.in.MEM.branch <= control.io.MEM.branch @[CPU.scala 113:29]
    ID_EX.io.in.EX.aluOp.alt <= control.io.EX.aluOp.alt @[CPU.scala 114:29]
    ID_EX.io.in.EX.aluOp.func <= control.io.EX.aluOp.func @[CPU.scala 114:29]
    ID_EX.io.in.EX.dst_sel <= control.io.EX.dst_sel @[CPU.scala 114:29]
    ID_EX.io.in.EX.alu_sel <= control.io.EX.alu_sel @[CPU.scala 114:29]
    ID_EX.io.in.EX.opcode <= control.io.EX.opcode @[CPU.scala 114:29]
    ID_EX.io.in.pc_next <= IF_ID.io.out.pc_next @[CPU.scala 115:29]
    ID_EX.io.in.rs.rs2 <= regs.io.reg.rs.rs2 @[CPU.scala 116:29]
    ID_EX.io.in.rs.rs1 <= regs.io.reg.rs.rs1 @[CPU.scala 116:29]
    node _T_248 = mux(control.io.MEM.write, decoder.io.imm.S, decoder.io.imm.I) @[CPU.scala 118:35]
    ID_EX.io.in.imm <= _T_248 @[CPU.scala 118:29]
    ID_EX.io.in.sel.rd <= decoder.io.sel.rd @[CPU.scala 119:29]
    ID_EX.io.in.sel.rs.rs2 <= decoder.io.sel.rs.rs2 @[CPU.scala 119:29]
    ID_EX.io.in.sel.rs.rs1 <= decoder.io.sel.rs.rs1 @[CPU.scala 119:29]
    fwdUnit.io.sel_rs1 <= ID_EX.io.out.sel.rs.rs1 @[CPU.scala 123:33]
    fwdUnit.io.sel_rs2 <= ID_EX.io.out.sel.rs.rs2 @[CPU.scala 124:33]
    fwdUnit.io.dst_exMem <= EX_MEM.io.out.dst @[CPU.scala 125:33]
    fwdUnit.io.dst_memWb <= MEM_WB.io.out.dst @[CPU.scala 126:33]
    fwdUnit.io.regWrite_exMem <= EX_MEM.io.out.WB.regWrite @[CPU.scala 127:33]
    fwdUnit.io.regWrite_memWb <= MEM_WB.io.out.WB.regWrite @[CPU.scala 128:33]
    alu.io.opcode <= ID_EX.io.out.EX.opcode @[CPU.scala 130:33]
    alu.io.aluOp.alt <= ID_EX.io.out.EX.aluOp.alt @[CPU.scala 131:33]
    alu.io.aluOp.func <= ID_EX.io.out.EX.aluOp.func @[CPU.scala 131:33]
    node _T_249 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_250 = mux(_T_249, ID_EX.io.out.rs.rs1, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_251 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_252 = mux(_T_251, regs.io.reg.rd, _T_250) @[Mux.scala 46:16]
    node _T_253 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_254 = mux(_T_253, EX_MEM.io.out.aluRes, _T_252) @[Mux.scala 46:16]
    alu.io.reg.rs.rs1 <= _T_254 @[CPU.scala 133:23]
    node _T_256 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.rs.rs2) @[CPU.scala 141:23]
    node _T_257 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_258 = mux(_T_257, _T_256, UInt<3>("h05")) @[Mux.scala 46:16]
    node _T_259 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_260 = mux(_T_259, regs.io.reg.rd, _T_258) @[Mux.scala 46:16]
    node _T_261 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_262 = mux(_T_261, EX_MEM.io.out.aluRes, _T_260) @[Mux.scala 46:16]
    alu.io.reg.rs.rs2 <= _T_262 @[CPU.scala 138:23]
    EX_MEM.io.in.pc_next <= ID_EX.io.out.pc_next @[CPU.scala 144:29]
    EX_MEM.io.in.WB.memToReg <= ID_EX.io.out.WB.memToReg @[CPU.scala 146:29]
    EX_MEM.io.in.WB.regWrite <= ID_EX.io.out.WB.regWrite @[CPU.scala 146:29]
    EX_MEM.io.in.MEM.func <= ID_EX.io.out.MEM.func @[CPU.scala 147:29]
    EX_MEM.io.in.MEM.read <= ID_EX.io.out.MEM.read @[CPU.scala 147:29]
    EX_MEM.io.in.MEM.write <= ID_EX.io.out.MEM.write @[CPU.scala 147:29]
    EX_MEM.io.in.MEM.branch <= ID_EX.io.out.MEM.branch @[CPU.scala 147:29]
    EX_MEM.io.in.zero <= alu.io.zero @[CPU.scala 148:29]
    EX_MEM.io.in.aluRes <= alu.io.reg.rd @[CPU.scala 149:29]
    EX_MEM.io.in.op2 <= alu.io.reg.rs.rs2 @[CPU.scala 150:29]
    node _T_263 = mux(ID_EX.io.out.EX.dst_sel, ID_EX.io.out.sel.rd, ID_EX.io.out.sel.rs.rs2) @[CPU.scala 152:35]
    EX_MEM.io.in.dst <= _T_263 @[CPU.scala 152:29]
    dataMem.io.mem.func <= EX_MEM.io.out.MEM.func @[CPU.scala 156:29]
    dataMem.io.mem.read <= EX_MEM.io.out.MEM.read @[CPU.scala 156:29]
    dataMem.io.mem.write <= EX_MEM.io.out.MEM.write @[CPU.scala 156:29]
    dataMem.io.mem.branch <= EX_MEM.io.out.MEM.branch @[CPU.scala 156:29]
    dataMem.io.reg.rs.rs1 <= EX_MEM.io.out.aluRes @[CPU.scala 157:29]
    dataMem.io.reg.rs.rs2 <= EX_MEM.io.out.op2 @[CPU.scala 158:29]
    MEM_WB.io.in.WB.memToReg <= EX_MEM.io.out.WB.memToReg @[CPU.scala 160:29]
    MEM_WB.io.in.WB.regWrite <= EX_MEM.io.out.WB.regWrite @[CPU.scala 160:29]
    MEM_WB.io.in.rd_mem <= dataMem.io.reg.rd @[CPU.scala 161:29]
    MEM_WB.io.in.rd_alu <= EX_MEM.io.out.aluRes @[CPU.scala 162:29]
    MEM_WB.io.in.dst <= EX_MEM.io.out.dst @[CPU.scala 163:29]
    regs.io.sel.rd <= MEM_WB.io.out.dst @[CPU.scala 167:29]
    regs.io.regWrite <= MEM_WB.io.out.WB.regWrite @[CPU.scala 168:29]
    node _T_264 = mux(MEM_WB.io.out.WB.memToReg, MEM_WB.io.out.rd_mem, MEM_WB.io.out.rd_alu) @[CPU.scala 169:35]
    regs.io.reg.rd <= _T_264 @[CPU.scala 169:29]
    node _T_266 = eq(dataMem.io.reg.rs.rs1, UInt<11>("h0401")) @[CPU.scala 173:60]
    node _T_267 = and(EX_MEM.io.out.MEM.write, _T_266) @[CPU.scala 173:35]
    when _T_267 : @[CPU.scala 173:72]
      node _T_268 = bits(dataMem.io.reg.rs.rs2, 7, 0) @[CPU.scala 174:44]
      uart.io.in <= _T_268 @[CPU.scala 174:20]
      skip @[CPU.scala 173:72]
    node _T_270 = eq(_T_267, UInt<1>("h00")) @[CPU.scala 173:72]
    when _T_270 : @[CPU.scala 175:18]
      uart.io.in <= UInt<1>("h00") @[CPU.scala 176:20]
      skip @[CPU.scala 175:18]
    io.txd <= uart.io.txd @[CPU.scala 179:12]
    io.r0 <= uart.io.r0 @[CPU.scala 182:11]
    io.r1 <= uart.io.r1 @[CPU.scala 183:11]
    io.r2 <= uart.io.r2 @[CPU.scala 184:11]
    io.r3 <= uart.io.r3 @[CPU.scala 185:11]
    
