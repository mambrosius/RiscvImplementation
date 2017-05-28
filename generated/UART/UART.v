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
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  output       io_txd
);
  wire  queue_clock;
  wire  queue_reset;
  wire  queue_io_enq_ready;
  wire  queue_io_enq_valid;
  wire [7:0] queue_io_enq_bits;
  wire  queue_io_deq_ready;
  wire  queue_io_deq_valid;
  wire [7:0] queue_io_deq_bits;
  wire  tx_clock;
  wire  tx_reset;
  wire  tx_io_enq_ready;
  wire  tx_io_enq_valid;
  wire [7:0] tx_io_enq_bits;
  wire  tx_io_txd;
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
  Tx tx (
    .clock(tx_clock),
    .reset(tx_reset),
    .io_enq_ready(tx_io_enq_ready),
    .io_enq_valid(tx_io_enq_valid),
    .io_enq_bits(tx_io_enq_bits),
    .io_txd(tx_io_txd)
  );
  assign io_enq_ready = queue_io_enq_ready;
  assign io_txd = tx_io_txd;
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = io_enq_valid;
  assign queue_io_enq_bits = io_enq_bits;
  assign queue_io_deq_ready = tx_io_enq_ready;
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_enq_valid = queue_io_deq_valid;
  assign tx_io_enq_bits = queue_io_deq_bits;
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
  input        clock,
  input        reset,
  input        io_rxd,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
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
  assign io_deq_valid = queue_io_deq_valid;
  assign io_deq_bits = queue_io_deq_bits;
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
  input        io_rxd,
  output       io_txd,
  input        io_enq_ready,
  output       io_enq_valid,
  output [7:0] io_enq_bits,
  output       io_deq_ready,
  input        io_deq_valid,
  input  [7:0] io_deq_bits
);
  wire  tx_clock;
  wire  tx_reset;
  wire  tx_io_enq_ready;
  wire  tx_io_enq_valid;
  wire [7:0] tx_io_enq_bits;
  wire  tx_io_txd;
  wire  rx_clock;
  wire  rx_reset;
  wire  rx_io_rxd;
  wire  rx_io_deq_ready;
  wire  rx_io_deq_valid;
  wire [7:0] rx_io_deq_bits;
  BufferedTx tx (
    .clock(tx_clock),
    .reset(tx_reset),
    .io_enq_ready(tx_io_enq_ready),
    .io_enq_valid(tx_io_enq_valid),
    .io_enq_bits(tx_io_enq_bits),
    .io_txd(tx_io_txd)
  );
  BufferedRx rx (
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_deq_ready(rx_io_deq_ready),
    .io_deq_valid(rx_io_deq_valid),
    .io_deq_bits(rx_io_deq_bits)
  );
  assign io_txd = tx_io_txd;
  assign io_enq_valid = rx_io_deq_valid;
  assign io_enq_bits = rx_io_deq_bits;
  assign io_deq_ready = tx_io_enq_ready;
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_enq_valid = io_deq_valid;
  assign tx_io_enq_bits = io_deq_bits;
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rxd;
  assign rx_io_deq_ready = io_enq_ready;
endmodule
