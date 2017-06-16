;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit CPU : 
  module InstructionMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, inst : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem rom : UInt<8>[240] @[Program.scala 29:38]
    infer mport _T_8 = rom[UInt<1>("h00")], clock
    _T_8 <= UInt<8>("h07f") @[Program.scala 35:57]
    infer mport _T_11 = rom[UInt<1>("h01")], clock
    _T_11 <= UInt<8>("h045") @[Program.scala 36:57]
    infer mport _T_14 = rom[UInt<2>("h02")], clock
    _T_14 <= UInt<8>("h04c") @[Program.scala 37:57]
    infer mport _T_17 = rom[UInt<2>("h03")], clock
    _T_17 <= UInt<8>("h046") @[Program.scala 38:57]
    infer mport _T_21 = rom[UInt<3>("h04")], clock
    _T_21 <= UInt<8>("h01") @[Program.scala 35:57]
    infer mport _T_24 = rom[UInt<3>("h05")], clock
    _T_24 <= UInt<8>("h01") @[Program.scala 36:57]
    infer mport _T_27 = rom[UInt<3>("h06")], clock
    _T_27 <= UInt<8>("h01") @[Program.scala 37:57]
    infer mport _T_30 = rom[UInt<3>("h07")], clock
    _T_30 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_34 = rom[UInt<4>("h08")], clock
    _T_34 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_37 = rom[UInt<4>("h09")], clock
    _T_37 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_40 = rom[UInt<4>("h0a")], clock
    _T_40 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_43 = rom[UInt<4>("h0b")], clock
    _T_43 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_47 = rom[UInt<4>("h0c")], clock
    _T_47 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_50 = rom[UInt<4>("h0d")], clock
    _T_50 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_53 = rom[UInt<4>("h0e")], clock
    _T_53 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_56 = rom[UInt<4>("h0f")], clock
    _T_56 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_60 = rom[UInt<5>("h010")], clock
    _T_60 <= UInt<8>("h02") @[Program.scala 35:57]
    infer mport _T_63 = rom[UInt<5>("h011")], clock
    _T_63 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_66 = rom[UInt<5>("h012")], clock
    _T_66 <= UInt<8>("h0f3") @[Program.scala 37:57]
    infer mport _T_69 = rom[UInt<5>("h013")], clock
    _T_69 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_73 = rom[UInt<5>("h014")], clock
    _T_73 <= UInt<8>("h01") @[Program.scala 35:57]
    infer mport _T_76 = rom[UInt<5>("h015")], clock
    _T_76 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_79 = rom[UInt<5>("h016")], clock
    _T_79 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_82 = rom[UInt<5>("h017")], clock
    _T_82 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_86 = rom[UInt<5>("h018")], clock
    _T_86 <= UInt<8>("h054") @[Program.scala 35:57]
    infer mport _T_89 = rom[UInt<5>("h019")], clock
    _T_89 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_92 = rom[UInt<5>("h01a")], clock
    _T_92 <= UInt<8>("h01") @[Program.scala 37:57]
    infer mport _T_95 = rom[UInt<5>("h01b")], clock
    _T_95 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_99 = rom[UInt<5>("h01c")], clock
    _T_99 <= UInt<8>("h034") @[Program.scala 35:57]
    infer mport _T_102 = rom[UInt<5>("h01d")], clock
    _T_102 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_105 = rom[UInt<5>("h01e")], clock
    _T_105 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_108 = rom[UInt<5>("h01f")], clock
    _T_108 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_112 = rom[UInt<6>("h020")], clock
    _T_112 <= UInt<8>("h0dc") @[Program.scala 35:57]
    infer mport _T_115 = rom[UInt<6>("h021")], clock
    _T_115 <= UInt<8>("h01") @[Program.scala 36:57]
    infer mport _T_118 = rom[UInt<6>("h022")], clock
    _T_118 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_121 = rom[UInt<6>("h023")], clock
    _T_121 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_125 = rom[UInt<6>("h024")], clock
    _T_125 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_128 = rom[UInt<6>("h025")], clock
    _T_128 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_131 = rom[UInt<6>("h026")], clock
    _T_131 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_134 = rom[UInt<6>("h027")], clock
    _T_134 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_138 = rom[UInt<6>("h028")], clock
    _T_138 <= UInt<8>("h034") @[Program.scala 35:57]
    infer mport _T_141 = rom[UInt<6>("h029")], clock
    _T_141 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_144 = rom[UInt<6>("h02a")], clock
    _T_144 <= UInt<8>("h020") @[Program.scala 37:57]
    infer mport _T_147 = rom[UInt<6>("h02b")], clock
    _T_147 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_151 = rom[UInt<6>("h02c")], clock
    _T_151 <= UInt<8>("h01") @[Program.scala 35:57]
    infer mport _T_154 = rom[UInt<6>("h02d")], clock
    _T_154 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_157 = rom[UInt<6>("h02e")], clock
    _T_157 <= UInt<8>("h028") @[Program.scala 37:57]
    infer mport _T_160 = rom[UInt<6>("h02f")], clock
    _T_160 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_164 = rom[UInt<6>("h030")], clock
    _T_164 <= UInt<8>("h06") @[Program.scala 35:57]
    infer mport _T_167 = rom[UInt<6>("h031")], clock
    _T_167 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_170 = rom[UInt<6>("h032")], clock
    _T_170 <= UInt<8>("h05") @[Program.scala 37:57]
    infer mport _T_173 = rom[UInt<6>("h033")], clock
    _T_173 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_177 = rom[UInt<6>("h034")], clock
    _T_177 <= UInt<8>("h01") @[Program.scala 35:57]
    infer mport _T_180 = rom[UInt<6>("h035")], clock
    _T_180 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_183 = rom[UInt<6>("h036")], clock
    _T_183 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_186 = rom[UInt<6>("h037")], clock
    _T_186 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_190 = rom[UInt<6>("h038")], clock
    _T_190 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_193 = rom[UInt<6>("h039")], clock
    _T_193 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_196 = rom[UInt<6>("h03a")], clock
    _T_196 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_199 = rom[UInt<6>("h03b")], clock
    _T_199 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_203 = rom[UInt<6>("h03c")], clock
    _T_203 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_206 = rom[UInt<6>("h03d")], clock
    _T_206 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_209 = rom[UInt<6>("h03e")], clock
    _T_209 <= UInt<8>("h01") @[Program.scala 37:57]
    infer mport _T_212 = rom[UInt<6>("h03f")], clock
    _T_212 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_216 = rom[UInt<7>("h040")], clock
    _T_216 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_219 = rom[UInt<7>("h041")], clock
    _T_219 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_222 = rom[UInt<7>("h042")], clock
    _T_222 <= UInt<8>("h01") @[Program.scala 37:57]
    infer mport _T_225 = rom[UInt<7>("h043")], clock
    _T_225 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_229 = rom[UInt<7>("h044")], clock
    _T_229 <= UInt<8>("h0cc") @[Program.scala 35:57]
    infer mport _T_232 = rom[UInt<7>("h045")], clock
    _T_232 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_235 = rom[UInt<7>("h046")], clock
    _T_235 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_238 = rom[UInt<7>("h047")], clock
    _T_238 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_242 = rom[UInt<7>("h048")], clock
    _T_242 <= UInt<8>("h0cc") @[Program.scala 35:57]
    infer mport _T_245 = rom[UInt<7>("h049")], clock
    _T_245 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_248 = rom[UInt<7>("h04a")], clock
    _T_248 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_251 = rom[UInt<7>("h04b")], clock
    _T_251 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_255 = rom[UInt<7>("h04c")], clock
    _T_255 <= UInt<8>("h05") @[Program.scala 35:57]
    infer mport _T_258 = rom[UInt<7>("h04d")], clock
    _T_258 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_261 = rom[UInt<7>("h04e")], clock
    _T_261 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_264 = rom[UInt<7>("h04f")], clock
    _T_264 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_268 = rom[UInt<7>("h050")], clock
    _T_268 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_271 = rom[UInt<7>("h051")], clock
    _T_271 <= UInt<8>("h010") @[Program.scala 36:57]
    infer mport _T_274 = rom[UInt<7>("h052")], clock
    _T_274 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_277 = rom[UInt<7>("h053")], clock
    _T_277 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_281 = rom[UInt<7>("h054")], clock
    _T_281 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_284 = rom[UInt<7>("h055")], clock
    _T_284 <= UInt<8>("h03") @[Program.scala 36:57]
    infer mport _T_287 = rom[UInt<7>("h056")], clock
    _T_287 <= UInt<8>("h010") @[Program.scala 37:57]
    infer mport _T_290 = rom[UInt<7>("h057")], clock
    _T_290 <= UInt<8>("h040") @[Program.scala 38:57]
    infer mport _T_294 = rom[UInt<7>("h058")], clock
    _T_294 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_297 = rom[UInt<7>("h059")], clock
    _T_297 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_300 = rom[UInt<7>("h05a")], clock
    _T_300 <= UInt<8>("h080") @[Program.scala 37:57]
    infer mport _T_303 = rom[UInt<7>("h05b")], clock
    _T_303 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_307 = rom[UInt<7>("h05c")], clock
    _T_307 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_310 = rom[UInt<7>("h05d")], clock
    _T_310 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_313 = rom[UInt<7>("h05e")], clock
    _T_313 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_316 = rom[UInt<7>("h05f")], clock
    _T_316 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_320 = rom[UInt<7>("h060")], clock
    _T_320 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_323 = rom[UInt<7>("h061")], clock
    _T_323 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_326 = rom[UInt<7>("h062")], clock
    _T_326 <= UInt<8>("h050") @[Program.scala 37:57]
    infer mport _T_329 = rom[UInt<7>("h063")], clock
    _T_329 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_333 = rom[UInt<7>("h064")], clock
    _T_333 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_336 = rom[UInt<7>("h065")], clock
    _T_336 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_339 = rom[UInt<7>("h066")], clock
    _T_339 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_342 = rom[UInt<7>("h067")], clock
    _T_342 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_346 = rom[UInt<7>("h068")], clock
    _T_346 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_349 = rom[UInt<7>("h069")], clock
    _T_349 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_352 = rom[UInt<7>("h06a")], clock
    _T_352 <= UInt<8>("h0c0") @[Program.scala 37:57]
    infer mport _T_355 = rom[UInt<7>("h06b")], clock
    _T_355 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_359 = rom[UInt<7>("h06c")], clock
    _T_359 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_362 = rom[UInt<7>("h06d")], clock
    _T_362 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_365 = rom[UInt<7>("h06e")], clock
    _T_365 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_368 = rom[UInt<7>("h06f")], clock
    _T_368 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_372 = rom[UInt<7>("h070")], clock
    _T_372 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_375 = rom[UInt<7>("h071")], clock
    _T_375 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_378 = rom[UInt<7>("h072")], clock
    _T_378 <= UInt<8>("h0c0") @[Program.scala 37:57]
    infer mport _T_381 = rom[UInt<7>("h073")], clock
    _T_381 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_385 = rom[UInt<7>("h074")], clock
    _T_385 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_388 = rom[UInt<7>("h075")], clock
    _T_388 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_391 = rom[UInt<7>("h076")], clock
    _T_391 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_394 = rom[UInt<7>("h077")], clock
    _T_394 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_398 = rom[UInt<7>("h078")], clock
    _T_398 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_401 = rom[UInt<7>("h079")], clock
    _T_401 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_404 = rom[UInt<7>("h07a")], clock
    _T_404 <= UInt<8>("h0f0") @[Program.scala 37:57]
    infer mport _T_407 = rom[UInt<7>("h07b")], clock
    _T_407 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_411 = rom[UInt<7>("h07c")], clock
    _T_411 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_414 = rom[UInt<7>("h07d")], clock
    _T_414 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_417 = rom[UInt<7>("h07e")], clock
    _T_417 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_420 = rom[UInt<7>("h07f")], clock
    _T_420 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_424 = rom[UInt<8>("h080")], clock
    _T_424 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_427 = rom[UInt<8>("h081")], clock
    _T_427 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_430 = rom[UInt<8>("h082")], clock
    _T_430 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_433 = rom[UInt<8>("h083")], clock
    _T_433 <= UInt<8>("h02") @[Program.scala 38:57]
    infer mport _T_437 = rom[UInt<8>("h084")], clock
    _T_437 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_440 = rom[UInt<8>("h085")], clock
    _T_440 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_443 = rom[UInt<8>("h086")], clock
    _T_443 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_446 = rom[UInt<8>("h087")], clock
    _T_446 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_450 = rom[UInt<8>("h088")], clock
    _T_450 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_453 = rom[UInt<8>("h089")], clock
    _T_453 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_456 = rom[UInt<8>("h08a")], clock
    _T_456 <= UInt<8>("h070") @[Program.scala 37:57]
    infer mport _T_459 = rom[UInt<8>("h08b")], clock
    _T_459 <= UInt<8>("h07") @[Program.scala 38:57]
    infer mport _T_463 = rom[UInt<8>("h08c")], clock
    _T_463 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_466 = rom[UInt<8>("h08d")], clock
    _T_466 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_469 = rom[UInt<8>("h08e")], clock
    _T_469 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_472 = rom[UInt<8>("h08f")], clock
    _T_472 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_476 = rom[UInt<8>("h090")], clock
    _T_476 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_479 = rom[UInt<8>("h091")], clock
    _T_479 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_482 = rom[UInt<8>("h092")], clock
    _T_482 <= UInt<8>("h0f0") @[Program.scala 37:57]
    infer mport _T_485 = rom[UInt<8>("h093")], clock
    _T_485 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_489 = rom[UInt<8>("h094")], clock
    _T_489 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_492 = rom[UInt<8>("h095")], clock
    _T_492 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_495 = rom[UInt<8>("h096")], clock
    _T_495 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_498 = rom[UInt<8>("h097")], clock
    _T_498 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_502 = rom[UInt<8>("h098")], clock
    _T_502 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_505 = rom[UInt<8>("h099")], clock
    _T_505 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_508 = rom[UInt<8>("h09a")], clock
    _T_508 <= UInt<8>("h020") @[Program.scala 37:57]
    infer mport _T_511 = rom[UInt<8>("h09b")], clock
    _T_511 <= UInt<8>("h07") @[Program.scala 38:57]
    infer mport _T_515 = rom[UInt<8>("h09c")], clock
    _T_515 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_518 = rom[UInt<8>("h09d")], clock
    _T_518 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_521 = rom[UInt<8>("h09e")], clock
    _T_521 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_524 = rom[UInt<8>("h09f")], clock
    _T_524 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_528 = rom[UInt<8>("h0a0")], clock
    _T_528 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_531 = rom[UInt<8>("h0a1")], clock
    _T_531 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_534 = rom[UInt<8>("h0a2")], clock
    _T_534 <= UInt<8>("h0c0") @[Program.scala 37:57]
    infer mport _T_537 = rom[UInt<8>("h0a3")], clock
    _T_537 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_541 = rom[UInt<8>("h0a4")], clock
    _T_541 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_544 = rom[UInt<8>("h0a5")], clock
    _T_544 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_547 = rom[UInt<8>("h0a6")], clock
    _T_547 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_550 = rom[UInt<8>("h0a7")], clock
    _T_550 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_554 = rom[UInt<8>("h0a8")], clock
    _T_554 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_557 = rom[UInt<8>("h0a9")], clock
    _T_557 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_560 = rom[UInt<8>("h0aa")], clock
    _T_560 <= UInt<8>("h040") @[Program.scala 37:57]
    infer mport _T_563 = rom[UInt<8>("h0ab")], clock
    _T_563 <= UInt<8>("h06") @[Program.scala 38:57]
    infer mport _T_567 = rom[UInt<8>("h0ac")], clock
    _T_567 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_570 = rom[UInt<8>("h0ad")], clock
    _T_570 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_573 = rom[UInt<8>("h0ae")], clock
    _T_573 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_576 = rom[UInt<8>("h0af")], clock
    _T_576 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_580 = rom[UInt<8>("h0b0")], clock
    _T_580 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_583 = rom[UInt<8>("h0b1")], clock
    _T_583 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_586 = rom[UInt<8>("h0b2")], clock
    _T_586 <= UInt<8>("h010") @[Program.scala 37:57]
    infer mport _T_589 = rom[UInt<8>("h0b3")], clock
    _T_589 <= UInt<8>("h02") @[Program.scala 38:57]
    infer mport _T_593 = rom[UInt<8>("h0b4")], clock
    _T_593 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_596 = rom[UInt<8>("h0b5")], clock
    _T_596 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_599 = rom[UInt<8>("h0b6")], clock
    _T_599 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_602 = rom[UInt<8>("h0b7")], clock
    _T_602 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_606 = rom[UInt<8>("h0b8")], clock
    _T_606 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_609 = rom[UInt<8>("h0b9")], clock
    _T_609 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_612 = rom[UInt<8>("h0ba")], clock
    _T_612 <= UInt<8>("h0a0") @[Program.scala 37:57]
    infer mport _T_615 = rom[UInt<8>("h0bb")], clock
    _T_615 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_619 = rom[UInt<8>("h0bc")], clock
    _T_619 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_622 = rom[UInt<8>("h0bd")], clock
    _T_622 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_625 = rom[UInt<8>("h0be")], clock
    _T_625 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_628 = rom[UInt<8>("h0bf")], clock
    _T_628 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_632 = rom[UInt<8>("h0c0")], clock
    _T_632 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_635 = rom[UInt<8>("h0c1")], clock
    _T_635 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_638 = rom[UInt<8>("h0c2")], clock
    _T_638 <= UInt<8>("h0d0") @[Program.scala 37:57]
    infer mport _T_641 = rom[UInt<8>("h0c3")], clock
    _T_641 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_645 = rom[UInt<8>("h0c4")], clock
    _T_645 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_648 = rom[UInt<8>("h0c5")], clock
    _T_648 <= UInt<8>("h020") @[Program.scala 36:57]
    infer mport _T_651 = rom[UInt<8>("h0c6")], clock
    _T_651 <= UInt<8>("h053") @[Program.scala 37:57]
    infer mport _T_654 = rom[UInt<8>("h0c7")], clock
    _T_654 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_658 = rom[UInt<8>("h0c8")], clock
    _T_658 <= UInt<8>("h067") @[Program.scala 35:57]
    infer mport _T_661 = rom[UInt<8>("h0c9")], clock
    _T_661 <= UInt<8>("h080") @[Program.scala 36:57]
    infer mport _T_664 = rom[UInt<8>("h0ca")], clock
    _T_664 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_667 = rom[UInt<8>("h0cb")], clock
    _T_667 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_671 = rom[UInt<8>("h0cc")], clock
    _T_671 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_674 = rom[UInt<8>("h0cd")], clock
    _T_674 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_677 = rom[UInt<8>("h0ce")], clock
    _T_677 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_680 = rom[UInt<8>("h0cf")], clock
    _T_680 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_684 = rom[UInt<8>("h0d0")], clock
    _T_684 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_687 = rom[UInt<8>("h0d1")], clock
    _T_687 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_690 = rom[UInt<8>("h0d2")], clock
    _T_690 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_693 = rom[UInt<8>("h0d3")], clock
    _T_693 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_697 = rom[UInt<8>("h0d4")], clock
    _T_697 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_700 = rom[UInt<8>("h0d5")], clock
    _T_700 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_703 = rom[UInt<8>("h0d6")], clock
    _T_703 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_706 = rom[UInt<8>("h0d7")], clock
    _T_706 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_710 = rom[UInt<8>("h0d8")], clock
    _T_710 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_713 = rom[UInt<8>("h0d9")], clock
    _T_713 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_716 = rom[UInt<8>("h0da")], clock
    _T_716 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_719 = rom[UInt<8>("h0db")], clock
    _T_719 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_723 = rom[UInt<8>("h0dc")], clock
    _T_723 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_726 = rom[UInt<8>("h0dd")], clock
    _T_726 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_729 = rom[UInt<8>("h0de")], clock
    _T_729 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_732 = rom[UInt<8>("h0df")], clock
    _T_732 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_736 = rom[UInt<8>("h0e0")], clock
    _T_736 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_739 = rom[UInt<8>("h0e1")], clock
    _T_739 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_742 = rom[UInt<8>("h0e2")], clock
    _T_742 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_745 = rom[UInt<8>("h0e3")], clock
    _T_745 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_749 = rom[UInt<8>("h0e4")], clock
    _T_749 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_752 = rom[UInt<8>("h0e5")], clock
    _T_752 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_755 = rom[UInt<8>("h0e6")], clock
    _T_755 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_758 = rom[UInt<8>("h0e7")], clock
    _T_758 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_762 = rom[UInt<8>("h0e8")], clock
    _T_762 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_765 = rom[UInt<8>("h0e9")], clock
    _T_765 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_768 = rom[UInt<8>("h0ea")], clock
    _T_768 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_771 = rom[UInt<8>("h0eb")], clock
    _T_771 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_775 = rom[UInt<8>("h0ec")], clock
    _T_775 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_778 = rom[UInt<8>("h0ed")], clock
    _T_778 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_781 = rom[UInt<8>("h0ee")], clock
    _T_781 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_784 = rom[UInt<8>("h0ef")], clock
    _T_784 <= UInt<8>("h00") @[Program.scala 38:57]
    node _T_787 = add(io.pc, UInt<2>("h03")) @[InstructionMemory.scala 24:35]
    node _T_788 = tail(_T_787, 1) @[InstructionMemory.scala 24:35]
    node _T_789 = bits(_T_788, 7, 0)
    read mport _T_790 = rom[_T_789], clock
    node _T_792 = add(io.pc, UInt<2>("h02")) @[InstructionMemory.scala 24:58]
    node _T_793 = tail(_T_792, 1) @[InstructionMemory.scala 24:58]
    node _T_794 = bits(_T_793, 7, 0)
    read mport _T_795 = rom[_T_794], clock
    node _T_797 = add(io.pc, UInt<1>("h01")) @[InstructionMemory.scala 24:81]
    node _T_798 = tail(_T_797, 1) @[InstructionMemory.scala 24:81]
    node _T_799 = bits(_T_798, 7, 0)
    read mport _T_800 = rom[_T_799], clock
    node _T_801 = bits(io.pc, 7, 0)
    read mport _T_802 = rom[_T_801], clock
    node _T_803 = cat(_T_800, _T_802) @[Cat.scala 30:58]
    node _T_804 = cat(_T_790, _T_795) @[Cat.scala 30:58]
    node _T_805 = cat(_T_804, _T_803) @[Cat.scala 30:58]
    io.inst <= _T_805 @[InstructionMemory.scala 24:13]
    
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip branch : UInt<1>, flip pc_src : UInt<32>, pc_next : UInt<32>, pc : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<7>("h054"))) @[ProgramCounter.scala 22:30]
    node _T_8 = add(pc_reg, UInt<3>("h04")) @[ProgramCounter.scala 23:35]
    node _T_9 = tail(_T_8, 1) @[ProgramCounter.scala 23:35]
    io.pc_next <= _T_9 @[ProgramCounter.scala 23:25]
    node _T_10 = mux(io.branch, io.pc_src, io.pc_next) @[ProgramCounter.scala 24:31]
    pc_reg <= _T_10 @[ProgramCounter.scala 24:25]
    io.pc <= pc_reg @[ProgramCounter.scala 25:25]
    
  module Decoder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst : UInt<32>, flip ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, rd : UInt<5>, imm : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_17 = bits(io.inst, 6, 0) @[Decoder.scala 27:32]
    io.ctrl.opcode <= _T_17 @[Decoder.scala 27:25]
    node _T_18 = bits(io.inst, 11, 7) @[Decoder.scala 28:40]
    io.rd <= _T_18 @[Decoder.scala 28:33]
    node _T_19 = bits(io.inst, 14, 12) @[Decoder.scala 29:32]
    io.ctrl.funct3 <= _T_19 @[Decoder.scala 29:25]
    node _T_20 = bits(io.inst, 19, 15) @[Decoder.scala 30:40]
    io.rs.rs1 <= _T_20 @[Decoder.scala 30:33]
    node _T_21 = bits(io.inst, 24, 20) @[Decoder.scala 31:40]
    io.rs.rs2 <= _T_21 @[Decoder.scala 31:33]
    node _T_22 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Decoder.scala 32:47]
    node _T_23 = bits(io.inst, 31, 25) @[Decoder.scala 32:58]
    node _T_25 = mux(_T_22, _T_23, UInt<7>("h00")) @[Decoder.scala 32:31]
    io.ctrl.funct7 <= _T_25 @[Decoder.scala 32:25]
    node _T_26 = eq(UInt<5>("h013"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_26 : @[Conditional.scala 29:59]
      node _T_28 = bits(io.inst, 31, 20) @[Decoder.scala 36:59]
      node _T_29 = cat(UInt<20>("h00"), _T_28) @[Cat.scala 30:58]
      io.imm <= _T_29 @[Decoder.scala 36:32]
      skip @[Conditional.scala 29:59]
    node _T_30 = eq(UInt<2>("h03"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_30 : @[Conditional.scala 29:59]
      node _T_32 = bits(io.inst, 31, 20) @[Decoder.scala 38:59]
      node _T_33 = cat(UInt<20>("h00"), _T_32) @[Cat.scala 30:58]
      io.imm <= _T_33 @[Decoder.scala 38:32]
      skip @[Conditional.scala 29:59]
    node _T_34 = eq(UInt<7>("h067"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_34 : @[Conditional.scala 29:59]
      node _T_36 = bits(io.inst, 31, 20) @[Decoder.scala 40:59]
      node _T_37 = cat(UInt<20>("h00"), _T_36) @[Cat.scala 30:58]
      io.imm <= _T_37 @[Decoder.scala 40:32]
      skip @[Conditional.scala 29:59]
    node _T_38 = eq(UInt<6>("h023"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_38 : @[Conditional.scala 29:59]
      node _T_40 = bits(io.inst, 31, 25) @[Decoder.scala 42:59]
      node _T_41 = bits(io.inst, 11, 7) @[Decoder.scala 42:72]
      node _T_42 = cat(UInt<20>("h00"), _T_40) @[Cat.scala 30:58]
      node _T_43 = cat(_T_42, _T_41) @[Cat.scala 30:58]
      io.imm <= _T_43 @[Decoder.scala 42:32]
      skip @[Conditional.scala 29:59]
    node _T_44 = eq(UInt<7>("h063"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_44 : @[Conditional.scala 29:59]
      node _T_46 = bits(io.inst, 31, 31) @[Decoder.scala 44:59]
      node _T_47 = bits(io.inst, 7, 7) @[Decoder.scala 44:69]
      node _T_48 = bits(io.inst, 30, 25) @[Decoder.scala 44:78]
      node _T_49 = bits(io.inst, 11, 8) @[Decoder.scala 44:91]
      node _T_50 = cat(_T_48, _T_49) @[Cat.scala 30:58]
      node _T_51 = cat(UInt<20>("h00"), _T_46) @[Cat.scala 30:58]
      node _T_52 = cat(_T_51, _T_47) @[Cat.scala 30:58]
      node _T_53 = cat(_T_52, _T_50) @[Cat.scala 30:58]
      io.imm <= _T_53 @[Decoder.scala 44:32]
      skip @[Conditional.scala 29:59]
    node _T_54 = eq(UInt<6>("h037"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_54 : @[Conditional.scala 29:59]
      node _T_56 = bits(io.inst, 31, 12) @[Decoder.scala 46:59]
      node _T_57 = cat(UInt<12>("h00"), _T_56) @[Cat.scala 30:58]
      io.imm <= _T_57 @[Decoder.scala 46:32]
      skip @[Conditional.scala 29:59]
    node _T_58 = eq(UInt<5>("h017"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_58 : @[Conditional.scala 29:59]
      node _T_60 = bits(io.inst, 31, 12) @[Decoder.scala 48:59]
      node _T_61 = cat(UInt<12>("h00"), _T_60) @[Cat.scala 30:58]
      io.imm <= _T_61 @[Decoder.scala 48:32]
      skip @[Conditional.scala 29:59]
    node _T_62 = eq(UInt<7>("h06f"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_62 : @[Conditional.scala 29:59]
      node _T_64 = bits(io.inst, 31, 31) @[Decoder.scala 50:59]
      node _T_65 = bits(io.inst, 19, 12) @[Decoder.scala 50:69]
      node _T_66 = bits(io.inst, 20, 20) @[Decoder.scala 50:82]
      node _T_67 = bits(io.inst, 30, 21) @[Decoder.scala 50:92]
      node _T_69 = cat(_T_66, _T_67) @[Cat.scala 30:58]
      node _T_70 = cat(_T_69, UInt<1>("h00")) @[Cat.scala 30:58]
      node _T_71 = cat(UInt<11>("h00"), _T_64) @[Cat.scala 30:58]
      node _T_72 = cat(_T_71, _T_65) @[Cat.scala 30:58]
      node _T_73 = cat(_T_72, _T_70) @[Cat.scala 30:58]
      io.imm <= _T_73 @[Decoder.scala 50:32]
      skip @[Conditional.scala 29:59]
    
  module Control : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_30 = neq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 23:51]
    io.EX.alu_sel <= _T_30 @[Control.scala 23:33]
    node _T_31 = neq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 24:51]
    io.EX.dst_sel <= _T_31 @[Control.scala 24:33]
    node _T_32 = bits(io.ctrl.funct7, 5, 5) @[Control.scala 26:76]
    node _T_33 = mux(io.EX.alu_sel, UInt<1>("h00"), _T_32) @[Control.scala 26:39]
    io.EX.alu_op.alt <= _T_33 @[Control.scala 26:33]
    io.EX.alu_op.func <= io.ctrl.funct3 @[Control.scala 27:33]
    io.EX.opcode <= io.ctrl.opcode @[Control.scala 28:33]
    io.MEM.func <= io.ctrl.funct3 @[Control.scala 30:33]
    node _T_34 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 31:51]
    io.MEM.read <= _T_34 @[Control.scala 31:33]
    node _T_35 = eq(io.ctrl.opcode, UInt<6>("h023")) @[Control.scala 32:51]
    io.MEM.write <= _T_35 @[Control.scala 32:33]
    node _T_36 = eq(io.ctrl.opcode, UInt<7>("h063")) @[Control.scala 33:51]
    io.MEM.branch <= _T_36 @[Control.scala 33:33]
    io.WB.rd_mem <= io.MEM.read @[Control.scala 35:33]
    node _T_37 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 36:51]
    node _T_38 = eq(io.ctrl.opcode, UInt<5>("h013")) @[Control.scala 36:75]
    node _T_39 = or(_T_37, _T_38) @[Control.scala 36:57]
    node _T_40 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 36:99]
    node _T_41 = or(_T_39, _T_40) @[Control.scala 36:81]
    io.WB.reg_w <= _T_41 @[Control.scala 36:33]
    
  module Registers : 
    input clock : Clock
    input reset : UInt<1>
    output io : {rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip reg_w : UInt<1>, flip rd : UInt<5>, flip res : UInt<32>, flip op : {flip op1 : UInt<32>, flip op2 : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem x : UInt<32>[32] @[Registers.scala 24:16]
    infer mport _T_15 = x[UInt<1>("h00")], clock
    _T_15 <= UInt<1>("h00") @[Registers.scala 27:12]
    when io.reg_w : @[Registers.scala 28:21]
      infer mport _T_16 = x[io.rd], clock
      _T_16 <= io.res @[Registers.scala 28:32]
      skip @[Registers.scala 28:21]
    node _T_17 = neq(io.res, UInt<1>("h00")) @[Registers.scala 30:39]
    node _T_18 = and(io.reg_w, _T_17) @[Registers.scala 30:28]
    node _T_19 = eq(io.rd, io.rs.rs1) @[Registers.scala 30:59]
    node fwd_rs1 = and(_T_18, _T_19) @[Registers.scala 30:49]
    node _T_20 = neq(io.res, UInt<1>("h00")) @[Registers.scala 31:39]
    node _T_21 = and(io.reg_w, _T_20) @[Registers.scala 31:28]
    node _T_22 = eq(io.rd, io.rs.rs2) @[Registers.scala 31:59]
    node fwd_rs2 = and(_T_21, _T_22) @[Registers.scala 31:49]
    infer mport _T_23 = x[io.rs.rs1], clock
    node _T_24 = mux(fwd_rs1, io.res, _T_23) @[Registers.scala 33:21]
    io.op.op1 <= _T_24 @[Registers.scala 33:15]
    infer mport _T_25 = x[io.rs.rs2], clock
    node _T_26 = mux(fwd_rs2, io.res, _T_25) @[Registers.scala 34:21]
    io.op.op2 <= _T_26 @[Registers.scala 34:15]
    
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip opcode : UInt<7>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, zero : UInt<1>, branch : UInt<1>, res : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node shamt = bits(io.op.op2, 4, 0) @[ALU.scala 28:20]
    node _T_10 = sub(io.op.op1, io.op.op2) @[ALU.scala 33:47]
    node _T_11 = asUInt(_T_10) @[ALU.scala 33:47]
    node _T_12 = tail(_T_11, 1) @[ALU.scala 33:47]
    node _T_13 = add(io.op.op1, io.op.op2) @[ALU.scala 33:58]
    node _T_14 = tail(_T_13, 1) @[ALU.scala 33:58]
    node _T_15 = mux(io.alu_op.alt, _T_12, _T_14) @[ALU.scala 33:27]
    node _T_16 = dshl(io.op.op1, shamt) @[ALU.scala 34:29]
    node _T_17 = lt(io.op.op1, io.op.op2) @[ALU.scala 36:29]
    node _T_18 = xor(io.op.op1, io.op.op2) @[ALU.scala 37:29]
    node _T_19 = dshr(io.op.op1, shamt) @[ALU.scala 38:53]
    node _T_20 = mux(io.alu_op.alt, UInt<1>("h00"), _T_19) @[ALU.scala 38:27]
    node _T_21 = or(io.op.op1, io.op.op2) @[ALU.scala 39:29]
    node _T_22 = eq(UInt<3>("h06"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_23 = mux(_T_22, _T_21, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_24 = eq(UInt<3>("h05"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_25 = mux(_T_24, _T_20, _T_23) @[Mux.scala 46:16]
    node _T_26 = eq(UInt<3>("h04"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_27 = mux(_T_26, _T_18, _T_25) @[Mux.scala 46:16]
    node _T_28 = eq(UInt<2>("h03"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_29 = mux(_T_28, _T_17, _T_27) @[Mux.scala 46:16]
    node _T_30 = eq(UInt<1>("h01"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_31 = mux(_T_30, _T_16, _T_29) @[Mux.scala 46:16]
    node _T_32 = eq(UInt<1>("h00"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_33 = mux(_T_32, _T_15, _T_31) @[Mux.scala 46:16]
    node _T_34 = add(io.op.op1, io.op.op2) @[ALU.scala 41:29]
    node _T_35 = tail(_T_34, 1) @[ALU.scala 41:29]
    node _T_36 = dshl(io.op.op1, shamt) @[ALU.scala 42:29]
    node _T_37 = lt(io.op.op1, io.op.op2) @[ALU.scala 44:29]
    node _T_38 = xor(io.op.op1, io.op.op2) @[ALU.scala 45:29]
    node _T_39 = dshr(io.op.op1, shamt) @[ALU.scala 46:53]
    node _T_40 = mux(io.alu_op.alt, UInt<1>("h00"), _T_39) @[ALU.scala 46:27]
    node _T_41 = or(io.op.op1, io.op.op2) @[ALU.scala 47:29]
    node _T_42 = eq(UInt<3>("h06"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_43 = mux(_T_42, _T_41, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_44 = eq(UInt<3>("h05"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_45 = mux(_T_44, _T_40, _T_43) @[Mux.scala 46:16]
    node _T_46 = eq(UInt<3>("h04"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_47 = mux(_T_46, _T_38, _T_45) @[Mux.scala 46:16]
    node _T_48 = eq(UInt<2>("h03"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_49 = mux(_T_48, _T_37, _T_47) @[Mux.scala 46:16]
    node _T_50 = eq(UInt<1>("h01"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_51 = mux(_T_50, _T_36, _T_49) @[Mux.scala 46:16]
    node _T_52 = eq(UInt<1>("h00"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_53 = mux(_T_52, _T_35, _T_51) @[Mux.scala 46:16]
    node _T_54 = add(io.op.op1, io.op.op2) @[ALU.scala 48:19]
    node _T_55 = tail(_T_54, 1) @[ALU.scala 48:19]
    node _T_56 = add(io.op.op1, io.op.op2) @[ALU.scala 49:19]
    node _T_57 = tail(_T_56, 1) @[ALU.scala 49:19]
    node _T_58 = sub(io.op.op1, io.op.op2) @[ALU.scala 50:19]
    node _T_59 = asUInt(_T_58) @[ALU.scala 50:19]
    node _T_60 = tail(_T_59, 1) @[ALU.scala 50:19]
    node _T_61 = eq(UInt<7>("h063"), io.opcode) @[Mux.scala 46:19]
    node _T_62 = mux(_T_61, _T_60, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_63 = eq(UInt<6>("h023"), io.opcode) @[Mux.scala 46:19]
    node _T_64 = mux(_T_63, _T_57, _T_62) @[Mux.scala 46:16]
    node _T_65 = eq(UInt<2>("h03"), io.opcode) @[Mux.scala 46:19]
    node _T_66 = mux(_T_65, _T_55, _T_64) @[Mux.scala 46:16]
    node _T_67 = eq(UInt<5>("h013"), io.opcode) @[Mux.scala 46:19]
    node _T_68 = mux(_T_67, _T_53, _T_66) @[Mux.scala 46:16]
    node _T_69 = eq(UInt<6>("h033"), io.opcode) @[Mux.scala 46:19]
    node _T_70 = mux(_T_69, _T_33, _T_68) @[Mux.scala 46:16]
    io.res <= _T_70 @[ALU.scala 30:12]
    node _T_71 = eq(io.res, UInt<1>("h00")) @[ALU.scala 62:23]
    io.zero <= _T_71 @[ALU.scala 62:13]
    
  module DataMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {mem : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, res : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem data_mem : UInt<8>[512] @[DataMemory.scala 25:27]
    when io.mem.write : @[DataMemory.scala 27:29]
      node _T_11 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_11 : @[Conditional.scala 29:59]
        node _T_12 = bits(io.op.op1, 8, 0)
        infer mport _T_13 = data_mem[_T_12], clock
        node _T_14 = bits(io.op.op2, 7, 0) @[DataMemory.scala 30:65]
        _T_13 <= _T_14 @[DataMemory.scala 30:53]
        skip @[Conditional.scala 29:59]
      node _T_15 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_15 : @[Conditional.scala 29:59]
        node _T_16 = bits(io.op.op1, 8, 0)
        infer mport _T_17 = data_mem[_T_16], clock
        node _T_18 = bits(io.op.op2, 7, 0) @[DataMemory.scala 32:71]
        _T_17 <= _T_18 @[DataMemory.scala 32:59]
        node _T_20 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 33:52]
        node _T_21 = tail(_T_20, 1) @[DataMemory.scala 33:52]
        node _T_22 = bits(_T_21, 8, 0)
        infer mport _T_23 = data_mem[_T_22], clock
        node _T_24 = bits(io.op.op2, 15, 8) @[DataMemory.scala 33:71]
        _T_23 <= _T_24 @[DataMemory.scala 33:59]
        skip @[Conditional.scala 29:59]
      node _T_25 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_25 : @[Conditional.scala 29:59]
        node _T_26 = bits(io.op.op1, 8, 0)
        infer mport _T_27 = data_mem[_T_26], clock
        node _T_28 = bits(io.op.op2, 7, 0) @[DataMemory.scala 35:71]
        _T_27 <= _T_28 @[DataMemory.scala 35:59]
        node _T_30 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 36:52]
        node _T_31 = tail(_T_30, 1) @[DataMemory.scala 36:52]
        node _T_32 = bits(_T_31, 8, 0)
        infer mport _T_33 = data_mem[_T_32], clock
        node _T_34 = bits(io.op.op2, 15, 8) @[DataMemory.scala 36:71]
        _T_33 <= _T_34 @[DataMemory.scala 36:59]
        node _T_36 = add(io.op.op1, UInt<2>("h02")) @[DataMemory.scala 37:52]
        node _T_37 = tail(_T_36, 1) @[DataMemory.scala 37:52]
        node _T_38 = bits(_T_37, 8, 0)
        infer mport _T_39 = data_mem[_T_38], clock
        node _T_40 = bits(io.op.op2, 23, 16) @[DataMemory.scala 37:71]
        _T_39 <= _T_40 @[DataMemory.scala 37:59]
        node _T_42 = add(io.op.op1, UInt<2>("h03")) @[DataMemory.scala 38:52]
        node _T_43 = tail(_T_42, 1) @[DataMemory.scala 38:52]
        node _T_44 = bits(_T_43, 8, 0)
        infer mport _T_45 = data_mem[_T_44], clock
        node _T_46 = bits(io.op.op2, 31, 24) @[DataMemory.scala 38:71]
        _T_45 <= _T_46 @[DataMemory.scala 38:59]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 27:29]
    when io.mem.read : @[DataMemory.scala 42:28]
      node _T_47 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_47 : @[Conditional.scala 29:59]
        node _T_48 = bits(io.op.op1, 8, 0)
        infer mport _T_49 = data_mem[_T_48], clock
        io.res <= _T_49 @[DataMemory.scala 45:40]
        skip @[Conditional.scala 29:59]
      node _T_50 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_50 : @[Conditional.scala 29:59]
        node _T_52 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 47:66]
        node _T_53 = tail(_T_52, 1) @[DataMemory.scala 47:66]
        node _T_54 = bits(_T_53, 8, 0)
        infer mport _T_55 = data_mem[_T_54], clock
        node _T_56 = bits(io.op.op1, 8, 0)
        infer mport _T_57 = data_mem[_T_56], clock
        node _T_58 = cat(_T_55, _T_57) @[Cat.scala 30:58]
        io.res <= _T_58 @[DataMemory.scala 47:40]
        skip @[Conditional.scala 29:59]
      node _T_59 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_59 : @[Conditional.scala 29:59]
        node _T_61 = add(io.op.op1, UInt<2>("h03")) @[DataMemory.scala 50:66]
        node _T_62 = tail(_T_61, 1) @[DataMemory.scala 50:66]
        node _T_63 = bits(_T_62, 8, 0)
        infer mport _T_64 = data_mem[_T_63], clock
        node _T_66 = add(io.op.op1, UInt<2>("h02")) @[DataMemory.scala 51:74]
        node _T_67 = tail(_T_66, 1) @[DataMemory.scala 51:74]
        node _T_68 = bits(_T_67, 8, 0)
        infer mport _T_69 = data_mem[_T_68], clock
        node _T_71 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 52:78]
        node _T_72 = tail(_T_71, 1) @[DataMemory.scala 52:78]
        node _T_73 = bits(_T_72, 8, 0)
        infer mport _T_74 = data_mem[_T_73], clock
        node _T_75 = bits(io.op.op1, 8, 0)
        infer mport _T_76 = data_mem[_T_75], clock
        node _T_77 = cat(_T_74, _T_76) @[Cat.scala 30:58]
        node _T_78 = cat(_T_64, _T_69) @[Cat.scala 30:58]
        node _T_79 = cat(_T_78, _T_77) @[Cat.scala 30:58]
        io.res <= _T_79 @[DataMemory.scala 50:40]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 42:28]
    node _T_81 = eq(io.mem.read, UInt<1>("h00")) @[DataMemory.scala 42:28]
    when _T_81 : @[DataMemory.scala 56:22]
      io.res <= UInt<1>("h00") @[DataMemory.scala 56:31]
      skip @[DataMemory.scala 56:22]
    
  module ForwardingUnit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip reg_w_mem : UInt<1>, flip reg_w_wb : UInt<1>, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd_mem : UInt<5>, flip rd_wb : UInt<5>, fwd_rs1 : UInt<2>, fwd_rs2 : UInt<2>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_10 = neq(io.rd_mem, UInt<1>("h00")) @[ForwardingUnit.scala 26:42]
    node _T_11 = and(io.reg_w_mem, _T_10) @[ForwardingUnit.scala 26:28]
    node _T_12 = eq(io.rd_mem, io.rs.rs1) @[ForwardingUnit.scala 26:66]
    node _T_13 = and(_T_11, _T_12) @[ForwardingUnit.scala 26:52]
    when _T_13 : @[ForwardingUnit.scala 26:82]
      io.fwd_rs1 <= UInt<2>("h02") @[ForwardingUnit.scala 27:28]
      skip @[ForwardingUnit.scala 26:82]
    node _T_14 = neq(io.rd_wb, UInt<1>("h00")) @[ForwardingUnit.scala 28:47]
    node _T_15 = and(io.reg_w_wb, _T_14) @[ForwardingUnit.scala 28:34]
    node _T_16 = eq(io.rd_wb, io.rs.rs1) @[ForwardingUnit.scala 28:70]
    node _T_17 = and(_T_15, _T_16) @[ForwardingUnit.scala 28:57]
    node _T_19 = eq(_T_13, UInt<1>("h00")) @[ForwardingUnit.scala 26:82]
    node _T_20 = and(_T_19, _T_17) @[ForwardingUnit.scala 28:86]
    when _T_20 : @[ForwardingUnit.scala 28:86]
      io.fwd_rs1 <= UInt<1>("h01") @[ForwardingUnit.scala 29:28]
      skip @[ForwardingUnit.scala 28:86]
    node _T_22 = eq(_T_13, UInt<1>("h00")) @[ForwardingUnit.scala 26:82]
    node _T_24 = eq(_T_17, UInt<1>("h00")) @[ForwardingUnit.scala 28:86]
    node _T_25 = and(_T_22, _T_24) @[ForwardingUnit.scala 28:86]
    when _T_25 : @[ForwardingUnit.scala 30:22]
      io.fwd_rs1 <= UInt<1>("h00") @[ForwardingUnit.scala 31:28]
      skip @[ForwardingUnit.scala 30:22]
    node _T_26 = neq(io.rd_mem, UInt<1>("h00")) @[ForwardingUnit.scala 34:42]
    node _T_27 = and(io.reg_w_mem, _T_26) @[ForwardingUnit.scala 34:28]
    node _T_28 = eq(io.rd_mem, io.rs.rs2) @[ForwardingUnit.scala 34:66]
    node _T_29 = and(_T_27, _T_28) @[ForwardingUnit.scala 34:52]
    when _T_29 : @[ForwardingUnit.scala 34:82]
      io.fwd_rs2 <= UInt<2>("h02") @[ForwardingUnit.scala 35:28]
      skip @[ForwardingUnit.scala 34:82]
    node _T_30 = neq(io.rd_wb, UInt<1>("h00")) @[ForwardingUnit.scala 36:47]
    node _T_31 = and(io.reg_w_wb, _T_30) @[ForwardingUnit.scala 36:34]
    node _T_32 = eq(io.rd_wb, io.rs.rs2) @[ForwardingUnit.scala 36:70]
    node _T_33 = and(_T_31, _T_32) @[ForwardingUnit.scala 36:57]
    node _T_35 = eq(_T_29, UInt<1>("h00")) @[ForwardingUnit.scala 34:82]
    node _T_36 = and(_T_35, _T_33) @[ForwardingUnit.scala 36:86]
    when _T_36 : @[ForwardingUnit.scala 36:86]
      io.fwd_rs2 <= UInt<1>("h01") @[ForwardingUnit.scala 37:28]
      skip @[ForwardingUnit.scala 36:86]
    node _T_38 = eq(_T_29, UInt<1>("h00")) @[ForwardingUnit.scala 34:82]
    node _T_40 = eq(_T_33, UInt<1>("h00")) @[ForwardingUnit.scala 36:86]
    node _T_41 = and(_T_38, _T_40) @[ForwardingUnit.scala 36:86]
    when _T_41 : @[ForwardingUnit.scala 38:22]
      io.fwd_rs2 <= UInt<1>("h00") @[ForwardingUnit.scala 39:28]
      skip @[ForwardingUnit.scala 38:22]
    
  module DetectHazardUnit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip rs2_ex : UInt<5>, flip mem_r : UInt<1>, stall : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_7 = eq(io.rs2_ex, io.rs1_id) @[DetectHazardUnit.scala 24:45]
    node _T_8 = eq(io.rs2_ex, io.rs2_id) @[DetectHazardUnit.scala 24:74]
    node _T_9 = or(_T_7, _T_8) @[DetectHazardUnit.scala 24:60]
    node _T_10 = and(io.mem_r, _T_9) @[DetectHazardUnit.scala 24:30]
    io.stall <= _T_10 @[DetectHazardUnit.scala 24:18]
    
  module Tx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, txd : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg data : UInt<9>, clock with : (reset => (reset, UInt<9>("h01ff"))) @[UART.scala 92:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 93:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 94:28]
    node _T_15 = eq(state, UInt<4>("h00")) @[UART.scala 96:27]
    io.enq.ready <= _T_15 @[UART.scala 96:18]
    node _T_16 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_16 : @[Conditional.scala 29:59]
      when io.enq.valid : @[UART.scala 100:33]
        node _T_18 = cat(io.enq.bits, UInt<1>("h00")) @[Cat.scala 30:58]
        data <= _T_18 @[UART.scala 101:23]
        ticks <= UInt<1>("h00") @[UART.scala 102:23]
        state <= UInt<4>("h0b") @[UART.scala 103:23]
        skip @[UART.scala 100:33]
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
    node _T_29 = eq(UInt<4>("h0b"), state) @[Conditional.scala 29:28]
    node _T_30 = or(_T_19, _T_20) @[Conditional.scala 29:53]
    node _T_31 = or(_T_30, _T_21) @[Conditional.scala 29:53]
    node _T_32 = or(_T_31, _T_22) @[Conditional.scala 29:53]
    node _T_33 = or(_T_32, _T_23) @[Conditional.scala 29:53]
    node _T_34 = or(_T_33, _T_24) @[Conditional.scala 29:53]
    node _T_35 = or(_T_34, _T_25) @[Conditional.scala 29:53]
    node _T_36 = or(_T_35, _T_26) @[Conditional.scala 29:53]
    node _T_37 = or(_T_36, _T_27) @[Conditional.scala 29:53]
    node _T_38 = or(_T_37, _T_28) @[Conditional.scala 29:53]
    node _T_39 = or(_T_38, _T_29) @[Conditional.scala 29:53]
    when _T_39 : @[Conditional.scala 29:59]
      node _T_40 = eq(ticks, UInt<9>("h01b2")) @[UART.scala 108:25]
      when _T_40 : @[UART.scala 108:39]
        node _T_42 = shr(data, 1) @[UART.scala 109:43]
        node _T_43 = cat(UInt<1>("h01"), _T_42) @[Cat.scala 30:58]
        data <= _T_43 @[UART.scala 109:23]
        ticks <= UInt<1>("h00") @[UART.scala 110:23]
        node _T_45 = sub(state, UInt<1>("h01")) @[UART.scala 111:32]
        node _T_46 = asUInt(_T_45) @[UART.scala 111:32]
        node _T_47 = tail(_T_46, 1) @[UART.scala 111:32]
        state <= _T_47 @[UART.scala 111:23]
        skip @[UART.scala 108:39]
      node _T_49 = eq(_T_40, UInt<1>("h00")) @[UART.scala 108:39]
      when _T_49 : @[UART.scala 112:26]
        node _T_51 = add(ticks, UInt<1>("h01")) @[UART.scala 113:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 113:32]
        ticks <= _T_52 @[UART.scala 113:23]
        skip @[UART.scala 112:26]
      skip @[Conditional.scala 29:59]
    node _T_53 = bits(data, 0, 0) @[UART.scala 117:19]
    io.txd <= _T_53 @[UART.scala 117:12]
    
  module UART : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, valid : UInt<1>, txd : UInt<1>, r0 : UInt<8>, r1 : UInt<8>, r2 : UInt<8>, r3 : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst tx of Tx @[UART.scala 42:20]
    tx.io is invalid
    tx.clock <= clock
    tx.reset <= reset
    wire _T_15 : UInt<8>[4] @[UART.scala 45:26]
    _T_15 is invalid @[UART.scala 45:26]
    _T_15[0] <= UInt<8>("h00") @[UART.scala 45:26]
    _T_15[1] <= UInt<8>("h00") @[UART.scala 45:26]
    _T_15[2] <= UInt<8>("h00") @[UART.scala 45:26]
    _T_15[3] <= UInt<8>("h00") @[UART.scala 45:26]
    reg q : UInt<8>[4], clock with : (reset => (reset, _T_15)) @[UART.scala 45:22]
    reg ptr : UInt<2>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 46:22]
    reg cnt : UInt<2>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 47:22]
    node _T_53 = add(ptr, cnt) @[UART.scala 48:38]
    node _T_54 = tail(_T_53, 1) @[UART.scala 48:38]
    reg i : UInt<4>, clock with : (reset => (reset, _T_54)) @[UART.scala 48:22]
    node _T_55 = add(ptr, cnt) @[UART.scala 50:14]
    node _T_56 = tail(_T_55, 1) @[UART.scala 50:14]
    i <= _T_56 @[UART.scala 50:7]
    io.r0 <= q[UInt<1>("h00")] @[UART.scala 52:11]
    io.r1 <= q[UInt<1>("h01")] @[UART.scala 53:11]
    io.r2 <= q[UInt<2>("h02")] @[UART.scala 54:11]
    io.r3 <= q[UInt<2>("h03")] @[UART.scala 55:11]
    node _T_74 = neq(io.in, UInt<1>("h00")) @[UART.scala 57:17]
    node _T_76 = neq(cnt, UInt<3>("h04")) @[UART.scala 57:32]
    node _T_77 = and(_T_74, _T_76) @[UART.scala 57:25]
    when _T_77 : @[UART.scala 57:41]
      node _T_81 = bits(i, 1, 0)
      q[_T_81] <= io.in @[UART.scala 58:14]
      node _T_83 = add(cnt, UInt<1>("h01")) @[UART.scala 59:21]
      node _T_84 = tail(_T_83, 1) @[UART.scala 59:21]
      cnt <= _T_84 @[UART.scala 59:14]
      skip @[UART.scala 57:41]
    node _T_86 = neq(cnt, UInt<1>("h00")) @[UART.scala 62:34]
    node _T_87 = and(tx.io.enq.ready, _T_86) @[UART.scala 62:27]
    when _T_87 : @[UART.scala 62:43]
      tx.io.enq.bits <= q[ptr] @[UART.scala 63:24]
      node _T_92 = sub(cnt, UInt<1>("h01")) @[UART.scala 64:20]
      node _T_93 = asUInt(_T_92) @[UART.scala 64:20]
      node _T_94 = tail(_T_93, 1) @[UART.scala 64:20]
      cnt <= _T_94 @[UART.scala 64:13]
      node _T_96 = add(ptr, UInt<1>("h01")) @[UART.scala 66:20]
      node _T_97 = tail(_T_96, 1) @[UART.scala 66:20]
      ptr <= _T_97 @[UART.scala 66:13]
      skip @[UART.scala 62:43]
    node _T_99 = neq(cnt, UInt<1>("h00")) @[UART.scala 69:28]
    tx.io.enq.valid <= _T_99 @[UART.scala 69:21]
    node _T_101 = neq(io.in, UInt<1>("h00")) @[UART.scala 72:18]
    node _T_103 = neq(cnt, UInt<1>("h00")) @[UART.scala 72:33]
    node _T_104 = or(_T_101, _T_103) @[UART.scala 72:26]
    node _T_105 = and(_T_104, tx.io.enq.ready) @[UART.scala 72:42]
    when _T_105 : @[UART.scala 72:62]
      io.valid <= UInt<1>("h00") @[UART.scala 73:18]
      skip @[UART.scala 72:62]
    node _T_107 = eq(_T_105, UInt<1>("h00")) @[UART.scala 72:62]
    when _T_107 : @[UART.scala 74:18]
      io.valid <= tx.io.enq.ready @[UART.scala 75:18]
      skip @[UART.scala 74:18]
    io.txd <= tx.io.txd @[UART.scala 78:13]
    
  module PipelineIF_ID : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {flip pc_next : UInt<32>, flip inst : UInt<32>}, flip out : {flip pc_next : UInt<32>, flip inst : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_12 : {flip pc_next : UInt<32>, flip inst : UInt<32>}, clock @[Pipeline.scala 20:34]
    _T_12.inst <= io.in.inst @[Pipeline.scala 20:34]
    _T_12.pc_next <= io.in.pc_next @[Pipeline.scala 20:34]
    io.out.inst <= _T_12.inst @[Pipeline.scala 20:24]
    io.out.pc_next <= _T_12.pc_next @[Pipeline.scala 20:24]
    
  module PipelineID_EX : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}, flip out : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_76 : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, flip dst_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}, clock @[Pipeline.scala 29:34]
    _T_76.pc_next <= io.in.pc_next @[Pipeline.scala 29:34]
    _T_76.imm <= io.in.imm @[Pipeline.scala 29:34]
    _T_76.rd <= io.in.rd @[Pipeline.scala 29:34]
    _T_76.rs.rs2 <= io.in.rs.rs2 @[Pipeline.scala 29:34]
    _T_76.rs.rs1 <= io.in.rs.rs1 @[Pipeline.scala 29:34]
    _T_76.op.op2 <= io.in.op.op2 @[Pipeline.scala 29:34]
    _T_76.op.op1 <= io.in.op.op1 @[Pipeline.scala 29:34]
    _T_76.EX.alu_op.alt <= io.in.EX.alu_op.alt @[Pipeline.scala 29:34]
    _T_76.EX.alu_op.func <= io.in.EX.alu_op.func @[Pipeline.scala 29:34]
    _T_76.EX.dst_sel <= io.in.EX.dst_sel @[Pipeline.scala 29:34]
    _T_76.EX.alu_sel <= io.in.EX.alu_sel @[Pipeline.scala 29:34]
    _T_76.EX.opcode <= io.in.EX.opcode @[Pipeline.scala 29:34]
    _T_76.MEM.func <= io.in.MEM.func @[Pipeline.scala 29:34]
    _T_76.MEM.read <= io.in.MEM.read @[Pipeline.scala 29:34]
    _T_76.MEM.write <= io.in.MEM.write @[Pipeline.scala 29:34]
    _T_76.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 29:34]
    _T_76.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 29:34]
    _T_76.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 29:34]
    io.out.pc_next <= _T_76.pc_next @[Pipeline.scala 29:24]
    io.out.imm <= _T_76.imm @[Pipeline.scala 29:24]
    io.out.rd <= _T_76.rd @[Pipeline.scala 29:24]
    io.out.rs.rs2 <= _T_76.rs.rs2 @[Pipeline.scala 29:24]
    io.out.rs.rs1 <= _T_76.rs.rs1 @[Pipeline.scala 29:24]
    io.out.op.op2 <= _T_76.op.op2 @[Pipeline.scala 29:24]
    io.out.op.op1 <= _T_76.op.op1 @[Pipeline.scala 29:24]
    io.out.EX.alu_op.alt <= _T_76.EX.alu_op.alt @[Pipeline.scala 29:24]
    io.out.EX.alu_op.func <= _T_76.EX.alu_op.func @[Pipeline.scala 29:24]
    io.out.EX.dst_sel <= _T_76.EX.dst_sel @[Pipeline.scala 29:24]
    io.out.EX.alu_sel <= _T_76.EX.alu_sel @[Pipeline.scala 29:24]
    io.out.EX.opcode <= _T_76.EX.opcode @[Pipeline.scala 29:24]
    io.out.MEM.func <= _T_76.MEM.func @[Pipeline.scala 29:24]
    io.out.MEM.read <= _T_76.MEM.read @[Pipeline.scala 29:24]
    io.out.MEM.write <= _T_76.MEM.write @[Pipeline.scala 29:24]
    io.out.MEM.branch <= _T_76.MEM.branch @[Pipeline.scala 29:24]
    io.out.WB.rd_mem <= _T_76.WB.rd_mem @[Pipeline.scala 29:24]
    io.out.WB.reg_w <= _T_76.WB.reg_w @[Pipeline.scala 29:24]
    
  module PipelineEX_MEM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>}, flip out : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_48 : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>}, clock @[Pipeline.scala 38:34]
    _T_48.pc_next <= io.in.pc_next @[Pipeline.scala 38:34]
    _T_48.rd <= io.in.rd @[Pipeline.scala 38:34]
    _T_48.op.op2 <= io.in.op.op2 @[Pipeline.scala 38:34]
    _T_48.op.op1 <= io.in.op.op1 @[Pipeline.scala 38:34]
    _T_48.MEM.func <= io.in.MEM.func @[Pipeline.scala 38:34]
    _T_48.MEM.read <= io.in.MEM.read @[Pipeline.scala 38:34]
    _T_48.MEM.write <= io.in.MEM.write @[Pipeline.scala 38:34]
    _T_48.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 38:34]
    _T_48.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 38:34]
    _T_48.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 38:34]
    _T_48.zero <= io.in.zero @[Pipeline.scala 38:34]
    io.out.pc_next <= _T_48.pc_next @[Pipeline.scala 38:24]
    io.out.rd <= _T_48.rd @[Pipeline.scala 38:24]
    io.out.op.op2 <= _T_48.op.op2 @[Pipeline.scala 38:24]
    io.out.op.op1 <= _T_48.op.op1 @[Pipeline.scala 38:24]
    io.out.MEM.func <= _T_48.MEM.func @[Pipeline.scala 38:24]
    io.out.MEM.read <= _T_48.MEM.read @[Pipeline.scala 38:24]
    io.out.MEM.write <= _T_48.MEM.write @[Pipeline.scala 38:24]
    io.out.MEM.branch <= _T_48.MEM.branch @[Pipeline.scala 38:24]
    io.out.WB.rd_mem <= _T_48.WB.rd_mem @[Pipeline.scala 38:24]
    io.out.WB.reg_w <= _T_48.WB.reg_w @[Pipeline.scala 38:24]
    io.out.zero <= _T_48.zero @[Pipeline.scala 38:24]
    
  module PipelineMEM_WB : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}, flip out : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_24 : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}, clock @[Pipeline.scala 47:34]
    _T_24.rd <= io.in.rd @[Pipeline.scala 47:34]
    _T_24.mem_res <= io.in.mem_res @[Pipeline.scala 47:34]
    _T_24.alu_res <= io.in.alu_res @[Pipeline.scala 47:34]
    _T_24.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 47:34]
    _T_24.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 47:34]
    io.out.rd <= _T_24.rd @[Pipeline.scala 47:24]
    io.out.mem_res <= _T_24.mem_res @[Pipeline.scala 47:24]
    io.out.alu_res <= _T_24.alu_res @[Pipeline.scala 47:24]
    io.out.WB.rd_mem <= _T_24.WB.rd_mem @[Pipeline.scala 47:24]
    io.out.WB.reg_w <= _T_24.WB.reg_w @[Pipeline.scala 47:24]
    
  module CPU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {txd : UInt<1>, r0 : UInt<8>, r1 : UInt<8>, r2 : UInt<8>, r3 : UInt<8>, inst : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst instMem of InstructionMemory @[CPU.scala 59:29]
    instMem.io is invalid
    instMem.clock <= clock
    instMem.reset <= reset
    inst counter of ProgramCounter @[CPU.scala 60:29]
    counter.io is invalid
    counter.clock <= clock
    counter.reset <= reset
    inst decoder of Decoder @[CPU.scala 61:29]
    decoder.io is invalid
    decoder.clock <= clock
    decoder.reset <= reset
    inst control of Control @[CPU.scala 62:29]
    control.io is invalid
    control.clock <= clock
    control.reset <= reset
    inst regs of Registers @[CPU.scala 63:29]
    regs.io is invalid
    regs.clock <= clock
    regs.reset <= reset
    inst alu of ALU @[CPU.scala 64:29]
    alu.io is invalid
    alu.clock <= clock
    alu.reset <= reset
    inst dataMem of DataMemory @[CPU.scala 65:29]
    dataMem.io is invalid
    dataMem.clock <= clock
    dataMem.reset <= reset
    inst fwdUnit of ForwardingUnit @[CPU.scala 66:29]
    fwdUnit.io is invalid
    fwdUnit.clock <= clock
    fwdUnit.reset <= reset
    inst hazardUnit of DetectHazardUnit @[CPU.scala 67:29]
    hazardUnit.io is invalid
    hazardUnit.clock <= clock
    hazardUnit.reset <= reset
    inst uart of UART @[CPU.scala 68:29]
    uart.io is invalid
    uart.clock <= clock
    uart.reset <= reset
    inst IF_ID of PipelineIF_ID @[CPU.scala 72:29]
    IF_ID.io is invalid
    IF_ID.clock <= clock
    IF_ID.reset <= reset
    inst ID_EX of PipelineID_EX @[CPU.scala 73:29]
    ID_EX.io is invalid
    ID_EX.clock <= clock
    ID_EX.reset <= reset
    inst EX_MEM of PipelineEX_MEM @[CPU.scala 74:29]
    EX_MEM.io is invalid
    EX_MEM.clock <= clock
    EX_MEM.reset <= reset
    inst MEM_WB of PipelineMEM_WB @[CPU.scala 75:29]
    MEM_WB.io is invalid
    MEM_WB.clock <= clock
    MEM_WB.reset <= reset
    node _T_51 = eq(regs.io.op.op1, regs.io.op.op2) @[CPU.scala 80:74]
    node _T_52 = and(control.io.MEM.branch, _T_51) @[CPU.scala 80:55]
    node _T_54 = eq(uart.io.valid, UInt<1>("h00")) @[CPU.scala 80:98]
    node _T_55 = or(_T_52, _T_54) @[CPU.scala 80:95]
    counter.io.branch <= _T_55 @[CPU.scala 80:29]
    node _T_56 = add(IF_ID.io.out.pc_next, decoder.io.imm) @[CPU.scala 81:72]
    node _T_57 = tail(_T_56, 1) @[CPU.scala 81:72]
    node _T_59 = sub(EX_MEM.io.out.pc_next, UInt<1>("h01")) @[CPU.scala 81:112]
    node _T_60 = asUInt(_T_59) @[CPU.scala 81:112]
    node _T_61 = tail(_T_60, 1) @[CPU.scala 81:112]
    node _T_62 = mux(uart.io.valid, _T_57, _T_61) @[CPU.scala 81:35]
    counter.io.pc_src <= _T_62 @[CPU.scala 81:29]
    instMem.io.pc <= counter.io.pc @[CPU.scala 82:29]
    IF_ID.io.in.pc_next <= counter.io.pc_next @[CPU.scala 84:29]
    IF_ID.io.in.inst <= instMem.io.inst @[CPU.scala 85:29]
    decoder.io.inst <= IF_ID.io.out.inst @[CPU.scala 89:29]
    regs.io.rs.rs2 <= decoder.io.rs.rs2 @[CPU.scala 90:29]
    regs.io.rs.rs1 <= decoder.io.rs.rs1 @[CPU.scala 90:29]
    node _T_63 = mux(uart.io.valid, decoder.io.ctrl.opcode, UInt<1>("h00")) @[CPU.scala 95:35]
    control.io.ctrl.opcode <= _T_63 @[CPU.scala 95:29]
    node _T_64 = mux(uart.io.valid, decoder.io.ctrl.funct3, UInt<1>("h00")) @[CPU.scala 96:35]
    control.io.ctrl.funct3 <= _T_64 @[CPU.scala 96:29]
    node _T_65 = mux(uart.io.valid, decoder.io.ctrl.funct7, UInt<1>("h00")) @[CPU.scala 97:35]
    control.io.ctrl.funct7 <= _T_65 @[CPU.scala 97:29]
    ID_EX.io.in.WB.rd_mem <= control.io.WB.rd_mem @[CPU.scala 99:29]
    ID_EX.io.in.WB.reg_w <= control.io.WB.reg_w @[CPU.scala 99:29]
    ID_EX.io.in.MEM.func <= control.io.MEM.func @[CPU.scala 100:29]
    ID_EX.io.in.MEM.read <= control.io.MEM.read @[CPU.scala 100:29]
    ID_EX.io.in.MEM.write <= control.io.MEM.write @[CPU.scala 100:29]
    ID_EX.io.in.MEM.branch <= control.io.MEM.branch @[CPU.scala 100:29]
    ID_EX.io.in.EX.alu_op.alt <= control.io.EX.alu_op.alt @[CPU.scala 101:29]
    ID_EX.io.in.EX.alu_op.func <= control.io.EX.alu_op.func @[CPU.scala 101:29]
    ID_EX.io.in.EX.dst_sel <= control.io.EX.dst_sel @[CPU.scala 101:29]
    ID_EX.io.in.EX.alu_sel <= control.io.EX.alu_sel @[CPU.scala 101:29]
    ID_EX.io.in.EX.opcode <= control.io.EX.opcode @[CPU.scala 101:29]
    ID_EX.io.in.pc_next <= IF_ID.io.out.pc_next @[CPU.scala 102:29]
    ID_EX.io.in.op.op2 <= regs.io.op.op2 @[CPU.scala 103:29]
    ID_EX.io.in.op.op1 <= regs.io.op.op1 @[CPU.scala 103:29]
    ID_EX.io.in.imm <= decoder.io.imm @[CPU.scala 104:29]
    ID_EX.io.in.rs.rs2 <= decoder.io.rs.rs2 @[CPU.scala 105:29]
    ID_EX.io.in.rs.rs1 <= decoder.io.rs.rs1 @[CPU.scala 105:29]
    ID_EX.io.in.rd <= decoder.io.rd @[CPU.scala 106:29]
    fwdUnit.io.rs.rs2 <= ID_EX.io.out.rs.rs2 @[CPU.scala 110:29]
    fwdUnit.io.rs.rs1 <= ID_EX.io.out.rs.rs1 @[CPU.scala 110:29]
    fwdUnit.io.rd_mem <= EX_MEM.io.out.rd @[CPU.scala 111:29]
    fwdUnit.io.rd_wb <= MEM_WB.io.out.rd @[CPU.scala 112:29]
    fwdUnit.io.reg_w_mem <= EX_MEM.io.out.WB.reg_w @[CPU.scala 113:29]
    fwdUnit.io.reg_w_wb <= MEM_WB.io.out.WB.reg_w @[CPU.scala 114:29]
    alu.io.opcode <= ID_EX.io.out.EX.opcode @[CPU.scala 116:29]
    alu.io.alu_op.alt <= ID_EX.io.out.EX.alu_op.alt @[CPU.scala 117:29]
    alu.io.alu_op.func <= ID_EX.io.out.EX.alu_op.func @[CPU.scala 117:29]
    node _T_66 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_67 = mux(_T_66, ID_EX.io.out.op.op1, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_68 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_69 = mux(_T_68, regs.io.res, _T_67) @[Mux.scala 46:16]
    node _T_70 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_71 = mux(_T_70, EX_MEM.io.out.op.op1, _T_69) @[Mux.scala 46:16]
    alu.io.op.op1 <= _T_71 @[CPU.scala 119:19]
    node _T_72 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, EX_MEM.io.out.op.op1) @[CPU.scala 125:23]
    node _T_73 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, regs.io.res) @[CPU.scala 126:23]
    node _T_74 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, ID_EX.io.out.op.op2) @[CPU.scala 127:23]
    node _T_75 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_76 = mux(_T_75, _T_74, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_77 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_78 = mux(_T_77, _T_73, _T_76) @[Mux.scala 46:16]
    node _T_79 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_80 = mux(_T_79, _T_72, _T_78) @[Mux.scala 46:16]
    alu.io.op.op2 <= _T_80 @[CPU.scala 124:19]
    EX_MEM.io.in.pc_next <= ID_EX.io.out.pc_next @[CPU.scala 129:29]
    EX_MEM.io.in.WB.rd_mem <= ID_EX.io.out.WB.rd_mem @[CPU.scala 131:29]
    EX_MEM.io.in.WB.reg_w <= ID_EX.io.out.WB.reg_w @[CPU.scala 131:29]
    EX_MEM.io.in.MEM.func <= ID_EX.io.out.MEM.func @[CPU.scala 132:29]
    EX_MEM.io.in.MEM.read <= ID_EX.io.out.MEM.read @[CPU.scala 132:29]
    EX_MEM.io.in.MEM.write <= ID_EX.io.out.MEM.write @[CPU.scala 132:29]
    EX_MEM.io.in.MEM.branch <= ID_EX.io.out.MEM.branch @[CPU.scala 132:29]
    EX_MEM.io.in.op.op2 <= ID_EX.io.out.op.op2 @[CPU.scala 133:29]
    EX_MEM.io.in.zero <= alu.io.zero @[CPU.scala 135:29]
    EX_MEM.io.in.op.op1 <= alu.io.res @[CPU.scala 136:29]
    node _T_81 = mux(ID_EX.io.out.EX.dst_sel, ID_EX.io.out.rd, ID_EX.io.out.rs.rs2) @[CPU.scala 138:35]
    EX_MEM.io.in.rd <= _T_81 @[CPU.scala 138:29]
    dataMem.io.mem.func <= EX_MEM.io.out.MEM.func @[CPU.scala 142:29]
    dataMem.io.mem.read <= EX_MEM.io.out.MEM.read @[CPU.scala 142:29]
    dataMem.io.mem.write <= EX_MEM.io.out.MEM.write @[CPU.scala 142:29]
    dataMem.io.mem.branch <= EX_MEM.io.out.MEM.branch @[CPU.scala 142:29]
    dataMem.io.op.op2 <= EX_MEM.io.out.op.op2 @[CPU.scala 143:29]
    dataMem.io.op.op1 <= EX_MEM.io.out.op.op1 @[CPU.scala 143:29]
    MEM_WB.io.in.WB.rd_mem <= EX_MEM.io.out.WB.rd_mem @[CPU.scala 145:29]
    MEM_WB.io.in.WB.reg_w <= EX_MEM.io.out.WB.reg_w @[CPU.scala 145:29]
    MEM_WB.io.in.rd <= EX_MEM.io.out.rd @[CPU.scala 146:29]
    MEM_WB.io.in.mem_res <= dataMem.io.res @[CPU.scala 147:29]
    MEM_WB.io.in.alu_res <= EX_MEM.io.out.op.op1 @[CPU.scala 148:29]
    regs.io.rd <= MEM_WB.io.out.rd @[CPU.scala 152:29]
    regs.io.reg_w <= MEM_WB.io.out.WB.reg_w @[CPU.scala 153:29]
    node _T_82 = mux(MEM_WB.io.out.WB.rd_mem, MEM_WB.io.out.mem_res, MEM_WB.io.out.alu_res) @[CPU.scala 154:35]
    regs.io.res <= _T_82 @[CPU.scala 154:29]
    node _T_84 = eq(dataMem.io.op.op1, UInt<11>("h0401")) @[CPU.scala 158:56]
    node _T_85 = and(EX_MEM.io.out.MEM.write, _T_84) @[CPU.scala 158:35]
    when _T_85 : @[CPU.scala 158:68]
      uart.io.in <= dataMem.io.op.op2 @[CPU.scala 159:20]
      skip @[CPU.scala 158:68]
    node _T_87 = eq(_T_85, UInt<1>("h00")) @[CPU.scala 158:68]
    when _T_87 : @[CPU.scala 160:18]
      uart.io.in <= UInt<1>("h00") @[CPU.scala 161:20]
      skip @[CPU.scala 160:18]
    io.txd <= uart.io.txd @[CPU.scala 164:12]
    io.r0 <= uart.io.r0 @[CPU.scala 168:11]
    io.r1 <= uart.io.r1 @[CPU.scala 169:11]
    io.r2 <= uart.io.r2 @[CPU.scala 170:11]
    io.r3 <= uart.io.r3 @[CPU.scala 171:11]
    io.inst <= instMem.io.inst @[CPU.scala 173:13]
    
