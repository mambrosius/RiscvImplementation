`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module ProgramCounter(
  input         clock,
  input         reset,
  input         io_branch,
  input  [31:0] io_pc_src,
  output [31:0] io_pc_next,
  output [31:0] io_pc
);
  reg [31:0] pc_reg;
  reg [31:0] _GEN_0;
  wire [32:0] _T_8;
  wire [31:0] _T_9;
  wire [31:0] _T_10;
  assign io_pc_next = _T_9;
  assign io_pc = pc_reg;
  assign _T_8 = pc_reg + 32'h1;
  assign _T_9 = _T_8[31:0];
  assign _T_10 = io_branch ? io_pc_src : io_pc_next;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  pc_reg = _GEN_0[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 32'h15;
    end else begin
      if (io_branch) begin
        pc_reg <= io_pc_src;
      end else begin
        pc_reg <= io_pc_next;
      end
    end
  end
endmodule
module Decoder(
  input  [31:0] io_inst,
  output [6:0]  io_ctrl_opcode,
  output [2:0]  io_ctrl_funct3,
  output [6:0]  io_ctrl_funct7,
  output [4:0]  io_rs_rs1,
  output [4:0]  io_rs_rs2,
  output [4:0]  io_rd,
  output [31:0] io_imm
);
  wire [6:0] _T_17;
  wire [4:0] _T_18;
  wire [2:0] _T_19;
  wire [4:0] _T_20;
  wire [4:0] _T_21;
  wire  _T_22;
  wire [6:0] _T_23;
  wire [6:0] _T_25;
  wire [11:0] _T_28;
  wire [31:0] _T_29;
  wire  _T_30;
  wire [31:0] _GEN_1;
  wire  _T_34;
  wire [31:0] _GEN_2;
  wire  _T_38;
  wire [26:0] _T_42;
  wire [31:0] _T_43;
  wire [31:0] _GEN_3;
  wire  _T_44;
  wire  _T_46;
  wire  _T_47;
  wire [5:0] _T_48;
  wire [3:0] _T_49;
  wire [9:0] _T_50;
  wire [20:0] _T_51;
  wire [21:0] _T_52;
  wire [31:0] _T_53;
  wire [31:0] _GEN_4;
  wire  _T_54;
  wire [19:0] _T_56;
  wire [31:0] _T_57;
  wire [31:0] _GEN_5;
  wire  _T_58;
  wire [31:0] _GEN_6;
  wire  _T_62;
  wire [7:0] _T_65;
  wire  _T_66;
  wire [9:0] _T_67;
  wire [10:0] _T_69;
  wire [11:0] _T_70;
  wire [11:0] _T_71;
  wire [19:0] _T_72;
  wire [31:0] _T_73;
  wire [31:0] _GEN_7;
  assign io_ctrl_opcode = _T_17;
  assign io_ctrl_funct3 = _T_19;
  assign io_ctrl_funct7 = _T_25;
  assign io_rs_rs1 = _T_20;
  assign io_rs_rs2 = _T_21;
  assign io_rd = _T_18;
  assign io_imm = _GEN_7;
  assign _T_17 = io_inst[6:0];
  assign _T_18 = io_inst[11:7];
  assign _T_19 = io_inst[14:12];
  assign _T_20 = io_inst[19:15];
  assign _T_21 = io_inst[24:20];
  assign _T_22 = io_ctrl_opcode == 7'h33;
  assign _T_23 = io_inst[31:25];
  assign _T_25 = _T_22 ? _T_23 : 7'h0;
  assign _T_28 = io_inst[31:20];
  assign _T_29 = {20'h0,_T_28};
  assign _T_30 = 7'h3 == io_ctrl_opcode;
  assign _GEN_1 = _T_30 ? _T_29 : _T_29;
  assign _T_34 = 7'h67 == io_ctrl_opcode;
  assign _GEN_2 = _T_34 ? _T_29 : _GEN_1;
  assign _T_38 = 7'h23 == io_ctrl_opcode;
  assign _T_42 = {20'h0,_T_23};
  assign _T_43 = {_T_42,_T_18};
  assign _GEN_3 = _T_38 ? _T_43 : _GEN_2;
  assign _T_44 = 7'h63 == io_ctrl_opcode;
  assign _T_46 = io_inst[31];
  assign _T_47 = io_inst[7];
  assign _T_48 = io_inst[30:25];
  assign _T_49 = io_inst[11:8];
  assign _T_50 = {_T_48,_T_49};
  assign _T_51 = {20'h0,_T_46};
  assign _T_52 = {_T_51,_T_47};
  assign _T_53 = {_T_52,_T_50};
  assign _GEN_4 = _T_44 ? _T_53 : _GEN_3;
  assign _T_54 = 7'h37 == io_ctrl_opcode;
  assign _T_56 = io_inst[31:12];
  assign _T_57 = {12'h0,_T_56};
  assign _GEN_5 = _T_54 ? _T_57 : _GEN_4;
  assign _T_58 = 7'h17 == io_ctrl_opcode;
  assign _GEN_6 = _T_58 ? _T_57 : _GEN_5;
  assign _T_62 = 7'h6f == io_ctrl_opcode;
  assign _T_65 = io_inst[19:12];
  assign _T_66 = io_inst[20];
  assign _T_67 = io_inst[30:21];
  assign _T_69 = {_T_66,_T_67};
  assign _T_70 = {_T_69,1'h0};
  assign _T_71 = {11'h0,_T_46};
  assign _T_72 = {_T_71,_T_65};
  assign _T_73 = {_T_72,_T_70};
  assign _GEN_7 = _T_62 ? _T_73 : _GEN_6;
endmodule
module Control(
  input  [6:0] io_ctrl_opcode,
  input  [2:0] io_ctrl_funct3,
  input  [6:0] io_ctrl_funct7,
  output       io_WB_reg_w,
  output       io_WB_rd_mem,
  output       io_MEM_branch,
  output       io_MEM_write,
  output       io_MEM_read,
  output [2:0] io_MEM_func,
  output [6:0] io_EX_opcode,
  output       io_EX_alu_sel,
  output       io_EX_dst_sel,
  output [2:0] io_EX_alu_op_func,
  output       io_EX_alu_op_alt
);
  wire  _T_30;
  wire  _T_31;
  wire  _T_32;
  wire  _T_33;
  wire  _T_34;
  wire  _T_35;
  wire  _T_36;
  wire  _T_37;
  wire  _T_38;
  wire  _T_39;
  wire  _T_41;
  assign io_WB_reg_w = _T_41;
  assign io_WB_rd_mem = io_MEM_read;
  assign io_MEM_branch = _T_36;
  assign io_MEM_write = _T_35;
  assign io_MEM_read = _T_34;
  assign io_MEM_func = io_ctrl_funct3;
  assign io_EX_opcode = io_ctrl_opcode;
  assign io_EX_alu_sel = _T_30;
  assign io_EX_dst_sel = _T_31;
  assign io_EX_alu_op_func = io_ctrl_funct3;
  assign io_EX_alu_op_alt = _T_33;
  assign _T_30 = io_ctrl_opcode != 7'h33;
  assign _T_31 = io_ctrl_opcode != 7'h3;
  assign _T_32 = io_ctrl_funct7[5];
  assign _T_33 = io_EX_alu_sel ? 1'h0 : _T_32;
  assign _T_34 = io_ctrl_opcode == 7'h3;
  assign _T_35 = io_ctrl_opcode == 7'h23;
  assign _T_36 = io_ctrl_opcode == 7'h63;
  assign _T_37 = io_ctrl_opcode == 7'h33;
  assign _T_38 = io_ctrl_opcode == 7'h13;
  assign _T_39 = _T_37 | _T_38;
  assign _T_41 = _T_39 | _T_34;
endmodule
module Registers(
  input         clock,
  input  [4:0]  io_rs_rs1,
  input  [4:0]  io_rs_rs2,
  input         io_reg_w,
  input  [4:0]  io_rd,
  input  [31:0] io_res,
  output [31:0] io_op_op1,
  output [31:0] io_op_op2
);
  reg [31:0] x [0:31];
  reg [31:0] _GEN_0;
  wire [31:0] x__T_23_data;
  wire [4:0] x__T_23_addr;
  wire [31:0] x__T_25_data;
  wire [4:0] x__T_25_addr;
  wire [31:0] x__T_15_data;
  wire [4:0] x__T_15_addr;
  wire  x__T_15_mask;
  wire  x__T_15_en;
  wire [31:0] x__T_16_data;
  wire [4:0] x__T_16_addr;
  wire  x__T_16_mask;
  wire  x__T_16_en;
  wire  _T_17;
  wire  _T_18;
  wire  _T_19;
  wire  fwd_rs1;
  wire  _T_22;
  wire  fwd_rs2;
  wire [31:0] _T_24;
  wire [31:0] _T_26;
  assign io_op_op1 = _T_24;
  assign io_op_op2 = _T_26;
  assign x__T_23_addr = io_rs_rs1;
  assign x__T_23_data = x[x__T_23_addr];
  assign x__T_25_addr = io_rs_rs2;
  assign x__T_25_data = x[x__T_25_addr];
  assign x__T_15_data = 32'h0;
  assign x__T_15_addr = 5'h0;
  assign x__T_15_mask = 1'h1;
  assign x__T_15_en = 1'h1;
  assign x__T_16_data = io_res;
  assign x__T_16_addr = io_rd;
  assign x__T_16_mask = io_reg_w;
  assign x__T_16_en = io_reg_w;
  assign _T_17 = io_res != 32'h0;
  assign _T_18 = io_reg_w & _T_17;
  assign _T_19 = io_rd == io_rs_rs1;
  assign fwd_rs1 = _T_18 & _T_19;
  assign _T_22 = io_rd == io_rs_rs2;
  assign fwd_rs2 = _T_18 & _T_22;
  assign _T_24 = fwd_rs1 ? io_res : x__T_23_data;
  assign _T_26 = fwd_rs2 ? io_res : x__T_25_data;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    x[initvar] = _GEN_0[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(x__T_15_en & x__T_15_mask) begin
      x[x__T_15_addr] <= x__T_15_data;
    end
    if(x__T_16_en & x__T_16_mask) begin
      x[x__T_16_addr] <= x__T_16_data;
    end
  end
endmodule
module ALU(
  input  [6:0]  io_opcode,
  input  [2:0]  io_alu_op_func,
  input         io_alu_op_alt,
  input  [31:0] io_op_op1,
  input  [31:0] io_op_op2,
  output [31:0] io_res
);
  wire [4:0] shamt;
  wire [32:0] _T_10;
  wire [32:0] _T_11;
  wire [31:0] _T_12;
  wire [32:0] _T_13;
  wire [31:0] _T_14;
  wire [31:0] _T_15;
  wire [62:0] _GEN_0;
  wire [62:0] _T_16;
  wire  _T_17;
  wire [31:0] _T_18;
  wire [31:0] _T_19;
  wire [31:0] _T_20;
  wire [31:0] _T_21;
  wire  _T_22;
  wire [31:0] _T_23;
  wire  _T_24;
  wire [31:0] _T_25;
  wire  _T_26;
  wire [31:0] _T_27;
  wire  _T_28;
  wire [31:0] _T_29;
  wire  _T_30;
  wire [62:0] _T_31;
  wire  _T_32;
  wire [62:0] _T_33;
  wire [62:0] _T_53;
  wire  _T_61;
  wire [31:0] _T_62;
  wire  _T_63;
  wire [31:0] _T_64;
  wire  _T_65;
  wire [31:0] _T_66;
  wire  _T_67;
  wire [62:0] _T_68;
  wire  _T_69;
  wire [62:0] _T_70;
  reg  _GEN_1;
  reg [31:0] _GEN_2;
  assign io_res = _T_70[31:0];
  assign shamt = io_op_op2[4:0];
  assign _T_10 = io_op_op1 - io_op_op2;
  assign _T_11 = $unsigned(_T_10);
  assign _T_12 = _T_11[31:0];
  assign _T_13 = io_op_op1 + io_op_op2;
  assign _T_14 = _T_13[31:0];
  assign _T_15 = io_alu_op_alt ? _T_12 : _T_14;
  assign _GEN_0 = {{31'd0}, io_op_op1};
  assign _T_16 = _GEN_0 << shamt;
  assign _T_17 = io_op_op1 < io_op_op2;
  assign _T_18 = io_op_op1 ^ io_op_op2;
  assign _T_19 = io_op_op1 >> shamt;
  assign _T_20 = io_alu_op_alt ? 32'h0 : _T_19;
  assign _T_21 = io_op_op1 | io_op_op2;
  assign _T_22 = 3'h6 == io_alu_op_func;
  assign _T_23 = _T_22 ? _T_21 : 32'h0;
  assign _T_24 = 3'h5 == io_alu_op_func;
  assign _T_25 = _T_24 ? _T_20 : _T_23;
  assign _T_26 = 3'h4 == io_alu_op_func;
  assign _T_27 = _T_26 ? _T_18 : _T_25;
  assign _T_28 = 3'h3 == io_alu_op_func;
  assign _T_29 = _T_28 ? {{31'd0}, _T_17} : _T_27;
  assign _T_30 = 3'h1 == io_alu_op_func;
  assign _T_31 = _T_30 ? _T_16 : {{31'd0}, _T_29};
  assign _T_32 = 3'h0 == io_alu_op_func;
  assign _T_33 = _T_32 ? {{31'd0}, _T_15} : _T_31;
  assign _T_53 = _T_32 ? {{31'd0}, _T_14} : _T_31;
  assign _T_61 = 7'h63 == io_opcode;
  assign _T_62 = _T_61 ? _T_12 : 32'h0;
  assign _T_63 = 7'h23 == io_opcode;
  assign _T_64 = _T_63 ? _T_14 : _T_62;
  assign _T_65 = 7'h3 == io_opcode;
  assign _T_66 = _T_65 ? _T_14 : _T_64;
  assign _T_67 = 7'h13 == io_opcode;
  assign _T_68 = _T_67 ? _T_53 : {{31'd0}, _T_66};
  assign _T_69 = 7'h33 == io_opcode;
  assign _T_70 = _T_69 ? _T_33 : _T_68;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _GEN_1 = _GEN_2[0:0];
  `endif
  end
