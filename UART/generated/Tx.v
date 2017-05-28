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
  wire  _T_16;
  wire  _T_17;
  wire [8:0] _T_19;
  wire [8:0] _GEN_0;
  wire [31:0] _GEN_1;
  wire [3:0] _GEN_2;
  wire [8:0] _GEN_3;
  wire [31:0] _GEN_4;
  wire [3:0] _GEN_5;
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
  wire [4:0] _T_46;
  wire [4:0] _T_47;
  wire [3:0] _T_48;
  wire [8:0] _GEN_6;
  wire [31:0] _GEN_7;
  wire [3:0] _GEN_8;
  wire  _T_50;
  wire [32:0] _T_52;
  wire [31:0] _T_53;
  wire [31:0] _GEN_9;
  wire [8:0] _GEN_10;
  wire [31:0] _GEN_11;
  wire [3:0] _GEN_12;
  wire  _T_54;
  assign io_enq_ready = _T_16;
  assign io_txd = _T_54;
  assign _T_16 = state == 4'h0;
  assign _T_17 = 4'h0 == state;
  assign _T_19 = {io_enq_bits,1'h0};
  assign _GEN_0 = io_enq_valid ? _T_19 : data;
  assign _GEN_1 = io_enq_valid ? 32'h0 : ticks;
  assign _GEN_2 = io_enq_valid ? 4'ha : state;
  assign _GEN_3 = _T_17 ? _GEN_0 : data;
  assign _GEN_4 = _T_17 ? _GEN_1 : ticks;
  assign _GEN_5 = _T_17 ? _GEN_2 : state;
  assign _T_21 = 4'h1 == state;
  assign _T_22 = 4'h2 == state;
  assign _T_23 = 4'h3 == state;
  assign _T_24 = 4'h4 == state;
  assign _T_25 = 4'h5 == state;
  assign _T_26 = 4'h6 == state;
  assign _T_27 = 4'h7 == state;
  assign _T_28 = 4'h8 == state;
  assign _T_29 = 4'h9 == state;
  assign _T_30 = 4'ha == state;
  assign _T_31 = _T_21 | _T_22;
  assign _T_32 = _T_31 | _T_23;
  assign _T_33 = _T_32 | _T_24;
  assign _T_34 = _T_33 | _T_25;
  assign _T_35 = _T_34 | _T_26;
  assign _T_36 = _T_35 | _T_27;
  assign _T_37 = _T_36 | _T_28;
  assign _T_38 = _T_37 | _T_29;
  assign _T_39 = _T_38 | _T_30;
  assign _T_40 = ticks == 32'h1b2;
  assign _T_42 = data[8:1];
  assign _T_43 = {1'h1,_T_42};
  assign _T_46 = state - 4'h1;
  assign _T_47 = $unsigned(_T_46);
  assign _T_48 = _T_47[3:0];
  assign _GEN_6 = _T_40 ? _T_43 : _GEN_3;
  assign _GEN_7 = _T_40 ? 32'h0 : _GEN_4;
  assign _GEN_8 = _T_40 ? _T_48 : _GEN_5;
  assign _T_50 = _T_40 == 1'h0;
  assign _T_52 = ticks + 32'h1;
  assign _T_53 = _T_52[31:0];
  assign _GEN_9 = _T_50 ? _T_53 : _GEN_7;
  assign _GEN_10 = _T_39 ? _GEN_6 : _GEN_3;
  assign _GEN_11 = _T_39 ? _GEN_9 : _GEN_4;
  assign _GEN_12 = _T_39 ? _GEN_8 : _GEN_5;
  assign _T_54 = data[0];
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
          if (_T_17) begin
            if (io_enq_valid) begin
              data <= _T_19;
            end
          end
        end
      end else begin
        if (_T_17) begin
          if (io_enq_valid) begin
            data <= _T_19;
          end
        end
      end
    end
    if (reset) begin
      ticks <= 32'h0;
    end else begin
      if (_T_39) begin
        if (_T_50) begin
          ticks <= _T_53;
        end else begin
          if (_T_40) begin
            ticks <= 32'h0;
          end else begin
            if (_T_17) begin
              if (io_enq_valid) begin
                ticks <= 32'h0;
              end
            end
          end
        end
      end else begin
        if (_T_17) begin
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
          state <= _T_48;
        end else begin
          if (_T_17) begin
            if (io_enq_valid) begin
              state <= 4'ha;
            end
          end
        end
      end else begin
        if (_T_17) begin
          if (io_enq_valid) begin
            state <= 4'ha;
          end
        end
      end
    end
  end
endmodule
