;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit CPU : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip branch : UInt<1>, flip pc_src : UInt<32>, pc_next : UInt<32>, pc : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ProgramCounter.scala 22:30]
    node _T_9 = add(pc_reg, UInt<1>("h01")) @[ProgramCounter.scala 24:35]
    node _T_10 = tail(_T_9, 1) @[ProgramCounter.scala 24:35]
    io.pc_next <= _T_10 @[ProgramCounter.scala 24:25]
    node _T_11 = mux(io.branch, io.pc_src, io.pc_next) @[ProgramCounter.scala 25:31]
    pc_reg <= _T_11 @[ProgramCounter.scala 25:25]
    io.pc <= pc_reg @[ProgramCounter.scala 26:25]
    
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
    output io : {branch : UInt<1>, pc : UInt<32>, pc_next : UInt<32>, inst : UInt<32>, opcode : UInt<32>, imm_i : UInt<32>, imm_sb : UInt<32>, alu_sel : UInt<1>, fwd_rs1 : UInt<2>, fwd_rs2 : UInt<2>, rs1 : UInt<32>, rs2 : UInt<32>, alu_src : UInt<32>, op1 : UInt<32>, op2 : UInt<32>, rd_exMem : UInt<32>, rd_memWb : UInt<32>, zero : UInt<1>, alu_res : UInt<32>, rs1_ifId : UInt<32>, rs2_ifId : UInt<32>, rd_sel : UInt<5>, sel_rs1 : UInt<5>, sel_rs2 : UInt<5>, dst_exMem : UInt<5>, dst_memWb : UInt<5>, regWrite_exMem : UInt<1>, regWrite_memWb : UInt<1>, memRead : UInt<1>, memWrite : UInt<1>, memRes : UInt<32>, wData : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem instMem : UInt<32>[15] @[Bin.scala 29:38]
    infer mport _T_79 = instMem[UInt<1>("h00")], clock
    _T_79 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_82 = instMem[UInt<1>("h01")], clock
    _T_82 <= UInt<32>("h0300093") @[Bin.scala 34:35]
    infer mport _T_85 = instMem[UInt<2>("h02")], clock
    _T_85 <= UInt<32>("h038800113") @[Bin.scala 34:35]
    infer mport _T_88 = instMem[UInt<2>("h03")], clock
    _T_88 <= UInt<32>("h01200193") @[Bin.scala 34:35]
    infer mport _T_91 = instMem[UInt<3>("h04")], clock
    _T_91 <= UInt<32>("h020a023") @[Bin.scala 34:35]
    infer mport _T_94 = instMem[UInt<3>("h05")], clock
    _T_94 <= UInt<32>("h0a203") @[Bin.scala 34:35]
    infer mport _T_97 = instMem[UInt<3>("h06")], clock
    _T_97 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_100 = instMem[UInt<3>("h07")], clock
    _T_100 <= UInt<32>("h03102b3") @[Bin.scala 34:35]
    infer mport _T_103 = instMem[UInt<4>("h08")], clock
    _T_103 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_106 = instMem[UInt<4>("h09")], clock
    _T_106 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_109 = instMem[UInt<4>("h0a")], clock
    _T_109 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_112 = instMem[UInt<4>("h0b")], clock
    _T_112 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_115 = instMem[UInt<4>("h0c")], clock
    _T_115 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_118 = instMem[UInt<4>("h0d")], clock
    _T_118 <= UInt<32>("h00") @[Bin.scala 34:35]
    infer mport _T_121 = instMem[UInt<4>("h0e")], clock
    _T_121 <= UInt<32>("h00") @[Bin.scala 34:35]
    inst counter of ProgramCounter @[CPU.scala 67:29]
    counter.io is invalid
    counter.clock <= clock
    counter.reset <= reset
    inst decoder of Decoder @[CPU.scala 68:29]
    decoder.io is invalid
    decoder.clock <= clock
    decoder.reset <= reset
    inst control of Control @[CPU.scala 69:29]
    control.io is invalid
    control.clock <= clock
    control.reset <= reset
    inst regs of Registers @[CPU.scala 70:29]
    regs.io is invalid
    regs.clock <= clock
    regs.reset <= reset
    inst alu of ALU @[CPU.scala 71:29]
    alu.io is invalid
    alu.clock <= clock
    alu.reset <= reset
    inst dataMem of DataMemory @[CPU.scala 72:29]
    dataMem.io is invalid
    dataMem.clock <= clock
    dataMem.reset <= reset
    inst fwdUnit of ForwardingUnit @[CPU.scala 73:29]
    fwdUnit.io is invalid
    fwdUnit.clock <= clock
    fwdUnit.reset <= reset
    inst hazardUnit of DetectHazardUnit @[CPU.scala 74:29]
    hazardUnit.io is invalid
    hazardUnit.clock <= clock
    hazardUnit.reset <= reset
    inst IF_ID of PipelineIF_ID @[CPU.scala 78:29]
    IF_ID.io is invalid
    IF_ID.clock <= clock
    IF_ID.reset <= reset
    inst ID_EX of PipelineID_EX @[CPU.scala 79:29]
    ID_EX.io is invalid
    ID_EX.clock <= clock
    ID_EX.reset <= reset
    inst EX_MEM of PipelineEX_MEM @[CPU.scala 80:29]
    EX_MEM.io is invalid
    EX_MEM.clock <= clock
    EX_MEM.reset <= reset
    inst MEM_WB of PipelineMEM_WB @[CPU.scala 81:29]
    MEM_WB.io is invalid
    MEM_WB.clock <= clock
    MEM_WB.reset <= reset
    io.pc <= counter.io.pc @[CPU.scala 85:29]
    IF_ID.io.in.pc_next <= counter.io.pc_next @[CPU.scala 87:29]
    node _T_123 = bits(io.pc, 3, 0)
    read mport _T_124 = instMem[_T_123], clock
    IF_ID.io.in.inst <= _T_124 @[CPU.scala 88:29]
    decoder.io.inst <= IF_ID.io.out.inst @[CPU.scala 92:29]
    regs.io.sel.rs.rs2 <= decoder.io.sel.rs.rs2 @[CPU.scala 93:29]
    regs.io.sel.rs.rs1 <= decoder.io.sel.rs.rs1 @[CPU.scala 93:29]
    control.io.ctrl.funct7 <= decoder.io.ctrl.funct7 @[CPU.scala 94:29]
    control.io.ctrl.funct3 <= decoder.io.ctrl.funct3 @[CPU.scala 94:29]
    control.io.ctrl.opcode <= decoder.io.ctrl.opcode @[CPU.scala 94:29]
    node _T_125 = eq(regs.io.reg.rs.rs1, regs.io.reg.rs.rs2) @[CPU.scala 96:51]
    node _T_126 = and(_T_125, control.io.MEM.branch) @[CPU.scala 96:74]
    counter.io.branch <= _T_126 @[CPU.scala 96:29]
    node _T_127 = add(IF_ID.io.out.pc_next, decoder.io.imm.SB) @[CPU.scala 97:53]
    node _T_128 = tail(_T_127, 1) @[CPU.scala 97:53]
    counter.io.pc_src <= _T_128 @[CPU.scala 97:29]
    ID_EX.io.in.WB.memToReg <= control.io.WB.memToReg @[CPU.scala 99:29]
    ID_EX.io.in.WB.regWrite <= control.io.WB.regWrite @[CPU.scala 99:29]
    ID_EX.io.in.MEM.func <= control.io.MEM.func @[CPU.scala 100:29]
    ID_EX.io.in.MEM.read <= control.io.MEM.read @[CPU.scala 100:29]
    ID_EX.io.in.MEM.write <= control.io.MEM.write @[CPU.scala 100:29]
    ID_EX.io.in.MEM.branch <= control.io.MEM.branch @[CPU.scala 100:29]
    ID_EX.io.in.EX.aluOp.alt <= control.io.EX.aluOp.alt @[CPU.scala 101:29]
    ID_EX.io.in.EX.aluOp.func <= control.io.EX.aluOp.func @[CPU.scala 101:29]
    ID_EX.io.in.EX.dst_sel <= control.io.EX.dst_sel @[CPU.scala 101:29]
    ID_EX.io.in.EX.alu_sel <= control.io.EX.alu_sel @[CPU.scala 101:29]
    ID_EX.io.in.EX.opcode <= control.io.EX.opcode @[CPU.scala 101:29]
    ID_EX.io.in.pc_next <= IF_ID.io.out.pc_next @[CPU.scala 102:29]
    ID_EX.io.in.rs.rs2 <= regs.io.reg.rs.rs2 @[CPU.scala 103:29]
    ID_EX.io.in.rs.rs1 <= regs.io.reg.rs.rs1 @[CPU.scala 103:29]
    node _T_129 = mux(control.io.MEM.write, decoder.io.imm.S, decoder.io.imm.I) @[CPU.scala 105:35]
    ID_EX.io.in.imm <= _T_129 @[CPU.scala 105:29]
    ID_EX.io.in.sel.rd <= decoder.io.sel.rd @[CPU.scala 106:29]
    ID_EX.io.in.sel.rs.rs2 <= decoder.io.sel.rs.rs2 @[CPU.scala 106:29]
    ID_EX.io.in.sel.rs.rs1 <= decoder.io.sel.rs.rs1 @[CPU.scala 106:29]
    fwdUnit.io.sel_rs1 <= ID_EX.io.out.sel.rs.rs1 @[CPU.scala 110:33]
    fwdUnit.io.sel_rs2 <= ID_EX.io.out.sel.rs.rs2 @[CPU.scala 111:33]
    fwdUnit.io.dst_exMem <= EX_MEM.io.out.dst @[CPU.scala 112:33]
    fwdUnit.io.dst_memWb <= MEM_WB.io.out.dst @[CPU.scala 113:33]
    fwdUnit.io.regWrite_exMem <= EX_MEM.io.out.WB.regWrite @[CPU.scala 114:33]
    fwdUnit.io.regWrite_memWb <= MEM_WB.io.out.WB.regWrite @[CPU.scala 115:33]
    alu.io.opcode <= ID_EX.io.out.EX.opcode @[CPU.scala 117:33]
    alu.io.aluOp.alt <= ID_EX.io.out.EX.aluOp.alt @[CPU.scala 118:33]
    alu.io.aluOp.func <= ID_EX.io.out.EX.aluOp.func @[CPU.scala 118:33]
    node _T_130 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_131 = mux(_T_130, ID_EX.io.out.rs.rs1, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_132 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_133 = mux(_T_132, regs.io.reg.rd, _T_131) @[Mux.scala 46:16]
    node _T_134 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_135 = mux(_T_134, EX_MEM.io.out.aluRes, _T_133) @[Mux.scala 46:16]
    alu.io.reg.rs.rs1 <= _T_135 @[CPU.scala 120:23]
    node _T_137 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.rs.rs2) @[CPU.scala 128:23]
    node _T_138 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_139 = mux(_T_138, _T_137, UInt<3>("h05")) @[Mux.scala 46:16]
    node _T_140 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_141 = mux(_T_140, regs.io.reg.rd, _T_139) @[Mux.scala 46:16]
    node _T_142 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_143 = mux(_T_142, EX_MEM.io.out.aluRes, _T_141) @[Mux.scala 46:16]
    alu.io.reg.rs.rs2 <= _T_143 @[CPU.scala 125:23]
    EX_MEM.io.in.WB.memToReg <= ID_EX.io.out.WB.memToReg @[CPU.scala 130:29]
    EX_MEM.io.in.WB.regWrite <= ID_EX.io.out.WB.regWrite @[CPU.scala 130:29]
    EX_MEM.io.in.MEM.func <= ID_EX.io.out.MEM.func @[CPU.scala 131:29]
    EX_MEM.io.in.MEM.read <= ID_EX.io.out.MEM.read @[CPU.scala 131:29]
    EX_MEM.io.in.MEM.write <= ID_EX.io.out.MEM.write @[CPU.scala 131:29]
    EX_MEM.io.in.MEM.branch <= ID_EX.io.out.MEM.branch @[CPU.scala 131:29]
    EX_MEM.io.in.zero <= alu.io.zero @[CPU.scala 132:29]
    EX_MEM.io.in.aluRes <= alu.io.reg.rd @[CPU.scala 133:29]
    EX_MEM.io.in.op2 <= alu.io.reg.rs.rs2 @[CPU.scala 134:29]
    node _T_144 = mux(ID_EX.io.out.EX.dst_sel, ID_EX.io.out.sel.rd, ID_EX.io.out.sel.rs.rs2) @[CPU.scala 136:35]
    EX_MEM.io.in.dst <= _T_144 @[CPU.scala 136:29]
    dataMem.io.mem.func <= EX_MEM.io.out.MEM.func @[CPU.scala 140:29]
    dataMem.io.mem.read <= EX_MEM.io.out.MEM.read @[CPU.scala 140:29]
    dataMem.io.mem.write <= EX_MEM.io.out.MEM.write @[CPU.scala 140:29]
    dataMem.io.mem.branch <= EX_MEM.io.out.MEM.branch @[CPU.scala 140:29]
    dataMem.io.reg.rs.rs1 <= EX_MEM.io.out.aluRes @[CPU.scala 141:29]
    dataMem.io.reg.rs.rs2 <= EX_MEM.io.out.op2 @[CPU.scala 142:29]
    MEM_WB.io.in.WB.memToReg <= EX_MEM.io.out.WB.memToReg @[CPU.scala 144:29]
    MEM_WB.io.in.WB.regWrite <= EX_MEM.io.out.WB.regWrite @[CPU.scala 144:29]
    MEM_WB.io.in.rd_mem <= dataMem.io.reg.rd @[CPU.scala 145:29]
    MEM_WB.io.in.rd_alu <= EX_MEM.io.out.aluRes @[CPU.scala 146:29]
    MEM_WB.io.in.dst <= EX_MEM.io.out.dst @[CPU.scala 147:29]
    regs.io.sel.rd <= MEM_WB.io.out.dst @[CPU.scala 151:29]
    regs.io.regWrite <= MEM_WB.io.out.WB.regWrite @[CPU.scala 152:29]
    node _T_145 = mux(MEM_WB.io.out.WB.memToReg, MEM_WB.io.out.rd_mem, MEM_WB.io.out.rd_alu) @[CPU.scala 153:35]
    regs.io.reg.rd <= _T_145 @[CPU.scala 153:29]
    io.pc <= counter.io.pc @[CPU.scala 157:17]
    io.pc_next <= counter.io.pc_next @[CPU.scala 158:17]
    node _T_146 = bits(io.pc, 3, 0)
    read mport _T_147 = instMem[_T_146], clock
    io.inst <= _T_147 @[CPU.scala 160:17]
    io.branch <= counter.io.branch @[CPU.scala 161:17]
    io.opcode <= ID_EX.io.out.EX.opcode @[CPU.scala 162:17]
    io.imm_i <= decoder.io.imm.I @[CPU.scala 164:17]
    io.imm_sb <= decoder.io.imm.SB @[CPU.scala 165:17]
    io.fwd_rs1 <= fwdUnit.io.fwd_rs1 @[CPU.scala 167:17]
    io.fwd_rs2 <= fwdUnit.io.fwd_rs2 @[CPU.scala 168:17]
    io.rs1 <= ID_EX.io.out.rs.rs1 @[CPU.scala 170:17]
    io.rs2 <= ID_EX.io.out.rs.rs2 @[CPU.scala 171:17]
    node _T_148 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.rs.rs2) @[CPU.scala 172:23]
    io.alu_src <= _T_148 @[CPU.scala 172:17]
    io.op1 <= alu.io.reg.rs.rs1 @[CPU.scala 173:17]
    io.op2 <= alu.io.reg.rs.rs2 @[CPU.scala 174:17]
    io.rd_exMem <= EX_MEM.io.out.aluRes @[CPU.scala 175:17]
    io.rd_memWb <= regs.io.reg.rd @[CPU.scala 176:17]
    io.zero <= EX_MEM.io.out.zero @[CPU.scala 178:18]
    io.alu_res <= alu.io.reg.rd @[CPU.scala 179:18]
    io.alu_sel <= ID_EX.io.out.EX.alu_sel @[CPU.scala 180:18]
    io.rd_sel <= ID_EX.io.out.sel.rd @[CPU.scala 181:18]
    io.sel_rs1 <= ID_EX.io.out.sel.rs.rs1 @[CPU.scala 182:18]
    io.sel_rs2 <= ID_EX.io.out.sel.rs.rs2 @[CPU.scala 183:18]
    io.dst_exMem <= EX_MEM.io.out.dst @[CPU.scala 184:18]
    io.dst_memWb <= MEM_WB.io.out.dst @[CPU.scala 185:18]
    io.regWrite_exMem <= EX_MEM.io.out.WB.regWrite @[CPU.scala 187:23]
    io.regWrite_memWb <= MEM_WB.io.out.WB.regWrite @[CPU.scala 188:23]
    io.memRead <= EX_MEM.io.out.MEM.read @[CPU.scala 190:18]
    io.memWrite <= EX_MEM.io.out.MEM.write @[CPU.scala 191:18]
    io.memRes <= dataMem.io.reg.rd @[CPU.scala 192:18]
    io.wData <= EX_MEM.io.out.op2 @[CPU.scala 193:18]
    
