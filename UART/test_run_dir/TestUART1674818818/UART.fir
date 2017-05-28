;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit UART : 
  module UART : 
    input clock : Clock
    input reset : UInt<1>
    output io : {channel : {flip data : UInt<8>, flip cts : UInt<1>, rts : UInt<1>}, txd : UInt<1>, tick_cnt : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node TICK_CNT = div(UInt<26>("h02faf080"), UInt<17>("h01c200")) @[UART.scala 33:24]
    reg dataReg : UInt<11>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 35:27]
    reg tickReg : UInt<32>, clock with : (reset => (reset, TICK_CNT)) @[UART.scala 38:27]
    reg bitsReg : UInt<4>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 39:27]
    node _T_13 = add(tickReg, UInt<1>("h01")) @[UART.scala 41:24]
    node _T_14 = tail(_T_13, 1) @[UART.scala 41:24]
    tickReg <= _T_14 @[UART.scala 41:13]
    node _T_16 = eq(tickReg, UInt<1>("h00")) @[UART.scala 42:32]
    node _T_18 = eq(bitsReg, UInt<1>("h00")) @[UART.scala 42:53]
    node _T_19 = and(_T_16, _T_18) @[UART.scala 42:41]
    io.channel.rts <= _T_19 @[UART.scala 42:20]
    node _T_20 = bits(dataReg, 0, 0) @[UART.scala 43:22]
    io.txd <= _T_20 @[UART.scala 43:12]
    node _T_21 = eq(tickReg, TICK_CNT) @[UART.scala 45:19]
    when _T_21 : @[UART.scala 45:33]
      node _T_23 = neq(bitsReg, UInt<1>("h00")) @[UART.scala 46:23]
      when _T_23 : @[UART.scala 46:32]
        node _T_25 = shr(dataReg, 1) @[UART.scala 47:41]
        node _T_26 = cat(UInt<1>("h01"), _T_25) @[Cat.scala 30:58]
        dataReg <= _T_26 @[UART.scala 47:21]
        node _T_28 = sub(bitsReg, UInt<1>("h01")) @[UART.scala 48:32]
        node _T_29 = asUInt(_T_28) @[UART.scala 48:32]
        node _T_30 = tail(_T_29, 1) @[UART.scala 48:32]
        bitsReg <= _T_30 @[UART.scala 48:21]
        skip @[UART.scala 46:32]
      node _T_32 = eq(_T_23, UInt<1>("h00")) @[UART.scala 46:32]
      node _T_33 = and(_T_32, io.channel.cts) @[UART.scala 49:38]
      when _T_33 : @[UART.scala 49:38]
        node _T_35 = cat(UInt<2>("h03"), io.channel.data) @[Cat.scala 30:58]
        node _T_37 = cat(_T_35, UInt<1>("h00")) @[Cat.scala 30:58]
        dataReg <= _T_37 @[UART.scala 50:21]
        bitsReg <= UInt<4>("h0b") @[UART.scala 51:21]
        skip @[UART.scala 49:38]
      tickReg <= UInt<1>("h00") @[UART.scala 53:17]
      skip @[UART.scala 45:33]
    io.tick_cnt <= tickReg @[UART.scala 59:17]
    
