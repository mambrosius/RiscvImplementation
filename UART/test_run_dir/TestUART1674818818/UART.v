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

module UART(
  input         clock,
  input         reset,
  input  [7:0]  io_channel_data,
  input         io_channel_cts,
  output        io_channel_rts,
  output        io_txd,
  output [31:0] io_tick_cnt
);
  wire [25:0] TICK_CNT;
  reg [10:0] dataReg;
  reg [31:0] _GEN_8;
  reg [31:0] tickReg;
  reg [31:0] _GEN_9;
  reg [3:0] bitsReg;
  reg [31:0] _GEN_10;
  wire [32:0] _T_13;
  wire [31:0] _T_14;
  wire  _T_16;
  wire  _T_18;
  wire  _T_19;
  wire  _T_20;
  wire [31:0] _GEN_7;
  wire  _T_21;
  wire  _T_23;
  wire [9:0] _T_25;
  wire [10:0] _T_26;
  wire [4:0] _T_28;
  wire [4:0] _T_29;
  wire [3:0] _T_30;
  wire [10:0] _GEN_0;
  wire [3:0] _GEN_1;
  wire  _T_32;
  wire  _T_33;
  wire [9:0] _T_35;
  wire [10:0] _T_37;
  wire [10:0] _GEN_2;
  wire [3:0] _GEN_3;
  wire [10:0] _GEN_4;
  wire [3:0] _GEN_5;
  wire [31:0] _GEN_6;
  assign io_channel_rts = _T_19;
  assign io_txd = _T_20;
  assign io_tick_cnt = tickReg;
  assign TICK_CNT = 26'h2faf080 / 26'h1c200;
  assign _T_13 = tickReg + 32'h1;
  assign _T_14 = _T_13[31:0];
  assign _T_16 = tickReg == 32'h0;
  assign _T_18 = bitsReg == 4'h0;
  assign _T_19 = _T_16 & _T_18;
  assign _T_20 = dataReg[0];
  assign _GEN_7 = {{6'd0}, TICK_CNT};
  assign _T_21 = tickReg == _GEN_7;
  assign _T_23 = bitsReg != 4'h0;
  assign _T_25 = dataReg[10:1];
  assign _T_26 = {1'h1,_T_25};
  assign _T_28 = bitsReg - 4'h1;
  assign _T_29 = $unsigned(_T_28);
  assign _T_30 = _T_29[3:0];
  assign _GEN_0 = _T_23 ? _T_26 : dataReg;
  assign _GEN_1 = _T_23 ? _T_30 : bitsReg;
  assign _T_32 = _T_23 == 1'h0;
  assign _T_33 = _T_32 & io_channel_cts;
  assign _T_35 = {2'h3,io_channel_data};
  assign _T_37 = {_T_35,1'h0};
  assign _GEN_2 = _T_33 ? _T_37 : _GEN_0;
  assign _GEN_3 = _T_33 ? 4'hb : _GEN_1;
  assign _GEN_4 = _T_21 ? _GEN_2 : dataReg;
  assign _GEN_5 = _T_21 ? _GEN_3 : bitsReg;
  assign _GEN_6 = _T_21 ? 32'h0 : _T_14;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  dataReg = _GEN_8[10:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  tickReg = _GEN_9[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  bitsReg = _GEN_10[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      dataReg <= 11'h0;
    end else begin
      if (_T_21) begin
        if (_T_33) begin
          dataReg <= _T_37;
        end else begin
          if (_T_23) begin
            dataReg <= _T_26;
          end
        end
      end
    end
    if (reset) begin
      tickReg <= {{6'd0}, TICK_CNT};
    end else begin
      if (_T_21) begin
        tickReg <= 32'h0;
      end else begin
        tickReg <= _T_14;
      end
    end
    if (reset) begin
      bitsReg <= 4'h0;
    end else begin
      if (_T_21) begin
        if (_T_33) begin
          bitsReg <= 4'hb;
        end else begin
          if (_T_23) begin
            bitsReg <= _T_30;
          end
        end
      end
    end
  end
endmodule