`endif
endmodule
module DataMemory(
  input         clock,
  input         io_mem_write,
  input         io_mem_read,
  input  [2:0]  io_mem_func,
  input  [31:0] io_op_op1,
  input  [31:0] io_op_op2,
  output [31:0] io_res
);
  reg [7:0] data_mem [0:511];
  reg [31:0] _GEN_0;
  wire [7:0] data_mem__T_49_data;
  wire [8:0] data_mem__T_49_addr;
  wire [7:0] data_mem__T_55_data;
  wire [8:0] data_mem__T_55_addr;
  wire [7:0] data_mem__T_57_data;
  wire [8:0] data_mem__T_57_addr;
  wire [7:0] data_mem__T_64_data;
  wire [8:0] data_mem__T_64_addr;
  wire [7:0] data_mem__T_69_data;
  wire [8:0] data_mem__T_69_addr;
  wire [7:0] data_mem__T_74_data;
  wire [8:0] data_mem__T_74_addr;
  wire [7:0] data_mem__T_76_data;
  wire [8:0] data_mem__T_76_addr;
  wire [7:0] data_mem__T_13_data;
  wire [8:0] data_mem__T_13_addr;
  wire  data_mem__T_13_mask;
  wire  data_mem__T_13_en;
  wire [7:0] data_mem__T_17_data;
  wire [8:0] data_mem__T_17_addr;
  wire  data_mem__T_17_mask;
  wire  data_mem__T_17_en;
  wire [7:0] data_mem__T_23_data;
  wire [8:0] data_mem__T_23_addr;
  wire  data_mem__T_23_mask;
  wire  data_mem__T_23_en;
  wire [7:0] data_mem__T_27_data;
  wire [8:0] data_mem__T_27_addr;
  wire  data_mem__T_27_mask;
  wire  data_mem__T_27_en;
  wire [7:0] data_mem__T_33_data;
  wire [8:0] data_mem__T_33_addr;
  wire  data_mem__T_33_mask;
  wire  data_mem__T_33_en;
  wire [7:0] data_mem__T_39_data;
  wire [8:0] data_mem__T_39_addr;
  wire  data_mem__T_39_mask;
  wire  data_mem__T_39_en;
  wire [7:0] data_mem__T_45_data;
  wire [8:0] data_mem__T_45_addr;
  wire  data_mem__T_45_mask;
  wire  data_mem__T_45_en;
  wire  _T_11;
  wire [8:0] _T_12;
  wire [7:0] _T_14;
  wire  _T_15;
  wire [8:0] _T_16;
  wire [7:0] _T_18;
  wire [32:0] _T_20;
  wire [31:0] _T_21;
  wire [8:0] _T_22;
  wire [7:0] _T_24;
  wire  _T_25;
  wire [8:0] _T_26;
  wire [7:0] _T_28;
  wire [8:0] _T_32;
  wire [7:0] _T_34;
  wire [32:0] _T_36;
  wire [31:0] _T_37;
  wire [8:0] _T_38;
  wire [7:0] _T_40;
  wire [32:0] _T_42;
  wire [31:0] _T_43;
  wire [8:0] _T_44;
  wire [7:0] _T_46;
  wire  _GEN_22;
  wire  _GEN_26;
  wire  _GEN_32;
  wire [8:0] _T_48;
  wire [7:0] _GEN_43;
  wire [8:0] _T_54;
  wire [8:0] _T_56;
  wire [15:0] _T_58;
  wire [15:0] _GEN_48;
  wire [8:0] _T_63;
  wire [8:0] _T_68;
  wire [8:0] _T_73;
  wire [8:0] _T_75;
  wire [15:0] _T_77;
  wire [15:0] _T_78;
  wire [31:0] _T_79;
  wire [31:0] _GEN_55;
  wire  _GEN_58;
  wire  _GEN_62;
  wire  _GEN_66;
  wire  _T_81;
  wire [31:0] _GEN_70;
  assign io_res = _GEN_70;
  assign data_mem__T_49_addr = _T_48;
  assign data_mem__T_49_data = data_mem[data_mem__T_49_addr];
  assign data_mem__T_55_addr = _T_54;
  assign data_mem__T_55_data = data_mem[data_mem__T_55_addr];
  assign data_mem__T_57_addr = _T_56;
  assign data_mem__T_57_data = data_mem[data_mem__T_57_addr];
  assign data_mem__T_64_addr = _T_63;
  assign data_mem__T_64_data = data_mem[data_mem__T_64_addr];
  assign data_mem__T_69_addr = _T_68;
  assign data_mem__T_69_data = data_mem[data_mem__T_69_addr];
  assign data_mem__T_74_addr = _T_73;
  assign data_mem__T_74_data = data_mem[data_mem__T_74_addr];
  assign data_mem__T_76_addr = _T_75;
  assign data_mem__T_76_data = data_mem[data_mem__T_76_addr];
  assign data_mem__T_13_data = _T_14;
  assign data_mem__T_13_addr = _T_12;
  assign data_mem__T_13_mask = _GEN_22;
  assign data_mem__T_13_en = _GEN_22;
  assign data_mem__T_17_data = _T_18;
  assign data_mem__T_17_addr = _T_16;
  assign data_mem__T_17_mask = _GEN_26;
  assign data_mem__T_17_en = _GEN_26;
  assign data_mem__T_23_data = _T_24;
  assign data_mem__T_23_addr = _T_22;
  assign data_mem__T_23_mask = _GEN_26;
  assign data_mem__T_23_en = _GEN_26;
  assign data_mem__T_27_data = _T_28;
  assign data_mem__T_27_addr = _T_26;
  assign data_mem__T_27_mask = _GEN_32;
  assign data_mem__T_27_en = _GEN_32;
  assign data_mem__T_33_data = _T_34;
  assign data_mem__T_33_addr = _T_32;
  assign data_mem__T_33_mask = _GEN_32;
  assign data_mem__T_33_en = _GEN_32;
  assign data_mem__T_39_data = _T_40;
  assign data_mem__T_39_addr = _T_38;
  assign data_mem__T_39_mask = _GEN_32;
  assign data_mem__T_39_en = _GEN_32;
  assign data_mem__T_45_data = _T_46;
  assign data_mem__T_45_addr = _T_44;
  assign data_mem__T_45_mask = _GEN_32;
  assign data_mem__T_45_en = _GEN_32;
  assign _T_11 = 3'h0 == io_mem_func;
  assign _T_12 = io_op_op1[8:0];
  assign _T_14 = io_op_op2[7:0];
  assign _T_15 = 3'h1 == io_mem_func;
  assign _T_16 = io_op_op1[8:0];
  assign _T_18 = io_op_op2[7:0];
  assign _T_20 = io_op_op1 + 32'h1;
  assign _T_21 = _T_20[31:0];
  assign _T_22 = _T_21[8:0];
  assign _T_24 = io_op_op2[15:8];
  assign _T_25 = 3'h2 == io_mem_func;
  assign _T_26 = io_op_op1[8:0];
  assign _T_28 = io_op_op2[7:0];
  assign _T_32 = _T_21[8:0];
  assign _T_34 = io_op_op2[15:8];
  assign _T_36 = io_op_op1 + 32'h2;
  assign _T_37 = _T_36[31:0];
  assign _T_38 = _T_37[8:0];
  assign _T_40 = io_op_op2[23:16];
  assign _T_42 = io_op_op1 + 32'h3;
  assign _T_43 = _T_42[31:0];
  assign _T_44 = _T_43[8:0];
  assign _T_46 = io_op_op2[31:24];
  assign _GEN_22 = io_mem_write ? _T_11 : 1'h0;
  assign _GEN_26 = io_mem_write ? _T_15 : 1'h0;
  assign _GEN_32 = io_mem_write ? _T_25 : 1'h0;
  assign _T_48 = io_op_op1[8:0];
  assign _GEN_43 = data_mem__T_49_data;
  assign _T_54 = _T_21[8:0];
  assign _T_56 = io_op_op1[8:0];
  assign _T_58 = {data_mem__T_55_data,data_mem__T_57_data};
  assign _GEN_48 = _T_15 ? _T_58 : {{8'd0}, _GEN_43};
  assign _T_63 = _T_43[8:0];
  assign _T_68 = _T_37[8:0];
  assign _T_73 = _T_21[8:0];
  assign _T_75 = io_op_op1[8:0];
  assign _T_77 = {data_mem__T_74_data,data_mem__T_76_data};
  assign _T_78 = {data_mem__T_64_data,data_mem__T_69_data};
  assign _T_79 = {_T_78,_T_77};
  assign _GEN_55 = _T_25 ? _T_79 : {{16'd0}, _GEN_48};
  assign _GEN_58 = io_mem_read ? _T_11 : 1'h0;
  assign _GEN_62 = io_mem_read ? _T_15 : 1'h0;
  assign _GEN_66 = io_mem_read ? _T_25 : 1'h0;
  assign _T_81 = io_mem_read == 1'h0;
  assign _GEN_70 = _T_81 ? 32'h0 : _GEN_55;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_mem[initvar] = _GEN_0[7:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(data_mem__T_13_en & data_mem__T_13_mask) begin
      data_mem[data_mem__T_13_addr] <= data_mem__T_13_data;
    end
    if(data_mem__T_17_en & data_mem__T_17_mask) begin
      data_mem[data_mem__T_17_addr] <= data_mem__T_17_data;
    end
    if(data_mem__T_23_en & data_mem__T_23_mask) begin
      data_mem[data_mem__T_23_addr] <= data_mem__T_23_data;
    end
    if(data_mem__T_27_en & data_mem__T_27_mask) begin
      data_mem[data_mem__T_27_addr] <= data_mem__T_27_data;
    end
    if(data_mem__T_33_en & data_mem__T_33_mask) begin
      data_mem[data_mem__T_33_addr] <= data_mem__T_33_data;
    end
    if(data_mem__T_39_en & data_mem__T_39_mask) begin
      data_mem[data_mem__T_39_addr] <= data_mem__T_39_data;
    end
    if(data_mem__T_45_en & data_mem__T_45_mask) begin
      data_mem[data_mem__T_45_addr] <= data_mem__T_45_data;
    end
  end
endmodule
module ForwardingUnit(
  input        io_reg_w_mem,
  input        io_reg_w_wb,
  input  [4:0] io_rs_rs1,
  input  [4:0] io_rs_rs2,
  input  [4:0] io_rd_mem,
  input  [4:0] io_rd_wb,
  output [1:0] io_fwd_rs1,
  output [1:0] io_fwd_rs2
);
  wire  _T_10;
  wire  _T_11;
  wire  _T_12;
  wire  _T_13;
  wire  _T_14;
  wire  _T_15;
  wire  _T_16;
  wire  _T_17;
  wire  _T_19;
  wire  _T_20;
  wire [1:0] _GEN_1;
  wire  _T_24;
  wire  _T_25;
  wire [1:0] _GEN_2;
  wire  _T_28;
  wire  _T_29;
  wire  _T_32;
  wire  _T_33;
  wire  _T_35;
  wire  _T_36;
  wire [1:0] _GEN_4;
  wire  _T_40;
  wire  _T_41;
  wire [1:0] _GEN_5;
  assign io_fwd_rs1 = _GEN_2;
  assign io_fwd_rs2 = _GEN_5;
  assign _T_10 = io_rd_mem != 5'h0;
  assign _T_11 = io_reg_w_mem & _T_10;
  assign _T_12 = io_rd_mem == io_rs_rs1;
  assign _T_13 = _T_11 & _T_12;
  assign _T_14 = io_rd_wb != 5'h0;
  assign _T_15 = io_reg_w_wb & _T_14;
  assign _T_16 = io_rd_wb == io_rs_rs1;
  assign _T_17 = _T_15 & _T_16;
  assign _T_19 = _T_13 == 1'h0;
  assign _T_20 = _T_19 & _T_17;
  assign _GEN_1 = _T_20 ? 2'h1 : 2'h2;
  assign _T_24 = _T_17 == 1'h0;
  assign _T_25 = _T_19 & _T_24;
  assign _GEN_2 = _T_25 ? 2'h0 : _GEN_1;
  assign _T_28 = io_rd_mem == io_rs_rs2;
  assign _T_29 = _T_11 & _T_28;
  assign _T_32 = io_rd_wb == io_rs_rs2;
  assign _T_33 = _T_15 & _T_32;
  assign _T_35 = _T_29 == 1'h0;
  assign _T_36 = _T_35 & _T_33;
  assign _GEN_4 = _T_36 ? 2'h1 : 2'h2;
  assign _T_40 = _T_33 == 1'h0;
  assign _T_41 = _T_35 & _T_40;
  assign _GEN_5 = _T_41 ? 2'h0 : _GEN_4;
endmodule
module Tx(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  output       io_txd
);
  reg [8:0] data;
  reg [31:0] _GEN_13;
  reg [31:0] ticks;
  reg [31:0] _GEN_14;
  reg [3:0] state;
  reg [31:0] _GEN_15;
  wire  _T_15;
  wire  _T_16;
  wire [8:0] _T_18;
  wire [8:0] _GEN_0;
  wire [31:0] _GEN_1;
  wire [3:0] _GEN_2;
  wire [8:0] _GEN_3;
  wire [31:0] _GEN_4;
  wire [3:0] _GEN_5;
  wire  _T_19;
  wire  _T_20;
  wire  _T_21;
  wire  _T_22;
  wire  _T_23;
  wire  _T_24;
  wire  _T_25;
  wire  _T_26;
  wire  _T_27;
  wire  _T_28;
  wire  _T_29;
  wire  _T_30;
  wire  _T_31;
  wire  _T_32;
  wire  _T_33;
  wire  _T_34;
  wire  _T_35;
  wire  _T_36;
  wire  _T_37;
  wire  _T_38;
  wire  _T_39;
  wire  _T_40;
  wire [7:0] _T_42;
  wire [8:0] _T_43;
  wire [4:0] _T_45;
  wire [4:0] _T_46;
  wire [3:0] _T_47;
  wire [8:0] _GEN_6;
  wire [31:0] _GEN_7;
  wire [3:0] _GEN_8;
  wire  _T_49;
  wire [32:0] _T_51;
  wire [31:0] _T_52;
  wire [31:0] _GEN_9;
  wire [8:0] _GEN_10;
  wire [31:0] _GEN_11;
  wire [3:0] _GEN_12;
  wire  _T_53;
  assign io_enq_ready = _T_15;
  assign io_txd = _T_53;
  assign _T_15 = state == 4'h0;
  assign _T_16 = 4'h0 == state;
  assign _T_18 = {io_enq_bits,1'h0};
  assign _GEN_0 = io_enq_valid ? _T_18 : data;
  assign _GEN_1 = io_enq_valid ? 32'h0 : ticks;
  assign _GEN_2 = io_enq_valid ? 4'hb : state;
  assign _GEN_3 = _T_16 ? _GEN_0 : data;
  assign _GEN_4 = _T_16 ? _GEN_1 : ticks;
  assign _GEN_5 = _T_16 ? _GEN_2 : state;
  assign _T_19 = 4'h1 == state;
  assign _T_20 = 4'h2 == state;
  assign _T_21 = 4'h3 == state;
  assign _T_22 = 4'h4 == state;
  assign _T_23 = 4'h5 == state;
  assign _T_24 = 4'h6 == state;
  assign _T_25 = 4'h7 == state;
  assign _T_26 = 4'h8 == state;
  assign _T_27 = 4'h9 == state;
  assign _T_28 = 4'ha == state;
  assign _T_29 = 4'hb == state;
  assign _T_30 = _T_19 | _T_20;
  assign _T_31 = _T_30 | _T_21;
  assign _T_32 = _T_31 | _T_22;
  assign _T_33 = _T_32 | _T_23;
  assign _T_34 = _T_33 | _T_24;
  assign _T_35 = _T_34 | _T_25;
  assign _T_36 = _T_35 | _T_26;
  assign _T_37 = _T_36 | _T_27;
  assign _T_38 = _T_37 | _T_28;
  assign _T_39 = _T_38 | _T_29;
  assign _T_40 = ticks == 32'h1b2;
  assign _T_42 = data[8:1];
  assign _T_43 = {1'h1,_T_42};
  assign _T_45 = state - 4'h1;
  assign _T_46 = $unsigned(_T_45);
  assign _T_47 = _T_46[3:0];
  assign _GEN_6 = _T_40 ? _T_43 : _GEN_3;
  assign _GEN_7 = _T_40 ? 32'h0 : _GEN_4;
  assign _GEN_8 = _T_40 ? _T_47 : _GEN_5;
  assign _T_49 = _T_40 == 1'h0;
  assign _T_51 = ticks + 32'h1;
  assign _T_52 = _T_51[31:0];
  assign _GEN_9 = _T_49 ? _T_52 : _GEN_7;
  assign _GEN_10 = _T_39 ? _GEN_6 : _GEN_3;
  assign _GEN_11 = _T_39 ? _GEN_9 : _GEN_4;
  assign _GEN_12 = _T_39 ? _GEN_8 : _GEN_5;
  assign _T_53 = data[0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  data = _GEN_13[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  ticks = _GEN_14[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  state = _GEN_15[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      data <= 9'h1ff;
    end else begin
      if (_T_39) begin
        if (_T_40) begin
          data <= _T_43;
        end else begin
          if (_T_16) begin
            if (io_enq_valid) begin
              data <= _T_18;
            end
          end
        end
      end else begin
        if (_T_16) begin
          if (io_enq_valid) begin
            data <= _T_18;
          end
        end
      end
    end
    if (reset) begin
      ticks <= 32'h0;
    end else begin
      if (_T_39) begin
        if (_T_49) begin
          ticks <= _T_52;
        end else begin
          if (_T_40) begin
            ticks <= 32'h0;
          end else begin
            if (_T_16) begin
              if (io_enq_valid) begin
                ticks <= 32'h0;
              end
            end
          end
        end
      end else begin
        if (_T_16) begin
          if (io_enq_valid) begin
            ticks <= 32'h0;
          end
        end
      end
    end
    if (reset) begin
      state <= 4'h0;
    end else begin
      if (_T_39) begin
        if (_T_40) begin
          state <= _T_47;
        end else begin
          if (_T_16) begin
            if (io_enq_valid) begin
              state <= 4'hb;
            end
          end
        end
      end else begin
        if (_T_16) begin
          if (io_enq_valid) begin
            state <= 4'hb;
          end
        end
      end
    end
  end
endmodule
module UART(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  output       io_valid,
  output       io_txd,
  output [7:0] io_r0,
  output [7:0] io_r1,
  output [7:0] io_r2,
  output [7:0] io_r3
);
  wire  tx_clock;
  wire  tx_reset;
  wire  tx_io_enq_ready;
  wire  tx_io_enq_valid;
  wire [7:0] tx_io_enq_bits;
  wire  tx_io_txd;
  wire [7:0] _T_15_0;
  wire [7:0] _T_15_1;
  wire [7:0] _T_15_2;
  wire [7:0] _T_15_3;
  reg [7:0] q_0;
  reg [31:0] _GEN_14;
  reg [7:0] q_1;
  reg [31:0] _GEN_17;
  reg [7:0] q_2;
  reg [31:0] _GEN_20;
  reg [7:0] q_3;
  reg [31:0] _GEN_21;
  reg [1:0] ptr;
  reg [31:0] _GEN_22;
  reg [1:0] cnt;
  reg [31:0] _GEN_23;
  wire [2:0] _T_53;
  wire [1:0] _T_54;
  reg [3:0] i;
  reg [31:0] _GEN_24;
  wire  _T_74;
  wire [2:0] _GEN_19;
  wire  _T_76;
  wire  _T_77;
  wire [1:0] _T_81;
  wire [7:0] _GEN_0;
  wire [7:0] _GEN_2;
  wire [7:0] _GEN_3;
  wire [7:0] _GEN_4;
  wire [7:0] _GEN_5;
  wire [2:0] _T_83;
  wire [1:0] _T_84;
  wire [7:0] _GEN_6;
  wire [7:0] _GEN_7;
  wire [7:0] _GEN_8;
  wire [7:0] _GEN_9;
  wire [1:0] _GEN_10;
  wire  _T_86;
  wire  _T_87;
  wire [7:0] _GEN_1;
  wire [7:0] _GEN_11;
  wire [7:0] _GEN_12;
  wire [7:0] _GEN_13;
  wire [2:0] _T_92;
  wire [2:0] _T_93;
  wire [1:0] _T_94;
  wire [2:0] _T_96;
  wire [1:0] _T_97;
  wire [1:0] _GEN_15;
  wire [1:0] _GEN_16;
  wire  _T_104;
  wire  _T_105;
  wire  _T_107;
  wire  _GEN_18;
  Tx tx (
    .clock(tx_clock),
    .reset(tx_reset),
    .io_enq_ready(tx_io_enq_ready),
    .io_enq_valid(tx_io_enq_valid),
    .io_enq_bits(tx_io_enq_bits),
    .io_txd(tx_io_txd)
  );
  assign io_valid = _GEN_18;
  assign io_txd = tx_io_txd;
  assign io_r0 = q_0;
  assign io_r1 = q_1;
  assign io_r2 = q_2;
  assign io_r3 = q_3;
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_enq_valid = _T_86;
  assign tx_io_enq_bits = _GEN_1;
  assign _T_15_0 = 8'h0;
  assign _T_15_1 = 8'h0;
  assign _T_15_2 = 8'h0;
  assign _T_15_3 = 8'h0;
  assign _T_53 = ptr + cnt;
  assign _T_54 = _T_53[1:0];
  assign _T_74 = io_in != 8'h0;
  assign _GEN_19 = {{1'd0}, cnt};
  assign _T_76 = _GEN_19 != 3'h4;
  assign _T_77 = _T_74 & _T_76;
  assign _T_81 = i[1:0];
  assign _GEN_0 = io_in;
  assign _GEN_2 = 2'h0 == _T_81 ? _GEN_0 : q_0;
  assign _GEN_3 = 2'h1 == _T_81 ? _GEN_0 : q_1;
  assign _GEN_4 = 2'h2 == _T_81 ? _GEN_0 : q_2;
  assign _GEN_5 = 2'h3 == _T_81 ? _GEN_0 : q_3;
  assign _T_83 = cnt + 2'h1;
  assign _T_84 = _T_83[1:0];
  assign _GEN_6 = _T_77 ? _GEN_2 : q_0;
  assign _GEN_7 = _T_77 ? _GEN_3 : q_1;
  assign _GEN_8 = _T_77 ? _GEN_4 : q_2;
  assign _GEN_9 = _T_77 ? _GEN_5 : q_3;
  assign _GEN_10 = _T_77 ? _T_84 : cnt;
  assign _T_86 = cnt != 2'h0;
  assign _T_87 = tx_io_enq_ready & _T_86;
  assign _GEN_1 = _GEN_13;
  assign _GEN_11 = 2'h1 == ptr ? q_1 : q_0;
  assign _GEN_12 = 2'h2 == ptr ? q_2 : _GEN_11;
  assign _GEN_13 = 2'h3 == ptr ? q_3 : _GEN_12;
  assign _T_92 = cnt - 2'h1;
  assign _T_93 = $unsigned(_T_92);
  assign _T_94 = _T_93[1:0];
  assign _T_96 = ptr + 2'h1;
  assign _T_97 = _T_96[1:0];
  assign _GEN_15 = _T_87 ? _T_94 : _GEN_10;
  assign _GEN_16 = _T_87 ? _T_97 : ptr;
  assign _T_104 = _T_74 | _T_86;
  assign _T_105 = _T_104 & tx_io_enq_ready;
  assign _T_107 = _T_105 == 1'h0;
  assign _GEN_18 = _T_107 ? tx_io_enq_ready : 1'h0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  q_0 = _GEN_14[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_17 = {1{$random}};
  q_1 = _GEN_17[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_20 = {1{$random}};
  q_2 = _GEN_20[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_21 = {1{$random}};
  q_3 = _GEN_21[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_22 = {1{$random}};
  ptr = _GEN_22[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_23 = {1{$random}};
  cnt = _GEN_23[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_24 = {1{$random}};
  i = _GEN_24[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      q_0 <= _T_15_0;
    end else begin
      if (_T_77) begin
        if (2'h0 == _T_81) begin
          q_0 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      q_1 <= _T_15_1;
    end else begin
      if (_T_77) begin
        if (2'h1 == _T_81) begin
          q_1 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      q_2 <= _T_15_2;
    end else begin
      if (_T_77) begin
        if (2'h2 == _T_81) begin
          q_2 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      q_3 <= _T_15_3;
    end else begin
      if (_T_77) begin
        if (2'h3 == _T_81) begin
          q_3 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      ptr <= 2'h0;
    end else begin
      if (_T_87) begin
        ptr <= _T_97;
      end
    end
    if (reset) begin
      cnt <= 2'h0;
    end else begin
      if (_T_87) begin
        cnt <= _T_94;
      end else begin
        if (_T_77) begin
          cnt <= _T_84;
        end
      end
    end
    if (reset) begin
      i <= {{2'd0}, _T_54};
    end else begin
      i <= {{2'd0}, _T_54};
    end
  end
endmodule
module PipelineIF_ID(
  input         clock,
  input  [31:0] io_in_pc_next,
  input  [31:0] io_in_inst,
  output [31:0] io_out_pc_next,
  output [31:0] io_out_inst
);
  reg [31:0] _T_12_pc_next;
  reg [31:0] _GEN_0;
  reg [31:0] _T_12_inst;
  reg [31:0] _GEN_1;
  assign io_out_pc_next = _T_12_pc_next;
  assign io_out_inst = _T_12_inst;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_12_pc_next = _GEN_0[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_12_inst = _GEN_1[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_12_pc_next <= io_in_pc_next;
    _T_12_inst <= io_in_inst;
  end
endmodule
module PipelineID_EX(
  input         clock,
  input         io_in_WB_reg_w,
  input         io_in_WB_rd_mem,
  input         io_in_MEM_write,
  input         io_in_MEM_read,
  input  [2:0]  io_in_MEM_func,
  input  [6:0]  io_in_EX_opcode,
  input         io_in_EX_alu_sel,
  input         io_in_EX_dst_sel,
  input  [2:0]  io_in_EX_alu_op_func,
  input         io_in_EX_alu_op_alt,
  input  [31:0] io_in_op_op1,
  input  [31:0] io_in_op_op2,
  input  [4:0]  io_in_rs_rs1,
  input  [4:0]  io_in_rs_rs2,
  input  [4:0]  io_in_rd,
  input  [31:0] io_in_imm,
  input  [31:0] io_in_pc_next,
  output        io_out_WB_reg_w,
  output        io_out_WB_rd_mem,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output [2:0]  io_out_MEM_func,
  output [6:0]  io_out_EX_opcode,
  output        io_out_EX_alu_sel,
  output        io_out_EX_dst_sel,
  output [2:0]  io_out_EX_alu_op_func,
  output        io_out_EX_alu_op_alt,
  output [31:0] io_out_op_op1,
  output [31:0] io_out_op_op2,
  output [4:0]  io_out_rs_rs1,
  output [4:0]  io_out_rs_rs2,
  output [4:0]  io_out_rd,
  output [31:0] io_out_imm,
  output [31:0] io_out_pc_next
);
  reg  _T_76_WB_reg_w;
  reg [31:0] _GEN_0;
  reg  _T_76_WB_rd_mem;
  reg [31:0] _GEN_1;
  reg  _T_76_MEM_write;
  reg [31:0] _GEN_2;
  reg  _T_76_MEM_read;
  reg [31:0] _GEN_3;
  reg [2:0] _T_76_MEM_func;
  reg [31:0] _GEN_4;
  reg [6:0] _T_76_EX_opcode;
  reg [31:0] _GEN_5;
  reg  _T_76_EX_alu_sel;
  reg [31:0] _GEN_6;
  reg  _T_76_EX_dst_sel;
  reg [31:0] _GEN_7;
  reg [2:0] _T_76_EX_alu_op_func;
  reg [31:0] _GEN_8;
  reg  _T_76_EX_alu_op_alt;
  reg [31:0] _GEN_9;
  reg [31:0] _T_76_op_op1;
  reg [31:0] _GEN_10;
  reg [31:0] _T_76_op_op2;
  reg [31:0] _GEN_11;
  reg [4:0] _T_76_rs_rs1;
  reg [31:0] _GEN_12;
  reg [4:0] _T_76_rs_rs2;
  reg [31:0] _GEN_13;
  reg [4:0] _T_76_rd;
  reg [31:0] _GEN_14;
  reg [31:0] _T_76_imm;
  reg [31:0] _GEN_15;
  reg [31:0] _T_76_pc_next;
  reg [31:0] _GEN_16;
  assign io_out_WB_reg_w = _T_76_WB_reg_w;
  assign io_out_WB_rd_mem = _T_76_WB_rd_mem;
  assign io_out_MEM_write = _T_76_MEM_write;
  assign io_out_MEM_read = _T_76_MEM_read;
  assign io_out_MEM_func = _T_76_MEM_func;
  assign io_out_EX_opcode = _T_76_EX_opcode;
  assign io_out_EX_alu_sel = _T_76_EX_alu_sel;
  assign io_out_EX_dst_sel = _T_76_EX_dst_sel;
  assign io_out_EX_alu_op_func = _T_76_EX_alu_op_func;
  assign io_out_EX_alu_op_alt = _T_76_EX_alu_op_alt;
  assign io_out_op_op1 = _T_76_op_op1;
  assign io_out_op_op2 = _T_76_op_op2;
  assign io_out_rs_rs1 = _T_76_rs_rs1;
  assign io_out_rs_rs2 = _T_76_rs_rs2;
  assign io_out_rd = _T_76_rd;
  assign io_out_imm = _T_76_imm;
  assign io_out_pc_next = _T_76_pc_next;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_76_WB_reg_w = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_76_WB_rd_mem = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_76_MEM_write = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_76_MEM_read = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_76_MEM_func = _GEN_4[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_76_EX_opcode = _GEN_5[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  _T_76_EX_alu_sel = _GEN_6[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_76_EX_dst_sel = _GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _T_76_EX_alu_op_func = _GEN_8[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _T_76_EX_alu_op_alt = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _T_76_op_op1 = _GEN_10[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _T_76_op_op2 = _GEN_11[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _T_76_rs_rs1 = _GEN_12[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  _T_76_rs_rs2 = _GEN_13[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  _T_76_rd = _GEN_14[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  _T_76_imm = _GEN_15[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {1{$random}};
  _T_76_pc_next = _GEN_16[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_76_WB_reg_w <= io_in_WB_reg_w;
    _T_76_WB_rd_mem <= io_in_WB_rd_mem;
    _T_76_MEM_write <= io_in_MEM_write;
    _T_76_MEM_read <= io_in_MEM_read;
    _T_76_MEM_func <= io_in_MEM_func;
    _T_76_EX_opcode <= io_in_EX_opcode;
    _T_76_EX_alu_sel <= io_in_EX_alu_sel;
    _T_76_EX_dst_sel <= io_in_EX_dst_sel;
    _T_76_EX_alu_op_func <= io_in_EX_alu_op_func;
    _T_76_EX_alu_op_alt <= io_in_EX_alu_op_alt;
    _T_76_op_op1 <= io_in_op_op1;
    _T_76_op_op2 <= io_in_op_op2;
    _T_76_rs_rs1 <= io_in_rs_rs1;
    _T_76_rs_rs2 <= io_in_rs_rs2;
    _T_76_rd <= io_in_rd;
    _T_76_imm <= io_in_imm;
    _T_76_pc_next <= io_in_pc_next;
  end
endmodule
module PipelineEX_MEM(
  input         clock,
  input         io_in_WB_reg_w,
  input         io_in_WB_rd_mem,
  input         io_in_MEM_write,
  input         io_in_MEM_read,
  input  [2:0]  io_in_MEM_func,
  input  [31:0] io_in_op_op1,
  input  [31:0] io_in_op_op2,
  input  [4:0]  io_in_rd,
  input  [31:0] io_in_pc_next,
  output        io_out_WB_reg_w,
  output        io_out_WB_rd_mem,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output [2:0]  io_out_MEM_func,
  output [31:0] io_out_op_op1,
  output [31:0] io_out_op_op2,
  output [4:0]  io_out_rd,
  output [31:0] io_out_pc_next
);
  reg  _T_48_WB_reg_w;
  reg [31:0] _GEN_0;
  reg  _T_48_WB_rd_mem;
  reg [31:0] _GEN_1;
  reg  _T_48_MEM_write;
  reg [31:0] _GEN_2;
  reg  _T_48_MEM_read;
  reg [31:0] _GEN_3;
  reg [2:0] _T_48_MEM_func;
  reg [31:0] _GEN_4;
  reg [31:0] _T_48_op_op1;
  reg [31:0] _GEN_5;
  reg [31:0] _T_48_op_op2;
  reg [31:0] _GEN_6;
  reg [4:0] _T_48_rd;
  reg [31:0] _GEN_7;
  reg [31:0] _T_48_pc_next;
  reg [31:0] _GEN_8;
  assign io_out_WB_reg_w = _T_48_WB_reg_w;
  assign io_out_WB_rd_mem = _T_48_WB_rd_mem;
  assign io_out_MEM_write = _T_48_MEM_write;
  assign io_out_MEM_read = _T_48_MEM_read;
  assign io_out_MEM_func = _T_48_MEM_func;
  assign io_out_op_op1 = _T_48_op_op1;
  assign io_out_op_op2 = _T_48_op_op2;
  assign io_out_rd = _T_48_rd;
  assign io_out_pc_next = _T_48_pc_next;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_48_WB_reg_w = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_48_WB_rd_mem = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_48_MEM_write = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_48_MEM_read = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_48_MEM_func = _GEN_4[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_48_op_op1 = _GEN_5[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  _T_48_op_op2 = _GEN_6[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_48_rd = _GEN_7[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _T_48_pc_next = _GEN_8[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_48_WB_reg_w <= io_in_WB_reg_w;
    _T_48_WB_rd_mem <= io_in_WB_rd_mem;
    _T_48_MEM_write <= io_in_MEM_write;
    _T_48_MEM_read <= io_in_MEM_read;
    _T_48_MEM_func <= io_in_MEM_func;
    _T_48_op_op1 <= io_in_op_op1;
    _T_48_op_op2 <= io_in_op_op2;
    _T_48_rd <= io_in_rd;
    _T_48_pc_next <= io_in_pc_next;
  end
endmodule
module PipelineMEM_WB(
  input         clock,
  input         io_in_WB_reg_w,
  input         io_in_WB_rd_mem,
  input  [31:0] io_in_alu_res,
  input  [31:0] io_in_mem_res,
  input  [4:0]  io_in_rd,
  output        io_out_WB_reg_w,
  output        io_out_WB_rd_mem,
  output [31:0] io_out_alu_res,
  output [31:0] io_out_mem_res,
  output [4:0]  io_out_rd
);
  reg  _T_24_WB_reg_w;
  reg [31:0] _GEN_0;
  reg  _T_24_WB_rd_mem;
  reg [31:0] _GEN_1;
  reg [31:0] _T_24_alu_res;
  reg [31:0] _GEN_2;
  reg [31:0] _T_24_mem_res;
  reg [31:0] _GEN_3;
  reg [4:0] _T_24_rd;
  reg [31:0] _GEN_4;
  assign io_out_WB_reg_w = _T_24_WB_reg_w;
  assign io_out_WB_rd_mem = _T_24_WB_rd_mem;
  assign io_out_alu_res = _T_24_alu_res;
  assign io_out_mem_res = _T_24_mem_res;
  assign io_out_rd = _T_24_rd;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_24_WB_reg_w = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_24_WB_rd_mem = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_24_alu_res = _GEN_2[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_24_mem_res = _GEN_3[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_24_rd = _GEN_4[4:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_24_WB_reg_w <= io_in_WB_reg_w;
    _T_24_WB_rd_mem <= io_in_WB_rd_mem;
    _T_24_alu_res <= io_in_alu_res;
    _T_24_mem_res <= io_in_mem_res;
    _T_24_rd <= io_in_rd;
  end
endmodule
module CPU(
  input        clock,
  input        reset,
  output       io_txd,
  output [7:0] io_r0,
  output [7:0] io_r1,
  output [7:0] io_r2,
  output [7:0] io_r3
);
  reg [31:0] instMem [0:64];
  reg [31:0] _GEN_6;
  wire [31:0] instMem__T_260_data;
  wire [6:0] instMem__T_260_addr;
  reg [31:0] _GEN_7;
  wire [31:0] instMem__T_53_data;
  wire [6:0] instMem__T_53_addr;
  wire  instMem__T_53_mask;
  wire  instMem__T_53_en;
  wire [31:0] instMem__T_56_data;
  wire [6:0] instMem__T_56_addr;
  wire  instMem__T_56_mask;
  wire  instMem__T_56_en;
  wire [31:0] instMem__T_59_data;
  wire [6:0] instMem__T_59_addr;
  wire  instMem__T_59_mask;
  wire  instMem__T_59_en;
  wire [31:0] instMem__T_62_data;
  wire [6:0] instMem__T_62_addr;
  wire  instMem__T_62_mask;
  wire  instMem__T_62_en;
  wire [31:0] instMem__T_65_data;
  wire [6:0] instMem__T_65_addr;
  wire  instMem__T_65_mask;
  wire  instMem__T_65_en;
  wire [31:0] instMem__T_68_data;
  wire [6:0] instMem__T_68_addr;
  wire  instMem__T_68_mask;
  wire  instMem__T_68_en;
  wire [31:0] instMem__T_71_data;
  wire [6:0] instMem__T_71_addr;
  wire  instMem__T_71_mask;
  wire  instMem__T_71_en;
  wire [31:0] instMem__T_74_data;
  wire [6:0] instMem__T_74_addr;
  wire  instMem__T_74_mask;
  wire  instMem__T_74_en;
  wire [31:0] instMem__T_77_data;
  wire [6:0] instMem__T_77_addr;
  wire  instMem__T_77_mask;
  wire  instMem__T_77_en;
  wire [31:0] instMem__T_80_data;
  wire [6:0] instMem__T_80_addr;
  wire  instMem__T_80_mask;
  wire  instMem__T_80_en;
  wire [31:0] instMem__T_83_data;
  wire [6:0] instMem__T_83_addr;
  wire  instMem__T_83_mask;
  wire  instMem__T_83_en;
  wire [31:0] instMem__T_86_data;
  wire [6:0] instMem__T_86_addr;
  wire  instMem__T_86_mask;
  wire  instMem__T_86_en;
  wire [31:0] instMem__T_89_data;
  wire [6:0] instMem__T_89_addr;
  wire  instMem__T_89_mask;
  wire  instMem__T_89_en;
  wire [31:0] instMem__T_92_data;
  wire [6:0] instMem__T_92_addr;
  wire  instMem__T_92_mask;
  wire  instMem__T_92_en;
  wire [31:0] instMem__T_95_data;
  wire [6:0] instMem__T_95_addr;
  wire  instMem__T_95_mask;
  wire  instMem__T_95_en;
  wire [31:0] instMem__T_98_data;
  wire [6:0] instMem__T_98_addr;
  wire  instMem__T_98_mask;
  wire  instMem__T_98_en;
  wire [31:0] instMem__T_101_data;
  wire [6:0] instMem__T_101_addr;
  wire  instMem__T_101_mask;
  wire  instMem__T_101_en;
  wire [31:0] instMem__T_104_data;
  wire [6:0] instMem__T_104_addr;
  wire  instMem__T_104_mask;
  wire  instMem__T_104_en;
  wire [31:0] instMem__T_107_data;
  wire [6:0] instMem__T_107_addr;
  wire  instMem__T_107_mask;
  wire  instMem__T_107_en;
  wire [31:0] instMem__T_110_data;
  wire [6:0] instMem__T_110_addr;
  wire  instMem__T_110_mask;
  wire  instMem__T_110_en;
  wire [31:0] instMem__T_113_data;
  wire [6:0] instMem__T_113_addr;
  wire  instMem__T_113_mask;
  wire  instMem__T_113_en;
  wire [31:0] instMem__T_116_data;
  wire [6:0] instMem__T_116_addr;
  wire  instMem__T_116_mask;
  wire  instMem__T_116_en;
  wire [31:0] instMem__T_119_data;
  wire [6:0] instMem__T_119_addr;
  wire  instMem__T_119_mask;
  wire  instMem__T_119_en;
  wire [31:0] instMem__T_122_data;
  wire [6:0] instMem__T_122_addr;
  wire  instMem__T_122_mask;
  wire  instMem__T_122_en;
  wire [31:0] instMem__T_125_data;
  wire [6:0] instMem__T_125_addr;
  wire  instMem__T_125_mask;
  wire  instMem__T_125_en;
  wire [31:0] instMem__T_128_data;
  wire [6:0] instMem__T_128_addr;
  wire  instMem__T_128_mask;
  wire  instMem__T_128_en;
  wire [31:0] instMem__T_131_data;
  wire [6:0] instMem__T_131_addr;
  wire  instMem__T_131_mask;
  wire  instMem__T_131_en;
  wire [31:0] instMem__T_134_data;
  wire [6:0] instMem__T_134_addr;
  wire  instMem__T_134_mask;
  wire  instMem__T_134_en;
  wire [31:0] instMem__T_137_data;
  wire [6:0] instMem__T_137_addr;
  wire  instMem__T_137_mask;
  wire  instMem__T_137_en;
  wire [31:0] instMem__T_140_data;
  wire [6:0] instMem__T_140_addr;
  wire  instMem__T_140_mask;
  wire  instMem__T_140_en;
  wire [31:0] instMem__T_143_data;
  wire [6:0] instMem__T_143_addr;
  wire  instMem__T_143_mask;
  wire  instMem__T_143_en;
  wire [31:0] instMem__T_146_data;
  wire [6:0] instMem__T_146_addr;
  wire  instMem__T_146_mask;
  wire  instMem__T_146_en;
  wire [31:0] instMem__T_149_data;
  wire [6:0] instMem__T_149_addr;
  wire  instMem__T_149_mask;
  wire  instMem__T_149_en;
  wire [31:0] instMem__T_152_data;
  wire [6:0] instMem__T_152_addr;
  wire  instMem__T_152_mask;
  wire  instMem__T_152_en;
  wire [31:0] instMem__T_155_data;
  wire [6:0] instMem__T_155_addr;
  wire  instMem__T_155_mask;
  wire  instMem__T_155_en;
  wire [31:0] instMem__T_158_data;
  wire [6:0] instMem__T_158_addr;
  wire  instMem__T_158_mask;
  wire  instMem__T_158_en;
  wire [31:0] instMem__T_161_data;
  wire [6:0] instMem__T_161_addr;
  wire  instMem__T_161_mask;
  wire  instMem__T_161_en;
  wire [31:0] instMem__T_164_data;
  wire [6:0] instMem__T_164_addr;
  wire  instMem__T_164_mask;
  wire  instMem__T_164_en;
  wire [31:0] instMem__T_167_data;
  wire [6:0] instMem__T_167_addr;
  wire  instMem__T_167_mask;
  wire  instMem__T_167_en;
  wire [31:0] instMem__T_170_data;
  wire [6:0] instMem__T_170_addr;
  wire  instMem__T_170_mask;
  wire  instMem__T_170_en;
  wire [31:0] instMem__T_173_data;
  wire [6:0] instMem__T_173_addr;
  wire  instMem__T_173_mask;
  wire  instMem__T_173_en;
  wire [31:0] instMem__T_176_data;
  wire [6:0] instMem__T_176_addr;
  wire  instMem__T_176_mask;
  wire  instMem__T_176_en;
  wire [31:0] instMem__T_179_data;
  wire [6:0] instMem__T_179_addr;
  wire  instMem__T_179_mask;
  wire  instMem__T_179_en;
  wire [31:0] instMem__T_182_data;
  wire [6:0] instMem__T_182_addr;
  wire  instMem__T_182_mask;
  wire  instMem__T_182_en;
  wire [31:0] instMem__T_185_data;
  wire [6:0] instMem__T_185_addr;
  wire  instMem__T_185_mask;
  wire  instMem__T_185_en;
  wire [31:0] instMem__T_188_data;
  wire [6:0] instMem__T_188_addr;
  wire  instMem__T_188_mask;
  wire  instMem__T_188_en;
  wire [31:0] instMem__T_191_data;
  wire [6:0] instMem__T_191_addr;
  wire  instMem__T_191_mask;
  wire  instMem__T_191_en;
  wire [31:0] instMem__T_194_data;
  wire [6:0] instMem__T_194_addr;
  wire  instMem__T_194_mask;
  wire  instMem__T_194_en;
  wire [31:0] instMem__T_197_data;
  wire [6:0] instMem__T_197_addr;
  wire  instMem__T_197_mask;
  wire  instMem__T_197_en;
  wire [31:0] instMem__T_200_data;
  wire [6:0] instMem__T_200_addr;
  wire  instMem__T_200_mask;
  wire  instMem__T_200_en;
  wire [31:0] instMem__T_203_data;
  wire [6:0] instMem__T_203_addr;
  wire  instMem__T_203_mask;
  wire  instMem__T_203_en;
  wire [31:0] instMem__T_206_data;
  wire [6:0] instMem__T_206_addr;
  wire  instMem__T_206_mask;
  wire  instMem__T_206_en;
  wire [31:0] instMem__T_209_data;
  wire [6:0] instMem__T_209_addr;
  wire  instMem__T_209_mask;
  wire  instMem__T_209_en;
  wire [31:0] instMem__T_212_data;
  wire [6:0] instMem__T_212_addr;
  wire  instMem__T_212_mask;
  wire  instMem__T_212_en;
  wire [31:0] instMem__T_215_data;
  wire [6:0] instMem__T_215_addr;
  wire  instMem__T_215_mask;
  wire  instMem__T_215_en;
  wire [31:0] instMem__T_218_data;
  wire [6:0] instMem__T_218_addr;
  wire  instMem__T_218_mask;
  wire  instMem__T_218_en;
  wire [31:0] instMem__T_221_data;
  wire [6:0] instMem__T_221_addr;
  wire  instMem__T_221_mask;
  wire  instMem__T_221_en;
  wire [31:0] instMem__T_224_data;
  wire [6:0] instMem__T_224_addr;
  wire  instMem__T_224_mask;
  wire  instMem__T_224_en;
  wire [31:0] instMem__T_227_data;
  wire [6:0] instMem__T_227_addr;
  wire  instMem__T_227_mask;
  wire  instMem__T_227_en;
  wire [31:0] instMem__T_230_data;
  wire [6:0] instMem__T_230_addr;
  wire  instMem__T_230_mask;
  wire  instMem__T_230_en;
  wire [31:0] instMem__T_233_data;
  wire [6:0] instMem__T_233_addr;
  wire  instMem__T_233_mask;
  wire  instMem__T_233_en;
  wire [31:0] instMem__T_236_data;
  wire [6:0] instMem__T_236_addr;
  wire  instMem__T_236_mask;
  wire  instMem__T_236_en;
  wire [31:0] instMem__T_239_data;
  wire [6:0] instMem__T_239_addr;
  wire  instMem__T_239_mask;
  wire  instMem__T_239_en;
  wire [31:0] instMem__T_242_data;
  wire [6:0] instMem__T_242_addr;
  wire  instMem__T_242_mask;
  wire  instMem__T_242_en;
  wire [31:0] instMem__T_245_data;
  wire [6:0] instMem__T_245_addr;
  wire  instMem__T_245_mask;
  wire  instMem__T_245_en;
  wire  counter_clock;
  wire  counter_reset;
  wire  counter_io_branch;
  wire [31:0] counter_io_pc_src;
  wire [31:0] counter_io_pc_next;
  wire [31:0] counter_io_pc;
  wire [31:0] decoder_io_inst;
  wire [6:0] decoder_io_ctrl_opcode;
  wire [2:0] decoder_io_ctrl_funct3;
  wire [6:0] decoder_io_ctrl_funct7;
  wire [4:0] decoder_io_rs_rs1;
  wire [4:0] decoder_io_rs_rs2;
  wire [4:0] decoder_io_rd;
  wire [31:0] decoder_io_imm;
  wire [6:0] control_io_ctrl_opcode;
  wire [2:0] control_io_ctrl_funct3;
  wire [6:0] control_io_ctrl_funct7;
  wire  control_io_WB_reg_w;
  wire  control_io_WB_rd_mem;
  wire  control_io_MEM_branch;
  wire  control_io_MEM_write;
  wire  control_io_MEM_read;
  wire [2:0] control_io_MEM_func;
  wire [6:0] control_io_EX_opcode;
  wire  control_io_EX_alu_sel;
  wire  control_io_EX_dst_sel;
  wire [2:0] control_io_EX_alu_op_func;
  wire  control_io_EX_alu_op_alt;
  wire  regs_clock;
  wire [4:0] regs_io_rs_rs1;
  wire [4:0] regs_io_rs_rs2;
  wire  regs_io_reg_w;
  wire [4:0] regs_io_rd;
  wire [31:0] regs_io_res;
  wire [31:0] regs_io_op_op1;
  wire [31:0] regs_io_op_op2;
  wire [6:0] alu_io_opcode;
  wire [2:0] alu_io_alu_op_func;
  wire  alu_io_alu_op_alt;
  wire [31:0] alu_io_op_op1;
  wire [31:0] alu_io_op_op2;
  wire [31:0] alu_io_res;
  wire  dataMem_clock;
  wire  dataMem_io_mem_write;
  wire  dataMem_io_mem_read;
  wire [2:0] dataMem_io_mem_func;
  wire [31:0] dataMem_io_op_op1;
  wire [31:0] dataMem_io_op_op2;
  wire [31:0] dataMem_io_res;
  wire  fwdUnit_io_reg_w_mem;
  wire  fwdUnit_io_reg_w_wb;
  wire [4:0] fwdUnit_io_rs_rs1;
  wire [4:0] fwdUnit_io_rs_rs2;
  wire [4:0] fwdUnit_io_rd_mem;
  wire [4:0] fwdUnit_io_rd_wb;
  wire [1:0] fwdUnit_io_fwd_rs1;
  wire [1:0] fwdUnit_io_fwd_rs2;
  wire  uart_clock;
  wire  uart_reset;
  wire [7:0] uart_io_in;
  wire  uart_io_valid;
  wire  uart_io_txd;
  wire [7:0] uart_io_r0;
  wire [7:0] uart_io_r1;
  wire [7:0] uart_io_r2;
  wire [7:0] uart_io_r3;
  wire  IF_ID_clock;
  wire [31:0] IF_ID_io_in_pc_next;
  wire [31:0] IF_ID_io_in_inst;
  wire [31:0] IF_ID_io_out_pc_next;
  wire [31:0] IF_ID_io_out_inst;
  wire  ID_EX_clock;
  wire  ID_EX_io_in_WB_reg_w;
  wire  ID_EX_io_in_WB_rd_mem;
  wire  ID_EX_io_in_MEM_write;
  wire  ID_EX_io_in_MEM_read;
  wire [2:0] ID_EX_io_in_MEM_func;
  wire [6:0] ID_EX_io_in_EX_opcode;
  wire  ID_EX_io_in_EX_alu_sel;
  wire  ID_EX_io_in_EX_dst_sel;
  wire [2:0] ID_EX_io_in_EX_alu_op_func;
  wire  ID_EX_io_in_EX_alu_op_alt;
  wire [31:0] ID_EX_io_in_op_op1;
  wire [31:0] ID_EX_io_in_op_op2;
  wire [4:0] ID_EX_io_in_rs_rs1;
  wire [4:0] ID_EX_io_in_rs_rs2;
  wire [4:0] ID_EX_io_in_rd;
  wire [31:0] ID_EX_io_in_imm;
  wire [31:0] ID_EX_io_in_pc_next;
  wire  ID_EX_io_out_WB_reg_w;
  wire  ID_EX_io_out_WB_rd_mem;
  wire  ID_EX_io_out_MEM_write;
  wire  ID_EX_io_out_MEM_read;
  wire [2:0] ID_EX_io_out_MEM_func;
  wire [6:0] ID_EX_io_out_EX_opcode;
  wire  ID_EX_io_out_EX_alu_sel;
  wire  ID_EX_io_out_EX_dst_sel;
  wire [2:0] ID_EX_io_out_EX_alu_op_func;
  wire  ID_EX_io_out_EX_alu_op_alt;
  wire [31:0] ID_EX_io_out_op_op1;
  wire [31:0] ID_EX_io_out_op_op2;
  wire [4:0] ID_EX_io_out_rs_rs1;
  wire [4:0] ID_EX_io_out_rs_rs2;
  wire [4:0] ID_EX_io_out_rd;
  wire [31:0] ID_EX_io_out_imm;
  wire [31:0] ID_EX_io_out_pc_next;
  wire  EX_MEM_clock;
  wire  EX_MEM_io_in_WB_reg_w;
  wire  EX_MEM_io_in_WB_rd_mem;
  wire  EX_MEM_io_in_MEM_write;
  wire  EX_MEM_io_in_MEM_read;
  wire [2:0] EX_MEM_io_in_MEM_func;
  wire [31:0] EX_MEM_io_in_op_op1;
  wire [31:0] EX_MEM_io_in_op_op2;
  wire [4:0] EX_MEM_io_in_rd;
  wire [31:0] EX_MEM_io_in_pc_next;
  wire  EX_MEM_io_out_WB_reg_w;
  wire  EX_MEM_io_out_WB_rd_mem;
  wire  EX_MEM_io_out_MEM_write;
  wire  EX_MEM_io_out_MEM_read;
  wire [2:0] EX_MEM_io_out_MEM_func;
  wire [31:0] EX_MEM_io_out_op_op1;
  wire [31:0] EX_MEM_io_out_op_op2;
  wire [4:0] EX_MEM_io_out_rd;
  wire [31:0] EX_MEM_io_out_pc_next;
  wire  MEM_WB_clock;
  wire  MEM_WB_io_in_WB_reg_w;
  wire  MEM_WB_io_in_WB_rd_mem;
  wire [31:0] MEM_WB_io_in_alu_res;
  wire [31:0] MEM_WB_io_in_mem_res;
  wire [4:0] MEM_WB_io_in_rd;
  wire  MEM_WB_io_out_WB_reg_w;
  wire  MEM_WB_io_out_WB_rd_mem;
  wire [31:0] MEM_WB_io_out_alu_res;
  wire [31:0] MEM_WB_io_out_mem_res;
  wire [4:0] MEM_WB_io_out_rd;
  wire  _T_247;
  wire  _T_248;
  wire  _T_250;
  wire  _T_251;
  wire [32:0] _T_252;
  wire [31:0] _T_253;
  wire [32:0] _T_255;
  wire [32:0] _T_256;
  wire [31:0] _T_257;
  wire [31:0] _T_258;
  wire [6:0] _T_259;
  wire [6:0] _T_261;
  wire [2:0] _T_262;
  wire [6:0] _T_263;
  wire  _T_264;
  wire [31:0] _T_265;
  wire  _T_266;
  wire [31:0] _T_267;
  wire  _T_268;
  wire [31:0] _T_269;
  wire [31:0] _T_270;
  wire [31:0] _T_271;
  wire [31:0] _T_272;
  wire  _T_273;
  wire [31:0] _T_274;
  wire  _T_275;
  wire [31:0] _T_276;
  wire  _T_277;
  wire [31:0] _T_278;
  wire [4:0] _T_279;
  wire [31:0] _T_280;
  wire  _T_282;
  wire  _T_283;
  wire [31:0] _GEN_0;
  wire  _T_285;
  wire [31:0] _GEN_1;
  reg [4:0] _GEN_2;
  reg [31:0] _GEN_8;
  reg [4:0] _GEN_3;
  reg [31:0] _GEN_9;
  reg [4:0] _GEN_4;
  reg [31:0] _GEN_10;
  reg  _GEN_5;
  reg [31:0] _GEN_11;
  ProgramCounter counter (
    .clock(counter_clock),
    .reset(counter_reset),
    .io_branch(counter_io_branch),
    .io_pc_src(counter_io_pc_src),
    .io_pc_next(counter_io_pc_next),
    .io_pc(counter_io_pc)
  );
  Decoder decoder (
    .io_inst(decoder_io_inst),
    .io_ctrl_opcode(decoder_io_ctrl_opcode),
    .io_ctrl_funct3(decoder_io_ctrl_funct3),
    .io_ctrl_funct7(decoder_io_ctrl_funct7),
    .io_rs_rs1(decoder_io_rs_rs1),
    .io_rs_rs2(decoder_io_rs_rs2),
    .io_rd(decoder_io_rd),
    .io_imm(decoder_io_imm)
  );
  Control control (
    .io_ctrl_opcode(control_io_ctrl_opcode),
    .io_ctrl_funct3(control_io_ctrl_funct3),
    .io_ctrl_funct7(control_io_ctrl_funct7),
    .io_WB_reg_w(control_io_WB_reg_w),
    .io_WB_rd_mem(control_io_WB_rd_mem),
    .io_MEM_branch(control_io_MEM_branch),
    .io_MEM_write(control_io_MEM_write),
    .io_MEM_read(control_io_MEM_read),
    .io_MEM_func(control_io_MEM_func),
    .io_EX_opcode(control_io_EX_opcode),
    .io_EX_alu_sel(control_io_EX_alu_sel),
    .io_EX_dst_sel(control_io_EX_dst_sel),
    .io_EX_alu_op_func(control_io_EX_alu_op_func),
    .io_EX_alu_op_alt(control_io_EX_alu_op_alt)
  );
  Registers regs (
    .clock(regs_clock),
    .io_rs_rs1(regs_io_rs_rs1),
    .io_rs_rs2(regs_io_rs_rs2),
    .io_reg_w(regs_io_reg_w),
    .io_rd(regs_io_rd),
    .io_res(regs_io_res),
    .io_op_op1(regs_io_op_op1),
    .io_op_op2(regs_io_op_op2)
  );
  ALU alu (
    .io_opcode(alu_io_opcode),
    .io_alu_op_func(alu_io_alu_op_func),
    .io_alu_op_alt(alu_io_alu_op_alt),
    .io_op_op1(alu_io_op_op1),
    .io_op_op2(alu_io_op_op2),
    .io_res(alu_io_res)
  );
  DataMemory dataMem (
    .clock(dataMem_clock),
    .io_mem_write(dataMem_io_mem_write),
    .io_mem_read(dataMem_io_mem_read),
    .io_mem_func(dataMem_io_mem_func),
    .io_op_op1(dataMem_io_op_op1),
    .io_op_op2(dataMem_io_op_op2),
    .io_res(dataMem_io_res)
  );
  ForwardingUnit fwdUnit (
    .io_reg_w_mem(fwdUnit_io_reg_w_mem),
    .io_reg_w_wb(fwdUnit_io_reg_w_wb),
    .io_rs_rs1(fwdUnit_io_rs_rs1),
    .io_rs_rs2(fwdUnit_io_rs_rs2),
    .io_rd_mem(fwdUnit_io_rd_mem),
    .io_rd_wb(fwdUnit_io_rd_wb),
    .io_fwd_rs1(fwdUnit_io_fwd_rs1),
    .io_fwd_rs2(fwdUnit_io_fwd_rs2)
  );
  UART uart (
    .clock(uart_clock),
    .reset(uart_reset),
    .io_in(uart_io_in),
    .io_valid(uart_io_valid),
    .io_txd(uart_io_txd),
    .io_r0(uart_io_r0),
    .io_r1(uart_io_r1),
    .io_r2(uart_io_r2),
    .io_r3(uart_io_r3)
  );
  PipelineIF_ID IF_ID (
    .clock(IF_ID_clock),
    .io_in_pc_next(IF_ID_io_in_pc_next),
    .io_in_inst(IF_ID_io_in_inst),
    .io_out_pc_next(IF_ID_io_out_pc_next),
    .io_out_inst(IF_ID_io_out_inst)
  );
  PipelineID_EX ID_EX (
    .clock(ID_EX_clock),
    .io_in_WB_reg_w(ID_EX_io_in_WB_reg_w),
    .io_in_WB_rd_mem(ID_EX_io_in_WB_rd_mem),
    .io_in_MEM_write(ID_EX_io_in_MEM_write),
    .io_in_MEM_read(ID_EX_io_in_MEM_read),
    .io_in_MEM_func(ID_EX_io_in_MEM_func),
    .io_in_EX_opcode(ID_EX_io_in_EX_opcode),
    .io_in_EX_alu_sel(ID_EX_io_in_EX_alu_sel),
    .io_in_EX_dst_sel(ID_EX_io_in_EX_dst_sel),
    .io_in_EX_alu_op_func(ID_EX_io_in_EX_alu_op_func),
    .io_in_EX_alu_op_alt(ID_EX_io_in_EX_alu_op_alt),
    .io_in_op_op1(ID_EX_io_in_op_op1),
    .io_in_op_op2(ID_EX_io_in_op_op2),
    .io_in_rs_rs1(ID_EX_io_in_rs_rs1),
    .io_in_rs_rs2(ID_EX_io_in_rs_rs2),
    .io_in_rd(ID_EX_io_in_rd),
    .io_in_imm(ID_EX_io_in_imm),
    .io_in_pc_next(ID_EX_io_in_pc_next),
    .io_out_WB_reg_w(ID_EX_io_out_WB_reg_w),
    .io_out_WB_rd_mem(ID_EX_io_out_WB_rd_mem),
    .io_out_MEM_write(ID_EX_io_out_MEM_write),
    .io_out_MEM_read(ID_EX_io_out_MEM_read),
    .io_out_MEM_func(ID_EX_io_out_MEM_func),
    .io_out_EX_opcode(ID_EX_io_out_EX_opcode),
    .io_out_EX_alu_sel(ID_EX_io_out_EX_alu_sel),
    .io_out_EX_dst_sel(ID_EX_io_out_EX_dst_sel),
    .io_out_EX_alu_op_func(ID_EX_io_out_EX_alu_op_func),
    .io_out_EX_alu_op_alt(ID_EX_io_out_EX_alu_op_alt),
    .io_out_op_op1(ID_EX_io_out_op_op1),
    .io_out_op_op2(ID_EX_io_out_op_op2),
    .io_out_rs_rs1(ID_EX_io_out_rs_rs1),
    .io_out_rs_rs2(ID_EX_io_out_rs_rs2),
    .io_out_rd(ID_EX_io_out_rd),
    .io_out_imm(ID_EX_io_out_imm),
    .io_out_pc_next(ID_EX_io_out_pc_next)
  );
  PipelineEX_MEM EX_MEM (
    .clock(EX_MEM_clock),
    .io_in_WB_reg_w(EX_MEM_io_in_WB_reg_w),
    .io_in_WB_rd_mem(EX_MEM_io_in_WB_rd_mem),
    .io_in_MEM_write(EX_MEM_io_in_MEM_write),
    .io_in_MEM_read(EX_MEM_io_in_MEM_read),
    .io_in_MEM_func(EX_MEM_io_in_MEM_func),
    .io_in_op_op1(EX_MEM_io_in_op_op1),
    .io_in_op_op2(EX_MEM_io_in_op_op2),
    .io_in_rd(EX_MEM_io_in_rd),
    .io_in_pc_next(EX_MEM_io_in_pc_next),
    .io_out_WB_reg_w(EX_MEM_io_out_WB_reg_w),
    .io_out_WB_rd_mem(EX_MEM_io_out_WB_rd_mem),
    .io_out_MEM_write(EX_MEM_io_out_MEM_write),
    .io_out_MEM_read(EX_MEM_io_out_MEM_read),
    .io_out_MEM_func(EX_MEM_io_out_MEM_func),
    .io_out_op_op1(EX_MEM_io_out_op_op1),
    .io_out_op_op2(EX_MEM_io_out_op_op2),
    .io_out_rd(EX_MEM_io_out_rd),
    .io_out_pc_next(EX_MEM_io_out_pc_next)
  );
  PipelineMEM_WB MEM_WB (
    .clock(MEM_WB_clock),
    .io_in_WB_reg_w(MEM_WB_io_in_WB_reg_w),
    .io_in_WB_rd_mem(MEM_WB_io_in_WB_rd_mem),
    .io_in_alu_res(MEM_WB_io_in_alu_res),
    .io_in_mem_res(MEM_WB_io_in_mem_res),
    .io_in_rd(MEM_WB_io_in_rd),
    .io_out_WB_reg_w(MEM_WB_io_out_WB_reg_w),
    .io_out_WB_rd_mem(MEM_WB_io_out_WB_rd_mem),
    .io_out_alu_res(MEM_WB_io_out_alu_res),
    .io_out_mem_res(MEM_WB_io_out_mem_res),
    .io_out_rd(MEM_WB_io_out_rd)
  );
  assign io_txd = uart_io_txd;
  assign io_r0 = uart_io_r0;
  assign io_r1 = uart_io_r1;
  assign io_r2 = uart_io_r2;
  assign io_r3 = uart_io_r3;
  assign instMem__T_260_addr = _T_259;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign instMem__T_260_data = instMem[instMem__T_260_addr];
  `else
  assign instMem__T_260_data = instMem__T_260_addr >= 7'h41 ? _GEN_7[31:0] : instMem[instMem__T_260_addr];
  `endif
  assign instMem__T_53_data = 32'h464c457f;
  assign instMem__T_53_addr = 7'h0;
  assign instMem__T_53_mask = 1'h1;
  assign instMem__T_53_en = 1'h1;
  assign instMem__T_56_data = 32'h10101;
  assign instMem__T_56_addr = 7'h1;
  assign instMem__T_56_mask = 1'h1;
  assign instMem__T_56_en = 1'h1;
  assign instMem__T_59_data = 32'h0;
  assign instMem__T_59_addr = 7'h2;
  assign instMem__T_59_mask = 1'h1;
  assign instMem__T_59_en = 1'h1;
  assign instMem__T_62_data = 32'h0;
  assign instMem__T_62_addr = 7'h3;
  assign instMem__T_62_mask = 1'h1;
  assign instMem__T_62_en = 1'h1;
  assign instMem__T_65_data = 32'hf30002;
  assign instMem__T_65_addr = 7'h4;
  assign instMem__T_65_mask = 1'h1;
  assign instMem__T_65_en = 1'h1;
  assign instMem__T_68_data = 32'h1;
  assign instMem__T_68_addr = 7'h5;
  assign instMem__T_68_mask = 1'h1;
  assign instMem__T_68_en = 1'h1;
  assign instMem__T_71_data = 32'h10054;
  assign instMem__T_71_addr = 7'h6;
  assign instMem__T_71_mask = 1'h1;
  assign instMem__T_71_en = 1'h1;
  assign instMem__T_74_data = 32'h34;
  assign instMem__T_74_addr = 7'h7;
  assign instMem__T_74_mask = 1'h1;
  assign instMem__T_74_en = 1'h1;
  assign instMem__T_77_data = 32'h1dc;
  assign instMem__T_77_addr = 7'h8;
  assign instMem__T_77_mask = 1'h1;
  assign instMem__T_77_en = 1'h1;
  assign instMem__T_80_data = 32'h0;
  assign instMem__T_80_addr = 7'h9;
  assign instMem__T_80_mask = 1'h1;
  assign instMem__T_80_en = 1'h1;
  assign instMem__T_83_data = 32'h200034;
  assign instMem__T_83_addr = 7'ha;
  assign instMem__T_83_mask = 1'h1;
  assign instMem__T_83_en = 1'h1;
  assign instMem__T_86_data = 32'h280001;
  assign instMem__T_86_addr = 7'hb;
  assign instMem__T_86_mask = 1'h1;
  assign instMem__T_86_en = 1'h1;
  assign instMem__T_89_data = 32'h50006;
  assign instMem__T_89_addr = 7'hc;
  assign instMem__T_89_mask = 1'h1;
  assign instMem__T_89_en = 1'h1;
  assign instMem__T_92_data = 32'h1;
  assign instMem__T_92_addr = 7'hd;
  assign instMem__T_92_mask = 1'h1;
  assign instMem__T_92_en = 1'h1;
  assign instMem__T_95_data = 32'h0;
  assign instMem__T_95_addr = 7'he;
  assign instMem__T_95_mask = 1'h1;
  assign instMem__T_95_en = 1'h1;
  assign instMem__T_98_data = 32'h10000;
  assign instMem__T_98_addr = 7'hf;
  assign instMem__T_98_mask = 1'h1;
  assign instMem__T_98_en = 1'h1;
  assign instMem__T_101_data = 32'h10000;
  assign instMem__T_101_addr = 7'h10;
  assign instMem__T_101_mask = 1'h1;
  assign instMem__T_101_en = 1'h1;
  assign instMem__T_104_data = 32'hcc;
  assign instMem__T_104_addr = 7'h11;
  assign instMem__T_104_mask = 1'h1;
  assign instMem__T_104_en = 1'h1;
  assign instMem__T_107_data = 32'hcc;
  assign instMem__T_107_addr = 7'h12;
  assign instMem__T_107_mask = 1'h1;
  assign instMem__T_107_en = 1'h1;
  assign instMem__T_110_data = 32'h5;
  assign instMem__T_110_addr = 7'h13;
  assign instMem__T_110_mask = 1'h1;
  assign instMem__T_110_en = 1'h1;
  assign instMem__T_113_data = 32'h1000;
  assign instMem__T_113_addr = 7'h14;
  assign instMem__T_113_mask = 1'h1;
  assign instMem__T_113_en = 1'h1;
  assign instMem__T_116_data = 32'h0;
  assign instMem__T_116_addr = 7'h15;
  assign instMem__T_116_mask = 1'h1;
  assign instMem__T_116_en = 1'h1;
  assign instMem__T_119_data = 32'h40100313;
  assign instMem__T_119_addr = 7'h16;
  assign instMem__T_119_mask = 1'h1;
  assign instMem__T_119_en = 1'h1;
  assign instMem__T_122_data = 32'h6800293;
  assign instMem__T_122_addr = 7'h17;
  assign instMem__T_122_mask = 1'h1;
  assign instMem__T_122_en = 1'h1;
  assign instMem__T_125_data = 32'h530023;
  assign instMem__T_125_addr = 7'h18;
  assign instMem__T_125_mask = 1'h1;
  assign instMem__T_125_en = 1'h1;
  assign instMem__T_128_data = 32'h6500293;
  assign instMem__T_128_addr = 7'h19;
  assign instMem__T_128_mask = 1'h1;
  assign instMem__T_128_en = 1'h1;
  assign instMem__T_131_data = 32'h530023;
  assign instMem__T_131_addr = 7'h1a;
  assign instMem__T_131_mask = 1'h1;
  assign instMem__T_131_en = 1'h1;
  assign instMem__T_134_data = 32'h6c00293;
  assign instMem__T_134_addr = 7'h1b;
  assign instMem__T_134_mask = 1'h1;
  assign instMem__T_134_en = 1'h1;
  assign instMem__T_137_data = 32'h530023;
  assign instMem__T_137_addr = 7'h1c;
  assign instMem__T_137_mask = 1'h1;
  assign instMem__T_137_en = 1'h1;
  assign instMem__T_140_data = 32'h6c00293;
  assign instMem__T_140_addr = 7'h1d;
  assign instMem__T_140_mask = 1'h1;
  assign instMem__T_140_en = 1'h1;
  assign instMem__T_143_data = 32'h530023;
  assign instMem__T_143_addr = 7'h1e;
  assign instMem__T_143_mask = 1'h1;
  assign instMem__T_143_en = 1'h1;
  assign instMem__T_146_data = 32'h6f00293;
  assign instMem__T_146_addr = 7'h1f;
  assign instMem__T_146_mask = 1'h1;
  assign instMem__T_146_en = 1'h1;
  assign instMem__T_149_data = 32'h530023;
  assign instMem__T_149_addr = 7'h20;
  assign instMem__T_149_mask = 1'h1;
  assign instMem__T_149_en = 1'h1;
  assign instMem__T_152_data = 32'h2000293;
  assign instMem__T_152_addr = 7'h21;
  assign instMem__T_152_mask = 1'h1;
  assign instMem__T_152_en = 1'h1;
  assign instMem__T_155_data = 32'h530023;
  assign instMem__T_155_addr = 7'h22;
  assign instMem__T_155_mask = 1'h1;
  assign instMem__T_155_en = 1'h1;
  assign instMem__T_158_data = 32'h7700293;
  assign instMem__T_158_addr = 7'h23;
  assign instMem__T_158_mask = 1'h1;
  assign instMem__T_158_en = 1'h1;
  assign instMem__T_161_data = 32'h530023;
  assign instMem__T_161_addr = 7'h24;
  assign instMem__T_161_mask = 1'h1;
  assign instMem__T_161_en = 1'h1;
  assign instMem__T_164_data = 32'h6f00293;
  assign instMem__T_164_addr = 7'h25;
  assign instMem__T_164_mask = 1'h1;
  assign instMem__T_164_en = 1'h1;
  assign instMem__T_167_data = 32'h530023;
  assign instMem__T_167_addr = 7'h26;
  assign instMem__T_167_mask = 1'h1;
  assign instMem__T_167_en = 1'h1;
  assign instMem__T_170_data = 32'h7200293;
  assign instMem__T_170_addr = 7'h27;
  assign instMem__T_170_mask = 1'h1;
  assign instMem__T_170_en = 1'h1;
  assign instMem__T_173_data = 32'h530023;
  assign instMem__T_173_addr = 7'h28;
  assign instMem__T_173_mask = 1'h1;
  assign instMem__T_173_en = 1'h1;
  assign instMem__T_176_data = 32'h6c00293;
  assign instMem__T_176_addr = 7'h29;
  assign instMem__T_176_mask = 1'h1;
  assign instMem__T_176_en = 1'h1;
  assign instMem__T_179_data = 32'h530023;
  assign instMem__T_179_addr = 7'h2a;
  assign instMem__T_179_mask = 1'h1;
  assign instMem__T_179_en = 1'h1;
  assign instMem__T_182_data = 32'h6400293;
  assign instMem__T_182_addr = 7'h2b;
  assign instMem__T_182_mask = 1'h1;
  assign instMem__T_182_en = 1'h1;
  assign instMem__T_185_data = 32'h530023;
  assign instMem__T_185_addr = 7'h2c;
  assign instMem__T_185_mask = 1'h1;
  assign instMem__T_185_en = 1'h1;
  assign instMem__T_188_data = 32'h2100293;
  assign instMem__T_188_addr = 7'h2d;
  assign instMem__T_188_mask = 1'h1;
  assign instMem__T_188_en = 1'h1;
  assign instMem__T_191_data = 32'h530023;
  assign instMem__T_191_addr = 7'h2e;
  assign instMem__T_191_mask = 1'h1;
  assign instMem__T_191_en = 1'h1;
  assign instMem__T_194_data = 32'ha00293;
  assign instMem__T_194_addr = 7'h2f;
  assign instMem__T_194_mask = 1'h1;
  assign instMem__T_194_en = 1'h1;
  assign instMem__T_197_data = 32'h530023;
  assign instMem__T_197_addr = 7'h30;
  assign instMem__T_197_mask = 1'h1;
  assign instMem__T_197_en = 1'h1;
  assign instMem__T_200_data = 32'hd00293;
  assign instMem__T_200_addr = 7'h31;
  assign instMem__T_200_mask = 1'h1;
  assign instMem__T_200_en = 1'h1;
  assign instMem__T_203_data = 32'h530023;
  assign instMem__T_203_addr = 7'h32;
  assign instMem__T_203_mask = 1'h1;
  assign instMem__T_203_en = 1'h1;
  assign instMem__T_206_data = 32'h8067;
  assign instMem__T_206_addr = 7'h33;
  assign instMem__T_206_mask = 1'h1;
  assign instMem__T_206_en = 1'h1;
  assign instMem__T_209_data = 32'h0;
  assign instMem__T_209_addr = 7'h34;
  assign instMem__T_209_mask = 1'h1;
  assign instMem__T_209_en = 1'h1;
  assign instMem__T_212_data = 32'h0;
  assign instMem__T_212_addr = 7'h35;
  assign instMem__T_212_mask = 1'h1;
  assign instMem__T_212_en = 1'h1;
  assign instMem__T_215_data = 32'h0;
  assign instMem__T_215_addr = 7'h36;
  assign instMem__T_215_mask = 1'h1;
  assign instMem__T_215_en = 1'h1;
  assign instMem__T_218_data = 32'h0;
  assign instMem__T_218_addr = 7'h37;
  assign instMem__T_218_mask = 1'h1;
  assign instMem__T_218_en = 1'h1;
  assign instMem__T_221_data = 32'h0;
  assign instMem__T_221_addr = 7'h38;
  assign instMem__T_221_mask = 1'h1;
  assign instMem__T_221_en = 1'h1;
  assign instMem__T_224_data = 32'h0;
  assign instMem__T_224_addr = 7'h39;
  assign instMem__T_224_mask = 1'h1;
  assign instMem__T_224_en = 1'h1;
  assign instMem__T_227_data = 32'h0;
  assign instMem__T_227_addr = 7'h3a;
  assign instMem__T_227_mask = 1'h1;
  assign instMem__T_227_en = 1'h1;
  assign instMem__T_230_data = 32'h0;
  assign instMem__T_230_addr = 7'h3b;
  assign instMem__T_230_mask = 1'h1;
  assign instMem__T_230_en = 1'h1;
  assign instMem__T_233_data = 32'h0;
  assign instMem__T_233_addr = 7'h3c;
  assign instMem__T_233_mask = 1'h1;
  assign instMem__T_233_en = 1'h1;
  assign instMem__T_236_data = 32'h0;
  assign instMem__T_236_addr = 7'h3d;
  assign instMem__T_236_mask = 1'h1;
  assign instMem__T_236_en = 1'h1;
  assign instMem__T_239_data = 32'h0;
  assign instMem__T_239_addr = 7'h3e;
  assign instMem__T_239_mask = 1'h1;
  assign instMem__T_239_en = 1'h1;
  assign instMem__T_242_data = 32'h0;
  assign instMem__T_242_addr = 7'h3f;
  assign instMem__T_242_mask = 1'h1;
  assign instMem__T_242_en = 1'h1;
  assign instMem__T_245_data = 32'h0;
  assign instMem__T_245_addr = 7'h40;
  assign instMem__T_245_mask = 1'h1;
  assign instMem__T_245_en = 1'h1;
  assign counter_clock = clock;
  assign counter_reset = reset;
  assign counter_io_branch = _T_251;
  assign counter_io_pc_src = _T_258;
  assign decoder_io_inst = IF_ID_io_out_inst;
  assign control_io_ctrl_opcode = _T_261;
  assign control_io_ctrl_funct3 = _T_262;
  assign control_io_ctrl_funct7 = _T_263;
  assign regs_clock = clock;
  assign regs_io_rs_rs1 = decoder_io_rs_rs1;
  assign regs_io_rs_rs2 = decoder_io_rs_rs2;
  assign regs_io_reg_w = MEM_WB_io_out_WB_reg_w;
  assign regs_io_rd = MEM_WB_io_out_rd;
  assign regs_io_res = _T_280;
  assign alu_io_opcode = ID_EX_io_out_EX_opcode;
  assign alu_io_alu_op_func = ID_EX_io_out_EX_alu_op_func;
  assign alu_io_alu_op_alt = ID_EX_io_out_EX_alu_op_alt;
  assign alu_io_op_op1 = _T_269;
  assign alu_io_op_op2 = _T_278;
  assign dataMem_clock = clock;
  assign dataMem_io_mem_write = EX_MEM_io_out_MEM_write;
  assign dataMem_io_mem_read = EX_MEM_io_out_MEM_read;
  assign dataMem_io_mem_func = EX_MEM_io_out_MEM_func;
  assign dataMem_io_op_op1 = EX_MEM_io_out_op_op1;
  assign dataMem_io_op_op2 = EX_MEM_io_out_op_op2;
  assign fwdUnit_io_reg_w_mem = EX_MEM_io_out_WB_reg_w;
  assign fwdUnit_io_reg_w_wb = MEM_WB_io_out_WB_reg_w;
  assign fwdUnit_io_rs_rs1 = ID_EX_io_out_rs_rs1;
  assign fwdUnit_io_rs_rs2 = ID_EX_io_out_rs_rs2;
  assign fwdUnit_io_rd_mem = EX_MEM_io_out_rd;
  assign fwdUnit_io_rd_wb = MEM_WB_io_out_rd;
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_in = _GEN_1[7:0];
  assign IF_ID_clock = clock;
  assign IF_ID_io_in_pc_next = counter_io_pc_next;
  assign IF_ID_io_in_inst = instMem__T_260_data;
  assign ID_EX_clock = clock;
  assign ID_EX_io_in_WB_reg_w = control_io_WB_reg_w;
  assign ID_EX_io_in_WB_rd_mem = control_io_WB_rd_mem;
  assign ID_EX_io_in_MEM_write = control_io_MEM_write;
  assign ID_EX_io_in_MEM_read = control_io_MEM_read;
  assign ID_EX_io_in_MEM_func = control_io_MEM_func;
  assign ID_EX_io_in_EX_opcode = control_io_EX_opcode;
  assign ID_EX_io_in_EX_alu_sel = control_io_EX_alu_sel;
  assign ID_EX_io_in_EX_dst_sel = control_io_EX_dst_sel;
  assign ID_EX_io_in_EX_alu_op_func = control_io_EX_alu_op_func;
  assign ID_EX_io_in_EX_alu_op_alt = control_io_EX_alu_op_alt;
  assign ID_EX_io_in_op_op1 = regs_io_op_op1;
  assign ID_EX_io_in_op_op2 = regs_io_op_op2;
  assign ID_EX_io_in_rs_rs1 = decoder_io_rs_rs1;
  assign ID_EX_io_in_rs_rs2 = decoder_io_rs_rs2;
  assign ID_EX_io_in_rd = decoder_io_rd;
  assign ID_EX_io_in_imm = decoder_io_imm;
  assign ID_EX_io_in_pc_next = IF_ID_io_out_pc_next;
  assign EX_MEM_clock = clock;
  assign EX_MEM_io_in_WB_reg_w = ID_EX_io_out_WB_reg_w;
  assign EX_MEM_io_in_WB_rd_mem = ID_EX_io_out_WB_rd_mem;
  assign EX_MEM_io_in_MEM_write = ID_EX_io_out_MEM_write;
  assign EX_MEM_io_in_MEM_read = ID_EX_io_out_MEM_read;
  assign EX_MEM_io_in_MEM_func = ID_EX_io_out_MEM_func;
  assign EX_MEM_io_in_op_op1 = alu_io_res;
  assign EX_MEM_io_in_op_op2 = ID_EX_io_out_op_op2;
  assign EX_MEM_io_in_rd = _T_279;
  assign EX_MEM_io_in_pc_next = ID_EX_io_out_pc_next;
  assign MEM_WB_clock = clock;
  assign MEM_WB_io_in_WB_reg_w = EX_MEM_io_out_WB_reg_w;
  assign MEM_WB_io_in_WB_rd_mem = EX_MEM_io_out_WB_rd_mem;
  assign MEM_WB_io_in_alu_res = EX_MEM_io_out_op_op1;
  assign MEM_WB_io_in_mem_res = dataMem_io_res;
  assign MEM_WB_io_in_rd = EX_MEM_io_out_rd;
  assign _T_247 = regs_io_op_op1 == regs_io_op_op2;
  assign _T_248 = control_io_MEM_branch & _T_247;
  assign _T_250 = uart_io_valid == 1'h0;
  assign _T_251 = _T_248 | _T_250;
  assign _T_252 = IF_ID_io_out_pc_next + decoder_io_imm;
  assign _T_253 = _T_252[31:0];
  assign _T_255 = EX_MEM_io_out_pc_next - 32'h1;
  assign _T_256 = $unsigned(_T_255);
  assign _T_257 = _T_256[31:0];
  assign _T_258 = uart_io_valid ? _T_253 : _T_257;
  assign _T_259 = counter_io_pc[6:0];
  assign _T_261 = uart_io_valid ? decoder_io_ctrl_opcode : 7'h0;
  assign _T_262 = uart_io_valid ? decoder_io_ctrl_funct3 : 3'h0;
  assign _T_263 = uart_io_valid ? decoder_io_ctrl_funct7 : 7'h0;
  assign _T_264 = 2'h0 == fwdUnit_io_fwd_rs1;
  assign _T_265 = _T_264 ? ID_EX_io_out_op_op1 : 32'h0;
  assign _T_266 = 2'h1 == fwdUnit_io_fwd_rs1;
  assign _T_267 = _T_266 ? regs_io_res : _T_265;
  assign _T_268 = 2'h2 == fwdUnit_io_fwd_rs1;
  assign _T_269 = _T_268 ? EX_MEM_io_out_op_op1 : _T_267;
  assign _T_270 = ID_EX_io_out_EX_alu_sel ? ID_EX_io_out_imm : EX_MEM_io_out_op_op1;
  assign _T_271 = ID_EX_io_out_EX_alu_sel ? ID_EX_io_out_imm : regs_io_res;
  assign _T_272 = ID_EX_io_out_EX_alu_sel ? ID_EX_io_out_imm : ID_EX_io_out_op_op2;
  assign _T_273 = 2'h0 == fwdUnit_io_fwd_rs2;
  assign _T_274 = _T_273 ? _T_272 : 32'h0;
  assign _T_275 = 2'h1 == fwdUnit_io_fwd_rs2;
  assign _T_276 = _T_275 ? _T_271 : _T_274;
  assign _T_277 = 2'h2 == fwdUnit_io_fwd_rs2;
  assign _T_278 = _T_277 ? _T_270 : _T_276;
  assign _T_279 = ID_EX_io_out_EX_dst_sel ? ID_EX_io_out_rd : ID_EX_io_out_rs_rs2;
  assign _T_280 = MEM_WB_io_out_WB_rd_mem ? MEM_WB_io_out_mem_res : MEM_WB_io_out_alu_res;
  assign _T_282 = dataMem_io_op_op1 == 32'h401;
  assign _T_283 = EX_MEM_io_out_MEM_write & _T_282;
  assign _GEN_0 = dataMem_io_op_op2;
  assign _T_285 = _T_283 == 1'h0;
  assign _GEN_1 = _T_285 ? 32'h0 : _GEN_0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 65; initvar = initvar+1)
    instMem[initvar] = _GEN_6[31:0];
  `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _GEN_2 = _GEN_8[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _GEN_3 = _GEN_9[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _GEN_4 = _GEN_10[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _GEN_5 = _GEN_11[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(instMem__T_53_en & instMem__T_53_mask) begin
      instMem[instMem__T_53_addr] <= instMem__T_53_data;
    end
    if(instMem__T_56_en & instMem__T_56_mask) begin
      instMem[instMem__T_56_addr] <= instMem__T_56_data;
    end
    if(instMem__T_59_en & instMem__T_59_mask) begin
      instMem[instMem__T_59_addr] <= instMem__T_59_data;
    end
    if(instMem__T_62_en & instMem__T_62_mask) begin
      instMem[instMem__T_62_addr] <= instMem__T_62_data;
    end
    if(instMem__T_65_en & instMem__T_65_mask) begin
      instMem[instMem__T_65_addr] <= instMem__T_65_data;
    end
    if(instMem__T_68_en & instMem__T_68_mask) begin
      instMem[instMem__T_68_addr] <= instMem__T_68_data;
    end
    if(instMem__T_71_en & instMem__T_71_mask) begin
      instMem[instMem__T_71_addr] <= instMem__T_71_data;
    end
    if(instMem__T_74_en & instMem__T_74_mask) begin
      instMem[instMem__T_74_addr] <= instMem__T_74_data;
    end
    if(instMem__T_77_en & instMem__T_77_mask) begin
      instMem[instMem__T_77_addr] <= instMem__T_77_data;
    end
    if(instMem__T_80_en & instMem__T_80_mask) begin
      instMem[instMem__T_80_addr] <= instMem__T_80_data;
    end
    if(instMem__T_83_en & instMem__T_83_mask) begin
      instMem[instMem__T_83_addr] <= instMem__T_83_data;
    end
    if(instMem__T_86_en & instMem__T_86_mask) begin
      instMem[instMem__T_86_addr] <= instMem__T_86_data;
    end
    if(instMem__T_89_en & instMem__T_89_mask) begin
      instMem[instMem__T_89_addr] <= instMem__T_89_data;
    end
    if(instMem__T_92_en & instMem__T_92_mask) begin
      instMem[instMem__T_92_addr] <= instMem__T_92_data;
    end
    if(instMem__T_95_en & instMem__T_95_mask) begin
      instMem[instMem__T_95_addr] <= instMem__T_95_data;
    end
    if(instMem__T_98_en & instMem__T_98_mask) begin
      instMem[instMem__T_98_addr] <= instMem__T_98_data;
    end
    if(instMem__T_101_en & instMem__T_101_mask) begin
      instMem[instMem__T_101_addr] <= instMem__T_101_data;
    end
    if(instMem__T_104_en & instMem__T_104_mask) begin
      instMem[instMem__T_104_addr] <= instMem__T_104_data;
    end
    if(instMem__T_107_en & instMem__T_107_mask) begin
      instMem[instMem__T_107_addr] <= instMem__T_107_data;
    end
    if(instMem__T_110_en & instMem__T_110_mask) begin
      instMem[instMem__T_110_addr] <= instMem__T_110_data;
    end
    if(instMem__T_113_en & instMem__T_113_mask) begin
      instMem[instMem__T_113_addr] <= instMem__T_113_data;
    end
    if(instMem__T_116_en & instMem__T_116_mask) begin
      instMem[instMem__T_116_addr] <= instMem__T_116_data;
    end
    if(instMem__T_119_en & instMem__T_119_mask) begin
      instMem[instMem__T_119_addr] <= instMem__T_119_data;
    end
    if(instMem__T_122_en & instMem__T_122_mask) begin
      instMem[instMem__T_122_addr] <= instMem__T_122_data;
    end
    if(instMem__T_125_en & instMem__T_125_mask) begin
      instMem[instMem__T_125_addr] <= instMem__T_125_data;
    end
    if(instMem__T_128_en & instMem__T_128_mask) begin
      instMem[instMem__T_128_addr] <= instMem__T_128_data;
    end
    if(instMem__T_131_en & instMem__T_131_mask) begin
      instMem[instMem__T_131_addr] <= instMem__T_131_data;
    end
    if(instMem__T_134_en & instMem__T_134_mask) begin
      instMem[instMem__T_134_addr] <= instMem__T_134_data;
    end
    if(instMem__T_137_en & instMem__T_137_mask) begin
      instMem[instMem__T_137_addr] <= instMem__T_137_data;
    end
    if(instMem__T_140_en & instMem__T_140_mask) begin
      instMem[instMem__T_140_addr] <= instMem__T_140_data;
    end
    if(instMem__T_143_en & instMem__T_143_mask) begin
      instMem[instMem__T_143_addr] <= instMem__T_143_data;
    end
    if(instMem__T_146_en & instMem__T_146_mask) begin
      instMem[instMem__T_146_addr] <= instMem__T_146_data;
    end
    if(instMem__T_149_en & instMem__T_149_mask) begin
      instMem[instMem__T_149_addr] <= instMem__T_149_data;
    end
    if(instMem__T_152_en & instMem__T_152_mask) begin
      instMem[instMem__T_152_addr] <= instMem__T_152_data;
    end
    if(instMem__T_155_en & instMem__T_155_mask) begin
      instMem[instMem__T_155_addr] <= instMem__T_155_data;
    end
    if(instMem__T_158_en & instMem__T_158_mask) begin
      instMem[instMem__T_158_addr] <= instMem__T_158_data;
    end
    if(instMem__T_161_en & instMem__T_161_mask) begin
      instMem[instMem__T_161_addr] <= instMem__T_161_data;
    end
    if(instMem__T_164_en & instMem__T_164_mask) begin
      instMem[instMem__T_164_addr] <= instMem__T_164_data;
    end
    if(instMem__T_167_en & instMem__T_167_mask) begin
      instMem[instMem__T_167_addr] <= instMem__T_167_data;
    end
    if(instMem__T_170_en & instMem__T_170_mask) begin
      instMem[instMem__T_170_addr] <= instMem__T_170_data;
    end
    if(instMem__T_173_en & instMem__T_173_mask) begin
      instMem[instMem__T_173_addr] <= instMem__T_173_data;
    end
    if(instMem__T_176_en & instMem__T_176_mask) begin
      instMem[instMem__T_176_addr] <= instMem__T_176_data;
    end
    if(instMem__T_179_en & instMem__T_179_mask) begin
      instMem[instMem__T_179_addr] <= instMem__T_179_data;
    end
    if(instMem__T_182_en & instMem__T_182_mask) begin
      instMem[instMem__T_182_addr] <= instMem__T_182_data;
    end
    if(instMem__T_185_en & instMem__T_185_mask) begin
      instMem[instMem__T_185_addr] <= instMem__T_185_data;
    end
    if(instMem__T_188_en & instMem__T_188_mask) begin
      instMem[instMem__T_188_addr] <= instMem__T_188_data;
    end
    if(instMem__T_191_en & instMem__T_191_mask) begin
      instMem[instMem__T_191_addr] <= instMem__T_191_data;
    end
    if(instMem__T_194_en & instMem__T_194_mask) begin
      instMem[instMem__T_194_addr] <= instMem__T_194_data;
    end
    if(instMem__T_197_en & instMem__T_197_mask) begin
      instMem[instMem__T_197_addr] <= instMem__T_197_data;
    end
    if(instMem__T_200_en & instMem__T_200_mask) begin
      instMem[instMem__T_200_addr] <= instMem__T_200_data;
    end
    if(instMem__T_203_en & instMem__T_203_mask) begin
      instMem[instMem__T_203_addr] <= instMem__T_203_data;
    end
    if(instMem__T_206_en & instMem__T_206_mask) begin
      instMem[instMem__T_206_addr] <= instMem__T_206_data;
    end
    if(instMem__T_209_en & instMem__T_209_mask) begin
      instMem[instMem__T_209_addr] <= instMem__T_209_data;
    end
    if(instMem__T_212_en & instMem__T_212_mask) begin
      instMem[instMem__T_212_addr] <= instMem__T_212_data;
    end
    if(instMem__T_215_en & instMem__T_215_mask) begin
      instMem[instMem__T_215_addr] <= instMem__T_215_data;
    end
    if(instMem__T_218_en & instMem__T_218_mask) begin
      instMem[instMem__T_218_addr] <= instMem__T_218_data;
    end
    if(instMem__T_221_en & instMem__T_221_mask) begin
      instMem[instMem__T_221_addr] <= instMem__T_221_data;
    end
    if(instMem__T_224_en & instMem__T_224_mask) begin
      instMem[instMem__T_224_addr] <= instMem__T_224_data;
    end
    if(instMem__T_227_en & instMem__T_227_mask) begin
      instMem[instMem__T_227_addr] <= instMem__T_227_data;
    end
    if(instMem__T_230_en & instMem__T_230_mask) begin
      instMem[instMem__T_230_addr] <= instMem__T_230_data;
    end
    if(instMem__T_233_en & instMem__T_233_mask) begin
      instMem[instMem__T_233_addr] <= instMem__T_233_data;
    end
    if(instMem__T_236_en & instMem__T_236_mask) begin
      instMem[instMem__T_236_addr] <= instMem__T_236_data;
    end
    if(instMem__T_239_en & instMem__T_239_mask) begin
      instMem[instMem__T_239_addr] <= instMem__T_239_data;
    end
    if(instMem__T_242_en & instMem__T_242_mask) begin
      instMem[instMem__T_242_addr] <= instMem__T_242_data;
    end
    if(instMem__T_245_en & instMem__T_245_mask) begin
      instMem[instMem__T_245_addr] <= instMem__T_245_data;
    end
  end
endmodule
