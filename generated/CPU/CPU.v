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
  wire [32:0] _T_9;
  wire [31:0] _T_10;
  wire [31:0] _T_11;
  assign io_pc_next = _T_10;
  assign io_pc = pc_reg;
  assign _T_9 = pc_reg + 32'h1;
  assign _T_10 = _T_9[31:0];
  assign _T_11 = io_branch ? io_pc_src : io_pc_next;
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
      pc_reg <= 32'h0;
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
  output [4:0]  io_sel_rs_rs1,
  output [4:0]  io_sel_rs_rs2,
  output [4:0]  io_sel_rd,
  output [11:0] io_imm_I,
  output [11:0] io_imm_S,
  output [11:0] io_imm_SB
);
  wire [6:0] _T_28;
  wire [4:0] _T_29;
  wire [2:0] _T_30;
  wire [4:0] _T_31;
  wire [4:0] _T_32;
  wire [6:0] _T_33;
  wire [11:0] _T_34;
  wire [11:0] _T_38;
  wire  _T_39;
  wire  _T_40;
  wire [5:0] _T_41;
  wire [3:0] _T_42;
  wire [9:0] _T_43;
  wire [1:0] _T_44;
  wire [11:0] _T_45;
  assign io_ctrl_opcode = _T_28;
  assign io_ctrl_funct3 = _T_30;
  assign io_ctrl_funct7 = _T_33;
  assign io_sel_rs_rs1 = _T_31;
  assign io_sel_rs_rs2 = _T_32;
  assign io_sel_rd = _T_29;
  assign io_imm_I = _T_34;
  assign io_imm_S = _T_38;
  assign io_imm_SB = _T_45;
  assign _T_28 = io_inst[6:0];
  assign _T_29 = io_inst[11:7];
  assign _T_30 = io_inst[14:12];
  assign _T_31 = io_inst[19:15];
  assign _T_32 = io_inst[24:20];
  assign _T_33 = io_inst[31:25];
  assign _T_34 = io_inst[31:20];
  assign _T_38 = {_T_33,_T_29};
  assign _T_39 = io_inst[31];
  assign _T_40 = io_inst[7];
  assign _T_41 = io_inst[30:25];
  assign _T_42 = io_inst[11:8];
  assign _T_43 = {_T_41,_T_42};
  assign _T_44 = {_T_39,_T_40};
  assign _T_45 = {_T_44,_T_43};
endmodule
module Control(
  input  [6:0] io_ctrl_opcode,
  input  [2:0] io_ctrl_funct3,
  input  [6:0] io_ctrl_funct7,
  output       io_WB_regWrite,
  output       io_WB_memToReg,
  output       io_MEM_branch,
  output       io_MEM_write,
  output       io_MEM_read,
  output [6:0] io_EX_opcode,
  output       io_EX_alu_sel,
  output       io_EX_dst_sel,
  output [2:0] io_EX_aluOp_func,
  output       io_EX_aluOp_alt
);
  wire  _T_30;
  wire  _T_31;
  wire  _T_32;
  wire  _T_34;
  wire  _T_35;
  wire  _T_37;
  wire [6:0] funct7;
  wire  _T_39;
  wire  _T_41;
  wire  _T_44;
  wire  _T_45;
  wire  _T_47;
  assign io_WB_regWrite = _T_47;
  assign io_WB_memToReg = io_MEM_read;
  assign io_MEM_branch = _T_30;
  assign io_MEM_write = _T_41;
  assign io_MEM_read = _T_35;
  assign io_EX_opcode = io_ctrl_opcode;
  assign io_EX_alu_sel = _T_34;
  assign io_EX_dst_sel = _T_37;
  assign io_EX_aluOp_func = io_ctrl_funct3;
  assign io_EX_aluOp_alt = _T_39;
  assign _T_30 = io_ctrl_opcode == 7'h63;
  assign _T_31 = io_ctrl_opcode == 7'h33;
  assign _T_32 = _T_30 | _T_31;
  assign _T_34 = _T_32 == 1'h0;
  assign _T_35 = io_ctrl_opcode == 7'h3;
  assign _T_37 = _T_35 == 1'h0;
  assign funct7 = io_EX_alu_sel ? 7'h0 : io_ctrl_funct7;
  assign _T_39 = funct7 == 7'h20;
  assign _T_41 = io_ctrl_opcode == 7'h23;
  assign _T_44 = io_ctrl_opcode == 7'h13;
  assign _T_45 = _T_31 | _T_44;
  assign _T_47 = _T_45 | _T_35;
endmodule
module Registers(
  input         clock,
  input  [4:0]  io_sel_rs_rs1,
  input  [4:0]  io_sel_rs_rs2,
  input  [4:0]  io_sel_rd,
  output [31:0] io_reg_rs_rs1,
  output [31:0] io_reg_rs_rs2,
  input  [31:0] io_reg_rd,
  input         io_regWrite
);
  reg [31:0] x [0:31];
  reg [31:0] _GEN_0;
  wire [31:0] x__T_22_data;
  wire [4:0] x__T_22_addr;
  wire [31:0] x__T_24_data;
  wire [4:0] x__T_24_addr;
  wire [31:0] x__T_15_data;
  wire [4:0] x__T_15_addr;
  wire  x__T_15_mask;
  wire  x__T_15_en;
  wire  _T_16;
  wire  _T_17;
  wire  _T_18;
  wire  fwd_rs1;
  wire  _T_21;
  wire  fwd_rs2;
  wire [31:0] _T_23;
  wire [31:0] _T_25;
  assign io_reg_rs_rs1 = _T_23;
  assign io_reg_rs_rs2 = _T_25;
  assign x__T_22_addr = io_sel_rs_rs1;
  assign x__T_22_data = x[x__T_22_addr];
  assign x__T_24_addr = io_sel_rs_rs2;
  assign x__T_24_data = x[x__T_24_addr];
  assign x__T_15_data = io_reg_rd;
  assign x__T_15_addr = io_sel_rd;
  assign x__T_15_mask = io_regWrite;
  assign x__T_15_en = io_regWrite;
  assign _T_16 = io_reg_rd != 32'h0;
  assign _T_17 = io_regWrite & _T_16;
  assign _T_18 = io_sel_rd == io_sel_rs_rs1;
  assign fwd_rs1 = _T_17 & _T_18;
  assign _T_21 = io_sel_rd == io_sel_rs_rs2;
  assign fwd_rs2 = _T_17 & _T_21;
  assign _T_23 = fwd_rs1 ? io_reg_rd : x__T_22_data;
  assign _T_25 = fwd_rs2 ? io_reg_rd : x__T_24_data;
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
  end
