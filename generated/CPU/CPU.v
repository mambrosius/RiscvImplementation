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
module Queue(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
);
  reg [7:0] ram [0:15];
  reg [31:0] _GEN_0;
  wire [7:0] ram__T_43_data;
  wire [3:0] ram__T_43_addr;
  wire [7:0] ram__T_29_data;
  wire [3:0] ram__T_29_addr;
  wire  ram__T_29_mask;
  wire  ram__T_29_en;
  reg [3:0] value;
  reg [31:0] _GEN_1;
  reg [3:0] value_1;
  reg [31:0] _GEN_2;
  reg  maybe_full;
  reg [31:0] _GEN_3;
  wire  _T_20;
  wire  _T_22;
  wire  _T_23;
  wire  _T_24;
  wire  _T_25;
  wire  do_enq;
  wire  _T_27;
  wire  do_deq;
  wire [4:0] _T_32;
  wire [3:0] _T_33;
  wire [3:0] _GEN_4;
  wire [4:0] _T_36;
  wire [3:0] _T_37;
  wire [3:0] _GEN_5;
  wire  _T_38;
  wire  _GEN_6;
  wire  _T_40;
  wire  _T_42;
  assign io_enq_ready = _T_42;
  assign io_deq_valid = _T_40;
  assign io_deq_bits = ram__T_43_data;
  assign ram__T_43_addr = value_1;
  assign ram__T_43_data = ram[ram__T_43_addr];
  assign ram__T_29_data = io_enq_bits;
  assign ram__T_29_addr = value;
  assign ram__T_29_mask = do_enq;
  assign ram__T_29_en = do_enq;
  assign _T_20 = value == value_1;
  assign _T_22 = maybe_full == 1'h0;
  assign _T_23 = _T_20 & _T_22;
  assign _T_24 = _T_20 & maybe_full;
  assign _T_25 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_25;
  assign _T_27 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_27;
  assign _T_32 = value + 4'h1;
  assign _T_33 = _T_32[3:0];
  assign _GEN_4 = do_enq ? _T_33 : value;
  assign _T_36 = value_1 + 4'h1;
  assign _T_37 = _T_36[3:0];
  assign _GEN_5 = do_deq ? _T_37 : value_1;
  assign _T_38 = do_enq != do_deq;
  assign _GEN_6 = _T_38 ? do_enq : maybe_full;
  assign _T_40 = _T_23 == 1'h0;
  assign _T_42 = _T_24 == 1'h0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _GEN_0[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  value = _GEN_1[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  value_1 = _GEN_2[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  maybe_full = _GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram__T_29_en & ram__T_29_mask) begin
      ram[ram__T_29_addr] <= ram__T_29_data;
    end
    if (reset) begin
      value <= 4'h0;
    end else begin
      if (do_enq) begin
        value <= _T_33;
      end
    end
    if (reset) begin
      value_1 <= 4'h0;
    end else begin
      if (do_deq) begin
        value_1 <= _T_37;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_38) begin
        maybe_full <= do_enq;
      end
    end
  end
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
  wire [7:0] _T_40;
  wire [8:0] _T_41;
  wire [4:0] _T_43;
  wire [4:0] _T_44;
  wire [3:0] _T_45;
  wire [8:0] _GEN_6;
  wire [31:0] _GEN_7;
  wire [3:0] _GEN_8;
  wire  _T_47;
  wire [32:0] _T_49;
  wire [31:0] _T_50;
  wire [31:0] _GEN_9;
  wire [8:0] _GEN_10;
  wire [31:0] _GEN_11;
  wire [3:0] _GEN_12;
  wire  _T_51;
  assign io_enq_ready = _T_15;
  assign io_txd = _T_51;
  assign _T_15 = state == 4'h0;
  assign _T_16 = 4'h0 == state;
  assign _T_18 = {io_enq_bits,1'h0};
  assign _GEN_0 = io_enq_valid ? _T_18 : data;
  assign _GEN_1 = io_enq_valid ? 32'h0 : ticks;
  assign _GEN_2 = io_enq_valid ? 4'ha : state;
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
  assign _T_29 = _T_19 | _T_20;
  assign _T_30 = _T_29 | _T_21;
  assign _T_31 = _T_30 | _T_22;
  assign _T_32 = _T_31 | _T_23;
  assign _T_33 = _T_32 | _T_24;
  assign _T_34 = _T_33 | _T_25;
  assign _T_35 = _T_34 | _T_26;
  assign _T_36 = _T_35 | _T_27;
  assign _T_37 = _T_36 | _T_28;
  assign _T_38 = ticks == 32'h1b2;
  assign _T_40 = data[8:1];
  assign _T_41 = {1'h1,_T_40};
  assign _T_43 = state - 4'h1;
  assign _T_44 = $unsigned(_T_43);
  assign _T_45 = _T_44[3:0];
  assign _GEN_6 = _T_38 ? _T_41 : _GEN_3;
  assign _GEN_7 = _T_38 ? 32'h0 : _GEN_4;
  assign _GEN_8 = _T_38 ? _T_45 : _GEN_5;
  assign _T_47 = _T_38 == 1'h0;
  assign _T_49 = ticks + 32'h1;
  assign _T_50 = _T_49[31:0];
  assign _GEN_9 = _T_47 ? _T_50 : _GEN_7;
  assign _GEN_10 = _T_37 ? _GEN_6 : _GEN_3;
  assign _GEN_11 = _T_37 ? _GEN_9 : _GEN_4;
  assign _GEN_12 = _T_37 ? _GEN_8 : _GEN_5;
  assign _T_51 = data[0];
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
      if (_T_37) begin
        if (_T_38) begin
          data <= _T_41;
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
      if (_T_37) begin
        if (_T_47) begin
          ticks <= _T_50;
        end else begin
          if (_T_38) begin
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
      if (_T_37) begin
        if (_T_38) begin
          state <= _T_45;
        end else begin
          if (_T_16) begin
            if (io_enq_valid) begin
              state <= 4'ha;
            end
          end
        end
      end else begin
        if (_T_16) begin
          if (io_enq_valid) begin
            state <= 4'ha;
          end
        end
      end
    end
  end
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  output       io_txd
);
  wire  queue1_clock;
  wire  queue1_reset;
  wire  queue1_io_enq_ready;
  wire  queue1_io_enq_valid;
  wire [7:0] queue1_io_enq_bits;
  wire  queue1_io_deq_ready;
  wire  queue1_io_deq_valid;
  wire [7:0] queue1_io_deq_bits;
  wire  queue2_clock;
  wire  queue2_reset;
  wire  queue2_io_enq_ready;
  wire  queue2_io_enq_valid;
  wire [7:0] queue2_io_enq_bits;
  wire  queue2_io_deq_ready;
  wire  queue2_io_deq_valid;
  wire [7:0] queue2_io_deq_bits;
  wire  tx_clock;
  wire  tx_reset;
  wire  tx_io_enq_ready;
  wire  tx_io_enq_valid;
  wire [7:0] tx_io_enq_bits;
  wire  tx_io_txd;
  Queue queue1 (
    .clock(queue1_clock),
    .reset(queue1_reset),
    .io_enq_ready(queue1_io_enq_ready),
    .io_enq_valid(queue1_io_enq_valid),
    .io_enq_bits(queue1_io_enq_bits),
    .io_deq_ready(queue1_io_deq_ready),
    .io_deq_valid(queue1_io_deq_valid),
    .io_deq_bits(queue1_io_deq_bits)
  );
  Queue queue2 (
    .clock(queue2_clock),
    .reset(queue2_reset),
    .io_enq_ready(queue2_io_enq_ready),
    .io_enq_valid(queue2_io_enq_valid),
    .io_enq_bits(queue2_io_enq_bits),
    .io_deq_ready(queue2_io_deq_ready),
    .io_deq_valid(queue2_io_deq_valid),
    .io_deq_bits(queue2_io_deq_bits)
  );
  Tx tx (
    .clock(tx_clock),
    .reset(tx_reset),
    .io_enq_ready(tx_io_enq_ready),
    .io_enq_valid(tx_io_enq_valid),
    .io_enq_bits(tx_io_enq_bits),
    .io_txd(tx_io_txd)
  );
  assign io_txd = tx_io_txd;
  assign queue1_clock = clock;
  assign queue1_reset = reset;
  assign queue1_io_enq_valid = io_enq_valid;
  assign queue1_io_enq_bits = io_enq_bits;
  assign queue1_io_deq_ready = queue2_io_enq_ready;
  assign queue2_clock = clock;
  assign queue2_reset = reset;
  assign queue2_io_enq_valid = queue1_io_deq_valid;
  assign queue2_io_enq_bits = queue1_io_deq_bits;
  assign queue2_io_deq_ready = tx_io_enq_ready;
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_enq_valid = queue2_io_deq_valid;
  assign tx_io_enq_bits = queue2_io_deq_bits;
endmodule
module Rx(
  input        clock,
  input        reset,
  input        io_rxd,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
);
  wire [8:0] TICK_HALF;
  reg [8:0] data;
  reg [31:0] _GEN_26;
  reg [31:0] ticks;
  reg [31:0] _GEN_27;
  reg [3:0] state;
  reg [31:0] _GEN_28;
  reg  valid;
  reg [31:0] _GEN_29;
  wire  _T_13;
  wire  _GEN_0;
  wire  _T_14;
  wire  _T_15;
  wire  _T_16;
  wire [32:0] _T_18;
  wire [32:0] _T_19;
  wire [31:0] _T_20;
  wire [31:0] _GEN_1;
  wire  _T_22;
  wire [31:0] _GEN_2;
  wire [3:0] _GEN_3;
  wire  _GEN_4;
  wire [31:0] _GEN_5;
  wire [3:0] _GEN_6;
  wire  _GEN_7;
  wire [31:0] _GEN_8;
  wire [3:0] _GEN_9;
  wire  _GEN_10;
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
  wire [7:0] _T_41;
  wire [8:0] _T_42;
  wire [4:0] _T_44;
  wire [4:0] _T_45;
  wire [3:0] _T_46;
  wire [8:0] _GEN_11;
  wire [31:0] _GEN_12;
  wire [3:0] _GEN_13;
  wire  _T_48;
  wire [31:0] _GEN_14;
  wire [8:0] _GEN_15;
  wire [31:0] _GEN_16;
  wire [3:0] _GEN_17;
  wire  _T_53;
  wire [31:0] _GEN_25;
  wire  _T_54;
  wire [31:0] _GEN_18;
  wire [3:0] _GEN_19;
  wire  _GEN_20;
  wire  _T_60;
  wire [31:0] _GEN_21;
  wire [31:0] _GEN_22;
  wire [3:0] _GEN_23;
  wire  _GEN_24;
  wire [7:0] _T_65;
  assign io_deq_valid = valid;
  assign io_deq_bits = _T_65;
  assign TICK_HALF = 9'h1b2 / 9'h2;
  assign _T_13 = valid & io_deq_ready;
  assign _GEN_0 = _T_13 ? 1'h0 : valid;
  assign _T_14 = 4'h0 == state;
  assign _T_15 = io_rxd == 1'h0;
  assign _T_16 = ticks != 32'h0;
  assign _T_18 = ticks - 32'h1;
  assign _T_19 = $unsigned(_T_18);
  assign _T_20 = _T_19[31:0];
  assign _GEN_1 = _T_16 ? _T_20 : ticks;
  assign _T_22 = _T_16 == 1'h0;
  assign _GEN_2 = _T_22 ? 32'h1b2 : _GEN_1;
  assign _GEN_3 = _T_22 ? 4'ha : state;
  assign _GEN_4 = _T_22 ? 1'h0 : _GEN_0;
  assign _GEN_5 = _T_15 ? _GEN_2 : ticks;
  assign _GEN_6 = _T_15 ? _GEN_3 : state;
  assign _GEN_7 = _T_15 ? _GEN_4 : _GEN_0;
  assign _GEN_8 = _T_14 ? _GEN_5 : ticks;
  assign _GEN_9 = _T_14 ? _GEN_6 : state;
  assign _GEN_10 = _T_14 ? _GEN_7 : _GEN_0;
  assign _T_23 = 4'h2 == state;
  assign _T_24 = 4'h3 == state;
  assign _T_25 = 4'h4 == state;
  assign _T_26 = 4'h5 == state;
  assign _T_27 = 4'h6 == state;
  assign _T_28 = 4'h7 == state;
  assign _T_29 = 4'h8 == state;
  assign _T_30 = 4'h9 == state;
  assign _T_31 = 4'ha == state;
  assign _T_32 = _T_23 | _T_24;
  assign _T_33 = _T_32 | _T_25;
  assign _T_34 = _T_33 | _T_26;
  assign _T_35 = _T_34 | _T_27;
  assign _T_36 = _T_35 | _T_28;
  assign _T_37 = _T_36 | _T_29;
  assign _T_38 = _T_37 | _T_30;
  assign _T_39 = _T_38 | _T_31;
  assign _T_40 = ticks == 32'h0;
  assign _T_41 = data[8:1];
  assign _T_42 = {io_rxd,_T_41};
  assign _T_44 = state - 4'h1;
  assign _T_45 = $unsigned(_T_44);
  assign _T_46 = _T_45[3:0];
  assign _GEN_11 = _T_40 ? _T_42 : data;
  assign _GEN_12 = _T_40 ? 32'h1b2 : _GEN_8;
  assign _GEN_13 = _T_40 ? _T_46 : _GEN_9;
  assign _T_48 = _T_40 == 1'h0;
  assign _GEN_14 = _T_48 ? _T_20 : _GEN_12;
  assign _GEN_15 = _T_39 ? _GEN_11 : data;
  assign _GEN_16 = _T_39 ? _GEN_14 : _GEN_8;
  assign _GEN_17 = _T_39 ? _GEN_13 : _GEN_9;
  assign _T_53 = 4'h1 == state;
  assign _GEN_25 = {{23'd0}, TICK_HALF};
  assign _T_54 = ticks == _GEN_25;
  assign _GEN_18 = _T_54 ? _T_20 : _GEN_16;
  assign _GEN_19 = _T_54 ? 4'h0 : _GEN_17;
  assign _GEN_20 = _T_54 ? 1'h1 : _GEN_10;
  assign _T_60 = _T_54 == 1'h0;
  assign _GEN_21 = _T_60 ? _T_20 : _GEN_18;
  assign _GEN_22 = _T_53 ? _GEN_21 : _GEN_16;
  assign _GEN_23 = _T_53 ? _GEN_19 : _GEN_17;
  assign _GEN_24 = _T_53 ? _GEN_20 : _GEN_10;
  assign _T_65 = data[7:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_26 = {1{$random}};
  data = _GEN_26[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_27 = {1{$random}};
  ticks = _GEN_27[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  state = _GEN_28[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_29 = {1{$random}};
  valid = _GEN_29[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      data <= 9'h0;
    end else begin
      if (_T_39) begin
        if (_T_40) begin
          data <= _T_42;
        end
      end
    end
    if (reset) begin
      ticks <= {{23'd0}, TICK_HALF};
    end else begin
      if (_T_53) begin
        if (_T_60) begin
          ticks <= _T_20;
        end else begin
          if (_T_54) begin
            ticks <= _T_20;
          end else begin
            if (_T_39) begin
              if (_T_48) begin
                ticks <= _T_20;
              end else begin
                if (_T_40) begin
                  ticks <= 32'h1b2;
                end else begin
                  if (_T_14) begin
                    if (_T_15) begin
                      if (_T_22) begin
                        ticks <= 32'h1b2;
                      end else begin
                        if (_T_16) begin
                          ticks <= _T_20;
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (_T_14) begin
                if (_T_15) begin
                  if (_T_22) begin
                    ticks <= 32'h1b2;
                  end else begin
                    if (_T_16) begin
                      ticks <= _T_20;
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (_T_39) begin
          if (_T_48) begin
            ticks <= _T_20;
          end else begin
            if (_T_40) begin
              ticks <= 32'h1b2;
            end else begin
              if (_T_14) begin
                if (_T_15) begin
                  if (_T_22) begin
                    ticks <= 32'h1b2;
                  end else begin
                    if (_T_16) begin
                      ticks <= _T_20;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_14) begin
            if (_T_15) begin
              if (_T_22) begin
                ticks <= 32'h1b2;
              end else begin
                if (_T_16) begin
                  ticks <= _T_20;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      state <= 4'h0;
    end else begin
      if (_T_53) begin
        if (_T_54) begin
          state <= 4'h0;
        end else begin
          if (_T_39) begin
            if (_T_40) begin
              state <= _T_46;
            end else begin
              if (_T_14) begin
                if (_T_15) begin
                  if (_T_22) begin
                    state <= 4'ha;
                  end
                end
              end
            end
          end else begin
            if (_T_14) begin
              if (_T_15) begin
                if (_T_22) begin
                  state <= 4'ha;
                end
              end
            end
          end
        end
      end else begin
        if (_T_39) begin
          if (_T_40) begin
            state <= _T_46;
          end else begin
            if (_T_14) begin
              if (_T_15) begin
                if (_T_22) begin
                  state <= 4'ha;
                end
              end
            end
          end
        end else begin
          if (_T_14) begin
            if (_T_15) begin
              if (_T_22) begin
                state <= 4'ha;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (_T_53) begin
        if (_T_54) begin
          valid <= 1'h1;
        end else begin
          if (_T_14) begin
            if (_T_15) begin
              if (_T_22) begin
                valid <= 1'h0;
              end else begin
                if (_T_13) begin
                  valid <= 1'h0;
                end
              end
            end else begin
              if (_T_13) begin
                valid <= 1'h0;
              end
            end
          end else begin
            if (_T_13) begin
              valid <= 1'h0;
            end
          end
        end
      end else begin
        if (_T_14) begin
          if (_T_15) begin
            if (_T_22) begin
              valid <= 1'h0;
            end else begin
              if (_T_13) begin
                valid <= 1'h0;
              end
            end
          end else begin
            valid <= _GEN_0;
          end
        end else begin
          valid <= _GEN_0;
        end
      end
    end
  end
endmodule
module BufferedRx(
  input   clock,
  input   reset,
  input   io_rxd,
  input   io_deq_ready
);
  wire  queue_clock;
  wire  queue_reset;
  wire  queue_io_enq_ready;
  wire  queue_io_enq_valid;
  wire [7:0] queue_io_enq_bits;
  wire  queue_io_deq_ready;
  wire  queue_io_deq_valid;
  wire [7:0] queue_io_deq_bits;
  wire  rx_clock;
  wire  rx_reset;
  wire  rx_io_rxd;
  wire  rx_io_deq_ready;
  wire  rx_io_deq_valid;
  wire [7:0] rx_io_deq_bits;
  Queue queue (
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits(queue_io_enq_bits),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits(queue_io_deq_bits)
  );
  Rx rx (
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_deq_ready(rx_io_deq_ready),
    .io_deq_valid(rx_io_deq_valid),
    .io_deq_bits(rx_io_deq_bits)
  );
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = rx_io_deq_valid;
  assign queue_io_enq_bits = rx_io_deq_bits;
  assign queue_io_deq_ready = io_deq_ready;
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rxd;
  assign rx_io_deq_ready = queue_io_enq_ready;
endmodule
module UART(
  input        clock,
  input        reset,
  input        io_ctl_enq_valid,
  input  [7:0] io_ctl_enq_bits,
  input        io_ctl_deq_ready,
  input        io_rxd,
  output       io_txd
);
  wire  tx_clock;
  wire  tx_reset;
  wire  tx_io_enq_valid;
  wire [7:0] tx_io_enq_bits;
  wire  tx_io_txd;
  wire  rx_clock;
  wire  rx_reset;
  wire  rx_io_rxd;
  wire  rx_io_deq_ready;
  BufferedTx tx (
    .clock(tx_clock),
    .reset(tx_reset),
    .io_enq_valid(tx_io_enq_valid),
    .io_enq_bits(tx_io_enq_bits),
    .io_txd(tx_io_txd)
  );
  BufferedRx rx (
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_deq_ready(rx_io_deq_ready)
  );
  assign io_txd = tx_io_txd;
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_enq_valid = io_ctl_enq_valid;
  assign tx_io_enq_bits = io_ctl_enq_bits;
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rxd;
  assign rx_io_deq_ready = io_ctl_deq_ready;
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
  reg [31:0] _T_76_imm;
  reg [31:0] _GEN_15;
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
  _T_76_imm = _GEN_15[31:0];
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
  input  [31:0] io_in_aluRes,
  input  [31:0] io_in_op2,
  input  [4:0]  io_in_dst,
  output        io_out_WB_regWrite,
  output        io_out_WB_memToReg,
  output        io_out_MEM_write,
  output        io_out_MEM_read,
  output [2:0]  io_out_MEM_func,
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
  assign io_out_MEM_func = _T_48_MEM_func;
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
    _T_48_MEM_func <= io_in_MEM_func;
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
  input   clock,
  input   reset,
  output  io_txd
);
  reg [31:0] instMem [0:64];
  reg [31:0] _GEN_8;
  wire [31:0] instMem__T_243_data;
  wire [6:0] instMem__T_243_addr;
  reg [31:0] _GEN_9;
  wire [31:0] instMem__T_48_data;
  wire [6:0] instMem__T_48_addr;
  wire  instMem__T_48_mask;
  wire  instMem__T_48_en;
  wire [31:0] instMem__T_51_data;
  wire [6:0] instMem__T_51_addr;
  wire  instMem__T_51_mask;
  wire  instMem__T_51_en;
  wire [31:0] instMem__T_54_data;
  wire [6:0] instMem__T_54_addr;
  wire  instMem__T_54_mask;
  wire  instMem__T_54_en;
  wire [31:0] instMem__T_57_data;
  wire [6:0] instMem__T_57_addr;
  wire  instMem__T_57_mask;
  wire  instMem__T_57_en;
  wire [31:0] instMem__T_60_data;
  wire [6:0] instMem__T_60_addr;
  wire  instMem__T_60_mask;
  wire  instMem__T_60_en;
  wire [31:0] instMem__T_63_data;
  wire [6:0] instMem__T_63_addr;
  wire  instMem__T_63_mask;
  wire  instMem__T_63_en;
  wire [31:0] instMem__T_66_data;
  wire [6:0] instMem__T_66_addr;
  wire  instMem__T_66_mask;
  wire  instMem__T_66_en;
  wire [31:0] instMem__T_69_data;
  wire [6:0] instMem__T_69_addr;
  wire  instMem__T_69_mask;
  wire  instMem__T_69_en;
  wire [31:0] instMem__T_72_data;
  wire [6:0] instMem__T_72_addr;
  wire  instMem__T_72_mask;
  wire  instMem__T_72_en;
  wire [31:0] instMem__T_75_data;
  wire [6:0] instMem__T_75_addr;
  wire  instMem__T_75_mask;
  wire  instMem__T_75_en;
  wire [31:0] instMem__T_78_data;
  wire [6:0] instMem__T_78_addr;
  wire  instMem__T_78_mask;
  wire  instMem__T_78_en;
  wire [31:0] instMem__T_81_data;
  wire [6:0] instMem__T_81_addr;
  wire  instMem__T_81_mask;
  wire  instMem__T_81_en;
  wire [31:0] instMem__T_84_data;
  wire [6:0] instMem__T_84_addr;
  wire  instMem__T_84_mask;
  wire  instMem__T_84_en;
  wire [31:0] instMem__T_87_data;
  wire [6:0] instMem__T_87_addr;
  wire  instMem__T_87_mask;
  wire  instMem__T_87_en;
  wire [31:0] instMem__T_90_data;
  wire [6:0] instMem__T_90_addr;
  wire  instMem__T_90_mask;
  wire  instMem__T_90_en;
  wire [31:0] instMem__T_93_data;
  wire [6:0] instMem__T_93_addr;
  wire  instMem__T_93_mask;
  wire  instMem__T_93_en;
  wire [31:0] instMem__T_96_data;
  wire [6:0] instMem__T_96_addr;
  wire  instMem__T_96_mask;
  wire  instMem__T_96_en;
  wire [31:0] instMem__T_99_data;
  wire [6:0] instMem__T_99_addr;
  wire  instMem__T_99_mask;
  wire  instMem__T_99_en;
  wire [31:0] instMem__T_102_data;
  wire [6:0] instMem__T_102_addr;
  wire  instMem__T_102_mask;
  wire  instMem__T_102_en;
  wire [31:0] instMem__T_105_data;
  wire [6:0] instMem__T_105_addr;
  wire  instMem__T_105_mask;
  wire  instMem__T_105_en;
  wire [31:0] instMem__T_108_data;
  wire [6:0] instMem__T_108_addr;
  wire  instMem__T_108_mask;
  wire  instMem__T_108_en;
  wire [31:0] instMem__T_111_data;
  wire [6:0] instMem__T_111_addr;
  wire  instMem__T_111_mask;
  wire  instMem__T_111_en;
  wire [31:0] instMem__T_114_data;
  wire [6:0] instMem__T_114_addr;
  wire  instMem__T_114_mask;
  wire  instMem__T_114_en;
  wire [31:0] instMem__T_117_data;
  wire [6:0] instMem__T_117_addr;
  wire  instMem__T_117_mask;
  wire  instMem__T_117_en;
  wire [31:0] instMem__T_120_data;
  wire [6:0] instMem__T_120_addr;
  wire  instMem__T_120_mask;
  wire  instMem__T_120_en;
  wire [31:0] instMem__T_123_data;
  wire [6:0] instMem__T_123_addr;
  wire  instMem__T_123_mask;
  wire  instMem__T_123_en;
  wire [31:0] instMem__T_126_data;
  wire [6:0] instMem__T_126_addr;
  wire  instMem__T_126_mask;
  wire  instMem__T_126_en;
  wire [31:0] instMem__T_129_data;
  wire [6:0] instMem__T_129_addr;
  wire  instMem__T_129_mask;
  wire  instMem__T_129_en;
  wire [31:0] instMem__T_132_data;
  wire [6:0] instMem__T_132_addr;
  wire  instMem__T_132_mask;
  wire  instMem__T_132_en;
  wire [31:0] instMem__T_135_data;
  wire [6:0] instMem__T_135_addr;
  wire  instMem__T_135_mask;
  wire  instMem__T_135_en;
  wire [31:0] instMem__T_138_data;
  wire [6:0] instMem__T_138_addr;
  wire  instMem__T_138_mask;
  wire  instMem__T_138_en;
  wire [31:0] instMem__T_141_data;
  wire [6:0] instMem__T_141_addr;
  wire  instMem__T_141_mask;
  wire  instMem__T_141_en;
  wire [31:0] instMem__T_144_data;
  wire [6:0] instMem__T_144_addr;
  wire  instMem__T_144_mask;
  wire  instMem__T_144_en;
  wire [31:0] instMem__T_147_data;
  wire [6:0] instMem__T_147_addr;
  wire  instMem__T_147_mask;
  wire  instMem__T_147_en;
  wire [31:0] instMem__T_150_data;
  wire [6:0] instMem__T_150_addr;
  wire  instMem__T_150_mask;
  wire  instMem__T_150_en;
  wire [31:0] instMem__T_153_data;
  wire [6:0] instMem__T_153_addr;
  wire  instMem__T_153_mask;
  wire  instMem__T_153_en;
  wire [31:0] instMem__T_156_data;
  wire [6:0] instMem__T_156_addr;
  wire  instMem__T_156_mask;
  wire  instMem__T_156_en;
  wire [31:0] instMem__T_159_data;
  wire [6:0] instMem__T_159_addr;
  wire  instMem__T_159_mask;
  wire  instMem__T_159_en;
  wire [31:0] instMem__T_162_data;
  wire [6:0] instMem__T_162_addr;
  wire  instMem__T_162_mask;
  wire  instMem__T_162_en;
  wire [31:0] instMem__T_165_data;
  wire [6:0] instMem__T_165_addr;
  wire  instMem__T_165_mask;
  wire  instMem__T_165_en;
  wire [31:0] instMem__T_168_data;
  wire [6:0] instMem__T_168_addr;
  wire  instMem__T_168_mask;
  wire  instMem__T_168_en;
  wire [31:0] instMem__T_171_data;
  wire [6:0] instMem__T_171_addr;
  wire  instMem__T_171_mask;
  wire  instMem__T_171_en;
  wire [31:0] instMem__T_174_data;
  wire [6:0] instMem__T_174_addr;
  wire  instMem__T_174_mask;
  wire  instMem__T_174_en;
  wire [31:0] instMem__T_177_data;
  wire [6:0] instMem__T_177_addr;
  wire  instMem__T_177_mask;
  wire  instMem__T_177_en;
  wire [31:0] instMem__T_180_data;
  wire [6:0] instMem__T_180_addr;
  wire  instMem__T_180_mask;
  wire  instMem__T_180_en;
  wire [31:0] instMem__T_183_data;
  wire [6:0] instMem__T_183_addr;
  wire  instMem__T_183_mask;
  wire  instMem__T_183_en;
  wire [31:0] instMem__T_186_data;
  wire [6:0] instMem__T_186_addr;
  wire  instMem__T_186_mask;
  wire  instMem__T_186_en;
  wire [31:0] instMem__T_189_data;
  wire [6:0] instMem__T_189_addr;
  wire  instMem__T_189_mask;
  wire  instMem__T_189_en;
  wire [31:0] instMem__T_192_data;
  wire [6:0] instMem__T_192_addr;
  wire  instMem__T_192_mask;
  wire  instMem__T_192_en;
  wire [31:0] instMem__T_195_data;
  wire [6:0] instMem__T_195_addr;
  wire  instMem__T_195_mask;
  wire  instMem__T_195_en;
  wire [31:0] instMem__T_198_data;
  wire [6:0] instMem__T_198_addr;
  wire  instMem__T_198_mask;
  wire  instMem__T_198_en;
  wire [31:0] instMem__T_201_data;
  wire [6:0] instMem__T_201_addr;
  wire  instMem__T_201_mask;
  wire  instMem__T_201_en;
  wire [31:0] instMem__T_204_data;
  wire [6:0] instMem__T_204_addr;
  wire  instMem__T_204_mask;
  wire  instMem__T_204_en;
  wire [31:0] instMem__T_207_data;
  wire [6:0] instMem__T_207_addr;
  wire  instMem__T_207_mask;
  wire  instMem__T_207_en;
  wire [31:0] instMem__T_210_data;
  wire [6:0] instMem__T_210_addr;
  wire  instMem__T_210_mask;
  wire  instMem__T_210_en;
  wire [31:0] instMem__T_213_data;
  wire [6:0] instMem__T_213_addr;
  wire  instMem__T_213_mask;
  wire  instMem__T_213_en;
  wire [31:0] instMem__T_216_data;
  wire [6:0] instMem__T_216_addr;
  wire  instMem__T_216_mask;
  wire  instMem__T_216_en;
  wire [31:0] instMem__T_219_data;
  wire [6:0] instMem__T_219_addr;
  wire  instMem__T_219_mask;
  wire  instMem__T_219_en;
  wire [31:0] instMem__T_222_data;
  wire [6:0] instMem__T_222_addr;
  wire  instMem__T_222_mask;
  wire  instMem__T_222_en;
  wire [31:0] instMem__T_225_data;
  wire [6:0] instMem__T_225_addr;
  wire  instMem__T_225_mask;
  wire  instMem__T_225_en;
  wire [31:0] instMem__T_228_data;
  wire [6:0] instMem__T_228_addr;
  wire  instMem__T_228_mask;
  wire  instMem__T_228_en;
  wire [31:0] instMem__T_231_data;
  wire [6:0] instMem__T_231_addr;
  wire  instMem__T_231_mask;
  wire  instMem__T_231_en;
  wire [31:0] instMem__T_234_data;
  wire [6:0] instMem__T_234_addr;
  wire  instMem__T_234_mask;
  wire  instMem__T_234_en;
  wire [31:0] instMem__T_237_data;
  wire [6:0] instMem__T_237_addr;
  wire  instMem__T_237_mask;
  wire  instMem__T_237_en;
  wire [31:0] instMem__T_240_data;
  wire [6:0] instMem__T_240_addr;
  wire  instMem__T_240_mask;
  wire  instMem__T_240_en;
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
  wire  uart_io_ctl_enq_valid;
  wire [7:0] uart_io_ctl_enq_bits;
  wire  uart_io_ctl_deq_ready;
  wire  uart_io_rxd;
  wire  uart_io_txd;
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
  wire [31:0] ID_EX_io_out_imm;
  wire  EX_MEM_clock;
  wire  EX_MEM_io_in_WB_regWrite;
  wire  EX_MEM_io_in_WB_memToReg;
  wire  EX_MEM_io_in_MEM_write;
  wire  EX_MEM_io_in_MEM_read;
  wire [2:0] EX_MEM_io_in_MEM_func;
  wire [31:0] EX_MEM_io_in_aluRes;
  wire [31:0] EX_MEM_io_in_op2;
  wire [4:0] EX_MEM_io_in_dst;
  wire  EX_MEM_io_out_WB_regWrite;
  wire  EX_MEM_io_out_WB_memToReg;
  wire  EX_MEM_io_out_MEM_write;
  wire  EX_MEM_io_out_MEM_read;
  wire [2:0] EX_MEM_io_out_MEM_func;
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
  wire [6:0] _T_242;
  wire  _T_244;
  wire  _T_245;
  wire [31:0] _GEN_264;
  wire [32:0] _T_246;
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
  reg [31:0] _GEN_10;
  reg [4:0] _GEN_2;
  reg [31:0] _GEN_11;
  reg [4:0] _GEN_3;
  reg [31:0] _GEN_12;
  reg  _GEN_4;
  reg [31:0] _GEN_13;
  reg  _GEN_5;
  reg [31:0] _GEN_14;
  reg  _GEN_6;
  reg [31:0] _GEN_15;
  reg [31:0] _GEN_7;
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
    .io_ctl_enq_valid(uart_io_ctl_enq_valid),
    .io_ctl_enq_bits(uart_io_ctl_enq_bits),
    .io_ctl_deq_ready(uart_io_ctl_deq_ready),
    .io_rxd(uart_io_rxd),
    .io_txd(uart_io_txd)
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
    .io_out_imm(ID_EX_io_out_imm)
  );
  PipelineEX_MEM EX_MEM (
    .clock(EX_MEM_clock),
    .io_in_WB_regWrite(EX_MEM_io_in_WB_regWrite),
    .io_in_WB_memToReg(EX_MEM_io_in_WB_memToReg),
    .io_in_MEM_write(EX_MEM_io_in_MEM_write),
    .io_in_MEM_read(EX_MEM_io_in_MEM_read),
    .io_in_MEM_func(EX_MEM_io_in_MEM_func),
    .io_in_aluRes(EX_MEM_io_in_aluRes),
    .io_in_op2(EX_MEM_io_in_op2),
    .io_in_dst(EX_MEM_io_in_dst),
    .io_out_WB_regWrite(EX_MEM_io_out_WB_regWrite),
    .io_out_WB_memToReg(EX_MEM_io_out_WB_memToReg),
    .io_out_MEM_write(EX_MEM_io_out_MEM_write),
    .io_out_MEM_read(EX_MEM_io_out_MEM_read),
    .io_out_MEM_func(EX_MEM_io_out_MEM_func),
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
  assign instMem__T_243_addr = _T_242;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign instMem__T_243_data = instMem[instMem__T_243_addr];
  `else
  assign instMem__T_243_data = instMem__T_243_addr >= 7'h41 ? _GEN_9[31:0] : instMem[instMem__T_243_addr];
  `endif
  assign instMem__T_48_data = 32'h464c457f;
  assign instMem__T_48_addr = 7'h0;
  assign instMem__T_48_mask = 1'h1;
  assign instMem__T_48_en = 1'h1;
  assign instMem__T_51_data = 32'h10101;
  assign instMem__T_51_addr = 7'h1;
  assign instMem__T_51_mask = 1'h1;
  assign instMem__T_51_en = 1'h1;
  assign instMem__T_54_data = 32'h0;
  assign instMem__T_54_addr = 7'h2;
  assign instMem__T_54_mask = 1'h1;
  assign instMem__T_54_en = 1'h1;
  assign instMem__T_57_data = 32'h0;
  assign instMem__T_57_addr = 7'h3;
  assign instMem__T_57_mask = 1'h1;
  assign instMem__T_57_en = 1'h1;
  assign instMem__T_60_data = 32'hf30002;
  assign instMem__T_60_addr = 7'h4;
  assign instMem__T_60_mask = 1'h1;
  assign instMem__T_60_en = 1'h1;
  assign instMem__T_63_data = 32'h1;
  assign instMem__T_63_addr = 7'h5;
  assign instMem__T_63_mask = 1'h1;
  assign instMem__T_63_en = 1'h1;
  assign instMem__T_66_data = 32'h10054;
  assign instMem__T_66_addr = 7'h6;
  assign instMem__T_66_mask = 1'h1;
  assign instMem__T_66_en = 1'h1;
  assign instMem__T_69_data = 32'h34;
  assign instMem__T_69_addr = 7'h7;
  assign instMem__T_69_mask = 1'h1;
  assign instMem__T_69_en = 1'h1;
  assign instMem__T_72_data = 32'h1dc;
  assign instMem__T_72_addr = 7'h8;
  assign instMem__T_72_mask = 1'h1;
  assign instMem__T_72_en = 1'h1;
  assign instMem__T_75_data = 32'h0;
  assign instMem__T_75_addr = 7'h9;
  assign instMem__T_75_mask = 1'h1;
  assign instMem__T_75_en = 1'h1;
  assign instMem__T_78_data = 32'h200034;
  assign instMem__T_78_addr = 7'ha;
  assign instMem__T_78_mask = 1'h1;
  assign instMem__T_78_en = 1'h1;
  assign instMem__T_81_data = 32'h280001;
  assign instMem__T_81_addr = 7'hb;
  assign instMem__T_81_mask = 1'h1;
  assign instMem__T_81_en = 1'h1;
  assign instMem__T_84_data = 32'h50006;
  assign instMem__T_84_addr = 7'hc;
  assign instMem__T_84_mask = 1'h1;
  assign instMem__T_84_en = 1'h1;
  assign instMem__T_87_data = 32'h1;
  assign instMem__T_87_addr = 7'hd;
  assign instMem__T_87_mask = 1'h1;
  assign instMem__T_87_en = 1'h1;
  assign instMem__T_90_data = 32'h0;
  assign instMem__T_90_addr = 7'he;
  assign instMem__T_90_mask = 1'h1;
  assign instMem__T_90_en = 1'h1;
  assign instMem__T_93_data = 32'h10000;
  assign instMem__T_93_addr = 7'hf;
  assign instMem__T_93_mask = 1'h1;
  assign instMem__T_93_en = 1'h1;
  assign instMem__T_96_data = 32'h10000;
  assign instMem__T_96_addr = 7'h10;
  assign instMem__T_96_mask = 1'h1;
  assign instMem__T_96_en = 1'h1;
  assign instMem__T_99_data = 32'hcc;
  assign instMem__T_99_addr = 7'h11;
  assign instMem__T_99_mask = 1'h1;
  assign instMem__T_99_en = 1'h1;
  assign instMem__T_102_data = 32'hcc;
  assign instMem__T_102_addr = 7'h12;
  assign instMem__T_102_mask = 1'h1;
  assign instMem__T_102_en = 1'h1;
  assign instMem__T_105_data = 32'h5;
  assign instMem__T_105_addr = 7'h13;
  assign instMem__T_105_mask = 1'h1;
  assign instMem__T_105_en = 1'h1;
  assign instMem__T_108_data = 32'h1000;
  assign instMem__T_108_addr = 7'h14;
  assign instMem__T_108_mask = 1'h1;
  assign instMem__T_108_en = 1'h1;
  assign instMem__T_111_data = 32'h40100313;
  assign instMem__T_111_addr = 7'h15;
  assign instMem__T_111_mask = 1'h1;
  assign instMem__T_111_en = 1'h1;
  assign instMem__T_114_data = 32'h6800293;
  assign instMem__T_114_addr = 7'h16;
  assign instMem__T_114_mask = 1'h1;
  assign instMem__T_114_en = 1'h1;
  assign instMem__T_117_data = 32'h532023;
  assign instMem__T_117_addr = 7'h17;
  assign instMem__T_117_mask = 1'h1;
  assign instMem__T_117_en = 1'h1;
  assign instMem__T_120_data = 32'h0;
  assign instMem__T_120_addr = 7'h18;
  assign instMem__T_120_mask = 1'h1;
  assign instMem__T_120_en = 1'h1;
  assign instMem__T_123_data = 32'h6500293;
  assign instMem__T_123_addr = 7'h19;
  assign instMem__T_123_mask = 1'h1;
  assign instMem__T_123_en = 1'h1;
  assign instMem__T_126_data = 32'h532023;
  assign instMem__T_126_addr = 7'h1a;
  assign instMem__T_126_mask = 1'h1;
  assign instMem__T_126_en = 1'h1;
  assign instMem__T_129_data = 32'h6c00293;
  assign instMem__T_129_addr = 7'h1b;
  assign instMem__T_129_mask = 1'h1;
  assign instMem__T_129_en = 1'h1;
  assign instMem__T_132_data = 32'h532023;
  assign instMem__T_132_addr = 7'h1c;
  assign instMem__T_132_mask = 1'h1;
  assign instMem__T_132_en = 1'h1;
  assign instMem__T_135_data = 32'h6c00293;
  assign instMem__T_135_addr = 7'h1d;
  assign instMem__T_135_mask = 1'h1;
  assign instMem__T_135_en = 1'h1;
  assign instMem__T_138_data = 32'h532023;
  assign instMem__T_138_addr = 7'h1e;
  assign instMem__T_138_mask = 1'h1;
  assign instMem__T_138_en = 1'h1;
  assign instMem__T_141_data = 32'h6f00293;
  assign instMem__T_141_addr = 7'h1f;
  assign instMem__T_141_mask = 1'h1;
  assign instMem__T_141_en = 1'h1;
  assign instMem__T_144_data = 32'h532023;
  assign instMem__T_144_addr = 7'h20;
  assign instMem__T_144_mask = 1'h1;
  assign instMem__T_144_en = 1'h1;
  assign instMem__T_147_data = 32'h2000293;
  assign instMem__T_147_addr = 7'h21;
  assign instMem__T_147_mask = 1'h1;
  assign instMem__T_147_en = 1'h1;
  assign instMem__T_150_data = 32'h532023;
  assign instMem__T_150_addr = 7'h22;
  assign instMem__T_150_mask = 1'h1;
  assign instMem__T_150_en = 1'h1;
  assign instMem__T_153_data = 32'h7700293;
  assign instMem__T_153_addr = 7'h23;
  assign instMem__T_153_mask = 1'h1;
  assign instMem__T_153_en = 1'h1;
  assign instMem__T_156_data = 32'h532023;
  assign instMem__T_156_addr = 7'h24;
  assign instMem__T_156_mask = 1'h1;
  assign instMem__T_156_en = 1'h1;
  assign instMem__T_159_data = 32'h6f00293;
  assign instMem__T_159_addr = 7'h25;
  assign instMem__T_159_mask = 1'h1;
  assign instMem__T_159_en = 1'h1;
  assign instMem__T_162_data = 32'h532023;
  assign instMem__T_162_addr = 7'h26;
  assign instMem__T_162_mask = 1'h1;
  assign instMem__T_162_en = 1'h1;
  assign instMem__T_165_data = 32'h7200293;
  assign instMem__T_165_addr = 7'h27;
  assign instMem__T_165_mask = 1'h1;
  assign instMem__T_165_en = 1'h1;
  assign instMem__T_168_data = 32'h532023;
  assign instMem__T_168_addr = 7'h28;
  assign instMem__T_168_mask = 1'h1;
  assign instMem__T_168_en = 1'h1;
  assign instMem__T_171_data = 32'h6c00293;
  assign instMem__T_171_addr = 7'h29;
  assign instMem__T_171_mask = 1'h1;
  assign instMem__T_171_en = 1'h1;
  assign instMem__T_174_data = 32'h532023;
  assign instMem__T_174_addr = 7'h2a;
  assign instMem__T_174_mask = 1'h1;
  assign instMem__T_174_en = 1'h1;
  assign instMem__T_177_data = 32'h6400293;
  assign instMem__T_177_addr = 7'h2b;
  assign instMem__T_177_mask = 1'h1;
  assign instMem__T_177_en = 1'h1;
  assign instMem__T_180_data = 32'h532023;
  assign instMem__T_180_addr = 7'h2c;
  assign instMem__T_180_mask = 1'h1;
  assign instMem__T_180_en = 1'h1;
  assign instMem__T_183_data = 32'h2100293;
  assign instMem__T_183_addr = 7'h2d;
  assign instMem__T_183_mask = 1'h1;
  assign instMem__T_183_en = 1'h1;
  assign instMem__T_186_data = 32'h532023;
  assign instMem__T_186_addr = 7'h2e;
  assign instMem__T_186_mask = 1'h1;
  assign instMem__T_186_en = 1'h1;
  assign instMem__T_189_data = 32'ha00293;
  assign instMem__T_189_addr = 7'h2f;
  assign instMem__T_189_mask = 1'h1;
  assign instMem__T_189_en = 1'h1;
  assign instMem__T_192_data = 32'h532023;
  assign instMem__T_192_addr = 7'h30;
  assign instMem__T_192_mask = 1'h1;
  assign instMem__T_192_en = 1'h1;
  assign instMem__T_195_data = 32'hd00293;
  assign instMem__T_195_addr = 7'h31;
  assign instMem__T_195_mask = 1'h1;
  assign instMem__T_195_en = 1'h1;
  assign instMem__T_198_data = 32'h532023;
  assign instMem__T_198_addr = 7'h32;
  assign instMem__T_198_mask = 1'h1;
  assign instMem__T_198_en = 1'h1;
  assign instMem__T_201_data = 32'h8067;
  assign instMem__T_201_addr = 7'h33;
  assign instMem__T_201_mask = 1'h1;
  assign instMem__T_201_en = 1'h1;
  assign instMem__T_204_data = 32'h0;
  assign instMem__T_204_addr = 7'h34;
  assign instMem__T_204_mask = 1'h1;
  assign instMem__T_204_en = 1'h1;
  assign instMem__T_207_data = 32'h0;
  assign instMem__T_207_addr = 7'h35;
  assign instMem__T_207_mask = 1'h1;
  assign instMem__T_207_en = 1'h1;
  assign instMem__T_210_data = 32'h0;
  assign instMem__T_210_addr = 7'h36;
  assign instMem__T_210_mask = 1'h1;
  assign instMem__T_210_en = 1'h1;
  assign instMem__T_213_data = 32'h0;
  assign instMem__T_213_addr = 7'h37;
  assign instMem__T_213_mask = 1'h1;
  assign instMem__T_213_en = 1'h1;
  assign instMem__T_216_data = 32'h0;
  assign instMem__T_216_addr = 7'h38;
  assign instMem__T_216_mask = 1'h1;
  assign instMem__T_216_en = 1'h1;
  assign instMem__T_219_data = 32'h0;
  assign instMem__T_219_addr = 7'h39;
  assign instMem__T_219_mask = 1'h1;
  assign instMem__T_219_en = 1'h1;
  assign instMem__T_222_data = 32'h0;
  assign instMem__T_222_addr = 7'h3a;
  assign instMem__T_222_mask = 1'h1;
  assign instMem__T_222_en = 1'h1;
  assign instMem__T_225_data = 32'h0;
  assign instMem__T_225_addr = 7'h3b;
  assign instMem__T_225_mask = 1'h1;
  assign instMem__T_225_en = 1'h1;
  assign instMem__T_228_data = 32'h0;
  assign instMem__T_228_addr = 7'h3c;
  assign instMem__T_228_mask = 1'h1;
  assign instMem__T_228_en = 1'h1;
  assign instMem__T_231_data = 32'h0;
  assign instMem__T_231_addr = 7'h3d;
  assign instMem__T_231_mask = 1'h1;
  assign instMem__T_231_en = 1'h1;
  assign instMem__T_234_data = 32'h0;
  assign instMem__T_234_addr = 7'h3e;
  assign instMem__T_234_mask = 1'h1;
  assign instMem__T_234_en = 1'h1;
  assign instMem__T_237_data = 32'h0;
  assign instMem__T_237_addr = 7'h3f;
  assign instMem__T_237_mask = 1'h1;
  assign instMem__T_237_en = 1'h1;
  assign instMem__T_240_data = 32'h0;
  assign instMem__T_240_addr = 7'h40;
  assign instMem__T_240_mask = 1'h1;
  assign instMem__T_240_en = 1'h1;
  assign counter_clock = clock;
  assign counter_reset = reset;
  assign counter_io_branch = _T_245;
  assign counter_io_pc_src = _T_247;
  assign decoder_io_inst = IF_ID_io_out_inst;
  assign control_io_ctrl_opcode = decoder_io_ctrl_opcode;
  assign control_io_ctrl_funct3 = decoder_io_ctrl_funct3;
  assign control_io_ctrl_funct7 = decoder_io_ctrl_funct7;
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
  assign uart_io_ctl_enq_valid = 1'h1;
  assign uart_io_ctl_enq_bits = _GEN_1;
  assign uart_io_ctl_deq_ready = _GEN_5;
  assign uart_io_rxd = _GEN_6;
  assign IF_ID_clock = clock;
  assign IF_ID_io_in_pc_next = counter_io_pc_next;
  assign IF_ID_io_in_inst = instMem__T_243_data;
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
  assign ID_EX_io_in_imm = {{20'd0}, _T_248};
  assign EX_MEM_clock = clock;
  assign EX_MEM_io_in_WB_regWrite = ID_EX_io_out_WB_regWrite;
  assign EX_MEM_io_in_WB_memToReg = ID_EX_io_out_WB_memToReg;
  assign EX_MEM_io_in_MEM_write = ID_EX_io_out_MEM_write;
  assign EX_MEM_io_in_MEM_read = ID_EX_io_out_MEM_read;
  assign EX_MEM_io_in_MEM_func = ID_EX_io_out_MEM_func;
  assign EX_MEM_io_in_aluRes = alu_io_reg_rd;
  assign EX_MEM_io_in_op2 = alu_io_reg_rs_rs2;
  assign EX_MEM_io_in_dst = _T_263;
  assign MEM_WB_clock = clock;
  assign MEM_WB_io_in_WB_regWrite = EX_MEM_io_out_WB_regWrite;
  assign MEM_WB_io_in_WB_memToReg = EX_MEM_io_out_WB_memToReg;
  assign MEM_WB_io_in_rd_alu = EX_MEM_io_out_aluRes;
  assign MEM_WB_io_in_rd_mem = dataMem_io_reg_rd;
  assign MEM_WB_io_in_dst = EX_MEM_io_out_dst;
  assign _T_242 = counter_io_pc[6:0];
  assign _T_244 = regs_io_reg_rs_rs1 == regs_io_reg_rs_rs2;
  assign _T_245 = _T_244 & control_io_MEM_branch;
  assign _GEN_264 = {{20'd0}, decoder_io_imm_SB};
  assign _T_246 = IF_ID_io_out_pc_next + _GEN_264;
  assign _T_247 = _T_246[31:0];
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
  _GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 65; initvar = initvar+1)
    instMem[initvar] = _GEN_8[31:0];
  `endif
  _GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _GEN_0 = _GEN_10[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _GEN_2 = _GEN_11[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _GEN_3 = _GEN_12[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  _GEN_4 = _GEN_13[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  _GEN_5 = _GEN_14[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  _GEN_6 = _GEN_15[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {1{$random}};
  _GEN_7 = _GEN_16[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(instMem__T_48_en & instMem__T_48_mask) begin
      instMem[instMem__T_48_addr] <= instMem__T_48_data;
    end
    if(instMem__T_51_en & instMem__T_51_mask) begin
      instMem[instMem__T_51_addr] <= instMem__T_51_data;
    end
    if(instMem__T_54_en & instMem__T_54_mask) begin
      instMem[instMem__T_54_addr] <= instMem__T_54_data;
    end
    if(instMem__T_57_en & instMem__T_57_mask) begin
      instMem[instMem__T_57_addr] <= instMem__T_57_data;
    end
    if(instMem__T_60_en & instMem__T_60_mask) begin
      instMem[instMem__T_60_addr] <= instMem__T_60_data;
    end
    if(instMem__T_63_en & instMem__T_63_mask) begin
      instMem[instMem__T_63_addr] <= instMem__T_63_data;
    end
    if(instMem__T_66_en & instMem__T_66_mask) begin
      instMem[instMem__T_66_addr] <= instMem__T_66_data;
    end
    if(instMem__T_69_en & instMem__T_69_mask) begin
      instMem[instMem__T_69_addr] <= instMem__T_69_data;
    end
    if(instMem__T_72_en & instMem__T_72_mask) begin
      instMem[instMem__T_72_addr] <= instMem__T_72_data;
    end
    if(instMem__T_75_en & instMem__T_75_mask) begin
      instMem[instMem__T_75_addr] <= instMem__T_75_data;
    end
    if(instMem__T_78_en & instMem__T_78_mask) begin
      instMem[instMem__T_78_addr] <= instMem__T_78_data;
    end
    if(instMem__T_81_en & instMem__T_81_mask) begin
      instMem[instMem__T_81_addr] <= instMem__T_81_data;
    end
    if(instMem__T_84_en & instMem__T_84_mask) begin
      instMem[instMem__T_84_addr] <= instMem__T_84_data;
    end
    if(instMem__T_87_en & instMem__T_87_mask) begin
      instMem[instMem__T_87_addr] <= instMem__T_87_data;
    end
    if(instMem__T_90_en & instMem__T_90_mask) begin
      instMem[instMem__T_90_addr] <= instMem__T_90_data;
    end
    if(instMem__T_93_en & instMem__T_93_mask) begin
      instMem[instMem__T_93_addr] <= instMem__T_93_data;
    end
    if(instMem__T_96_en & instMem__T_96_mask) begin
      instMem[instMem__T_96_addr] <= instMem__T_96_data;
    end
    if(instMem__T_99_en & instMem__T_99_mask) begin
      instMem[instMem__T_99_addr] <= instMem__T_99_data;
    end
    if(instMem__T_102_en & instMem__T_102_mask) begin
      instMem[instMem__T_102_addr] <= instMem__T_102_data;
    end
    if(instMem__T_105_en & instMem__T_105_mask) begin
      instMem[instMem__T_105_addr] <= instMem__T_105_data;
    end
    if(instMem__T_108_en & instMem__T_108_mask) begin
      instMem[instMem__T_108_addr] <= instMem__T_108_data;
    end
    if(instMem__T_111_en & instMem__T_111_mask) begin
      instMem[instMem__T_111_addr] <= instMem__T_111_data;
    end
    if(instMem__T_114_en & instMem__T_114_mask) begin
      instMem[instMem__T_114_addr] <= instMem__T_114_data;
    end
    if(instMem__T_117_en & instMem__T_117_mask) begin
      instMem[instMem__T_117_addr] <= instMem__T_117_data;
    end
    if(instMem__T_120_en & instMem__T_120_mask) begin
      instMem[instMem__T_120_addr] <= instMem__T_120_data;
    end
    if(instMem__T_123_en & instMem__T_123_mask) begin
      instMem[instMem__T_123_addr] <= instMem__T_123_data;
    end
    if(instMem__T_126_en & instMem__T_126_mask) begin
      instMem[instMem__T_126_addr] <= instMem__T_126_data;
    end
    if(instMem__T_129_en & instMem__T_129_mask) begin
      instMem[instMem__T_129_addr] <= instMem__T_129_data;
    end
    if(instMem__T_132_en & instMem__T_132_mask) begin
      instMem[instMem__T_132_addr] <= instMem__T_132_data;
    end
    if(instMem__T_135_en & instMem__T_135_mask) begin
      instMem[instMem__T_135_addr] <= instMem__T_135_data;
    end
    if(instMem__T_138_en & instMem__T_138_mask) begin
      instMem[instMem__T_138_addr] <= instMem__T_138_data;
    end
    if(instMem__T_141_en & instMem__T_141_mask) begin
      instMem[instMem__T_141_addr] <= instMem__T_141_data;
    end
    if(instMem__T_144_en & instMem__T_144_mask) begin
      instMem[instMem__T_144_addr] <= instMem__T_144_data;
    end
    if(instMem__T_147_en & instMem__T_147_mask) begin
      instMem[instMem__T_147_addr] <= instMem__T_147_data;
    end
    if(instMem__T_150_en & instMem__T_150_mask) begin
      instMem[instMem__T_150_addr] <= instMem__T_150_data;
    end
    if(instMem__T_153_en & instMem__T_153_mask) begin
      instMem[instMem__T_153_addr] <= instMem__T_153_data;
    end
    if(instMem__T_156_en & instMem__T_156_mask) begin
      instMem[instMem__T_156_addr] <= instMem__T_156_data;
    end
    if(instMem__T_159_en & instMem__T_159_mask) begin
      instMem[instMem__T_159_addr] <= instMem__T_159_data;
    end
    if(instMem__T_162_en & instMem__T_162_mask) begin
      instMem[instMem__T_162_addr] <= instMem__T_162_data;
    end
    if(instMem__T_165_en & instMem__T_165_mask) begin
      instMem[instMem__T_165_addr] <= instMem__T_165_data;
    end
    if(instMem__T_168_en & instMem__T_168_mask) begin
      instMem[instMem__T_168_addr] <= instMem__T_168_data;
    end
    if(instMem__T_171_en & instMem__T_171_mask) begin
      instMem[instMem__T_171_addr] <= instMem__T_171_data;
    end
    if(instMem__T_174_en & instMem__T_174_mask) begin
      instMem[instMem__T_174_addr] <= instMem__T_174_data;
    end
    if(instMem__T_177_en & instMem__T_177_mask) begin
      instMem[instMem__T_177_addr] <= instMem__T_177_data;
    end
    if(instMem__T_180_en & instMem__T_180_mask) begin
      instMem[instMem__T_180_addr] <= instMem__T_180_data;
    end
    if(instMem__T_183_en & instMem__T_183_mask) begin
      instMem[instMem__T_183_addr] <= instMem__T_183_data;
    end
    if(instMem__T_186_en & instMem__T_186_mask) begin
      instMem[instMem__T_186_addr] <= instMem__T_186_data;
    end
    if(instMem__T_189_en & instMem__T_189_mask) begin
      instMem[instMem__T_189_addr] <= instMem__T_189_data;
    end
    if(instMem__T_192_en & instMem__T_192_mask) begin
      instMem[instMem__T_192_addr] <= instMem__T_192_data;
    end
    if(instMem__T_195_en & instMem__T_195_mask) begin
      instMem[instMem__T_195_addr] <= instMem__T_195_data;
    end
    if(instMem__T_198_en & instMem__T_198_mask) begin
      instMem[instMem__T_198_addr] <= instMem__T_198_data;
    end
    if(instMem__T_201_en & instMem__T_201_mask) begin
      instMem[instMem__T_201_addr] <= instMem__T_201_data;
    end
    if(instMem__T_204_en & instMem__T_204_mask) begin
      instMem[instMem__T_204_addr] <= instMem__T_204_data;
    end
    if(instMem__T_207_en & instMem__T_207_mask) begin
      instMem[instMem__T_207_addr] <= instMem__T_207_data;
    end
    if(instMem__T_210_en & instMem__T_210_mask) begin
      instMem[instMem__T_210_addr] <= instMem__T_210_data;
    end
    if(instMem__T_213_en & instMem__T_213_mask) begin
      instMem[instMem__T_213_addr] <= instMem__T_213_data;
    end
    if(instMem__T_216_en & instMem__T_216_mask) begin
      instMem[instMem__T_216_addr] <= instMem__T_216_data;
    end
    if(instMem__T_219_en & instMem__T_219_mask) begin
      instMem[instMem__T_219_addr] <= instMem__T_219_data;
    end
    if(instMem__T_222_en & instMem__T_222_mask) begin
      instMem[instMem__T_222_addr] <= instMem__T_222_data;
    end
    if(instMem__T_225_en & instMem__T_225_mask) begin
      instMem[instMem__T_225_addr] <= instMem__T_225_data;
    end
    if(instMem__T_228_en & instMem__T_228_mask) begin
      instMem[instMem__T_228_addr] <= instMem__T_228_data;
    end
    if(instMem__T_231_en & instMem__T_231_mask) begin
      instMem[instMem__T_231_addr] <= instMem__T_231_data;
    end
    if(instMem__T_234_en & instMem__T_234_mask) begin
      instMem[instMem__T_234_addr] <= instMem__T_234_data;
    end
    if(instMem__T_237_en & instMem__T_237_mask) begin
      instMem[instMem__T_237_addr] <= instMem__T_237_data;
    end
    if(instMem__T_240_en & instMem__T_240_mask) begin
      instMem[instMem__T_240_addr] <= instMem__T_240_data;
    end
  end
endmodule
