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
  output [2:0] io_MEM_func,
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
  assign io_MEM_func = io_ctrl_funct3;
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
  input  [6:0]  io_opcode
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
  reg  _GEN_1;
  reg [31:0] _GEN_2;
  assign io_reg_rd = _T_68[31:0];
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
  input  [31:0] io_reg_rs_rs1,
  input  [31:0] io_reg_rs_rs2,
  output [31:0] io_reg_rd
);
  reg [31:0] dataMem [0:1023];
  reg [31:0] _GEN_0;
  wire [31:0] dataMem__T_23_data;
  wire [9:0] dataMem__T_23_addr;
  wire [31:0] dataMem__T_13_data;
  wire [9:0] dataMem__T_13_addr;
  wire  dataMem__T_13_mask;
  wire  dataMem__T_13_en;
  wire [31:0] dataMem__T_17_data;
  wire [9:0] dataMem__T_17_addr;
  wire  dataMem__T_17_mask;
  wire  dataMem__T_17_en;
  wire [31:0] dataMem__T_21_data;
  wire [9:0] dataMem__T_21_addr;
  wire  dataMem__T_21_mask;
  wire  dataMem__T_21_en;
  wire [31:0] _GEN_36;
  wire [31:0] _GEN_40;
  wire  _T_11;
  wire [9:0] _T_12;
  wire [7:0] _T_14;
  wire  _T_15;
  wire [9:0] _T_16;
  wire [15:0] _T_18;
  wire  _T_19;
  wire [9:0] _T_20;
  wire  _GEN_14;
  wire  _GEN_18;
  wire  _GEN_22;
  wire [9:0] _T_22;
  wire [7:0] _T_25;
  wire [15:0] _T_27;
  wire [15:0] _GEN_25;
  wire [31:0] _GEN_26;
  assign io_reg_rd = _GEN_26;
  assign dataMem__T_23_addr = _T_22;
  assign dataMem__T_23_data = dataMem[dataMem__T_23_addr];
  assign dataMem__T_13_data = _GEN_36;
  assign dataMem__T_13_addr = _T_12;
  assign dataMem__T_13_mask = _GEN_14;
  assign dataMem__T_13_en = _GEN_14;
  assign dataMem__T_17_data = _GEN_40;
  assign dataMem__T_17_addr = _T_16;
  assign dataMem__T_17_mask = _GEN_18;
  assign dataMem__T_17_en = _GEN_18;
  assign dataMem__T_21_data = io_reg_rs_rs2;
  assign dataMem__T_21_addr = _T_20;
  assign dataMem__T_21_mask = _GEN_22;
  assign dataMem__T_21_en = _GEN_22;
  assign _GEN_36 = {{24'd0}, _T_14};
  assign _GEN_40 = {{16'd0}, _T_18};
  assign _T_11 = 3'h0 == io_mem_func;
  assign _T_12 = io_reg_rs_rs1[9:0];
  assign _T_14 = io_reg_rs_rs2[7:0];
  assign _T_15 = 3'h1 == io_mem_func;
  assign _T_16 = io_reg_rs_rs1[9:0];
  assign _T_18 = io_reg_rs_rs2[15:0];
  assign _T_19 = 3'h2 == io_mem_func;
  assign _T_20 = io_reg_rs_rs1[9:0];
  assign _GEN_14 = io_mem_write ? _T_11 : 1'h0;
  assign _GEN_18 = io_mem_write ? _T_15 : 1'h0;
  assign _GEN_22 = io_mem_write ? _T_19 : 1'h0;
  assign _T_22 = io_reg_rs_rs1[9:0];
  assign _T_25 = dataMem__T_23_data[7:0];
  assign _T_27 = dataMem__T_23_data[15:0];
  assign _GEN_25 = _T_15 ? _T_27 : {{8'd0}, _T_25};
  assign _GEN_26 = _T_19 ? dataMem__T_23_data : {{16'd0}, _GEN_25};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    dataMem[initvar] = _GEN_0[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(dataMem__T_13_en & dataMem__T_13_mask) begin
      dataMem[dataMem__T_13_addr] <= dataMem__T_13_data;
    end
    if(dataMem__T_17_en & dataMem__T_17_mask) begin
      dataMem[dataMem__T_17_addr] <= dataMem__T_17_data;
    end
    if(dataMem__T_21_en & dataMem__T_21_mask) begin
      dataMem[dataMem__T_21_addr] <= dataMem__T_21_data;
    end
  end
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
  wire [2:0] _T_55;
  wire [1:0] _T_56;
  reg [3:0] i;
  reg [31:0] _GEN_24;
  wire  _T_76;
  wire [2:0] _GEN_19;
  wire  _T_78;
  wire  _T_79;
  wire [1:0] _T_83;
  wire [7:0] _GEN_0;
  wire [7:0] _GEN_2;
  wire [7:0] _GEN_3;
  wire [7:0] _GEN_4;
  wire [7:0] _GEN_5;
  wire [2:0] _T_85;
  wire [1:0] _T_86;
  wire [7:0] _GEN_6;
  wire [7:0] _GEN_7;
  wire [7:0] _GEN_8;
  wire [7:0] _GEN_9;
  wire [1:0] _GEN_10;
  wire  _T_88;
  wire  _T_89;
  wire [7:0] _GEN_1;
  wire [7:0] _GEN_11;
  wire [7:0] _GEN_12;
  wire [7:0] _GEN_13;
  wire [2:0] _T_94;
  wire [2:0] _T_95;
  wire [1:0] _T_96;
  wire [2:0] _T_98;
  wire [1:0] _T_99;
  wire [1:0] _GEN_15;
  wire [1:0] _GEN_16;
  wire  _T_106;
  wire  _T_107;
  wire  _T_109;
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
  assign tx_io_enq_valid = _T_88;
  assign tx_io_enq_bits = _GEN_1;
  assign _T_15_0 = 8'h0;
  assign _T_15_1 = 8'h0;
  assign _T_15_2 = 8'h0;
  assign _T_15_3 = 8'h0;
  assign _T_55 = ptr + cnt;
  assign _T_56 = _T_55[1:0];
  assign _T_76 = io_in != 8'h0;
  assign _GEN_19 = {{1'd0}, cnt};
  assign _T_78 = _GEN_19 != 3'h4;
  assign _T_79 = _T_76 & _T_78;
  assign _T_83 = i[1:0];
  assign _GEN_0 = io_in;
  assign _GEN_2 = 2'h0 == _T_83 ? _GEN_0 : q_0;
  assign _GEN_3 = 2'h1 == _T_83 ? _GEN_0 : q_1;
  assign _GEN_4 = 2'h2 == _T_83 ? _GEN_0 : q_2;
  assign _GEN_5 = 2'h3 == _T_83 ? _GEN_0 : q_3;
  assign _T_85 = cnt + 2'h1;
  assign _T_86 = _T_85[1:0];
  assign _GEN_6 = _T_79 ? _GEN_2 : q_0;
  assign _GEN_7 = _T_79 ? _GEN_3 : q_1;
  assign _GEN_8 = _T_79 ? _GEN_4 : q_2;
  assign _GEN_9 = _T_79 ? _GEN_5 : q_3;
  assign _GEN_10 = _T_79 ? _T_86 : cnt;
  assign _T_88 = cnt != 2'h0;
  assign _T_89 = tx_io_enq_ready & _T_88;
  assign _GEN_1 = _GEN_13;
  assign _GEN_11 = 2'h1 == ptr ? q_1 : q_0;
  assign _GEN_12 = 2'h2 == ptr ? q_2 : _GEN_11;
  assign _GEN_13 = 2'h3 == ptr ? q_3 : _GEN_12;
  assign _T_94 = cnt - 2'h1;
  assign _T_95 = $unsigned(_T_94);
  assign _T_96 = _T_95[1:0];
  assign _T_98 = ptr + 2'h1;
  assign _T_99 = _T_98[1:0];
  assign _GEN_15 = _T_89 ? _T_96 : _GEN_10;
  assign _GEN_16 = _T_89 ? _T_99 : ptr;
  assign _T_106 = _T_76 | _T_88;
  assign _T_107 = _T_106 & tx_io_enq_ready;
  assign _T_109 = _T_107 == 1'h0;
  assign _GEN_18 = _T_109 ? tx_io_enq_ready : 1'h0;
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
      if (_T_79) begin
        if (2'h0 == _T_83) begin
          q_0 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      q_1 <= _T_15_1;
    end else begin
      if (_T_79) begin
        if (2'h1 == _T_83) begin
          q_1 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      q_2 <= _T_15_2;
    end else begin
      if (_T_79) begin
        if (2'h2 == _T_83) begin
          q_2 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      q_3 <= _T_15_3;
    end else begin
      if (_T_79) begin
        if (2'h3 == _T_83) begin
          q_3 <= _GEN_0;
        end
      end
    end
    if (reset) begin
      ptr <= 2'h0;
    end else begin
      if (_T_89) begin
        ptr <= _T_99;
      end
    end
    if (reset) begin
      cnt <= 2'h0;
    end else begin
      if (_T_89) begin
        cnt <= _T_96;
      end else begin
        if (_T_79) begin
          cnt <= _T_86;
        end
      end
    end
    if (reset) begin
      i <= {{2'd0}, _T_56};
    end else begin
      i <= {{2'd0}, _T_56};
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
  input         io_in_WB_regWrite,
  input         io_in_WB_memToReg,
  input         io_in_MEM_write,
  input         io_in_MEM_read,
  input  [2:0]  io_in_MEM_func,
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
  input  [31:0] io_in_pc_next,
  input  [31:0] io_in_imm,
  output        io_out_WB_regWrite,
  output        io_out_WB_memToReg,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output [2:0]  io_out_MEM_func,
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
  output [31:0] io_out_pc_next,
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
  reg [2:0] _T_76_MEM_func;
  reg [31:0] _GEN_4;
  reg [6:0] _T_76_EX_opcode;
  reg [31:0] _GEN_5;
  reg  _T_76_EX_alu_sel;
  reg [31:0] _GEN_6;
  reg  _T_76_EX_dst_sel;
  reg [31:0] _GEN_7;
  reg [2:0] _T_76_EX_aluOp_func;
  reg [31:0] _GEN_8;
  reg  _T_76_EX_aluOp_alt;
  reg [31:0] _GEN_9;
  reg [31:0] _T_76_rs_rs1;
  reg [31:0] _GEN_10;
  reg [31:0] _T_76_rs_rs2;
  reg [31:0] _GEN_11;
  reg [4:0] _T_76_sel_rs_rs1;
  reg [31:0] _GEN_12;
  reg [4:0] _T_76_sel_rs_rs2;
  reg [31:0] _GEN_13;
  reg [4:0] _T_76_sel_rd;
  reg [31:0] _GEN_14;
  reg [31:0] _T_76_pc_next;
  reg [31:0] _GEN_15;
  reg [31:0] _T_76_imm;
  reg [31:0] _GEN_16;
  assign io_out_WB_regWrite = _T_76_WB_regWrite;
  assign io_out_WB_memToReg = _T_76_WB_memToReg;
  assign io_out_MEM_write = _T_76_MEM_write;
  assign io_out_MEM_read = _T_76_MEM_read;
  assign io_out_MEM_func = _T_76_MEM_func;
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
  assign io_out_pc_next = _T_76_pc_next;
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
  _T_76_EX_aluOp_func = _GEN_8[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _T_76_EX_aluOp_alt = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _T_76_rs_rs1 = _GEN_10[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _T_76_rs_rs2 = _GEN_11[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _T_76_sel_rs_rs1 = _GEN_12[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  _T_76_sel_rs_rs2 = _GEN_13[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  _T_76_sel_rd = _GEN_14[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  _T_76_pc_next = _GEN_15[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {1{$random}};
  _T_76_imm = _GEN_16[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_76_WB_regWrite <= io_in_WB_regWrite;
    _T_76_WB_memToReg <= io_in_WB_memToReg;
    _T_76_MEM_write <= io_in_MEM_write;
    _T_76_MEM_read <= io_in_MEM_read;
    _T_76_MEM_func <= io_in_MEM_func;
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
    _T_76_pc_next <= io_in_pc_next;
    _T_76_imm <= io_in_imm;
  end
endmodule
module PipelineEX_MEM(
  input         clock,
  input         io_in_WB_regWrite,
  input         io_in_WB_memToReg,
  input         io_in_MEM_write,
  input         io_in_MEM_read,
  input  [2:0]  io_in_MEM_func,
  input  [31:0] io_in_pc_next,
  input  [31:0] io_in_aluRes,
  input  [31:0] io_in_op2,
  input  [4:0]  io_in_dst,
  output        io_out_WB_regWrite,
  output        io_out_WB_memToReg,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output [2:0]  io_out_MEM_func,
  output [31:0] io_out_pc_next,
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
  reg [2:0] _T_48_MEM_func;
  reg [31:0] _GEN_4;
  reg [31:0] _T_48_pc_next;
  reg [31:0] _GEN_5;
  reg [31:0] _T_48_aluRes;
  reg [31:0] _GEN_6;
  reg [31:0] _T_48_op2;
  reg [31:0] _GEN_7;
  reg [4:0] _T_48_dst;
  reg [31:0] _GEN_8;
  assign io_out_WB_regWrite = _T_48_WB_regWrite;
  assign io_out_WB_memToReg = _T_48_WB_memToReg;
  assign io_out_MEM_write = _T_48_MEM_write;
  assign io_out_MEM_read = _T_48_MEM_read;
  assign io_out_MEM_func = _T_48_MEM_func;
  assign io_out_pc_next = _T_48_pc_next;
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
  _T_48_MEM_func = _GEN_4[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_48_pc_next = _GEN_5[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  _T_48_aluRes = _GEN_6[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_48_op2 = _GEN_7[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _T_48_dst = _GEN_8[4:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_48_WB_regWrite <= io_in_WB_regWrite;
    _T_48_WB_memToReg <= io_in_WB_memToReg;
    _T_48_MEM_write <= io_in_MEM_write;
    _T_48_MEM_read <= io_in_MEM_read;
    _T_48_MEM_func <= io_in_MEM_func;
    _T_48_pc_next <= io_in_pc_next;
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
  input        clock,
  input        reset,
  output       io_txd,
  output [7:0] io_r0,
  output [7:0] io_r1,
  output [7:0] io_r2,
  output [7:0] io_r3
);
  reg [31:0] instMem [0:59];
  reg [31:0] _GEN_5;
  wire [31:0] instMem__T_232_data;
  wire [5:0] instMem__T_232_addr;
  reg [31:0] _GEN_6;
  wire [31:0] instMem__T_52_data;
  wire [5:0] instMem__T_52_addr;
  wire  instMem__T_52_mask;
  wire  instMem__T_52_en;
  wire [31:0] instMem__T_55_data;
  wire [5:0] instMem__T_55_addr;
  wire  instMem__T_55_mask;
  wire  instMem__T_55_en;
  wire [31:0] instMem__T_58_data;
  wire [5:0] instMem__T_58_addr;
  wire  instMem__T_58_mask;
  wire  instMem__T_58_en;
  wire [31:0] instMem__T_61_data;
  wire [5:0] instMem__T_61_addr;
  wire  instMem__T_61_mask;
  wire  instMem__T_61_en;
  wire [31:0] instMem__T_64_data;
  wire [5:0] instMem__T_64_addr;
  wire  instMem__T_64_mask;
  wire  instMem__T_64_en;
  wire [31:0] instMem__T_67_data;
  wire [5:0] instMem__T_67_addr;
  wire  instMem__T_67_mask;
  wire  instMem__T_67_en;
  wire [31:0] instMem__T_70_data;
  wire [5:0] instMem__T_70_addr;
  wire  instMem__T_70_mask;
  wire  instMem__T_70_en;
  wire [31:0] instMem__T_73_data;
  wire [5:0] instMem__T_73_addr;
  wire  instMem__T_73_mask;
  wire  instMem__T_73_en;
  wire [31:0] instMem__T_76_data;
  wire [5:0] instMem__T_76_addr;
  wire  instMem__T_76_mask;
  wire  instMem__T_76_en;
  wire [31:0] instMem__T_79_data;
  wire [5:0] instMem__T_79_addr;
  wire  instMem__T_79_mask;
  wire  instMem__T_79_en;
  wire [31:0] instMem__T_82_data;
  wire [5:0] instMem__T_82_addr;
  wire  instMem__T_82_mask;
  wire  instMem__T_82_en;
  wire [31:0] instMem__T_85_data;
  wire [5:0] instMem__T_85_addr;
  wire  instMem__T_85_mask;
  wire  instMem__T_85_en;
  wire [31:0] instMem__T_88_data;
  wire [5:0] instMem__T_88_addr;
  wire  instMem__T_88_mask;
  wire  instMem__T_88_en;
  wire [31:0] instMem__T_91_data;
  wire [5:0] instMem__T_91_addr;
  wire  instMem__T_91_mask;
  wire  instMem__T_91_en;
  wire [31:0] instMem__T_94_data;
  wire [5:0] instMem__T_94_addr;
  wire  instMem__T_94_mask;
  wire  instMem__T_94_en;
  wire [31:0] instMem__T_97_data;
  wire [5:0] instMem__T_97_addr;
  wire  instMem__T_97_mask;
  wire  instMem__T_97_en;
  wire [31:0] instMem__T_100_data;
  wire [5:0] instMem__T_100_addr;
  wire  instMem__T_100_mask;
  wire  instMem__T_100_en;
  wire [31:0] instMem__T_103_data;
  wire [5:0] instMem__T_103_addr;
  wire  instMem__T_103_mask;
  wire  instMem__T_103_en;
  wire [31:0] instMem__T_106_data;
  wire [5:0] instMem__T_106_addr;
  wire  instMem__T_106_mask;
  wire  instMem__T_106_en;
  wire [31:0] instMem__T_109_data;
  wire [5:0] instMem__T_109_addr;
  wire  instMem__T_109_mask;
  wire  instMem__T_109_en;
  wire [31:0] instMem__T_112_data;
  wire [5:0] instMem__T_112_addr;
  wire  instMem__T_112_mask;
  wire  instMem__T_112_en;
  wire [31:0] instMem__T_115_data;
  wire [5:0] instMem__T_115_addr;
  wire  instMem__T_115_mask;
  wire  instMem__T_115_en;
  wire [31:0] instMem__T_118_data;
  wire [5:0] instMem__T_118_addr;
  wire  instMem__T_118_mask;
  wire  instMem__T_118_en;
  wire [31:0] instMem__T_121_data;
  wire [5:0] instMem__T_121_addr;
  wire  instMem__T_121_mask;
  wire  instMem__T_121_en;
  wire [31:0] instMem__T_124_data;
  wire [5:0] instMem__T_124_addr;
  wire  instMem__T_124_mask;
  wire  instMem__T_124_en;
  wire [31:0] instMem__T_127_data;
  wire [5:0] instMem__T_127_addr;
  wire  instMem__T_127_mask;
  wire  instMem__T_127_en;
  wire [31:0] instMem__T_130_data;
  wire [5:0] instMem__T_130_addr;
  wire  instMem__T_130_mask;
  wire  instMem__T_130_en;
  wire [31:0] instMem__T_133_data;
  wire [5:0] instMem__T_133_addr;
  wire  instMem__T_133_mask;
  wire  instMem__T_133_en;
  wire [31:0] instMem__T_136_data;
  wire [5:0] instMem__T_136_addr;
  wire  instMem__T_136_mask;
  wire  instMem__T_136_en;
  wire [31:0] instMem__T_139_data;
  wire [5:0] instMem__T_139_addr;
  wire  instMem__T_139_mask;
  wire  instMem__T_139_en;
  wire [31:0] instMem__T_142_data;
  wire [5:0] instMem__T_142_addr;
  wire  instMem__T_142_mask;
  wire  instMem__T_142_en;
  wire [31:0] instMem__T_145_data;
  wire [5:0] instMem__T_145_addr;
  wire  instMem__T_145_mask;
  wire  instMem__T_145_en;
  wire [31:0] instMem__T_148_data;
  wire [5:0] instMem__T_148_addr;
  wire  instMem__T_148_mask;
  wire  instMem__T_148_en;
  wire [31:0] instMem__T_151_data;
  wire [5:0] instMem__T_151_addr;
  wire  instMem__T_151_mask;
  wire  instMem__T_151_en;
  wire [31:0] instMem__T_154_data;
  wire [5:0] instMem__T_154_addr;
  wire  instMem__T_154_mask;
  wire  instMem__T_154_en;
  wire [31:0] instMem__T_157_data;
  wire [5:0] instMem__T_157_addr;
  wire  instMem__T_157_mask;
  wire  instMem__T_157_en;
  wire [31:0] instMem__T_160_data;
  wire [5:0] instMem__T_160_addr;
  wire  instMem__T_160_mask;
  wire  instMem__T_160_en;
  wire [31:0] instMem__T_163_data;
  wire [5:0] instMem__T_163_addr;
  wire  instMem__T_163_mask;
  wire  instMem__T_163_en;
  wire [31:0] instMem__T_166_data;
  wire [5:0] instMem__T_166_addr;
  wire  instMem__T_166_mask;
  wire  instMem__T_166_en;
  wire [31:0] instMem__T_169_data;
  wire [5:0] instMem__T_169_addr;
  wire  instMem__T_169_mask;
  wire  instMem__T_169_en;
  wire [31:0] instMem__T_172_data;
  wire [5:0] instMem__T_172_addr;
  wire  instMem__T_172_mask;
  wire  instMem__T_172_en;
  wire [31:0] instMem__T_175_data;
  wire [5:0] instMem__T_175_addr;
  wire  instMem__T_175_mask;
  wire  instMem__T_175_en;
  wire [31:0] instMem__T_178_data;
  wire [5:0] instMem__T_178_addr;
  wire  instMem__T_178_mask;
  wire  instMem__T_178_en;
  wire [31:0] instMem__T_181_data;
  wire [5:0] instMem__T_181_addr;
  wire  instMem__T_181_mask;
  wire  instMem__T_181_en;
  wire [31:0] instMem__T_184_data;
  wire [5:0] instMem__T_184_addr;
  wire  instMem__T_184_mask;
  wire  instMem__T_184_en;
  wire [31:0] instMem__T_187_data;
  wire [5:0] instMem__T_187_addr;
  wire  instMem__T_187_mask;
  wire  instMem__T_187_en;
  wire [31:0] instMem__T_190_data;
  wire [5:0] instMem__T_190_addr;
  wire  instMem__T_190_mask;
  wire  instMem__T_190_en;
  wire [31:0] instMem__T_193_data;
  wire [5:0] instMem__T_193_addr;
  wire  instMem__T_193_mask;
  wire  instMem__T_193_en;
  wire [31:0] instMem__T_196_data;
  wire [5:0] instMem__T_196_addr;
  wire  instMem__T_196_mask;
  wire  instMem__T_196_en;
  wire [31:0] instMem__T_199_data;
  wire [5:0] instMem__T_199_addr;
  wire  instMem__T_199_mask;
  wire  instMem__T_199_en;
  wire [31:0] instMem__T_202_data;
  wire [5:0] instMem__T_202_addr;
  wire  instMem__T_202_mask;
  wire  instMem__T_202_en;
  wire [31:0] instMem__T_205_data;
  wire [5:0] instMem__T_205_addr;
  wire  instMem__T_205_mask;
  wire  instMem__T_205_en;
  wire [31:0] instMem__T_208_data;
  wire [5:0] instMem__T_208_addr;
  wire  instMem__T_208_mask;
  wire  instMem__T_208_en;
  wire [31:0] instMem__T_211_data;
  wire [5:0] instMem__T_211_addr;
  wire  instMem__T_211_mask;
  wire  instMem__T_211_en;
  wire [31:0] instMem__T_214_data;
  wire [5:0] instMem__T_214_addr;
  wire  instMem__T_214_mask;
  wire  instMem__T_214_en;
  wire [31:0] instMem__T_217_data;
  wire [5:0] instMem__T_217_addr;
  wire  instMem__T_217_mask;
  wire  instMem__T_217_en;
  wire [31:0] instMem__T_220_data;
  wire [5:0] instMem__T_220_addr;
  wire  instMem__T_220_mask;
  wire  instMem__T_220_en;
  wire [31:0] instMem__T_223_data;
  wire [5:0] instMem__T_223_addr;
  wire  instMem__T_223_mask;
  wire  instMem__T_223_en;
  wire [31:0] instMem__T_226_data;
  wire [5:0] instMem__T_226_addr;
  wire  instMem__T_226_mask;
  wire  instMem__T_226_en;
  wire [31:0] instMem__T_229_data;
  wire [5:0] instMem__T_229_addr;
  wire  instMem__T_229_mask;
  wire  instMem__T_229_en;
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
  wire [2:0] control_io_MEM_func;
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
  wire  dataMem_clock;
  wire  dataMem_io_mem_write;
  wire  dataMem_io_mem_read;
  wire [2:0] dataMem_io_mem_func;
  wire [31:0] dataMem_io_reg_rs_rs1;
  wire [31:0] dataMem_io_reg_rs_rs2;
  wire [31:0] dataMem_io_reg_rd;
  wire  fwdUnit_io_regWrite_exMem;
  wire  fwdUnit_io_regWrite_memWb;
  wire [4:0] fwdUnit_io_sel_rs1;
  wire [4:0] fwdUnit_io_sel_rs2;
  wire [4:0] fwdUnit_io_dst_exMem;
  wire [4:0] fwdUnit_io_dst_memWb;
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
  wire  ID_EX_io_in_WB_regWrite;
  wire  ID_EX_io_in_WB_memToReg;
  wire  ID_EX_io_in_MEM_write;
  wire  ID_EX_io_in_MEM_read;
  wire [2:0] ID_EX_io_in_MEM_func;
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
  wire [31:0] ID_EX_io_in_pc_next;
  wire [31:0] ID_EX_io_in_imm;
  wire  ID_EX_io_out_WB_regWrite;
  wire  ID_EX_io_out_WB_memToReg;
  wire  ID_EX_io_out_MEM_write;
  wire  ID_EX_io_out_MEM_read;
  wire [2:0] ID_EX_io_out_MEM_func;
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
  wire [31:0] ID_EX_io_out_pc_next;
  wire [31:0] ID_EX_io_out_imm;
  wire  EX_MEM_clock;
  wire  EX_MEM_io_in_WB_regWrite;
  wire  EX_MEM_io_in_WB_memToReg;
  wire  EX_MEM_io_in_MEM_write;
  wire  EX_MEM_io_in_MEM_read;
  wire [2:0] EX_MEM_io_in_MEM_func;
  wire [31:0] EX_MEM_io_in_pc_next;
  wire [31:0] EX_MEM_io_in_aluRes;
  wire [31:0] EX_MEM_io_in_op2;
  wire [4:0] EX_MEM_io_in_dst;
  wire  EX_MEM_io_out_WB_regWrite;
  wire  EX_MEM_io_out_WB_memToReg;
  wire  EX_MEM_io_out_MEM_write;
  wire  EX_MEM_io_out_MEM_read;
  wire [2:0] EX_MEM_io_out_MEM_func;
  wire [31:0] EX_MEM_io_out_pc_next;
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
  wire [5:0] _T_231;
  wire [6:0] _T_233;
  wire [2:0] _T_234;
  wire [6:0] _T_235;
  wire  _T_236;
  wire  _T_237;
  wire  _T_239;
  wire  _T_240;
  wire [31:0] _GEN_244;
  wire [32:0] _T_241;
  wire [31:0] _T_242;
  wire [32:0] _T_244;
  wire [32:0] _T_245;
  wire [31:0] _T_246;
  wire [31:0] _T_247;
  wire [11:0] _T_248;
  wire  _T_249;
  wire [31:0] _T_250;
  wire  _T_251;
  wire [31:0] _T_252;
  wire  _T_253;
  wire [31:0] _T_254;
  wire [31:0] _T_256;
  wire  _T_257;
  wire [31:0] _T_258;
  wire  _T_259;
  wire [31:0] _T_260;
  wire  _T_261;
  wire [31:0] _T_262;
  wire [4:0] _T_263;
  wire [31:0] _T_264;
  wire  _T_266;
  wire  _T_267;
  wire [7:0] _T_268;
  wire  _T_270;
  wire [7:0] _GEN_1;
  reg [4:0] _GEN_0;
  reg [31:0] _GEN_7;
  reg [4:0] _GEN_2;
  reg [31:0] _GEN_8;
  reg [4:0] _GEN_3;
  reg [31:0] _GEN_9;
  reg  _GEN_4;
  reg [31:0] _GEN_10;
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
    .io_MEM_func(control_io_MEM_func),
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
    .io_opcode(alu_io_opcode)
  );
  DataMemory dataMem (
    .clock(dataMem_clock),
    .io_mem_write(dataMem_io_mem_write),
    .io_mem_read(dataMem_io_mem_read),
    .io_mem_func(dataMem_io_mem_func),
    .io_reg_rs_rs1(dataMem_io_reg_rs_rs1),
    .io_reg_rs_rs2(dataMem_io_reg_rs_rs2),
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
    .io_in_WB_regWrite(ID_EX_io_in_WB_regWrite),
    .io_in_WB_memToReg(ID_EX_io_in_WB_memToReg),
    .io_in_MEM_write(ID_EX_io_in_MEM_write),
    .io_in_MEM_read(ID_EX_io_in_MEM_read),
    .io_in_MEM_func(ID_EX_io_in_MEM_func),
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
    .io_in_pc_next(ID_EX_io_in_pc_next),
    .io_in_imm(ID_EX_io_in_imm),
    .io_out_WB_regWrite(ID_EX_io_out_WB_regWrite),
    .io_out_WB_memToReg(ID_EX_io_out_WB_memToReg),
    .io_out_MEM_write(ID_EX_io_out_MEM_write),
    .io_out_MEM_read(ID_EX_io_out_MEM_read),
    .io_out_MEM_func(ID_EX_io_out_MEM_func),
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
    .io_out_pc_next(ID_EX_io_out_pc_next),
    .io_out_imm(ID_EX_io_out_imm)
  );
  PipelineEX_MEM EX_MEM (
    .clock(EX_MEM_clock),
    .io_in_WB_regWrite(EX_MEM_io_in_WB_regWrite),
    .io_in_WB_memToReg(EX_MEM_io_in_WB_memToReg),
    .io_in_MEM_write(EX_MEM_io_in_MEM_write),
    .io_in_MEM_read(EX_MEM_io_in_MEM_read),
    .io_in_MEM_func(EX_MEM_io_in_MEM_func),
    .io_in_pc_next(EX_MEM_io_in_pc_next),
    .io_in_aluRes(EX_MEM_io_in_aluRes),
    .io_in_op2(EX_MEM_io_in_op2),
    .io_in_dst(EX_MEM_io_in_dst),
    .io_out_WB_regWrite(EX_MEM_io_out_WB_regWrite),
    .io_out_WB_memToReg(EX_MEM_io_out_WB_memToReg),
    .io_out_MEM_write(EX_MEM_io_out_MEM_write),
    .io_out_MEM_read(EX_MEM_io_out_MEM_read),
    .io_out_MEM_func(EX_MEM_io_out_MEM_func),
    .io_out_pc_next(EX_MEM_io_out_pc_next),
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
  assign io_txd = uart_io_txd;
  assign io_r0 = uart_io_r0;
  assign io_r1 = uart_io_r1;
  assign io_r2 = uart_io_r2;
  assign io_r3 = uart_io_r3;
  assign instMem__T_232_addr = _T_231;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign instMem__T_232_data = instMem[instMem__T_232_addr];
  `else
  assign instMem__T_232_data = instMem__T_232_addr >= 6'h3c ? _GEN_6[31:0] : instMem[instMem__T_232_addr];
  `endif
  assign instMem__T_52_data = 32'h464c457f;
  assign instMem__T_52_addr = 6'h0;
  assign instMem__T_52_mask = 1'h1;
  assign instMem__T_52_en = 1'h1;
  assign instMem__T_55_data = 32'h10101;
  assign instMem__T_55_addr = 6'h1;
  assign instMem__T_55_mask = 1'h1;
  assign instMem__T_55_en = 1'h1;
  assign instMem__T_58_data = 32'h0;
  assign instMem__T_58_addr = 6'h2;
  assign instMem__T_58_mask = 1'h1;
  assign instMem__T_58_en = 1'h1;
  assign instMem__T_61_data = 32'h0;
  assign instMem__T_61_addr = 6'h3;
  assign instMem__T_61_mask = 1'h1;
  assign instMem__T_61_en = 1'h1;
  assign instMem__T_64_data = 32'hf30002;
  assign instMem__T_64_addr = 6'h4;
  assign instMem__T_64_mask = 1'h1;
  assign instMem__T_64_en = 1'h1;
  assign instMem__T_67_data = 32'h1;
  assign instMem__T_67_addr = 6'h5;
  assign instMem__T_67_mask = 1'h1;
  assign instMem__T_67_en = 1'h1;
  assign instMem__T_70_data = 32'h10054;
  assign instMem__T_70_addr = 6'h6;
  assign instMem__T_70_mask = 1'h1;
  assign instMem__T_70_en = 1'h1;
  assign instMem__T_73_data = 32'h34;
  assign instMem__T_73_addr = 6'h7;
  assign instMem__T_73_mask = 1'h1;
  assign instMem__T_73_en = 1'h1;
  assign instMem__T_76_data = 32'h1dc;
  assign instMem__T_76_addr = 6'h8;
  assign instMem__T_76_mask = 1'h1;
  assign instMem__T_76_en = 1'h1;
  assign instMem__T_79_data = 32'h0;
  assign instMem__T_79_addr = 6'h9;
  assign instMem__T_79_mask = 1'h1;
  assign instMem__T_79_en = 1'h1;
  assign instMem__T_82_data = 32'h200034;
  assign instMem__T_82_addr = 6'ha;
  assign instMem__T_82_mask = 1'h1;
  assign instMem__T_82_en = 1'h1;
  assign instMem__T_85_data = 32'h280001;
  assign instMem__T_85_addr = 6'hb;
  assign instMem__T_85_mask = 1'h1;
  assign instMem__T_85_en = 1'h1;
  assign instMem__T_88_data = 32'h50006;
  assign instMem__T_88_addr = 6'hc;
  assign instMem__T_88_mask = 1'h1;
  assign instMem__T_88_en = 1'h1;
  assign instMem__T_91_data = 32'h1;
  assign instMem__T_91_addr = 6'hd;
  assign instMem__T_91_mask = 1'h1;
  assign instMem__T_91_en = 1'h1;
  assign instMem__T_94_data = 32'h0;
  assign instMem__T_94_addr = 6'he;
  assign instMem__T_94_mask = 1'h1;
  assign instMem__T_94_en = 1'h1;
  assign instMem__T_97_data = 32'h10000;
  assign instMem__T_97_addr = 6'hf;
  assign instMem__T_97_mask = 1'h1;
  assign instMem__T_97_en = 1'h1;
  assign instMem__T_100_data = 32'h10000;
  assign instMem__T_100_addr = 6'h10;
  assign instMem__T_100_mask = 1'h1;
  assign instMem__T_100_en = 1'h1;
  assign instMem__T_103_data = 32'hcc;
  assign instMem__T_103_addr = 6'h11;
  assign instMem__T_103_mask = 1'h1;
  assign instMem__T_103_en = 1'h1;
  assign instMem__T_106_data = 32'hcc;
  assign instMem__T_106_addr = 6'h12;
  assign instMem__T_106_mask = 1'h1;
  assign instMem__T_106_en = 1'h1;
  assign instMem__T_109_data = 32'h5;
  assign instMem__T_109_addr = 6'h13;
  assign instMem__T_109_mask = 1'h1;
  assign instMem__T_109_en = 1'h1;
  assign instMem__T_112_data = 32'h1000;
  assign instMem__T_112_addr = 6'h14;
  assign instMem__T_112_mask = 1'h1;
  assign instMem__T_112_en = 1'h1;
  assign instMem__T_115_data = 32'h40100313;
  assign instMem__T_115_addr = 6'h15;
  assign instMem__T_115_mask = 1'h1;
  assign instMem__T_115_en = 1'h1;
  assign instMem__T_118_data = 32'h6800293;
  assign instMem__T_118_addr = 6'h16;
  assign instMem__T_118_mask = 1'h1;
  assign instMem__T_118_en = 1'h1;
  assign instMem__T_121_data = 32'h532023;
  assign instMem__T_121_addr = 6'h17;
  assign instMem__T_121_mask = 1'h1;
  assign instMem__T_121_en = 1'h1;
  assign instMem__T_124_data = 32'h6500293;
  assign instMem__T_124_addr = 6'h18;
  assign instMem__T_124_mask = 1'h1;
  assign instMem__T_124_en = 1'h1;
  assign instMem__T_127_data = 32'h532023;
  assign instMem__T_127_addr = 6'h19;
  assign instMem__T_127_mask = 1'h1;
  assign instMem__T_127_en = 1'h1;
  assign instMem__T_130_data = 32'h6c00293;
  assign instMem__T_130_addr = 6'h1a;
  assign instMem__T_130_mask = 1'h1;
  assign instMem__T_130_en = 1'h1;
  assign instMem__T_133_data = 32'h532023;
  assign instMem__T_133_addr = 6'h1b;
  assign instMem__T_133_mask = 1'h1;
  assign instMem__T_133_en = 1'h1;
  assign instMem__T_136_data = 32'h6c00293;
  assign instMem__T_136_addr = 6'h1c;
  assign instMem__T_136_mask = 1'h1;
  assign instMem__T_136_en = 1'h1;
  assign instMem__T_139_data = 32'h532023;
  assign instMem__T_139_addr = 6'h1d;
  assign instMem__T_139_mask = 1'h1;
  assign instMem__T_139_en = 1'h1;
  assign instMem__T_142_data = 32'h6f00293;
  assign instMem__T_142_addr = 6'h1e;
  assign instMem__T_142_mask = 1'h1;
  assign instMem__T_142_en = 1'h1;
  assign instMem__T_145_data = 32'h532023;
  assign instMem__T_145_addr = 6'h1f;
  assign instMem__T_145_mask = 1'h1;
  assign instMem__T_145_en = 1'h1;
  assign instMem__T_148_data = 32'h2000293;
  assign instMem__T_148_addr = 6'h20;
  assign instMem__T_148_mask = 1'h1;
  assign instMem__T_148_en = 1'h1;
  assign instMem__T_151_data = 32'h532023;
  assign instMem__T_151_addr = 6'h21;
  assign instMem__T_151_mask = 1'h1;
  assign instMem__T_151_en = 1'h1;
  assign instMem__T_154_data = 32'h7700293;
  assign instMem__T_154_addr = 6'h22;
  assign instMem__T_154_mask = 1'h1;
  assign instMem__T_154_en = 1'h1;
  assign instMem__T_157_data = 32'h532023;
  assign instMem__T_157_addr = 6'h23;
  assign instMem__T_157_mask = 1'h1;
  assign instMem__T_157_en = 1'h1;
  assign instMem__T_160_data = 32'h6f00293;
  assign instMem__T_160_addr = 6'h24;
  assign instMem__T_160_mask = 1'h1;
  assign instMem__T_160_en = 1'h1;
  assign instMem__T_163_data = 32'h532023;
  assign instMem__T_163_addr = 6'h25;
  assign instMem__T_163_mask = 1'h1;
  assign instMem__T_163_en = 1'h1;
  assign instMem__T_166_data = 32'h7200293;
  assign instMem__T_166_addr = 6'h26;
  assign instMem__T_166_mask = 1'h1;
  assign instMem__T_166_en = 1'h1;
  assign instMem__T_169_data = 32'h532023;
  assign instMem__T_169_addr = 6'h27;
  assign instMem__T_169_mask = 1'h1;
  assign instMem__T_169_en = 1'h1;
  assign instMem__T_172_data = 32'h6c00293;
  assign instMem__T_172_addr = 6'h28;
  assign instMem__T_172_mask = 1'h1;
  assign instMem__T_172_en = 1'h1;
  assign instMem__T_175_data = 32'h532023;
  assign instMem__T_175_addr = 6'h29;
  assign instMem__T_175_mask = 1'h1;
  assign instMem__T_175_en = 1'h1;
  assign instMem__T_178_data = 32'h6400293;
  assign instMem__T_178_addr = 6'h2a;
  assign instMem__T_178_mask = 1'h1;
  assign instMem__T_178_en = 1'h1;
  assign instMem__T_181_data = 32'h532023;
  assign instMem__T_181_addr = 6'h2b;
  assign instMem__T_181_mask = 1'h1;
  assign instMem__T_181_en = 1'h1;
  assign instMem__T_184_data = 32'h2100293;
  assign instMem__T_184_addr = 6'h2c;
  assign instMem__T_184_mask = 1'h1;
  assign instMem__T_184_en = 1'h1;
  assign instMem__T_187_data = 32'h532023;
  assign instMem__T_187_addr = 6'h2d;
  assign instMem__T_187_mask = 1'h1;
  assign instMem__T_187_en = 1'h1;
  assign instMem__T_190_data = 32'ha00293;
  assign instMem__T_190_addr = 6'h2e;
  assign instMem__T_190_mask = 1'h1;
  assign instMem__T_190_en = 1'h1;
  assign instMem__T_193_data = 32'h532023;
  assign instMem__T_193_addr = 6'h2f;
  assign instMem__T_193_mask = 1'h1;
  assign instMem__T_193_en = 1'h1;
  assign instMem__T_196_data = 32'hd00293;
  assign instMem__T_196_addr = 6'h30;
  assign instMem__T_196_mask = 1'h1;
  assign instMem__T_196_en = 1'h1;
  assign instMem__T_199_data = 32'h532023;
  assign instMem__T_199_addr = 6'h31;
  assign instMem__T_199_mask = 1'h1;
  assign instMem__T_199_en = 1'h1;
  assign instMem__T_202_data = 32'h8067;
  assign instMem__T_202_addr = 6'h32;
  assign instMem__T_202_mask = 1'h1;
  assign instMem__T_202_en = 1'h1;
  assign instMem__T_205_data = 32'h0;
  assign instMem__T_205_addr = 6'h33;
  assign instMem__T_205_mask = 1'h1;
  assign instMem__T_205_en = 1'h1;
  assign instMem__T_208_data = 32'h0;
  assign instMem__T_208_addr = 6'h34;
  assign instMem__T_208_mask = 1'h1;
  assign instMem__T_208_en = 1'h1;
  assign instMem__T_211_data = 32'h0;
  assign instMem__T_211_addr = 6'h35;
  assign instMem__T_211_mask = 1'h1;
  assign instMem__T_211_en = 1'h1;
  assign instMem__T_214_data = 32'h0;
  assign instMem__T_214_addr = 6'h36;
  assign instMem__T_214_mask = 1'h1;
  assign instMem__T_214_en = 1'h1;
  assign instMem__T_217_data = 32'h0;
  assign instMem__T_217_addr = 6'h37;
  assign instMem__T_217_mask = 1'h1;
  assign instMem__T_217_en = 1'h1;
  assign instMem__T_220_data = 32'h0;
  assign instMem__T_220_addr = 6'h38;
  assign instMem__T_220_mask = 1'h1;
  assign instMem__T_220_en = 1'h1;
  assign instMem__T_223_data = 32'h0;
  assign instMem__T_223_addr = 6'h39;
  assign instMem__T_223_mask = 1'h1;
  assign instMem__T_223_en = 1'h1;
  assign instMem__T_226_data = 32'h0;
  assign instMem__T_226_addr = 6'h3a;
  assign instMem__T_226_mask = 1'h1;
  assign instMem__T_226_en = 1'h1;
  assign instMem__T_229_data = 32'h0;
  assign instMem__T_229_addr = 6'h3b;
  assign instMem__T_229_mask = 1'h1;
  assign instMem__T_229_en = 1'h1;
  assign counter_clock = clock;
  assign counter_reset = reset;
  assign counter_io_branch = _T_240;
  assign counter_io_pc_src = _T_247;
  assign decoder_io_inst = IF_ID_io_out_inst;
  assign control_io_ctrl_opcode = _T_233;
  assign control_io_ctrl_funct3 = _T_234;
  assign control_io_ctrl_funct7 = _T_235;
  assign regs_clock = clock;
  assign regs_io_sel_rs_rs1 = decoder_io_sel_rs_rs1;
  assign regs_io_sel_rs_rs2 = decoder_io_sel_rs_rs2;
  assign regs_io_sel_rd = MEM_WB_io_out_dst;
  assign regs_io_reg_rd = _T_264;
  assign regs_io_regWrite = MEM_WB_io_out_WB_regWrite;
  assign alu_io_aluOp_func = ID_EX_io_out_EX_aluOp_func;
  assign alu_io_aluOp_alt = ID_EX_io_out_EX_aluOp_alt;
  assign alu_io_reg_rs_rs1 = _T_254;
  assign alu_io_reg_rs_rs2 = _T_262;
  assign alu_io_opcode = ID_EX_io_out_EX_opcode;
  assign dataMem_clock = clock;
  assign dataMem_io_mem_write = EX_MEM_io_out_MEM_write;
  assign dataMem_io_mem_read = EX_MEM_io_out_MEM_read;
  assign dataMem_io_mem_func = EX_MEM_io_out_MEM_func;
  assign dataMem_io_reg_rs_rs1 = EX_MEM_io_out_aluRes;
  assign dataMem_io_reg_rs_rs2 = EX_MEM_io_out_op2;
  assign fwdUnit_io_regWrite_exMem = EX_MEM_io_out_WB_regWrite;
  assign fwdUnit_io_regWrite_memWb = MEM_WB_io_out_WB_regWrite;
  assign fwdUnit_io_sel_rs1 = ID_EX_io_out_sel_rs_rs1;
  assign fwdUnit_io_sel_rs2 = ID_EX_io_out_sel_rs_rs2;
  assign fwdUnit_io_dst_exMem = EX_MEM_io_out_dst;
  assign fwdUnit_io_dst_memWb = MEM_WB_io_out_dst;
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_in = _GEN_1;
  assign IF_ID_clock = clock;
  assign IF_ID_io_in_pc_next = counter_io_pc_next;
  assign IF_ID_io_in_inst = instMem__T_232_data;
  assign ID_EX_clock = clock;
  assign ID_EX_io_in_WB_regWrite = control_io_WB_regWrite;
  assign ID_EX_io_in_WB_memToReg = control_io_WB_memToReg;
  assign ID_EX_io_in_MEM_write = control_io_MEM_write;
  assign ID_EX_io_in_MEM_read = control_io_MEM_read;
  assign ID_EX_io_in_MEM_func = control_io_MEM_func;
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
  assign ID_EX_io_in_pc_next = IF_ID_io_out_pc_next;
  assign ID_EX_io_in_imm = {{20'd0}, _T_248};
  assign EX_MEM_clock = clock;
  assign EX_MEM_io_in_WB_regWrite = ID_EX_io_out_WB_regWrite;
  assign EX_MEM_io_in_WB_memToReg = ID_EX_io_out_WB_memToReg;
  assign EX_MEM_io_in_MEM_write = ID_EX_io_out_MEM_write;
  assign EX_MEM_io_in_MEM_read = ID_EX_io_out_MEM_read;
  assign EX_MEM_io_in_MEM_func = ID_EX_io_out_MEM_func;
  assign EX_MEM_io_in_pc_next = ID_EX_io_out_pc_next;
  assign EX_MEM_io_in_aluRes = alu_io_reg_rd;
  assign EX_MEM_io_in_op2 = alu_io_reg_rs_rs2;
  assign EX_MEM_io_in_dst = _T_263;
  assign MEM_WB_clock = clock;
  assign MEM_WB_io_in_WB_regWrite = EX_MEM_io_out_WB_regWrite;
  assign MEM_WB_io_in_WB_memToReg = EX_MEM_io_out_WB_memToReg;
  assign MEM_WB_io_in_rd_alu = EX_MEM_io_out_aluRes;
  assign MEM_WB_io_in_rd_mem = dataMem_io_reg_rd;
  assign MEM_WB_io_in_dst = EX_MEM_io_out_dst;
  assign _T_231 = counter_io_pc[5:0];
  assign _T_233 = uart_io_valid ? decoder_io_ctrl_opcode : 7'h0;
  assign _T_234 = uart_io_valid ? decoder_io_ctrl_funct3 : 3'h0;
  assign _T_235 = uart_io_valid ? decoder_io_ctrl_funct7 : 7'h0;
  assign _T_236 = regs_io_reg_rs_rs1 == regs_io_reg_rs_rs2;
  assign _T_237 = _T_236 & control_io_MEM_branch;
  assign _T_239 = uart_io_valid == 1'h0;
  assign _T_240 = _T_237 | _T_239;
  assign _GEN_244 = {{20'd0}, decoder_io_imm_SB};
  assign _T_241 = IF_ID_io_out_pc_next + _GEN_244;
  assign _T_242 = _T_241[31:0];
  assign _T_244 = EX_MEM_io_out_pc_next - 32'h1;
  assign _T_245 = $unsigned(_T_244);
  assign _T_246 = _T_245[31:0];
  assign _T_247 = uart_io_valid ? _T_242 : _T_246;
  assign _T_248 = control_io_MEM_write ? decoder_io_imm_S : decoder_io_imm_I;
  assign _T_249 = 2'h0 == fwdUnit_io_fwd_rs1;
  assign _T_250 = _T_249 ? ID_EX_io_out_rs_rs1 : 32'h0;
  assign _T_251 = 2'h1 == fwdUnit_io_fwd_rs1;
  assign _T_252 = _T_251 ? regs_io_reg_rd : _T_250;
  assign _T_253 = 2'h2 == fwdUnit_io_fwd_rs1;
  assign _T_254 = _T_253 ? EX_MEM_io_out_aluRes : _T_252;
  assign _T_256 = ID_EX_io_out_EX_alu_sel ? ID_EX_io_out_imm : ID_EX_io_out_rs_rs2;
  assign _T_257 = 2'h0 == fwdUnit_io_fwd_rs2;
  assign _T_258 = _T_257 ? _T_256 : 32'h5;
  assign _T_259 = 2'h1 == fwdUnit_io_fwd_rs2;
  assign _T_260 = _T_259 ? regs_io_reg_rd : _T_258;
  assign _T_261 = 2'h2 == fwdUnit_io_fwd_rs2;
  assign _T_262 = _T_261 ? EX_MEM_io_out_aluRes : _T_260;
  assign _T_263 = ID_EX_io_out_EX_dst_sel ? ID_EX_io_out_sel_rd : ID_EX_io_out_sel_rs_rs2;
  assign _T_264 = MEM_WB_io_out_WB_memToReg ? MEM_WB_io_out_rd_mem : MEM_WB_io_out_rd_alu;
  assign _T_266 = dataMem_io_reg_rs_rs1 == 32'h401;
  assign _T_267 = EX_MEM_io_out_MEM_write & _T_266;
  assign _T_268 = dataMem_io_reg_rs_rs2[7:0];
  assign _T_270 = _T_267 == 1'h0;
  assign _GEN_1 = _T_270 ? 8'h0 : _T_268;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 60; initvar = initvar+1)
    instMem[initvar] = _GEN_5[31:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _GEN_0 = _GEN_7[4:0];
  `endif
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
  _GEN_4 = _GEN_10[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(instMem__T_52_en & instMem__T_52_mask) begin
      instMem[instMem__T_52_addr] <= instMem__T_52_data;
    end
    if(instMem__T_55_en & instMem__T_55_mask) begin
      instMem[instMem__T_55_addr] <= instMem__T_55_data;
    end
    if(instMem__T_58_en & instMem__T_58_mask) begin
      instMem[instMem__T_58_addr] <= instMem__T_58_data;
    end
    if(instMem__T_61_en & instMem__T_61_mask) begin
      instMem[instMem__T_61_addr] <= instMem__T_61_data;
    end
    if(instMem__T_64_en & instMem__T_64_mask) begin
      instMem[instMem__T_64_addr] <= instMem__T_64_data;
    end
    if(instMem__T_67_en & instMem__T_67_mask) begin
      instMem[instMem__T_67_addr] <= instMem__T_67_data;
    end
    if(instMem__T_70_en & instMem__T_70_mask) begin
      instMem[instMem__T_70_addr] <= instMem__T_70_data;
    end
    if(instMem__T_73_en & instMem__T_73_mask) begin
      instMem[instMem__T_73_addr] <= instMem__T_73_data;
    end
    if(instMem__T_76_en & instMem__T_76_mask) begin
      instMem[instMem__T_76_addr] <= instMem__T_76_data;
    end
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
    if(instMem__T_124_en & instMem__T_124_mask) begin
      instMem[instMem__T_124_addr] <= instMem__T_124_data;
    end
    if(instMem__T_127_en & instMem__T_127_mask) begin
      instMem[instMem__T_127_addr] <= instMem__T_127_data;
    end
    if(instMem__T_130_en & instMem__T_130_mask) begin
      instMem[instMem__T_130_addr] <= instMem__T_130_data;
    end
    if(instMem__T_133_en & instMem__T_133_mask) begin
      instMem[instMem__T_133_addr] <= instMem__T_133_data;
    end
    if(instMem__T_136_en & instMem__T_136_mask) begin
      instMem[instMem__T_136_addr] <= instMem__T_136_data;
    end
    if(instMem__T_139_en & instMem__T_139_mask) begin
      instMem[instMem__T_139_addr] <= instMem__T_139_data;
    end
    if(instMem__T_142_en & instMem__T_142_mask) begin
      instMem[instMem__T_142_addr] <= instMem__T_142_data;
    end
    if(instMem__T_145_en & instMem__T_145_mask) begin
      instMem[instMem__T_145_addr] <= instMem__T_145_data;
    end
    if(instMem__T_148_en & instMem__T_148_mask) begin
      instMem[instMem__T_148_addr] <= instMem__T_148_data;
    end
    if(instMem__T_151_en & instMem__T_151_mask) begin
      instMem[instMem__T_151_addr] <= instMem__T_151_data;
    end
    if(instMem__T_154_en & instMem__T_154_mask) begin
      instMem[instMem__T_154_addr] <= instMem__T_154_data;
    end
    if(instMem__T_157_en & instMem__T_157_mask) begin
      instMem[instMem__T_157_addr] <= instMem__T_157_data;
    end
    if(instMem__T_160_en & instMem__T_160_mask) begin
      instMem[instMem__T_160_addr] <= instMem__T_160_data;
    end
    if(instMem__T_163_en & instMem__T_163_mask) begin
      instMem[instMem__T_163_addr] <= instMem__T_163_data;
    end
    if(instMem__T_166_en & instMem__T_166_mask) begin
      instMem[instMem__T_166_addr] <= instMem__T_166_data;
    end
    if(instMem__T_169_en & instMem__T_169_mask) begin
      instMem[instMem__T_169_addr] <= instMem__T_169_data;
    end
    if(instMem__T_172_en & instMem__T_172_mask) begin
      instMem[instMem__T_172_addr] <= instMem__T_172_data;
    end
    if(instMem__T_175_en & instMem__T_175_mask) begin
      instMem[instMem__T_175_addr] <= instMem__T_175_data;
    end
    if(instMem__T_178_en & instMem__T_178_mask) begin
      instMem[instMem__T_178_addr] <= instMem__T_178_data;
    end
    if(instMem__T_181_en & instMem__T_181_mask) begin
      instMem[instMem__T_181_addr] <= instMem__T_181_data;
    end
    if(instMem__T_184_en & instMem__T_184_mask) begin
      instMem[instMem__T_184_addr] <= instMem__T_184_data;
    end
    if(instMem__T_187_en & instMem__T_187_mask) begin
      instMem[instMem__T_187_addr] <= instMem__T_187_data;
    end
    if(instMem__T_190_en & instMem__T_190_mask) begin
      instMem[instMem__T_190_addr] <= instMem__T_190_data;
    end
    if(instMem__T_193_en & instMem__T_193_mask) begin
      instMem[instMem__T_193_addr] <= instMem__T_193_data;
    end
    if(instMem__T_196_en & instMem__T_196_mask) begin
      instMem[instMem__T_196_addr] <= instMem__T_196_data;
    end
    if(instMem__T_199_en & instMem__T_199_mask) begin
      instMem[instMem__T_199_addr] <= instMem__T_199_data;
    end
    if(instMem__T_202_en & instMem__T_202_mask) begin
      instMem[instMem__T_202_addr] <= instMem__T_202_data;
    end
    if(instMem__T_205_en & instMem__T_205_mask) begin
      instMem[instMem__T_205_addr] <= instMem__T_205_data;
    end
    if(instMem__T_208_en & instMem__T_208_mask) begin
      instMem[instMem__T_208_addr] <= instMem__T_208_data;
    end
    if(instMem__T_211_en & instMem__T_211_mask) begin
      instMem[instMem__T_211_addr] <= instMem__T_211_data;
    end
    if(instMem__T_214_en & instMem__T_214_mask) begin
      instMem[instMem__T_214_addr] <= instMem__T_214_data;
    end
    if(instMem__T_217_en & instMem__T_217_mask) begin
      instMem[instMem__T_217_addr] <= instMem__T_217_data;
    end
    if(instMem__T_220_en & instMem__T_220_mask) begin
      instMem[instMem__T_220_addr] <= instMem__T_220_data;
    end
    if(instMem__T_223_en & instMem__T_223_mask) begin
      instMem[instMem__T_223_addr] <= instMem__T_223_data;
    end
    if(instMem__T_226_en & instMem__T_226_mask) begin
      instMem[instMem__T_226_addr] <= instMem__T_226_data;
    end
    if(instMem__T_229_en & instMem__T_229_mask) begin
      instMem[instMem__T_229_addr] <= instMem__T_229_data;
    end
  end
endmodule
