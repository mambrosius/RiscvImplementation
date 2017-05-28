;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit BufferedRx : 
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
    
  module Rx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node TICK_HALF = div(UInt<18>("h028b0a"), UInt<2>("h02")) @[UART.scala 151:29]
    reg data : UInt<9>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 155:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, TICK_HALF)) @[UART.scala 156:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 157:28]
    reg valid : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 158:28]
    node _T_14 = and(valid, io.deq.ready) @[UART.scala 160:17]
    when _T_14 : @[UART.scala 160:34]
      valid <= UInt<1>("h00") @[UART.scala 161:15]
      skip @[UART.scala 160:34]
    node _T_16 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_16 : @[Conditional.scala 29:59]
      node _T_18 = eq(io.rxd, UInt<1>("h00")) @[UART.scala 166:26]
      when _T_18 : @[UART.scala 166:35]
        node _T_20 = neq(ticks, UInt<1>("h00")) @[UART.scala 167:29]
        when _T_20 : @[UART.scala 167:37]
          node _T_22 = sub(ticks, UInt<1>("h01")) @[UART.scala 168:36]
          node _T_23 = asUInt(_T_22) @[UART.scala 168:36]
          node _T_24 = tail(_T_23, 1) @[UART.scala 168:36]
          ticks <= _T_24 @[UART.scala 168:27]
          skip @[UART.scala 167:37]
        node _T_26 = eq(_T_20, UInt<1>("h00")) @[UART.scala 167:37]
        when _T_26 : @[UART.scala 169:30]
          ticks <= UInt<18>("h028b0a") @[UART.scala 170:27]
          state <= UInt<4>("h0a") @[UART.scala 171:27]
          valid <= UInt<1>("h00") @[UART.scala 172:27]
          skip @[UART.scala 169:30]
        skip @[UART.scala 166:35]
      skip @[Conditional.scala 29:59]
    node _T_28 = eq(UInt<4>("h02"), state) @[Conditional.scala 29:28]
    node _T_29 = eq(UInt<4>("h03"), state) @[Conditional.scala 29:28]
    node _T_30 = eq(UInt<4>("h04"), state) @[Conditional.scala 29:28]
    node _T_31 = eq(UInt<4>("h05"), state) @[Conditional.scala 29:28]
    node _T_32 = eq(UInt<4>("h06"), state) @[Conditional.scala 29:28]
    node _T_33 = eq(UInt<4>("h07"), state) @[Conditional.scala 29:28]
    node _T_34 = eq(UInt<4>("h08"), state) @[Conditional.scala 29:28]
    node _T_35 = eq(UInt<4>("h09"), state) @[Conditional.scala 29:28]
    node _T_36 = eq(UInt<4>("h0a"), state) @[Conditional.scala 29:28]
    node _T_37 = or(_T_28, _T_29) @[Conditional.scala 29:53]
    node _T_38 = or(_T_37, _T_30) @[Conditional.scala 29:53]
    node _T_39 = or(_T_38, _T_31) @[Conditional.scala 29:53]
    node _T_40 = or(_T_39, _T_32) @[Conditional.scala 29:53]
    node _T_41 = or(_T_40, _T_33) @[Conditional.scala 29:53]
    node _T_42 = or(_T_41, _T_34) @[Conditional.scala 29:53]
    node _T_43 = or(_T_42, _T_35) @[Conditional.scala 29:53]
    node _T_44 = or(_T_43, _T_36) @[Conditional.scala 29:53]
    when _T_44 : @[Conditional.scala 29:59]
      node _T_46 = eq(ticks, UInt<1>("h00")) @[UART.scala 178:25]
      when _T_46 : @[UART.scala 178:34]
        node _T_47 = shr(data, 1) @[UART.scala 179:43]
        node _T_48 = cat(io.rxd, _T_47) @[Cat.scala 30:58]
        data <= _T_48 @[UART.scala 179:23]
        ticks <= UInt<18>("h028b0a") @[UART.scala 180:23]
        node _T_50 = sub(state, UInt<1>("h01")) @[UART.scala 181:32]
        node _T_51 = asUInt(_T_50) @[UART.scala 181:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 181:32]
        state <= _T_52 @[UART.scala 181:23]
        skip @[UART.scala 178:34]
      node _T_54 = eq(_T_46, UInt<1>("h00")) @[UART.scala 178:34]
      when _T_54 : @[UART.scala 182:26]
        node _T_56 = sub(ticks, UInt<1>("h01")) @[UART.scala 183:32]
        node _T_57 = asUInt(_T_56) @[UART.scala 183:32]
        node _T_58 = tail(_T_57, 1) @[UART.scala 183:32]
        ticks <= _T_58 @[UART.scala 183:23]
        skip @[UART.scala 182:26]
      skip @[Conditional.scala 29:59]
    node _T_59 = eq(UInt<4>("h01"), state) @[Conditional.scala 29:28]
    when _T_59 : @[Conditional.scala 29:59]
      node _T_60 = eq(ticks, TICK_HALF) @[UART.scala 188:25]
      when _T_60 : @[UART.scala 188:40]
        node _T_62 = sub(ticks, UInt<1>("h01")) @[UART.scala 189:32]
        node _T_63 = asUInt(_T_62) @[UART.scala 189:32]
        node _T_64 = tail(_T_63, 1) @[UART.scala 189:32]
        ticks <= _T_64 @[UART.scala 189:23]
        state <= UInt<4>("h00") @[UART.scala 190:23]
        valid <= UInt<1>("h01") @[UART.scala 191:23]
        skip @[UART.scala 188:40]
      node _T_67 = eq(_T_60, UInt<1>("h00")) @[UART.scala 188:40]
      when _T_67 : @[UART.scala 192:26]
        node _T_69 = sub(ticks, UInt<1>("h01")) @[UART.scala 193:32]
        node _T_70 = asUInt(_T_69) @[UART.scala 193:32]
        node _T_71 = tail(_T_70, 1) @[UART.scala 193:32]
        ticks <= _T_71 @[UART.scala 193:23]
        skip @[UART.scala 192:26]
      skip @[Conditional.scala 29:59]
    io.deq.valid <= valid @[UART.scala 198:18]
    node _T_72 = bits(data, 7, 0) @[UART.scala 199:25]
    io.deq.bits <= _T_72 @[UART.scala 199:18]
    
  module BufferedRx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, cnt : UInt<6>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst queue of Queue @[UART.scala 227:23]
    queue.io is invalid
    queue.clock <= clock
    queue.reset <= reset
    inst rx of Rx @[UART.scala 228:23]
    rx.io is invalid
    rx.clock <= clock
    rx.reset <= reset
    queue.io.enq.bits <= rx.io.deq.bits @[UART.scala 230:18]
    queue.io.enq.valid <= rx.io.deq.valid @[UART.scala 230:18]
    rx.io.deq.ready <= queue.io.enq.ready @[UART.scala 230:18]
    io.deq.bits <= queue.io.deq.bits @[UART.scala 231:18]
    io.deq.valid <= queue.io.deq.valid @[UART.scala 231:18]
    queue.io.deq.ready <= io.deq.ready @[UART.scala 231:18]
    rx.io.rxd <= io.rxd @[UART.scala 232:18]
    io.cnt <= queue.io.count @[UART.scala 233:18]
    