endmodule
module ALU(
  input  [2:0]  io_aluOp_func,
  input         io_aluOp_alt,
  input  [31:0] io_reg_rs_rs1,
  input  [31:0] io_reg_rs_rs2,
  output [31:0] io_reg_rd,
  input  [6:0]  io_opcode,
  output        io_zero
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
  wire  _T_59;
  wire [31:0] _T_60;
  wire  _T_61;
  wire [31:0] _T_62;
  wire  _T_63;
  wire [31:0] _T_64;
  wire  _T_65;
  wire [62:0] _T_66;
  wire  _T_67;
  wire [62:0] _T_68;
  wire  _T_69;
  reg  _GEN_1;
  reg [31:0] _GEN_2;
  assign io_reg_rd = _T_68[31:0];
  assign io_zero = _T_69;
  assign shamt = io_reg_rs_rs2[4:0];
  assign _T_10 = io_reg_rs_rs1 - io_reg_rs_rs2;
  assign _T_11 = $unsigned(_T_10);
  assign _T_12 = _T_11[31:0];
  assign _T_13 = io_reg_rs_rs1 + io_reg_rs_rs2;
  assign _T_14 = _T_13[31:0];
  assign _T_15 = io_aluOp_alt ? _T_12 : _T_14;
  assign _GEN_0 = {{31'd0}, io_reg_rs_rs1};
  assign _T_16 = _GEN_0 << shamt;
  assign _T_17 = io_reg_rs_rs1 < io_reg_rs_rs2;
  assign _T_18 = io_reg_rs_rs1 ^ io_reg_rs_rs2;
  assign _T_19 = io_reg_rs_rs1 >> shamt;
  assign _T_20 = io_aluOp_alt ? 32'h0 : _T_19;
  assign _T_21 = io_reg_rs_rs1 | io_reg_rs_rs2;
  assign _T_22 = 3'h6 == io_aluOp_func;
  assign _T_23 = _T_22 ? _T_21 : 32'h0;
  assign _T_24 = 3'h5 == io_aluOp_func;
  assign _T_25 = _T_24 ? _T_20 : _T_23;
  assign _T_26 = 3'h4 == io_aluOp_func;
  assign _T_27 = _T_26 ? _T_18 : _T_25;
  assign _T_28 = 3'h3 == io_aluOp_func;
  assign _T_29 = _T_28 ? {{31'd0}, _T_17} : _T_27;
  assign _T_30 = 3'h1 == io_aluOp_func;
  assign _T_31 = _T_30 ? _T_16 : {{31'd0}, _T_29};
  assign _T_32 = 3'h0 == io_aluOp_func;
  assign _T_33 = _T_32 ? {{31'd0}, _T_15} : _T_31;
  assign _T_53 = _T_32 ? {{31'd0}, _T_14} : _T_31;
  assign _T_59 = 7'h63 == io_opcode;
  assign _T_60 = _T_59 ? _T_12 : 32'h0;
  assign _T_61 = 7'h23 == io_opcode;
  assign _T_62 = _T_61 ? io_reg_rs_rs1 : _T_60;
  assign _T_63 = 7'h3 == io_opcode;
  assign _T_64 = _T_63 ? _T_14 : _T_62;
  assign _T_65 = 7'h13 == io_opcode;
  assign _T_66 = _T_65 ? _T_53 : {{31'd0}, _T_64};
  assign _T_67 = 7'h33 == io_opcode;
  assign _T_68 = _T_67 ? _T_33 : _T_66;
  assign _T_69 = io_reg_rd == 32'h0;
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
  output [31:0] io_reg_rd
);
  reg [31:0] _GEN_0;
  reg [31:0] _GEN_1;
  assign io_reg_rd = _GEN_0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _GEN_0 = _GEN_1[31:0];
  `endif
  end
`endif
endmodule
module ForwardingUnit(
  input        io_regWrite_exMem,
  input        io_regWrite_memWb,
  input  [4:0] io_sel_rs1,
  input  [4:0] io_sel_rs2,
  input  [4:0] io_dst_exMem,
  input  [4:0] io_dst_memWb,
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
  assign _T_10 = io_dst_exMem != 5'h0;
  assign _T_11 = io_regWrite_exMem & _T_10;
  assign _T_12 = io_dst_exMem == io_sel_rs1;
  assign _T_13 = _T_11 & _T_12;
  assign _T_14 = io_dst_memWb != 5'h0;
  assign _T_15 = io_regWrite_memWb & _T_14;
  assign _T_16 = io_dst_memWb == io_sel_rs1;
  assign _T_17 = _T_15 & _T_16;
  assign _T_19 = _T_13 == 1'h0;
  assign _T_20 = _T_19 & _T_17;
  assign _GEN_1 = _T_20 ? 2'h1 : 2'h2;
  assign _T_24 = _T_17 == 1'h0;
  assign _T_25 = _T_19 & _T_24;
  assign _GEN_2 = _T_25 ? 2'h0 : _GEN_1;
  assign _T_28 = io_dst_exMem == io_sel_rs2;
  assign _T_29 = _T_11 & _T_28;
  assign _T_32 = io_dst_memWb == io_sel_rs2;
  assign _T_33 = _T_15 & _T_32;
  assign _T_35 = _T_29 == 1'h0;
  assign _T_36 = _T_35 & _T_33;
  assign _GEN_4 = _T_36 ? 2'h1 : 2'h2;
  assign _T_40 = _T_33 == 1'h0;
  assign _T_41 = _T_35 & _T_40;
  assign _GEN_5 = _T_41 ? 2'h0 : _GEN_4;
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
  input         io_in_WB_regWrite,
  input         io_in_WB_memToReg,
  input         io_in_MEM_write,
  input         io_in_MEM_read,
  input  [6:0]  io_in_EX_opcode,
  input         io_in_EX_alu_sel,
  input         io_in_EX_dst_sel,
  input  [2:0]  io_in_EX_aluOp_func,
  input         io_in_EX_aluOp_alt,
  input  [31:0] io_in_rs_rs1,
  input  [31:0] io_in_rs_rs2,
  input  [4:0]  io_in_sel_rs_rs1,
  input  [4:0]  io_in_sel_rs_rs2,
  input  [4:0]  io_in_sel_rd,
  input  [31:0] io_in_imm,
  output        io_out_WB_regWrite,
  output        io_out_WB_memToReg,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output [6:0]  io_out_EX_opcode,
  output        io_out_EX_alu_sel,
  output        io_out_EX_dst_sel,
  output [2:0]  io_out_EX_aluOp_func,
  output        io_out_EX_aluOp_alt,
  output [31:0] io_out_rs_rs1,
  output [31:0] io_out_rs_rs2,
  output [4:0]  io_out_sel_rs_rs1,
  output [4:0]  io_out_sel_rs_rs2,
  output [4:0]  io_out_sel_rd,
  output [31:0] io_out_imm
);
  reg  _T_76_WB_regWrite;
  reg [31:0] _GEN_0;
  reg  _T_76_WB_memToReg;
  reg [31:0] _GEN_1;
  reg  _T_76_MEM_write;
  reg [31:0] _GEN_2;
  reg  _T_76_MEM_read;
  reg [31:0] _GEN_3;
  reg [6:0] _T_76_EX_opcode;
  reg [31:0] _GEN_4;
  reg  _T_76_EX_alu_sel;
  reg [31:0] _GEN_5;
  reg  _T_76_EX_dst_sel;
  reg [31:0] _GEN_6;
  reg [2:0] _T_76_EX_aluOp_func;
  reg [31:0] _GEN_7;
  reg  _T_76_EX_aluOp_alt;
  reg [31:0] _GEN_8;
  reg [31:0] _T_76_rs_rs1;
  reg [31:0] _GEN_9;
  reg [31:0] _T_76_rs_rs2;
  reg [31:0] _GEN_10;
  reg [4:0] _T_76_sel_rs_rs1;
  reg [31:0] _GEN_11;
  reg [4:0] _T_76_sel_rs_rs2;
  reg [31:0] _GEN_12;
  reg [4:0] _T_76_sel_rd;
  reg [31:0] _GEN_13;
  reg [31:0] _T_76_imm;
  reg [31:0] _GEN_14;
  assign io_out_WB_regWrite = _T_76_WB_regWrite;
  assign io_out_WB_memToReg = _T_76_WB_memToReg;
  assign io_out_MEM_write = _T_76_MEM_write;
  assign io_out_MEM_read = _T_76_MEM_read;
  assign io_out_EX_opcode = _T_76_EX_opcode;
  assign io_out_EX_alu_sel = _T_76_EX_alu_sel;
  assign io_out_EX_dst_sel = _T_76_EX_dst_sel;
  assign io_out_EX_aluOp_func = _T_76_EX_aluOp_func;
  assign io_out_EX_aluOp_alt = _T_76_EX_aluOp_alt;
  assign io_out_rs_rs1 = _T_76_rs_rs1;
  assign io_out_rs_rs2 = _T_76_rs_rs2;
  assign io_out_sel_rs_rs1 = _T_76_sel_rs_rs1;
  assign io_out_sel_rs_rs2 = _T_76_sel_rs_rs2;
  assign io_out_sel_rd = _T_76_sel_rd;
  assign io_out_imm = _T_76_imm;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_76_WB_regWrite = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_76_WB_memToReg = _GEN_1[0:0];
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
  _T_76_EX_opcode = _GEN_4[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_76_EX_alu_sel = _GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  _T_76_EX_dst_sel = _GEN_6[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_76_EX_aluOp_func = _GEN_7[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _T_76_EX_aluOp_alt = _GEN_8[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _T_76_rs_rs1 = _GEN_9[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _T_76_rs_rs2 = _GEN_10[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _T_76_sel_rs_rs1 = _GEN_11[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _T_76_sel_rs_rs2 = _GEN_12[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  _T_76_sel_rd = _GEN_13[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  _T_76_imm = _GEN_14[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_76_WB_regWrite <= io_in_WB_regWrite;
    _T_76_WB_memToReg <= io_in_WB_memToReg;
    _T_76_MEM_write <= io_in_MEM_write;
    _T_76_MEM_read <= io_in_MEM_read;
    _T_76_EX_opcode <= io_in_EX_opcode;
    _T_76_EX_alu_sel <= io_in_EX_alu_sel;
    _T_76_EX_dst_sel <= io_in_EX_dst_sel;
    _T_76_EX_aluOp_func <= io_in_EX_aluOp_func;
    _T_76_EX_aluOp_alt <= io_in_EX_aluOp_alt;
    _T_76_rs_rs1 <= io_in_rs_rs1;
    _T_76_rs_rs2 <= io_in_rs_rs2;
    _T_76_sel_rs_rs1 <= io_in_sel_rs_rs1;
    _T_76_sel_rs_rs2 <= io_in_sel_rs_rs2;
    _T_76_sel_rd <= io_in_sel_rd;
    _T_76_imm <= io_in_imm;
  end
endmodule
module PipelineEX_MEM(
  input         clock,
  input         io_in_WB_regWrite,
  input         io_in_WB_memToReg,
  input         io_in_MEM_write,
  input         io_in_MEM_read,
  input         io_in_zero,
  input  [31:0] io_in_aluRes,
  input  [31:0] io_in_op2,
  input  [4:0]  io_in_dst,
  output        io_out_WB_regWrite,
  output        io_out_WB_memToReg,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output        io_out_zero,
  output [31:0] io_out_aluRes,
  output [31:0] io_out_op2,
  output [4:0]  io_out_dst
);
  reg  _T_48_WB_regWrite;
  reg [31:0] _GEN_0;
  reg  _T_48_WB_memToReg;
  reg [31:0] _GEN_1;
  reg  _T_48_MEM_write;
  reg [31:0] _GEN_2;
  reg  _T_48_MEM_read;
  reg [31:0] _GEN_3;
  reg  _T_48_zero;
  reg [31:0] _GEN_4;
  reg [31:0] _T_48_aluRes;
  reg [31:0] _GEN_5;
  reg [31:0] _T_48_op2;
  reg [31:0] _GEN_6;
  reg [4:0] _T_48_dst;
  reg [31:0] _GEN_7;
  assign io_out_WB_regWrite = _T_48_WB_regWrite;
  assign io_out_WB_memToReg = _T_48_WB_memToReg;
  assign io_out_MEM_write = _T_48_MEM_write;
  assign io_out_MEM_read = _T_48_MEM_read;
  assign io_out_zero = _T_48_zero;
  assign io_out_aluRes = _T_48_aluRes;
  assign io_out_op2 = _T_48_op2;
  assign io_out_dst = _T_48_dst;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_48_WB_regWrite = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_48_WB_memToReg = _GEN_1[0:0];
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
  _T_48_zero = _GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_48_aluRes = _GEN_5[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  _T_48_op2 = _GEN_6[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_48_dst = _GEN_7[4:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_48_WB_regWrite <= io_in_WB_regWrite;
    _T_48_WB_memToReg <= io_in_WB_memToReg;
    _T_48_MEM_write <= io_in_MEM_write;
    _T_48_MEM_read <= io_in_MEM_read;
    _T_48_zero <= io_in_zero;
    _T_48_aluRes <= io_in_aluRes;
    _T_48_op2 <= io_in_op2;
    _T_48_dst <= io_in_dst;
  end
endmodule
module PipelineMEM_WB(
  input         clock,
  input         io_in_WB_regWrite,
  input         io_in_WB_memToReg,
  input  [31:0] io_in_rd_alu,
  input  [31:0] io_in_rd_mem,
  input  [4:0]  io_in_dst,
  output        io_out_WB_regWrite,
  output        io_out_WB_memToReg,
  output [31:0] io_out_rd_alu,
  output [31:0] io_out_rd_mem,
  output [4:0]  io_out_dst
);
  reg  _T_24_WB_regWrite;
  reg [31:0] _GEN_0;
  reg  _T_24_WB_memToReg;
  reg [31:0] _GEN_1;
  reg [31:0] _T_24_rd_alu;
  reg [31:0] _GEN_2;
  reg [31:0] _T_24_rd_mem;
  reg [31:0] _GEN_3;
  reg [4:0] _T_24_dst;
  reg [31:0] _GEN_4;
  assign io_out_WB_regWrite = _T_24_WB_regWrite;
  assign io_out_WB_memToReg = _T_24_WB_memToReg;
  assign io_out_rd_alu = _T_24_rd_alu;
  assign io_out_rd_mem = _T_24_rd_mem;
  assign io_out_dst = _T_24_dst;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_24_WB_regWrite = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_24_WB_memToReg = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_24_rd_alu = _GEN_2[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_24_rd_mem = _GEN_3[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_24_dst = _GEN_4[4:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_24_WB_regWrite <= io_in_WB_regWrite;
    _T_24_WB_memToReg <= io_in_WB_memToReg;
    _T_24_rd_alu <= io_in_rd_alu;
    _T_24_rd_mem <= io_in_rd_mem;
    _T_24_dst <= io_in_dst;
  end
endmodule
module CPU(
  input         clock,
  input         reset,
  output        io_branch,
  output [31:0] io_pc,
  output [31:0] io_pc_next,
  output [31:0] io_inst,
  output [31:0] io_opcode,
  output [31:0] io_imm_i,
  output [31:0] io_imm_sb,
  output        io_alu_sel,
  output [1:0]  io_fwd_rs1,
  output [1:0]  io_fwd_rs2,
  output [31:0] io_rs1,
  output [31:0] io_rs2,
  output [31:0] io_alu_src,
  output [31:0] io_op1,
  output [31:0] io_op2,
  output [31:0] io_rd_exMem,
  output [31:0] io_rd_memWb,
  output        io_zero,
  output [31:0] io_alu_res,
  output [31:0] io_rs1_ifId,
  output [31:0] io_rs2_ifId,
  output [4:0]  io_rd_sel,
  output [4:0]  io_sel_rs1,
  output [4:0]  io_sel_rs2,
  output [4:0]  io_dst_exMem,
  output [4:0]  io_dst_memWb,
  output        io_regWrite_exMem,
  output        io_regWrite_memWb,
  output        io_memRead,
  output        io_memWrite,
  output [31:0] io_memRes,
  output [31:0] io_wData
);
  reg [31:0] instMem [0:14];
  reg [31:0] _GEN_7;
  wire [31:0] instMem__T_124_data;
  wire [3:0] instMem__T_124_addr;
  reg [31:0] _GEN_8;
  wire [31:0] instMem__T_147_data;
  wire [3:0] instMem__T_147_addr;
  reg [31:0] _GEN_9;
  wire [31:0] instMem__T_79_data;
  wire [3:0] instMem__T_79_addr;
  wire  instMem__T_79_mask;
  wire  instMem__T_79_en;
  wire [31:0] instMem__T_82_data;
  wire [3:0] instMem__T_82_addr;
  wire  instMem__T_82_mask;
  wire  instMem__T_82_en;
  wire [31:0] instMem__T_85_data;
  wire [3:0] instMem__T_85_addr;
  wire  instMem__T_85_mask;
  wire  instMem__T_85_en;
  wire [31:0] instMem__T_88_data;
  wire [3:0] instMem__T_88_addr;
  wire  instMem__T_88_mask;
  wire  instMem__T_88_en;
  wire [31:0] instMem__T_91_data;
  wire [3:0] instMem__T_91_addr;
  wire  instMem__T_91_mask;
  wire  instMem__T_91_en;
  wire [31:0] instMem__T_94_data;
  wire [3:0] instMem__T_94_addr;
  wire  instMem__T_94_mask;
  wire  instMem__T_94_en;
  wire [31:0] instMem__T_97_data;
  wire [3:0] instMem__T_97_addr;
  wire  instMem__T_97_mask;
  wire  instMem__T_97_en;
  wire [31:0] instMem__T_100_data;
  wire [3:0] instMem__T_100_addr;
  wire  instMem__T_100_mask;
  wire  instMem__T_100_en;
  wire [31:0] instMem__T_103_data;
  wire [3:0] instMem__T_103_addr;
  wire  instMem__T_103_mask;
  wire  instMem__T_103_en;
  wire [31:0] instMem__T_106_data;
  wire [3:0] instMem__T_106_addr;
  wire  instMem__T_106_mask;
  wire  instMem__T_106_en;
  wire [31:0] instMem__T_109_data;
  wire [3:0] instMem__T_109_addr;
  wire  instMem__T_109_mask;
  wire  instMem__T_109_en;
  wire [31:0] instMem__T_112_data;
  wire [3:0] instMem__T_112_addr;
  wire  instMem__T_112_mask;
  wire  instMem__T_112_en;
  wire [31:0] instMem__T_115_data;
  wire [3:0] instMem__T_115_addr;
  wire  instMem__T_115_mask;
  wire  instMem__T_115_en;
  wire [31:0] instMem__T_118_data;
  wire [3:0] instMem__T_118_addr;
  wire  instMem__T_118_mask;
  wire  instMem__T_118_en;
  wire [31:0] instMem__T_121_data;
  wire [3:0] instMem__T_121_addr;
  wire  instMem__T_121_mask;
  wire  instMem__T_121_en;
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
  wire [4:0] decoder_io_sel_rs_rs1;
  wire [4:0] decoder_io_sel_rs_rs2;
  wire [4:0] decoder_io_sel_rd;
  wire [11:0] decoder_io_imm_I;
  wire [11:0] decoder_io_imm_S;
  wire [11:0] decoder_io_imm_SB;
  wire [6:0] control_io_ctrl_opcode;
  wire [2:0] control_io_ctrl_funct3;
  wire [6:0] control_io_ctrl_funct7;
  wire  control_io_WB_regWrite;
  wire  control_io_WB_memToReg;
  wire  control_io_MEM_branch;
  wire  control_io_MEM_write;
  wire  control_io_MEM_read;
  wire [6:0] control_io_EX_opcode;
  wire  control_io_EX_alu_sel;
  wire  control_io_EX_dst_sel;
  wire [2:0] control_io_EX_aluOp_func;
  wire  control_io_EX_aluOp_alt;
  wire  regs_clock;
  wire [4:0] regs_io_sel_rs_rs1;
  wire [4:0] regs_io_sel_rs_rs2;
  wire [4:0] regs_io_sel_rd;
  wire [31:0] regs_io_reg_rs_rs1;
  wire [31:0] regs_io_reg_rs_rs2;
  wire [31:0] regs_io_reg_rd;
  wire  regs_io_regWrite;
  wire [2:0] alu_io_aluOp_func;
  wire  alu_io_aluOp_alt;
  wire [31:0] alu_io_reg_rs_rs1;
  wire [31:0] alu_io_reg_rs_rs2;
  wire [31:0] alu_io_reg_rd;
  wire [6:0] alu_io_opcode;
  wire  alu_io_zero;
  wire [31:0] dataMem_io_reg_rd;
  wire  fwdUnit_io_regWrite_exMem;
  wire  fwdUnit_io_regWrite_memWb;
  wire [4:0] fwdUnit_io_sel_rs1;
  wire [4:0] fwdUnit_io_sel_rs2;
  wire [4:0] fwdUnit_io_dst_exMem;
  wire [4:0] fwdUnit_io_dst_memWb;
  wire [1:0] fwdUnit_io_fwd_rs1;
  wire [1:0] fwdUnit_io_fwd_rs2;
  wire  IF_ID_clock;
  wire [31:0] IF_ID_io_in_pc_next;
  wire [31:0] IF_ID_io_in_inst;
  wire [31:0] IF_ID_io_out_pc_next;
  wire [31:0] IF_ID_io_out_inst;
  wire  ID_EX_clock;
  wire  ID_EX_io_in_WB_regWrite;
  wire  ID_EX_io_in_WB_memToReg;
  wire  ID_EX_io_in_MEM_write;
  wire  ID_EX_io_in_MEM_read;
  wire [6:0] ID_EX_io_in_EX_opcode;
  wire  ID_EX_io_in_EX_alu_sel;
  wire  ID_EX_io_in_EX_dst_sel;
  wire [2:0] ID_EX_io_in_EX_aluOp_func;
  wire  ID_EX_io_in_EX_aluOp_alt;
  wire [31:0] ID_EX_io_in_rs_rs1;
  wire [31:0] ID_EX_io_in_rs_rs2;
  wire [4:0] ID_EX_io_in_sel_rs_rs1;
  wire [4:0] ID_EX_io_in_sel_rs_rs2;
  wire [4:0] ID_EX_io_in_sel_rd;
  wire [31:0] ID_EX_io_in_imm;
  wire  ID_EX_io_out_WB_regWrite;
  wire  ID_EX_io_out_WB_memToReg;
  wire  ID_EX_io_out_MEM_write;
  wire  ID_EX_io_out_MEM_read;
  wire [6:0] ID_EX_io_out_EX_opcode;
  wire  ID_EX_io_out_EX_alu_sel;
  wire  ID_EX_io_out_EX_dst_sel;
  wire [2:0] ID_EX_io_out_EX_aluOp_func;
  wire  ID_EX_io_out_EX_aluOp_alt;
  wire [31:0] ID_EX_io_out_rs_rs1;
  wire [31:0] ID_EX_io_out_rs_rs2;
  wire [4:0] ID_EX_io_out_sel_rs_rs1;
  wire [4:0] ID_EX_io_out_sel_rs_rs2;
  wire [4:0] ID_EX_io_out_sel_rd;
  wire [31:0] ID_EX_io_out_imm;
  wire  EX_MEM_clock;
  wire  EX_MEM_io_in_WB_regWrite;
  wire  EX_MEM_io_in_WB_memToReg;
  wire  EX_MEM_io_in_MEM_write;
  wire  EX_MEM_io_in_MEM_read;
  wire  EX_MEM_io_in_zero;
  wire [31:0] EX_MEM_io_in_aluRes;
  wire [31:0] EX_MEM_io_in_op2;
  wire [4:0] EX_MEM_io_in_dst;
  wire  EX_MEM_io_out_WB_regWrite;
  wire  EX_MEM_io_out_WB_memToReg;
  wire  EX_MEM_io_out_MEM_write;
  wire  EX_MEM_io_out_MEM_read;
  wire  EX_MEM_io_out_zero;
  wire [31:0] EX_MEM_io_out_aluRes;
  wire [31:0] EX_MEM_io_out_op2;
  wire [4:0] EX_MEM_io_out_dst;
  wire  MEM_WB_clock;
  wire  MEM_WB_io_in_WB_regWrite;
  wire  MEM_WB_io_in_WB_memToReg;
  wire [31:0] MEM_WB_io_in_rd_alu;
  wire [31:0] MEM_WB_io_in_rd_mem;
  wire [4:0] MEM_WB_io_in_dst;
  wire  MEM_WB_io_out_WB_regWrite;
  wire  MEM_WB_io_out_WB_memToReg;
  wire [31:0] MEM_WB_io_out_rd_alu;
  wire [31:0] MEM_WB_io_out_rd_mem;
  wire [4:0] MEM_WB_io_out_dst;
  wire [3:0] _T_123;
  wire  _T_125;
  wire  _T_126;
  wire [31:0] _GEN_64;
  wire [32:0] _T_127;
  wire [31:0] _T_128;
  wire [11:0] _T_129;
  wire  _T_130;
  wire [31:0] _T_131;
  wire  _T_132;
  wire [31:0] _T_133;
  wire  _T_134;
  wire [31:0] _T_135;
  wire [31:0] _T_137;
  wire  _T_138;
  wire [31:0] _T_139;
  wire  _T_140;
  wire [31:0] _T_141;
  wire  _T_142;
  wire [31:0] _T_143;
  wire [4:0] _T_144;
  wire [31:0] _T_145;
  wire [3:0] _T_146;
  reg [31:0] _GEN_0;
  reg [31:0] _GEN_10;
  reg [31:0] _GEN_1;
  reg [31:0] _GEN_11;
  reg [4:0] _GEN_2;
  reg [31:0] _GEN_12;
  reg [4:0] _GEN_3;
  reg [31:0] _GEN_13;
  reg [4:0] _GEN_4;
  reg [31:0] _GEN_14;
  reg  _GEN_5;
  reg [31:0] _GEN_15;
  reg [31:0] _GEN_6;
  reg [31:0] _GEN_16;
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
    .io_sel_rs_rs1(decoder_io_sel_rs_rs1),
    .io_sel_rs_rs2(decoder_io_sel_rs_rs2),
    .io_sel_rd(decoder_io_sel_rd),
    .io_imm_I(decoder_io_imm_I),
    .io_imm_S(decoder_io_imm_S),
    .io_imm_SB(decoder_io_imm_SB)
  );
  Control control (
    .io_ctrl_opcode(control_io_ctrl_opcode),
    .io_ctrl_funct3(control_io_ctrl_funct3),
    .io_ctrl_funct7(control_io_ctrl_funct7),
    .io_WB_regWrite(control_io_WB_regWrite),
    .io_WB_memToReg(control_io_WB_memToReg),
    .io_MEM_branch(control_io_MEM_branch),
    .io_MEM_write(control_io_MEM_write),
    .io_MEM_read(control_io_MEM_read),
    .io_EX_opcode(control_io_EX_opcode),
    .io_EX_alu_sel(control_io_EX_alu_sel),
    .io_EX_dst_sel(control_io_EX_dst_sel),
    .io_EX_aluOp_func(control_io_EX_aluOp_func),
    .io_EX_aluOp_alt(control_io_EX_aluOp_alt)
  );
  Registers regs (
    .clock(regs_clock),
    .io_sel_rs_rs1(regs_io_sel_rs_rs1),
    .io_sel_rs_rs2(regs_io_sel_rs_rs2),
    .io_sel_rd(regs_io_sel_rd),
    .io_reg_rs_rs1(regs_io_reg_rs_rs1),
    .io_reg_rs_rs2(regs_io_reg_rs_rs2),
    .io_reg_rd(regs_io_reg_rd),
    .io_regWrite(regs_io_regWrite)
  );
  ALU alu (
    .io_aluOp_func(alu_io_aluOp_func),
    .io_aluOp_alt(alu_io_aluOp_alt),
    .io_reg_rs_rs1(alu_io_reg_rs_rs1),
    .io_reg_rs_rs2(alu_io_reg_rs_rs2),
    .io_reg_rd(alu_io_reg_rd),
    .io_opcode(alu_io_opcode),
    .io_zero(alu_io_zero)
  );
  DataMemory dataMem (
    .io_reg_rd(dataMem_io_reg_rd)
  );
  ForwardingUnit fwdUnit (
    .io_regWrite_exMem(fwdUnit_io_regWrite_exMem),
    .io_regWrite_memWb(fwdUnit_io_regWrite_memWb),
    .io_sel_rs1(fwdUnit_io_sel_rs1),
    .io_sel_rs2(fwdUnit_io_sel_rs2),
    .io_dst_exMem(fwdUnit_io_dst_exMem),
    .io_dst_memWb(fwdUnit_io_dst_memWb),
    .io_fwd_rs1(fwdUnit_io_fwd_rs1),
    .io_fwd_rs2(fwdUnit_io_fwd_rs2)
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
    .io_in_WB_regWrite(ID_EX_io_in_WB_regWrite),
    .io_in_WB_memToReg(ID_EX_io_in_WB_memToReg),
    .io_in_MEM_write(ID_EX_io_in_MEM_write),
    .io_in_MEM_read(ID_EX_io_in_MEM_read),
    .io_in_EX_opcode(ID_EX_io_in_EX_opcode),
    .io_in_EX_alu_sel(ID_EX_io_in_EX_alu_sel),
    .io_in_EX_dst_sel(ID_EX_io_in_EX_dst_sel),
    .io_in_EX_aluOp_func(ID_EX_io_in_EX_aluOp_func),
    .io_in_EX_aluOp_alt(ID_EX_io_in_EX_aluOp_alt),
    .io_in_rs_rs1(ID_EX_io_in_rs_rs1),
    .io_in_rs_rs2(ID_EX_io_in_rs_rs2),
    .io_in_sel_rs_rs1(ID_EX_io_in_sel_rs_rs1),
    .io_in_sel_rs_rs2(ID_EX_io_in_sel_rs_rs2),
    .io_in_sel_rd(ID_EX_io_in_sel_rd),
    .io_in_imm(ID_EX_io_in_imm),
    .io_out_WB_regWrite(ID_EX_io_out_WB_regWrite),
    .io_out_WB_memToReg(ID_EX_io_out_WB_memToReg),
    .io_out_MEM_write(ID_EX_io_out_MEM_write),
    .io_out_MEM_read(ID_EX_io_out_MEM_read),
    .io_out_EX_opcode(ID_EX_io_out_EX_opcode),
    .io_out_EX_alu_sel(ID_EX_io_out_EX_alu_sel),
    .io_out_EX_dst_sel(ID_EX_io_out_EX_dst_sel),
    .io_out_EX_aluOp_func(ID_EX_io_out_EX_aluOp_func),
    .io_out_EX_aluOp_alt(ID_EX_io_out_EX_aluOp_alt),
    .io_out_rs_rs1(ID_EX_io_out_rs_rs1),
    .io_out_rs_rs2(ID_EX_io_out_rs_rs2),
    .io_out_sel_rs_rs1(ID_EX_io_out_sel_rs_rs1),
    .io_out_sel_rs_rs2(ID_EX_io_out_sel_rs_rs2),
    .io_out_sel_rd(ID_EX_io_out_sel_rd),
    .io_out_imm(ID_EX_io_out_imm)
  );
  PipelineEX_MEM EX_MEM (
    .clock(EX_MEM_clock),
    .io_in_WB_regWrite(EX_MEM_io_in_WB_regWrite),
    .io_in_WB_memToReg(EX_MEM_io_in_WB_memToReg),
    .io_in_MEM_write(EX_MEM_io_in_MEM_write),
    .io_in_MEM_read(EX_MEM_io_in_MEM_read),
    .io_in_zero(EX_MEM_io_in_zero),
    .io_in_aluRes(EX_MEM_io_in_aluRes),
    .io_in_op2(EX_MEM_io_in_op2),
    .io_in_dst(EX_MEM_io_in_dst),
    .io_out_WB_regWrite(EX_MEM_io_out_WB_regWrite),
    .io_out_WB_memToReg(EX_MEM_io_out_WB_memToReg),
    .io_out_MEM_write(EX_MEM_io_out_MEM_write),
    .io_out_MEM_read(EX_MEM_io_out_MEM_read),
    .io_out_zero(EX_MEM_io_out_zero),
    .io_out_aluRes(EX_MEM_io_out_aluRes),
    .io_out_op2(EX_MEM_io_out_op2),
    .io_out_dst(EX_MEM_io_out_dst)
  );
  PipelineMEM_WB MEM_WB (
    .clock(MEM_WB_clock),
    .io_in_WB_regWrite(MEM_WB_io_in_WB_regWrite),
    .io_in_WB_memToReg(MEM_WB_io_in_WB_memToReg),
    .io_in_rd_alu(MEM_WB_io_in_rd_alu),
    .io_in_rd_mem(MEM_WB_io_in_rd_mem),
    .io_in_dst(MEM_WB_io_in_dst),
    .io_out_WB_regWrite(MEM_WB_io_out_WB_regWrite),
    .io_out_WB_memToReg(MEM_WB_io_out_WB_memToReg),
    .io_out_rd_alu(MEM_WB_io_out_rd_alu),
    .io_out_rd_mem(MEM_WB_io_out_rd_mem),
    .io_out_dst(MEM_WB_io_out_dst)
  );
  assign io_branch = counter_io_branch;
  assign io_pc = counter_io_pc;
  assign io_pc_next = counter_io_pc_next;
  assign io_inst = instMem__T_147_data;
  assign io_opcode = {{25'd0}, ID_EX_io_out_EX_opcode};
  assign io_imm_i = {{20'd0}, decoder_io_imm_I};
  assign io_imm_sb = {{20'd0}, decoder_io_imm_SB};
  assign io_alu_sel = ID_EX_io_out_EX_alu_sel;
  assign io_fwd_rs1 = fwdUnit_io_fwd_rs1;
  assign io_fwd_rs2 = fwdUnit_io_fwd_rs2;
  assign io_rs1 = ID_EX_io_out_rs_rs1;
  assign io_rs2 = ID_EX_io_out_rs_rs2;
  assign io_alu_src = _T_137;
  assign io_op1 = alu_io_reg_rs_rs1;
  assign io_op2 = alu_io_reg_rs_rs2;
  assign io_rd_exMem = EX_MEM_io_out_aluRes;
  assign io_rd_memWb = regs_io_reg_rd;
  assign io_zero = EX_MEM_io_out_zero;
  assign io_alu_res = alu_io_reg_rd;
  assign io_rs1_ifId = _GEN_0;
  assign io_rs2_ifId = _GEN_1;
  assign io_rd_sel = ID_EX_io_out_sel_rd;
  assign io_sel_rs1 = ID_EX_io_out_sel_rs_rs1;
  assign io_sel_rs2 = ID_EX_io_out_sel_rs_rs2;
  assign io_dst_exMem = EX_MEM_io_out_dst;
  assign io_dst_memWb = MEM_WB_io_out_dst;
  assign io_regWrite_exMem = EX_MEM_io_out_WB_regWrite;
  assign io_regWrite_memWb = MEM_WB_io_out_WB_regWrite;
  assign io_memRead = EX_MEM_io_out_MEM_read;
  assign io_memWrite = EX_MEM_io_out_MEM_write;
  assign io_memRes = dataMem_io_reg_rd;
  assign io_wData = EX_MEM_io_out_op2;
  assign instMem__T_124_addr = _T_123;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign instMem__T_124_data = instMem[instMem__T_124_addr];
  `else
  assign instMem__T_124_data = instMem__T_124_addr >= 4'hf ? _GEN_8[31:0] : instMem[instMem__T_124_addr];
  `endif
  assign instMem__T_147_addr = _T_146;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign instMem__T_147_data = instMem[instMem__T_147_addr];
  `else
  assign instMem__T_147_data = instMem__T_147_addr >= 4'hf ? _GEN_9[31:0] : instMem[instMem__T_147_addr];
  `endif
  assign instMem__T_79_data = 32'h0;
  assign instMem__T_79_addr = 4'h0;
  assign instMem__T_79_mask = 1'h1;
  assign instMem__T_79_en = 1'h1;
  assign instMem__T_82_data = 32'h300093;
  assign instMem__T_82_addr = 4'h1;
  assign instMem__T_82_mask = 1'h1;
  assign instMem__T_82_en = 1'h1;
  assign instMem__T_85_data = 32'h38800113;
  assign instMem__T_85_addr = 4'h2;
  assign instMem__T_85_mask = 1'h1;
  assign instMem__T_85_en = 1'h1;
  assign instMem__T_88_data = 32'h1200193;
  assign instMem__T_88_addr = 4'h3;
  assign instMem__T_88_mask = 1'h1;
  assign instMem__T_88_en = 1'h1;
  assign instMem__T_91_data = 32'h20a023;
  assign instMem__T_91_addr = 4'h4;
  assign instMem__T_91_mask = 1'h1;
  assign instMem__T_91_en = 1'h1;
  assign instMem__T_94_data = 32'ha203;
  assign instMem__T_94_addr = 4'h5;
  assign instMem__T_94_mask = 1'h1;
  assign instMem__T_94_en = 1'h1;
  assign instMem__T_97_data = 32'h0;
  assign instMem__T_97_addr = 4'h6;
  assign instMem__T_97_mask = 1'h1;
  assign instMem__T_97_en = 1'h1;
  assign instMem__T_100_data = 32'h3102b3;
  assign instMem__T_100_addr = 4'h7;
  assign instMem__T_100_mask = 1'h1;
  assign instMem__T_100_en = 1'h1;
  assign instMem__T_103_data = 32'h0;
  assign instMem__T_103_addr = 4'h8;
  assign instMem__T_103_mask = 1'h1;
  assign instMem__T_103_en = 1'h1;
  assign instMem__T_106_data = 32'h0;
  assign instMem__T_106_addr = 4'h9;
  assign instMem__T_106_mask = 1'h1;
  assign instMem__T_106_en = 1'h1;
  assign instMem__T_109_data = 32'h0;
  assign instMem__T_109_addr = 4'ha;
  assign instMem__T_109_mask = 1'h1;
  assign instMem__T_109_en = 1'h1;
  assign instMem__T_112_data = 32'h0;
  assign instMem__T_112_addr = 4'hb;
  assign instMem__T_112_mask = 1'h1;
  assign instMem__T_112_en = 1'h1;
  assign instMem__T_115_data = 32'h0;
  assign instMem__T_115_addr = 4'hc;
  assign instMem__T_115_mask = 1'h1;
  assign instMem__T_115_en = 1'h1;
  assign instMem__T_118_data = 32'h0;
  assign instMem__T_118_addr = 4'hd;
  assign instMem__T_118_mask = 1'h1;
  assign instMem__T_118_en = 1'h1;
  assign instMem__T_121_data = 32'h0;
  assign instMem__T_121_addr = 4'he;
  assign instMem__T_121_mask = 1'h1;
  assign instMem__T_121_en = 1'h1;
  assign counter_clock = clock;
  assign counter_reset = reset;
  assign counter_io_branch = _T_126;
  assign counter_io_pc_src = _T_128;
  assign decoder_io_inst = IF_ID_io_out_inst;
  assign control_io_ctrl_opcode = decoder_io_ctrl_opcode;
  assign control_io_ctrl_funct3 = decoder_io_ctrl_funct3;
  assign control_io_ctrl_funct7 = decoder_io_ctrl_funct7;
  assign regs_clock = clock;
  assign regs_io_sel_rs_rs1 = decoder_io_sel_rs_rs1;
  assign regs_io_sel_rs_rs2 = decoder_io_sel_rs_rs2;
  assign regs_io_sel_rd = MEM_WB_io_out_dst;
  assign regs_io_reg_rd = _T_145;
  assign regs_io_regWrite = MEM_WB_io_out_WB_regWrite;
  assign alu_io_aluOp_func = ID_EX_io_out_EX_aluOp_func;
  assign alu_io_aluOp_alt = ID_EX_io_out_EX_aluOp_alt;
  assign alu_io_reg_rs_rs1 = _T_135;
  assign alu_io_reg_rs_rs2 = _T_143;
  assign alu_io_opcode = ID_EX_io_out_EX_opcode;
  assign fwdUnit_io_regWrite_exMem = EX_MEM_io_out_WB_regWrite;
  assign fwdUnit_io_regWrite_memWb = MEM_WB_io_out_WB_regWrite;
  assign fwdUnit_io_sel_rs1 = ID_EX_io_out_sel_rs_rs1;
  assign fwdUnit_io_sel_rs2 = ID_EX_io_out_sel_rs_rs2;
  assign fwdUnit_io_dst_exMem = EX_MEM_io_out_dst;
  assign fwdUnit_io_dst_memWb = MEM_WB_io_out_dst;
  assign IF_ID_clock = clock;
  assign IF_ID_io_in_pc_next = counter_io_pc_next;
  assign IF_ID_io_in_inst = instMem__T_124_data;
  assign ID_EX_clock = clock;
  assign ID_EX_io_in_WB_regWrite = control_io_WB_regWrite;
  assign ID_EX_io_in_WB_memToReg = control_io_WB_memToReg;
  assign ID_EX_io_in_MEM_write = control_io_MEM_write;
  assign ID_EX_io_in_MEM_read = control_io_MEM_read;
  assign ID_EX_io_in_EX_opcode = control_io_EX_opcode;
  assign ID_EX_io_in_EX_alu_sel = control_io_EX_alu_sel;
  assign ID_EX_io_in_EX_dst_sel = control_io_EX_dst_sel;
  assign ID_EX_io_in_EX_aluOp_func = control_io_EX_aluOp_func;
  assign ID_EX_io_in_EX_aluOp_alt = control_io_EX_aluOp_alt;
  assign ID_EX_io_in_rs_rs1 = regs_io_reg_rs_rs1;
  assign ID_EX_io_in_rs_rs2 = regs_io_reg_rs_rs2;
  assign ID_EX_io_in_sel_rs_rs1 = decoder_io_sel_rs_rs1;
  assign ID_EX_io_in_sel_rs_rs2 = decoder_io_sel_rs_rs2;
  assign ID_EX_io_in_sel_rd = decoder_io_sel_rd;
  assign ID_EX_io_in_imm = {{20'd0}, _T_129};
  assign EX_MEM_clock = clock;
  assign EX_MEM_io_in_WB_regWrite = ID_EX_io_out_WB_regWrite;
  assign EX_MEM_io_in_WB_memToReg = ID_EX_io_out_WB_memToReg;
  assign EX_MEM_io_in_MEM_write = ID_EX_io_out_MEM_write;
  assign EX_MEM_io_in_MEM_read = ID_EX_io_out_MEM_read;
  assign EX_MEM_io_in_zero = alu_io_zero;
  assign EX_MEM_io_in_aluRes = alu_io_reg_rd;
  assign EX_MEM_io_in_op2 = alu_io_reg_rs_rs2;
  assign EX_MEM_io_in_dst = _T_144;
  assign MEM_WB_clock = clock;
  assign MEM_WB_io_in_WB_regWrite = EX_MEM_io_out_WB_regWrite;
  assign MEM_WB_io_in_WB_memToReg = EX_MEM_io_out_WB_memToReg;
  assign MEM_WB_io_in_rd_alu = EX_MEM_io_out_aluRes;
  assign MEM_WB_io_in_rd_mem = dataMem_io_reg_rd;
  assign MEM_WB_io_in_dst = EX_MEM_io_out_dst;
  assign _T_123 = io_pc[3:0];
  assign _T_125 = regs_io_reg_rs_rs1 == regs_io_reg_rs_rs2;
  assign _T_126 = _T_125 & control_io_MEM_branch;
  assign _GEN_64 = {{20'd0}, decoder_io_imm_SB};
  assign _T_127 = IF_ID_io_out_pc_next + _GEN_64;
  assign _T_128 = _T_127[31:0];
  assign _T_129 = control_io_MEM_write ? decoder_io_imm_S : decoder_io_imm_I;
  assign _T_130 = 2'h0 == fwdUnit_io_fwd_rs1;
  assign _T_131 = _T_130 ? ID_EX_io_out_rs_rs1 : 32'h0;
  assign _T_132 = 2'h1 == fwdUnit_io_fwd_rs1;
  assign _T_133 = _T_132 ? regs_io_reg_rd : _T_131;
  assign _T_134 = 2'h2 == fwdUnit_io_fwd_rs1;
  assign _T_135 = _T_134 ? EX_MEM_io_out_aluRes : _T_133;
  assign _T_137 = ID_EX_io_out_EX_alu_sel ? ID_EX_io_out_imm : ID_EX_io_out_rs_rs2;
  assign _T_138 = 2'h0 == fwdUnit_io_fwd_rs2;
  assign _T_139 = _T_138 ? _T_137 : 32'h5;
  assign _T_140 = 2'h1 == fwdUnit_io_fwd_rs2;
  assign _T_141 = _T_140 ? regs_io_reg_rd : _T_139;
  assign _T_142 = 2'h2 == fwdUnit_io_fwd_rs2;
  assign _T_143 = _T_142 ? EX_MEM_io_out_aluRes : _T_141;
  assign _T_144 = ID_EX_io_out_EX_dst_sel ? ID_EX_io_out_sel_rd : ID_EX_io_out_sel_rs_rs2;
  assign _T_145 = MEM_WB_io_out_WB_memToReg ? MEM_WB_io_out_rd_mem : MEM_WB_io_out_rd_alu;
  assign _T_146 = io_pc[3:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 15; initvar = initvar+1)
    instMem[initvar] = _GEN_7[31:0];
  `endif
  _GEN_8 = {1{$random}};
  _GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _GEN_0 = _GEN_10[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _GEN_1 = _GEN_11[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _GEN_2 = _GEN_12[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  _GEN_3 = _GEN_13[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  _GEN_4 = _GEN_14[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  _GEN_5 = _GEN_15[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {1{$random}};
  _GEN_6 = _GEN_16[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(instMem__T_79_en & instMem__T_79_mask) begin
      instMem[instMem__T_79_addr] <= instMem__T_79_data;
    end
    if(instMem__T_82_en & instMem__T_82_mask) begin
      instMem[instMem__T_82_addr] <= instMem__T_82_data;
    end
    if(instMem__T_85_en & instMem__T_85_mask) begin
      instMem[instMem__T_85_addr] <= instMem__T_85_data;
    end
    if(instMem__T_88_en & instMem__T_88_mask) begin
      instMem[instMem__T_88_addr] <= instMem__T_88_data;
    end
    if(instMem__T_91_en & instMem__T_91_mask) begin
      instMem[instMem__T_91_addr] <= instMem__T_91_data;
    end
    if(instMem__T_94_en & instMem__T_94_mask) begin
      instMem[instMem__T_94_addr] <= instMem__T_94_data;
    end
    if(instMem__T_97_en & instMem__T_97_mask) begin
      instMem[instMem__T_97_addr] <= instMem__T_97_data;
    end
    if(instMem__T_100_en & instMem__T_100_mask) begin
      instMem[instMem__T_100_addr] <= instMem__T_100_data;
    end
    if(instMem__T_103_en & instMem__T_103_mask) begin
      instMem[instMem__T_103_addr] <= instMem__T_103_data;
    end
    if(instMem__T_106_en & instMem__T_106_mask) begin
      instMem[instMem__T_106_addr] <= instMem__T_106_data;
    end
    if(instMem__T_109_en & instMem__T_109_mask) begin
      instMem[instMem__T_109_addr] <= instMem__T_109_data;
    end
    if(instMem__T_112_en & instMem__T_112_mask) begin
      instMem[instMem__T_112_addr] <= instMem__T_112_data;
    end
    if(instMem__T_115_en & instMem__T_115_mask) begin
      instMem[instMem__T_115_addr] <= instMem__T_115_data;
    end
    if(instMem__T_118_en & instMem__T_118_mask) begin
      instMem[instMem__T_118_addr] <= instMem__T_118_data;
    end
    if(instMem__T_121_en & instMem__T_121_mask) begin
      instMem[instMem__T_121_addr] <= instMem__T_121_data;
    end
  end
endmodule
