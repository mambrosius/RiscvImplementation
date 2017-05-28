;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit UART : 
  module Queue : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, count : UInt<5>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem ram : UInt<8>[16] @[Decoupled.scala 186:24]
    reg value : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 17:33]
    reg value_1 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 17:33]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 189:35]
    node _T_20 = eq(value, value_1) @[Decoupled.scala 191:41]
    node _T_22 = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 192:36]
    node _T_23 = and(_T_20, _T_22) @[Decoupled.scala 192:33]
    node _T_24 = and(_T_20, maybe_full) @[Decoupled.scala 193:32]
    node _T_25 = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 27:37]
    wire do_enq : UInt<1>
    do_enq is invalid
    do_enq <= _T_25
    node _T_27 = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 27:37]
    wire do_deq : UInt<1>
    do_deq is invalid
    do_deq <= _T_27
    when do_enq : @[Decoupled.scala 197:17]
      infer mport _T_29 = ram[value], clock
      _T_29 <= io.enq.bits @[Decoupled.scala 198:24]
      node wrap = eq(value, UInt<4>("h0f")) @[Counter.scala 25:24]
      node _T_32 = add(value, UInt<1>("h01")) @[Counter.scala 26:22]
      node _T_33 = tail(_T_32, 1) @[Counter.scala 26:22]
      value <= _T_33 @[Counter.scala 26:13]
      skip @[Decoupled.scala 197:17]
    when do_deq : @[Decoupled.scala 201:17]
      node wrap_1 = eq(value_1, UInt<4>("h0f")) @[Counter.scala 25:24]
      node _T_36 = add(value_1, UInt<1>("h01")) @[Counter.scala 26:22]
      node _T_37 = tail(_T_36, 1) @[Counter.scala 26:22]
      value_1 <= _T_37 @[Counter.scala 26:13]
      skip @[Decoupled.scala 201:17]
    node _T_38 = neq(do_enq, do_deq) @[Decoupled.scala 204:16]
    when _T_38 : @[Decoupled.scala 204:27]
      maybe_full <= do_enq @[Decoupled.scala 205:16]
      skip @[Decoupled.scala 204:27]
    node _T_40 = eq(_T_23, UInt<1>("h00")) @[Decoupled.scala 208:19]
    io.deq.valid <= _T_40 @[Decoupled.scala 208:16]
    node _T_42 = eq(_T_24, UInt<1>("h00")) @[Decoupled.scala 209:19]
    io.enq.ready <= _T_42 @[Decoupled.scala 209:16]
    infer mport _T_43 = ram[value_1], clock
    io.deq.bits <= _T_43 @[Decoupled.scala 210:15]
    node _T_44 = sub(value, value_1) @[Decoupled.scala 225:40]
    node _T_45 = asUInt(_T_44) @[Decoupled.scala 225:40]
    node _T_46 = tail(_T_45, 1) @[Decoupled.scala 225:40]
    node _T_47 = and(maybe_full, _T_20) @[Decoupled.scala 227:32]
    node _T_48 = cat(_T_47, _T_46) @[Cat.scala 30:58]
    io.count <= _T_48 @[Decoupled.scala 227:14]
    
  module Tx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, txd : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg data : UInt<9>, clock with : (reset => (reset, UInt<9>("h01ff"))) @[UART.scala 47:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 48:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 49:28]
    node _T_15 = eq(state, UInt<4>("h00")) @[UART.scala 51:27]
    io.enq.ready <= _T_15 @[UART.scala 51:18]
    node _T_16 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_16 : @[Conditional.scala 29:59]
      when io.enq.valid : @[UART.scala 55:33]
        node _T_18 = cat(io.enq.bits, UInt<1>("h00")) @[Cat.scala 30:58]
        data <= _T_18 @[UART.scala 56:23]
        ticks <= UInt<1>("h00") @[UART.scala 57:23]
        state <= UInt<4>("h0a") @[UART.scala 58:23]
        skip @[UART.scala 55:33]
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
    node _T_29 = or(_T_19, _T_20) @[Conditional.scala 29:53]
    node _T_30 = or(_T_29, _T_21) @[Conditional.scala 29:53]
    node _T_31 = or(_T_30, _T_22) @[Conditional.scala 29:53]
    node _T_32 = or(_T_31, _T_23) @[Conditional.scala 29:53]
    node _T_33 = or(_T_32, _T_24) @[Conditional.scala 29:53]
    node _T_34 = or(_T_33, _T_25) @[Conditional.scala 29:53]
    node _T_35 = or(_T_34, _T_26) @[Conditional.scala 29:53]
    node _T_36 = or(_T_35, _T_27) @[Conditional.scala 29:53]
    node _T_37 = or(_T_36, _T_28) @[Conditional.scala 29:53]
    when _T_37 : @[Conditional.scala 29:59]
      node _T_38 = eq(ticks, UInt<9>("h01b2")) @[UART.scala 63:25]
      when _T_38 : @[UART.scala 63:39]
        node _T_40 = shr(data, 1) @[UART.scala 64:43]
        node _T_41 = cat(UInt<1>("h01"), _T_40) @[Cat.scala 30:58]
        data <= _T_41 @[UART.scala 64:23]
        ticks <= UInt<1>("h00") @[UART.scala 65:23]
        node _T_43 = sub(state, UInt<1>("h01")) @[UART.scala 66:32]
        node _T_44 = asUInt(_T_43) @[UART.scala 66:32]
        node _T_45 = tail(_T_44, 1) @[UART.scala 66:32]
        state <= _T_45 @[UART.scala 66:23]
        skip @[UART.scala 63:39]
      node _T_47 = eq(_T_38, UInt<1>("h00")) @[UART.scala 63:39]
      when _T_47 : @[UART.scala 67:26]
        node _T_49 = add(ticks, UInt<1>("h01")) @[UART.scala 68:32]
        node _T_50 = tail(_T_49, 1) @[UART.scala 68:32]
        ticks <= _T_50 @[UART.scala 68:23]
        skip @[UART.scala 67:26]
      skip @[Conditional.scala 29:59]
    node _T_51 = bits(data, 0, 0) @[UART.scala 72:19]
    io.txd <= _T_51 @[UART.scala 72:12]
    
  module BufferedTx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, cnt : UInt<6>, txd : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst queue of Queue @[UART.scala 141:23]
    queue.io is invalid
    queue.clock <= clock
    queue.reset <= reset
    inst tx of Tx @[UART.scala 142:23]
    tx.io is invalid
    tx.clock <= clock
    tx.reset <= reset
    queue.io.enq.bits <= io.enq.bits @[UART.scala 144:18]
    queue.io.enq.valid <= io.enq.valid @[UART.scala 144:18]
    io.enq.ready <= queue.io.enq.ready @[UART.scala 144:18]
    tx.io.enq.bits <= queue.io.deq.bits @[UART.scala 145:18]
    tx.io.enq.valid <= queue.io.deq.valid @[UART.scala 145:18]
    queue.io.deq.ready <= tx.io.enq.ready @[UART.scala 145:18]
    io.txd <= tx.io.txd @[UART.scala 146:18]
    io.cnt <= queue.io.count @[UART.scala 147:18]
    
  module Queue_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, count : UInt<5>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem ram : UInt<8>[16] @[Decoupled.scala 186:24]
    reg value : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 17:33]
    reg value_1 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 17:33]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 189:35]
    node _T_20 = eq(value, value_1) @[Decoupled.scala 191:41]
    node _T_22 = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 192:36]
    node _T_23 = and(_T_20, _T_22) @[Decoupled.scala 192:33]
    node _T_24 = and(_T_20, maybe_full) @[Decoupled.scala 193:32]
    node _T_25 = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 27:37]
    wire do_enq : UInt<1>
    do_enq is invalid
    do_enq <= _T_25
    node _T_27 = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 27:37]
    wire do_deq : UInt<1>
    do_deq is invalid
    do_deq <= _T_27
    when do_enq : @[Decoupled.scala 197:17]
      infer mport _T_29 = ram[value], clock
      _T_29 <= io.enq.bits @[Decoupled.scala 198:24]
      node wrap = eq(value, UInt<4>("h0f")) @[Counter.scala 25:24]
      node _T_32 = add(value, UInt<1>("h01")) @[Counter.scala 26:22]
      node _T_33 = tail(_T_32, 1) @[Counter.scala 26:22]
      value <= _T_33 @[Counter.scala 26:13]
      skip @[Decoupled.scala 197:17]
    when do_deq : @[Decoupled.scala 201:17]
      node wrap_1 = eq(value_1, UInt<4>("h0f")) @[Counter.scala 25:24]
      node _T_36 = add(value_1, UInt<1>("h01")) @[Counter.scala 26:22]
      node _T_37 = tail(_T_36, 1) @[Counter.scala 26:22]
      value_1 <= _T_37 @[Counter.scala 26:13]
      skip @[Decoupled.scala 201:17]
    node _T_38 = neq(do_enq, do_deq) @[Decoupled.scala 204:16]
    when _T_38 : @[Decoupled.scala 204:27]
      maybe_full <= do_enq @[Decoupled.scala 205:16]
      skip @[Decoupled.scala 204:27]
    node _T_40 = eq(_T_23, UInt<1>("h00")) @[Decoupled.scala 208:19]
    io.deq.valid <= _T_40 @[Decoupled.scala 208:16]
    node _T_42 = eq(_T_24, UInt<1>("h00")) @[Decoupled.scala 209:19]
    io.enq.ready <= _T_42 @[Decoupled.scala 209:16]
    infer mport _T_43 = ram[value_1], clock
    io.deq.bits <= _T_43 @[Decoupled.scala 210:15]
    node _T_44 = sub(value, value_1) @[Decoupled.scala 225:40]
    node _T_45 = asUInt(_T_44) @[Decoupled.scala 225:40]
    node _T_46 = tail(_T_45, 1) @[Decoupled.scala 225:40]
    node _T_47 = and(maybe_full, _T_20) @[Decoupled.scala 227:32]
    node _T_48 = cat(_T_47, _T_46) @[Cat.scala 30:58]
    io.count <= _T_48 @[Decoupled.scala 227:14]
    
  module Rx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node TICK_HALF = div(UInt<9>("h01b2"), UInt<2>("h02")) @[UART.scala 82:29]
    reg data : UInt<9>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 86:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, TICK_HALF)) @[UART.scala 87:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 88:28]
    reg valid : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 89:28]
    node _T_13 = and(valid, io.deq.ready) @[UART.scala 91:17]
    when _T_13 : @[UART.scala 91:34]
      valid <= UInt<1>("h00") @[UART.scala 92:15]
      skip @[UART.scala 91:34]
    node _T_14 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_14 : @[Conditional.scala 29:59]
      node _T_15 = eq(io.rxd, UInt<1>("h00")) @[UART.scala 97:26]
      when _T_15 : @[UART.scala 97:36]
        node _T_16 = neq(ticks, UInt<1>("h00")) @[UART.scala 98:29]
        when _T_16 : @[UART.scala 98:38]
          node _T_18 = sub(ticks, UInt<1>("h01")) @[UART.scala 99:36]
          node _T_19 = asUInt(_T_18) @[UART.scala 99:36]
          node _T_20 = tail(_T_19, 1) @[UART.scala 99:36]
          ticks <= _T_20 @[UART.scala 99:27]
          skip @[UART.scala 98:38]
        node _T_22 = eq(_T_16, UInt<1>("h00")) @[UART.scala 98:38]
        when _T_22 : @[UART.scala 100:30]
          ticks <= UInt<9>("h01b2") @[UART.scala 101:27]
          state <= UInt<4>("h0a") @[UART.scala 102:27]
          valid <= UInt<1>("h00") @[UART.scala 103:27]
          skip @[UART.scala 100:30]
        skip @[UART.scala 97:36]
      skip @[Conditional.scala 29:59]
    node _T_23 = eq(UInt<4>("h02"), state) @[Conditional.scala 29:28]
    node _T_24 = eq(UInt<4>("h03"), state) @[Conditional.scala 29:28]
    node _T_25 = eq(UInt<4>("h04"), state) @[Conditional.scala 29:28]
    node _T_26 = eq(UInt<4>("h05"), state) @[Conditional.scala 29:28]
    node _T_27 = eq(UInt<4>("h06"), state) @[Conditional.scala 29:28]
    node _T_28 = eq(UInt<4>("h07"), state) @[Conditional.scala 29:28]
    node _T_29 = eq(UInt<4>("h08"), state) @[Conditional.scala 29:28]
    node _T_30 = eq(UInt<4>("h09"), state) @[Conditional.scala 29:28]
    node _T_31 = eq(UInt<4>("h0a"), state) @[Conditional.scala 29:28]
    node _T_32 = or(_T_23, _T_24) @[Conditional.scala 29:53]
    node _T_33 = or(_T_32, _T_25) @[Conditional.scala 29:53]
    node _T_34 = or(_T_33, _T_26) @[Conditional.scala 29:53]
    node _T_35 = or(_T_34, _T_27) @[Conditional.scala 29:53]
    node _T_36 = or(_T_35, _T_28) @[Conditional.scala 29:53]
    node _T_37 = or(_T_36, _T_29) @[Conditional.scala 29:53]
    node _T_38 = or(_T_37, _T_30) @[Conditional.scala 29:53]
    node _T_39 = or(_T_38, _T_31) @[Conditional.scala 29:53]
    when _T_39 : @[Conditional.scala 29:59]
      node _T_40 = eq(ticks, UInt<1>("h00")) @[UART.scala 109:25]
      when _T_40 : @[UART.scala 109:35]
        node _T_41 = shr(data, 1) @[UART.scala 110:43]
        node _T_42 = cat(io.rxd, _T_41) @[Cat.scala 30:58]
        data <= _T_42 @[UART.scala 110:23]
        ticks <= UInt<9>("h01b2") @[UART.scala 111:23]
        node _T_44 = sub(state, UInt<1>("h01")) @[UART.scala 112:32]
        node _T_45 = asUInt(_T_44) @[UART.scala 112:32]
        node _T_46 = tail(_T_45, 1) @[UART.scala 112:32]
        state <= _T_46 @[UART.scala 112:23]
        skip @[UART.scala 109:35]
      node _T_48 = eq(_T_40, UInt<1>("h00")) @[UART.scala 109:35]
      when _T_48 : @[UART.scala 113:26]
        node _T_50 = sub(ticks, UInt<1>("h01")) @[UART.scala 114:32]
        node _T_51 = asUInt(_T_50) @[UART.scala 114:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 114:32]
        ticks <= _T_52 @[UART.scala 114:23]
        skip @[UART.scala 113:26]
      skip @[Conditional.scala 29:59]
    node _T_53 = eq(UInt<4>("h01"), state) @[Conditional.scala 29:28]
    when _T_53 : @[Conditional.scala 29:59]
      node _T_54 = eq(ticks, TICK_HALF) @[UART.scala 119:25]
      when _T_54 : @[UART.scala 119:40]
        node _T_56 = sub(ticks, UInt<1>("h01")) @[UART.scala 120:32]
        node _T_57 = asUInt(_T_56) @[UART.scala 120:32]
        node _T_58 = tail(_T_57, 1) @[UART.scala 120:32]
        ticks <= _T_58 @[UART.scala 120:23]
        state <= UInt<4>("h00") @[UART.scala 121:23]
        valid <= UInt<1>("h01") @[UART.scala 122:23]
        skip @[UART.scala 119:40]
      node _T_60 = eq(_T_54, UInt<1>("h00")) @[UART.scala 119:40]
      when _T_60 : @[UART.scala 123:26]
        node _T_62 = sub(ticks, UInt<1>("h01")) @[UART.scala 124:32]
        node _T_63 = asUInt(_T_62) @[UART.scala 124:32]
        node _T_64 = tail(_T_63, 1) @[UART.scala 124:32]
        ticks <= _T_64 @[UART.scala 124:23]
        skip @[UART.scala 123:26]
      skip @[Conditional.scala 29:59]
    io.deq.valid <= valid @[UART.scala 129:18]
    node _T_65 = bits(data, 7, 0) @[UART.scala 130:25]
    io.deq.bits <= _T_65 @[UART.scala 130:18]
    
  module BufferedRx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, cnt : UInt<6>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst queue of Queue_1 @[UART.scala 158:23]
    queue.io is invalid
    queue.clock <= clock
    queue.reset <= reset
    inst rx of Rx @[UART.scala 159:23]
    rx.io is invalid
    rx.clock <= clock
    rx.reset <= reset
    queue.io.enq.bits <= rx.io.deq.bits @[UART.scala 161:18]
    queue.io.enq.valid <= rx.io.deq.valid @[UART.scala 161:18]
    rx.io.deq.ready <= queue.io.enq.ready @[UART.scala 161:18]
    io.deq.bits <= queue.io.deq.bits @[UART.scala 162:18]
    io.deq.valid <= queue.io.deq.valid @[UART.scala 162:18]
    queue.io.deq.ready <= io.deq.ready @[UART.scala 162:18]
    rx.io.rxd <= io.rxd @[UART.scala 163:18]
    io.cnt <= queue.io.count @[UART.scala 164:18]
    
  module UART : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, txd : UInt<1>, enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst tx of BufferedTx @[UART.scala 28:20]
    tx.io is invalid
    tx.clock <= clock
    tx.reset <= reset
    inst rx of BufferedRx @[UART.scala 29:20]
    rx.io is invalid
    rx.clock <= clock
    rx.reset <= reset
    io.txd <= tx.io.txd @[UART.scala 31:15]
    rx.io.rxd <= io.rxd @[UART.scala 32:15]
    tx.io.enq.bits <= io.deq.bits @[UART.scala 33:15]
    tx.io.enq.valid <= io.deq.valid @[UART.scala 33:15]
    io.deq.ready <= tx.io.enq.ready @[UART.scala 33:15]
    io.enq.bits <= rx.io.deq.bits @[UART.scala 34:15]
    io.enq.valid <= rx.io.deq.valid @[UART.scala 34:15]
    rx.io.deq.ready <= io.enq.ready @[UART.scala 34:15]
    
