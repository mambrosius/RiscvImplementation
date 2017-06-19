;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.7, sbtVersion: 0.13.12, builtAtString: 2017-05-25 17:44:19.669, builtAtMillis: 1495734259669
circuit CPU : 
  module InstructionMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, inst : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem rom : UInt<8>[256] @[Program.scala 29:38]
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
    _T_112 <= UInt<8>("h0c0") @[Program.scala 35:57]
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
    _T_229 <= UInt<8>("h09c") @[Program.scala 35:57]
    infer mport _T_232 = rom[UInt<7>("h045")], clock
    _T_232 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_235 = rom[UInt<7>("h046")], clock
    _T_235 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_238 = rom[UInt<7>("h047")], clock
    _T_238 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_242 = rom[UInt<7>("h048")], clock
    _T_242 <= UInt<8>("h09c") @[Program.scala 35:57]
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
    _T_284 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_287 = rom[UInt<7>("h056")], clock
    _T_287 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_290 = rom[UInt<7>("h057")], clock
    _T_290 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_294 = rom[UInt<7>("h058")], clock
    _T_294 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_297 = rom[UInt<7>("h059")], clock
    _T_297 <= UInt<8>("h04") @[Program.scala 36:57]
    infer mport _T_300 = rom[UInt<7>("h05a")], clock
    _T_300 <= UInt<8>("h0d0") @[Program.scala 37:57]
    infer mport _T_303 = rom[UInt<7>("h05b")], clock
    _T_303 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_307 = rom[UInt<7>("h05c")], clock
    _T_307 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_310 = rom[UInt<7>("h05d")], clock
    _T_310 <= UInt<8>("h04") @[Program.scala 36:57]
    infer mport _T_313 = rom[UInt<7>("h05e")], clock
    _T_313 <= UInt<8>("h0f0") @[Program.scala 37:57]
    infer mport _T_316 = rom[UInt<7>("h05f")], clock
    _T_316 <= UInt<8>("h01e") @[Program.scala 38:57]
    infer mport _T_320 = rom[UInt<7>("h060")], clock
    _T_320 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_323 = rom[UInt<7>("h061")], clock
    _T_323 <= UInt<8>("h09") @[Program.scala 36:57]
    infer mport _T_326 = rom[UInt<7>("h062")], clock
    _T_326 <= UInt<8>("h0f0") @[Program.scala 37:57]
    infer mport _T_329 = rom[UInt<7>("h063")], clock
    _T_329 <= UInt<8>("h01f") @[Program.scala 38:57]
    infer mport _T_333 = rom[UInt<7>("h064")], clock
    _T_333 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_336 = rom[UInt<7>("h065")], clock
    _T_336 <= UInt<8>("h09") @[Program.scala 36:57]
    infer mport _T_339 = rom[UInt<7>("h066")], clock
    _T_339 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_342 = rom[UInt<7>("h067")], clock
    _T_342 <= UInt<8>("h020") @[Program.scala 38:57]
    infer mport _T_346 = rom[UInt<7>("h068")], clock
    _T_346 <= UInt<8>("h083") @[Program.scala 35:57]
    infer mport _T_349 = rom[UInt<7>("h069")], clock
    _T_349 <= UInt<8>("h02") @[Program.scala 36:57]
    infer mport _T_352 = rom[UInt<7>("h06a")], clock
    _T_352 <= UInt<8>("h09") @[Program.scala 37:57]
    infer mport _T_355 = rom[UInt<7>("h06b")], clock
    _T_355 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_359 = rom[UInt<7>("h06c")], clock
    _T_359 <= UInt<8>("h03") @[Program.scala 35:57]
    infer mport _T_362 = rom[UInt<7>("h06d")], clock
    _T_362 <= UInt<8>("h083") @[Program.scala 36:57]
    infer mport _T_365 = rom[UInt<7>("h06e")], clock
    _T_365 <= UInt<8>("h04") @[Program.scala 37:57]
    infer mport _T_368 = rom[UInt<7>("h06f")], clock
    _T_368 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_372 = rom[UInt<7>("h070")], clock
    _T_372 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_375 = rom[UInt<7>("h071")], clock
    _T_375 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_378 = rom[UInt<7>("h072")], clock
    _T_378 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_381 = rom[UInt<7>("h073")], clock
    _T_381 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_385 = rom[UInt<7>("h074")], clock
    _T_385 <= UInt<8>("h063") @[Program.scala 35:57]
    infer mport _T_388 = rom[UInt<7>("h075")], clock
    _T_388 <= UInt<8>("h08") @[Program.scala 36:57]
    infer mport _T_391 = rom[UInt<7>("h076")], clock
    _T_391 <= UInt<8>("h083") @[Program.scala 37:57]
    infer mport _T_394 = rom[UInt<7>("h077")], clock
    _T_394 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_398 = rom[UInt<7>("h078")], clock
    _T_398 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_401 = rom[UInt<7>("h079")], clock
    _T_401 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_404 = rom[UInt<7>("h07a")], clock
    _T_404 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_407 = rom[UInt<7>("h07b")], clock
    _T_407 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_411 = rom[UInt<7>("h07c")], clock
    _T_411 <= UInt<8>("h06f") @[Program.scala 35:57]
    infer mport _T_414 = rom[UInt<7>("h07d")], clock
    _T_414 <= UInt<8>("h0f0") @[Program.scala 36:57]
    infer mport _T_417 = rom[UInt<7>("h07e")], clock
    _T_417 <= UInt<8>("h09f") @[Program.scala 37:57]
    infer mport _T_420 = rom[UInt<7>("h07f")], clock
    _T_420 <= UInt<8>("h0fd") @[Program.scala 38:57]
    infer mport _T_424 = rom[UInt<8>("h080")], clock
    _T_424 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_427 = rom[UInt<8>("h081")], clock
    _T_427 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_430 = rom[UInt<8>("h082")], clock
    _T_430 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_433 = rom[UInt<8>("h083")], clock
    _T_433 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_437 = rom[UInt<8>("h084")], clock
    _T_437 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_440 = rom[UInt<8>("h085")], clock
    _T_440 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_443 = rom[UInt<8>("h086")], clock
    _T_443 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_446 = rom[UInt<8>("h087")], clock
    _T_446 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_450 = rom[UInt<8>("h088")], clock
    _T_450 <= UInt<8>("h093") @[Program.scala 35:57]
    infer mport _T_453 = rom[UInt<8>("h089")], clock
    _T_453 <= UInt<8>("h082") @[Program.scala 36:57]
    infer mport _T_456 = rom[UInt<8>("h08a")], clock
    _T_456 <= UInt<8>("h02") @[Program.scala 37:57]
    infer mport _T_459 = rom[UInt<8>("h08b")], clock
    _T_459 <= UInt<8>("h03") @[Program.scala 38:57]
    infer mport _T_463 = rom[UInt<8>("h08c")], clock
    _T_463 <= UInt<8>("h023") @[Program.scala 35:57]
    infer mport _T_466 = rom[UInt<8>("h08d")], clock
    _T_466 <= UInt<8>("h080") @[Program.scala 36:57]
    infer mport _T_469 = rom[UInt<8>("h08e")], clock
    _T_469 <= UInt<8>("h059") @[Program.scala 37:57]
    infer mport _T_472 = rom[UInt<8>("h08f")], clock
    _T_472 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_476 = rom[UInt<8>("h090")], clock
    _T_476 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_479 = rom[UInt<8>("h091")], clock
    _T_479 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_482 = rom[UInt<8>("h092")], clock
    _T_482 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_485 = rom[UInt<8>("h093")], clock
    _T_485 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_489 = rom[UInt<8>("h094")], clock
    _T_489 <= UInt<8>("h013") @[Program.scala 35:57]
    infer mport _T_492 = rom[UInt<8>("h095")], clock
    _T_492 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_495 = rom[UInt<8>("h096")], clock
    _T_495 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_498 = rom[UInt<8>("h097")], clock
    _T_498 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_502 = rom[UInt<8>("h098")], clock
    _T_502 <= UInt<8>("h06f") @[Program.scala 35:57]
    infer mport _T_505 = rom[UInt<8>("h099")], clock
    _T_505 <= UInt<8>("h0f0") @[Program.scala 36:57]
    infer mport _T_508 = rom[UInt<8>("h09a")], clock
    _T_508 <= UInt<8>("h0df") @[Program.scala 37:57]
    infer mport _T_511 = rom[UInt<8>("h09b")], clock
    _T_511 <= UInt<8>("h0fb") @[Program.scala 38:57]
    infer mport _T_515 = rom[UInt<8>("h09c")], clock
    _T_515 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_518 = rom[UInt<8>("h09d")], clock
    _T_518 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_521 = rom[UInt<8>("h09e")], clock
    _T_521 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_524 = rom[UInt<8>("h09f")], clock
    _T_524 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_528 = rom[UInt<8>("h0a0")], clock
    _T_528 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_531 = rom[UInt<8>("h0a1")], clock
    _T_531 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_534 = rom[UInt<8>("h0a2")], clock
    _T_534 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_537 = rom[UInt<8>("h0a3")], clock
    _T_537 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_541 = rom[UInt<8>("h0a4")], clock
    _T_541 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_544 = rom[UInt<8>("h0a5")], clock
    _T_544 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_547 = rom[UInt<8>("h0a6")], clock
    _T_547 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_550 = rom[UInt<8>("h0a7")], clock
    _T_550 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_554 = rom[UInt<8>("h0a8")], clock
    _T_554 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_557 = rom[UInt<8>("h0a9")], clock
    _T_557 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_560 = rom[UInt<8>("h0aa")], clock
    _T_560 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_563 = rom[UInt<8>("h0ab")], clock
    _T_563 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_567 = rom[UInt<8>("h0ac")], clock
    _T_567 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_570 = rom[UInt<8>("h0ad")], clock
    _T_570 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_573 = rom[UInt<8>("h0ae")], clock
    _T_573 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_576 = rom[UInt<8>("h0af")], clock
    _T_576 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_580 = rom[UInt<8>("h0b0")], clock
    _T_580 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_583 = rom[UInt<8>("h0b1")], clock
    _T_583 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_586 = rom[UInt<8>("h0b2")], clock
    _T_586 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_589 = rom[UInt<8>("h0b3")], clock
    _T_589 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_593 = rom[UInt<8>("h0b4")], clock
    _T_593 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_596 = rom[UInt<8>("h0b5")], clock
    _T_596 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_599 = rom[UInt<8>("h0b6")], clock
    _T_599 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_602 = rom[UInt<8>("h0b7")], clock
    _T_602 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_606 = rom[UInt<8>("h0b8")], clock
    _T_606 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_609 = rom[UInt<8>("h0b9")], clock
    _T_609 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_612 = rom[UInt<8>("h0ba")], clock
    _T_612 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_615 = rom[UInt<8>("h0bb")], clock
    _T_615 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_619 = rom[UInt<8>("h0bc")], clock
    _T_619 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_622 = rom[UInt<8>("h0bd")], clock
    _T_622 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_625 = rom[UInt<8>("h0be")], clock
    _T_625 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_628 = rom[UInt<8>("h0bf")], clock
    _T_628 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_632 = rom[UInt<8>("h0c0")], clock
    _T_632 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_635 = rom[UInt<8>("h0c1")], clock
    _T_635 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_638 = rom[UInt<8>("h0c2")], clock
    _T_638 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_641 = rom[UInt<8>("h0c3")], clock
    _T_641 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_645 = rom[UInt<8>("h0c4")], clock
    _T_645 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_648 = rom[UInt<8>("h0c5")], clock
    _T_648 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_651 = rom[UInt<8>("h0c6")], clock
    _T_651 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_654 = rom[UInt<8>("h0c7")], clock
    _T_654 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_658 = rom[UInt<8>("h0c8")], clock
    _T_658 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_661 = rom[UInt<8>("h0c9")], clock
    _T_661 <= UInt<8>("h00") @[Program.scala 36:57]
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
    infer mport _T_788 = rom[UInt<8>("h0f0")], clock
    _T_788 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_791 = rom[UInt<8>("h0f1")], clock
    _T_791 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_794 = rom[UInt<8>("h0f2")], clock
    _T_794 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_797 = rom[UInt<8>("h0f3")], clock
    _T_797 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_801 = rom[UInt<8>("h0f4")], clock
    _T_801 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_804 = rom[UInt<8>("h0f5")], clock
    _T_804 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_807 = rom[UInt<8>("h0f6")], clock
    _T_807 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_810 = rom[UInt<8>("h0f7")], clock
    _T_810 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_814 = rom[UInt<8>("h0f8")], clock
    _T_814 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_817 = rom[UInt<8>("h0f9")], clock
    _T_817 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_820 = rom[UInt<8>("h0fa")], clock
    _T_820 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_823 = rom[UInt<8>("h0fb")], clock
    _T_823 <= UInt<8>("h00") @[Program.scala 38:57]
    infer mport _T_827 = rom[UInt<8>("h0fc")], clock
    _T_827 <= UInt<8>("h00") @[Program.scala 35:57]
    infer mport _T_830 = rom[UInt<8>("h0fd")], clock
    _T_830 <= UInt<8>("h00") @[Program.scala 36:57]
    infer mport _T_833 = rom[UInt<8>("h0fe")], clock
    _T_833 <= UInt<8>("h00") @[Program.scala 37:57]
    infer mport _T_836 = rom[UInt<8>("h0ff")], clock
    _T_836 <= UInt<8>("h00") @[Program.scala 38:57]
    node _T_839 = add(io.pc, UInt<2>("h03")) @[InstructionMemory.scala 24:35]
    node _T_840 = tail(_T_839, 1) @[InstructionMemory.scala 24:35]
    node _T_841 = bits(_T_840, 7, 0)
    read mport _T_842 = rom[_T_841], clock
    node _T_844 = add(io.pc, UInt<2>("h02")) @[InstructionMemory.scala 24:58]
    node _T_845 = tail(_T_844, 1) @[InstructionMemory.scala 24:58]
    node _T_846 = bits(_T_845, 7, 0)
    read mport _T_847 = rom[_T_846], clock
    node _T_849 = add(io.pc, UInt<1>("h01")) @[InstructionMemory.scala 24:81]
    node _T_850 = tail(_T_849, 1) @[InstructionMemory.scala 24:81]
    node _T_851 = bits(_T_850, 7, 0)
    read mport _T_852 = rom[_T_851], clock
    node _T_853 = bits(io.pc, 7, 0)
    read mport _T_854 = rom[_T_853], clock
    node _T_855 = cat(_T_852, _T_854) @[Cat.scala 30:58]
    node _T_856 = cat(_T_842, _T_847) @[Cat.scala 30:58]
    node _T_857 = cat(_T_856, _T_855) @[Cat.scala 30:58]
    io.inst <= _T_857 @[InstructionMemory.scala 24:13]
    
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip jump : UInt<1>, flip stall : UInt<1>, flip branch : UInt<1>, flip jump_t : UInt<32>, flip branch_t : UInt<32>, pc_next : UInt<32>, pc : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<7>("h050"))) @[ProgramCounter.scala 26:30]
    node pc_src = mux(io.branch, io.branch_t, io.pc_next) @[ProgramCounter.scala 27:30]
    node _T_11 = add(pc_reg, UInt<3>("h04")) @[ProgramCounter.scala 29:57]
    node _T_12 = tail(_T_11, 1) @[ProgramCounter.scala 29:57]
    node _T_13 = mux(io.stall, pc_reg, _T_12) @[ProgramCounter.scala 29:31]
    io.pc_next <= _T_13 @[ProgramCounter.scala 29:25]
    node _T_14 = mux(io.jump, io.jump_t, pc_src) @[ProgramCounter.scala 30:31]
    pc_reg <= _T_14 @[ProgramCounter.scala 30:25]
    io.pc <= pc_reg @[ProgramCounter.scala 34:25]
    
  module Decoder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst : UInt<32>, flip ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, rd : UInt<5>, imm : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_17 = bits(io.inst, 6, 0) @[Decoder.scala 25:35]
    io.ctrl.opcode <= _T_17 @[Decoder.scala 25:25]
    node _T_18 = bits(io.inst, 11, 7) @[Decoder.scala 26:43]
    io.rd <= _T_18 @[Decoder.scala 26:33]
    node _T_19 = bits(io.inst, 14, 12) @[Decoder.scala 27:35]
    io.ctrl.funct3 <= _T_19 @[Decoder.scala 27:25]
    node _T_20 = bits(io.inst, 19, 15) @[Decoder.scala 28:43]
    io.rs.rs1 <= _T_20 @[Decoder.scala 28:33]
    node _T_21 = eq(io.ctrl.opcode, UInt<5>("h013")) @[Decoder.scala 29:55]
    node _T_22 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Decoder.scala 29:79]
    node _T_23 = or(_T_21, _T_22) @[Decoder.scala 29:61]
    node _T_25 = bits(io.inst, 24, 20) @[Decoder.scala 29:109]
    node _T_26 = mux(_T_23, UInt<5>("h00"), _T_25) @[Decoder.scala 29:39]
    io.rs.rs2 <= _T_26 @[Decoder.scala 29:33]
    node _T_27 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Decoder.scala 30:47]
    node _T_28 = bits(io.inst, 31, 25) @[Decoder.scala 30:61]
    node _T_30 = mux(_T_27, _T_28, UInt<7>("h00")) @[Decoder.scala 30:31]
    io.ctrl.funct7 <= _T_30 @[Decoder.scala 30:25]
    node _T_31 = bits(io.inst, 31, 31) @[Decoder.scala 32:31]
    node sign = mux(_T_31, UInt<20>("h0fffff"), UInt<20>("h00")) @[Decoder.scala 32:23]
    node _T_34 = eq(UInt<6>("h033"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_34 : @[Conditional.scala 29:59]
      io.imm <= UInt<32>("h00") @[Decoder.scala 36:32]
      skip @[Conditional.scala 29:59]
    node _T_36 = eq(UInt<5>("h013"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_36 : @[Conditional.scala 29:59]
      node _T_37 = bits(io.inst, 31, 20) @[Decoder.scala 38:52]
      node _T_38 = cat(sign, _T_37) @[Cat.scala 30:58]
      io.imm <= _T_38 @[Decoder.scala 38:32]
      skip @[Conditional.scala 29:59]
    node _T_39 = eq(UInt<2>("h03"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_39 : @[Conditional.scala 29:59]
      node _T_40 = bits(io.inst, 31, 20) @[Decoder.scala 40:52]
      node _T_41 = cat(sign, _T_40) @[Cat.scala 30:58]
      io.imm <= _T_41 @[Decoder.scala 40:32]
      skip @[Conditional.scala 29:59]
    node _T_42 = eq(UInt<7>("h067"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_42 : @[Conditional.scala 29:59]
      node _T_43 = bits(io.inst, 31, 20) @[Decoder.scala 42:52]
      node _T_44 = cat(sign, _T_43) @[Cat.scala 30:58]
      io.imm <= _T_44 @[Decoder.scala 42:32]
      skip @[Conditional.scala 29:59]
    node _T_45 = eq(UInt<6>("h023"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_45 : @[Conditional.scala 29:59]
      node _T_46 = bits(io.inst, 31, 25) @[Decoder.scala 44:52]
      node _T_47 = bits(io.inst, 11, 7) @[Decoder.scala 44:68]
      node _T_48 = cat(sign, _T_46) @[Cat.scala 30:58]
      node _T_49 = cat(_T_48, _T_47) @[Cat.scala 30:58]
      io.imm <= _T_49 @[Decoder.scala 44:32]
      skip @[Conditional.scala 29:59]
    node _T_50 = eq(UInt<7>("h063"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_50 : @[Conditional.scala 29:59]
      node _T_51 = bits(io.inst, 31, 31) @[Decoder.scala 46:52]
      node _T_52 = bits(io.inst, 7, 7) @[Decoder.scala 46:65]
      node _T_53 = bits(io.inst, 30, 25) @[Decoder.scala 46:77]
      node _T_54 = bits(io.inst, 11, 8) @[Decoder.scala 46:93]
      node _T_55 = cat(_T_53, _T_54) @[Cat.scala 30:58]
      node _T_56 = cat(sign, _T_51) @[Cat.scala 30:58]
      node _T_57 = cat(_T_56, _T_52) @[Cat.scala 30:58]
      node _T_58 = cat(_T_57, _T_55) @[Cat.scala 30:58]
      io.imm <= _T_58 @[Decoder.scala 46:32]
      skip @[Conditional.scala 29:59]
    node _T_59 = eq(UInt<6>("h037"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_59 : @[Conditional.scala 29:59]
      node _T_60 = bits(sign, 11, 0) @[Decoder.scala 48:43]
      node _T_61 = bits(io.inst, 31, 12) @[Decoder.scala 48:58]
      node _T_62 = cat(_T_60, _T_61) @[Cat.scala 30:58]
      io.imm <= _T_62 @[Decoder.scala 48:32]
      skip @[Conditional.scala 29:59]
    node _T_63 = eq(UInt<5>("h017"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_63 : @[Conditional.scala 29:59]
      node _T_64 = bits(sign, 11, 0) @[Decoder.scala 50:43]
      node _T_65 = bits(io.inst, 31, 12) @[Decoder.scala 50:58]
      node _T_66 = cat(_T_64, _T_65) @[Cat.scala 30:58]
      io.imm <= _T_66 @[Decoder.scala 50:32]
      skip @[Conditional.scala 29:59]
    node _T_67 = eq(UInt<7>("h06f"), io.ctrl.opcode) @[Conditional.scala 29:28]
    when _T_67 : @[Conditional.scala 29:59]
      node _T_68 = bits(sign, 10, 0) @[Decoder.scala 52:43]
      node _T_69 = bits(io.inst, 31, 31) @[Decoder.scala 52:58]
      node _T_70 = bits(io.inst, 19, 12) @[Decoder.scala 52:71]
      node _T_71 = bits(io.inst, 20, 20) @[Decoder.scala 52:87]
      node _T_72 = bits(io.inst, 30, 21) @[Decoder.scala 52:100]
      node _T_74 = cat(_T_71, _T_72) @[Cat.scala 30:58]
      node _T_75 = cat(_T_74, UInt<1>("h00")) @[Cat.scala 30:58]
      node _T_76 = cat(_T_68, _T_69) @[Cat.scala 30:58]
      node _T_77 = cat(_T_76, _T_70) @[Cat.scala 30:58]
      node _T_78 = cat(_T_77, _T_75) @[Cat.scala 30:58]
      io.imm <= _T_78 @[Decoder.scala 52:32]
      skip @[Conditional.scala 29:59]
    
  module Control : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ctrl : {flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>}, flip stall : UInt<1>, flip WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, flip EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, jump : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_30 = eq(io.ctrl.opcode, UInt<7>("h06f")) @[Control.scala 25:79]
    node _T_31 = mux(io.stall, UInt<1>("h00"), _T_30) @[Control.scala 25:47]
    io.jump <= _T_31 @[Control.scala 25:41]
    node _T_32 = neq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 27:71]
    node _T_33 = neq(io.ctrl.opcode, UInt<7>("h063")) @[Control.scala 27:95]
    node _T_34 = and(_T_32, _T_33) @[Control.scala 27:77]
    node _T_35 = mux(io.stall, UInt<1>("h00"), _T_34) @[Control.scala 27:39]
    io.EX.alu_sel <= _T_35 @[Control.scala 27:33]
    node _T_36 = bits(io.ctrl.funct7, 5, 5) @[Control.scala 28:70]
    node _T_37 = mux(io.stall, UInt<1>("h00"), _T_36) @[Control.scala 28:39]
    io.EX.alu_op.alt <= _T_37 @[Control.scala 28:33]
    node _T_38 = mux(io.stall, UInt<1>("h00"), io.ctrl.funct3) @[Control.scala 29:39]
    io.EX.alu_op.func <= _T_38 @[Control.scala 29:33]
    node _T_39 = mux(io.stall, UInt<1>("h00"), io.ctrl.opcode) @[Control.scala 30:39]
    io.EX.opcode <= _T_39 @[Control.scala 30:33]
    node _T_40 = mux(io.stall, UInt<1>("h00"), io.ctrl.funct3) @[Control.scala 32:39]
    io.MEM.func <= _T_40 @[Control.scala 32:33]
    node _T_41 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 33:71]
    node _T_42 = mux(io.stall, UInt<1>("h00"), _T_41) @[Control.scala 33:39]
    io.MEM.read <= _T_42 @[Control.scala 33:33]
    node _T_43 = eq(io.ctrl.opcode, UInt<6>("h023")) @[Control.scala 34:71]
    node _T_44 = mux(io.stall, UInt<1>("h00"), _T_43) @[Control.scala 34:39]
    io.MEM.write <= _T_44 @[Control.scala 34:33]
    node _T_45 = eq(io.ctrl.opcode, UInt<7>("h063")) @[Control.scala 35:71]
    node _T_46 = mux(io.stall, UInt<1>("h00"), _T_45) @[Control.scala 35:39]
    io.MEM.branch <= _T_46 @[Control.scala 35:33]
    node _T_47 = mux(io.stall, UInt<1>("h00"), io.MEM.read) @[Control.scala 38:39]
    io.WB.rd_mem <= _T_47 @[Control.scala 38:33]
    node _T_48 = eq(io.ctrl.opcode, UInt<6>("h033")) @[Control.scala 39:71]
    node _T_49 = eq(io.ctrl.opcode, UInt<5>("h013")) @[Control.scala 40:75]
    node _T_50 = or(_T_48, _T_49) @[Control.scala 39:77]
    node _T_51 = eq(io.ctrl.opcode, UInt<2>("h03")) @[Control.scala 40:99]
    node _T_52 = or(_T_50, _T_51) @[Control.scala 40:81]
    node _T_53 = mux(io.stall, UInt<1>("h00"), _T_52) @[Control.scala 39:39]
    io.WB.reg_w <= _T_53 @[Control.scala 39:33]
    
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
    output io : {flip opcode : UInt<7>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, zero : UInt<1>, res : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node shamt = bits(io.op.op2, 4, 0) @[ALU.scala 28:20]
    node _T_9 = sub(io.op.op1, io.op.op2) @[ALU.scala 33:47]
    node _T_10 = asUInt(_T_9) @[ALU.scala 33:47]
    node _T_11 = tail(_T_10, 1) @[ALU.scala 33:47]
    node _T_12 = add(io.op.op1, io.op.op2) @[ALU.scala 33:58]
    node _T_13 = tail(_T_12, 1) @[ALU.scala 33:58]
    node _T_14 = mux(io.alu_op.alt, _T_11, _T_13) @[ALU.scala 33:27]
    node _T_15 = dshl(io.op.op1, shamt) @[ALU.scala 34:29]
    node _T_16 = lt(io.op.op1, io.op.op2) @[ALU.scala 36:29]
    node _T_17 = xor(io.op.op1, io.op.op2) @[ALU.scala 37:29]
    node _T_18 = dshr(io.op.op1, shamt) @[ALU.scala 38:53]
    node _T_19 = mux(io.alu_op.alt, UInt<1>("h00"), _T_18) @[ALU.scala 38:27]
    node _T_20 = or(io.op.op1, io.op.op2) @[ALU.scala 39:29]
    node _T_21 = eq(UInt<3>("h06"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_22 = mux(_T_21, _T_20, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_23 = eq(UInt<3>("h05"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_24 = mux(_T_23, _T_19, _T_22) @[Mux.scala 46:16]
    node _T_25 = eq(UInt<3>("h04"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_26 = mux(_T_25, _T_17, _T_24) @[Mux.scala 46:16]
    node _T_27 = eq(UInt<2>("h03"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_28 = mux(_T_27, _T_16, _T_26) @[Mux.scala 46:16]
    node _T_29 = eq(UInt<1>("h01"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_30 = mux(_T_29, _T_15, _T_28) @[Mux.scala 46:16]
    node _T_31 = eq(UInt<1>("h00"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_32 = mux(_T_31, _T_14, _T_30) @[Mux.scala 46:16]
    node _T_33 = add(io.op.op1, io.op.op2) @[ALU.scala 41:29]
    node _T_34 = tail(_T_33, 1) @[ALU.scala 41:29]
    node _T_35 = dshl(io.op.op1, shamt) @[ALU.scala 42:29]
    node _T_36 = lt(io.op.op1, io.op.op2) @[ALU.scala 44:29]
    node _T_37 = xor(io.op.op1, io.op.op2) @[ALU.scala 45:29]
    node _T_38 = dshr(io.op.op1, shamt) @[ALU.scala 46:53]
    node _T_39 = mux(io.alu_op.alt, UInt<1>("h00"), _T_38) @[ALU.scala 46:27]
    node _T_40 = or(io.op.op1, io.op.op2) @[ALU.scala 47:29]
    node _T_41 = eq(UInt<3>("h06"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_42 = mux(_T_41, _T_40, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_43 = eq(UInt<3>("h05"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_44 = mux(_T_43, _T_39, _T_42) @[Mux.scala 46:16]
    node _T_45 = eq(UInt<3>("h04"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_46 = mux(_T_45, _T_37, _T_44) @[Mux.scala 46:16]
    node _T_47 = eq(UInt<2>("h03"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_48 = mux(_T_47, _T_36, _T_46) @[Mux.scala 46:16]
    node _T_49 = eq(UInt<1>("h01"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_50 = mux(_T_49, _T_35, _T_48) @[Mux.scala 46:16]
    node _T_51 = eq(UInt<1>("h00"), io.alu_op.func) @[Mux.scala 46:19]
    node _T_52 = mux(_T_51, _T_34, _T_50) @[Mux.scala 46:16]
    node _T_53 = add(io.op.op1, io.op.op2) @[ALU.scala 48:19]
    node _T_54 = tail(_T_53, 1) @[ALU.scala 48:19]
    node _T_55 = add(io.op.op1, io.op.op2) @[ALU.scala 49:19]
    node _T_56 = tail(_T_55, 1) @[ALU.scala 49:19]
    node _T_57 = sub(io.op.op1, io.op.op2) @[ALU.scala 50:19]
    node _T_58 = asUInt(_T_57) @[ALU.scala 50:19]
    node _T_59 = tail(_T_58, 1) @[ALU.scala 50:19]
    node _T_60 = eq(UInt<7>("h063"), io.opcode) @[Mux.scala 46:19]
    node _T_61 = mux(_T_60, _T_59, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_62 = eq(UInt<6>("h023"), io.opcode) @[Mux.scala 46:19]
    node _T_63 = mux(_T_62, _T_56, _T_61) @[Mux.scala 46:16]
    node _T_64 = eq(UInt<2>("h03"), io.opcode) @[Mux.scala 46:19]
    node _T_65 = mux(_T_64, _T_54, _T_63) @[Mux.scala 46:16]
    node _T_66 = eq(UInt<5>("h013"), io.opcode) @[Mux.scala 46:19]
    node _T_67 = mux(_T_66, _T_52, _T_65) @[Mux.scala 46:16]
    node _T_68 = eq(UInt<6>("h033"), io.opcode) @[Mux.scala 46:19]
    node _T_69 = mux(_T_68, _T_32, _T_67) @[Mux.scala 46:16]
    io.res <= _T_69 @[ALU.scala 30:12]
    node _T_70 = eq(io.res, UInt<1>("h00")) @[ALU.scala 62:23]
    io.zero <= _T_70 @[ALU.scala 62:13]
    
  module DataMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {mem : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip tx_req : UInt<1>, flip rx : UInt<8>, res : UInt<32>, tx : UInt<8>, rx_out : UInt<8>, rx_cnt : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    cmem data_mem : UInt<8>[512] @[DataMemory.scala 29:27]
    reg rx_cnt : UInt<4>, clock with : (reset => (reset, UInt<1>("h00"))) @[DataMemory.scala 30:31]
    when io.mem.write : @[DataMemory.scala 32:29]
      node _T_17 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_17 : @[Conditional.scala 29:59]
        node _T_18 = bits(io.op.op1, 8, 0)
        infer mport _T_19 = data_mem[_T_18], clock
        node _T_20 = bits(io.op.op2, 7, 0) @[DataMemory.scala 35:65]
        _T_19 <= _T_20 @[DataMemory.scala 35:53]
        skip @[Conditional.scala 29:59]
      node _T_21 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_21 : @[Conditional.scala 29:59]
        node _T_22 = bits(io.op.op1, 8, 0)
        infer mport _T_23 = data_mem[_T_22], clock
        node _T_24 = bits(io.op.op2, 7, 0) @[DataMemory.scala 37:71]
        _T_23 <= _T_24 @[DataMemory.scala 37:59]
        node _T_26 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 38:52]
        node _T_27 = tail(_T_26, 1) @[DataMemory.scala 38:52]
        node _T_28 = bits(_T_27, 8, 0)
        infer mport _T_29 = data_mem[_T_28], clock
        node _T_30 = bits(io.op.op2, 15, 8) @[DataMemory.scala 38:71]
        _T_29 <= _T_30 @[DataMemory.scala 38:59]
        skip @[Conditional.scala 29:59]
      node _T_31 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_31 : @[Conditional.scala 29:59]
        node _T_32 = bits(io.op.op1, 8, 0)
        infer mport _T_33 = data_mem[_T_32], clock
        node _T_34 = bits(io.op.op2, 7, 0) @[DataMemory.scala 40:71]
        _T_33 <= _T_34 @[DataMemory.scala 40:59]
        node _T_36 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 41:52]
        node _T_37 = tail(_T_36, 1) @[DataMemory.scala 41:52]
        node _T_38 = bits(_T_37, 8, 0)
        infer mport _T_39 = data_mem[_T_38], clock
        node _T_40 = bits(io.op.op2, 15, 8) @[DataMemory.scala 41:71]
        _T_39 <= _T_40 @[DataMemory.scala 41:59]
        node _T_42 = add(io.op.op1, UInt<2>("h02")) @[DataMemory.scala 42:52]
        node _T_43 = tail(_T_42, 1) @[DataMemory.scala 42:52]
        node _T_44 = bits(_T_43, 8, 0)
        infer mport _T_45 = data_mem[_T_44], clock
        node _T_46 = bits(io.op.op2, 23, 16) @[DataMemory.scala 42:71]
        _T_45 <= _T_46 @[DataMemory.scala 42:59]
        node _T_48 = add(io.op.op1, UInt<2>("h03")) @[DataMemory.scala 43:52]
        node _T_49 = tail(_T_48, 1) @[DataMemory.scala 43:52]
        node _T_50 = bits(_T_49, 8, 0)
        infer mport _T_51 = data_mem[_T_50], clock
        node _T_52 = bits(io.op.op2, 31, 24) @[DataMemory.scala 43:71]
        _T_51 <= _T_52 @[DataMemory.scala 43:59]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 32:29]
    when io.mem.read : @[DataMemory.scala 47:28]
      node _T_53 = eq(UInt<1>("h00"), io.mem.func) @[Conditional.scala 29:28]
      when _T_53 : @[Conditional.scala 29:59]
        node _T_54 = bits(io.op.op1, 8, 0)
        infer mport _T_55 = data_mem[_T_54], clock
        io.res <= _T_55 @[DataMemory.scala 50:40]
        skip @[Conditional.scala 29:59]
      node _T_56 = eq(UInt<1>("h01"), io.mem.func) @[Conditional.scala 29:28]
      when _T_56 : @[Conditional.scala 29:59]
        node _T_58 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 52:66]
        node _T_59 = tail(_T_58, 1) @[DataMemory.scala 52:66]
        node _T_60 = bits(_T_59, 8, 0)
        infer mport _T_61 = data_mem[_T_60], clock
        node _T_62 = bits(io.op.op1, 8, 0)
        infer mport _T_63 = data_mem[_T_62], clock
        node _T_64 = cat(_T_61, _T_63) @[Cat.scala 30:58]
        io.res <= _T_64 @[DataMemory.scala 52:40]
        skip @[Conditional.scala 29:59]
      node _T_65 = eq(UInt<2>("h02"), io.mem.func) @[Conditional.scala 29:28]
      when _T_65 : @[Conditional.scala 29:59]
        node _T_67 = add(io.op.op1, UInt<2>("h03")) @[DataMemory.scala 55:66]
        node _T_68 = tail(_T_67, 1) @[DataMemory.scala 55:66]
        node _T_69 = bits(_T_68, 8, 0)
        infer mport _T_70 = data_mem[_T_69], clock
        node _T_72 = add(io.op.op1, UInt<2>("h02")) @[DataMemory.scala 56:74]
        node _T_73 = tail(_T_72, 1) @[DataMemory.scala 56:74]
        node _T_74 = bits(_T_73, 8, 0)
        infer mport _T_75 = data_mem[_T_74], clock
        node _T_77 = add(io.op.op1, UInt<1>("h01")) @[DataMemory.scala 57:78]
        node _T_78 = tail(_T_77, 1) @[DataMemory.scala 57:78]
        node _T_79 = bits(_T_78, 8, 0)
        infer mport _T_80 = data_mem[_T_79], clock
        node _T_81 = bits(io.op.op1, 8, 0)
        infer mport _T_82 = data_mem[_T_81], clock
        node _T_83 = cat(_T_80, _T_82) @[Cat.scala 30:58]
        node _T_84 = cat(_T_70, _T_75) @[Cat.scala 30:58]
        node _T_85 = cat(_T_84, _T_83) @[Cat.scala 30:58]
        io.res <= _T_85 @[DataMemory.scala 55:40]
        skip @[Conditional.scala 29:59]
      skip @[DataMemory.scala 47:28]
    node _T_87 = eq(io.mem.read, UInt<1>("h00")) @[DataMemory.scala 47:28]
    when _T_87 : @[DataMemory.scala 61:22]
      io.res <= UInt<1>("h00") @[DataMemory.scala 61:31]
      skip @[DataMemory.scala 61:22]
    node _T_88 = eq(io.op.op1, UInt<10>("h0200")) @[DataMemory.scala 63:33]
    node _T_90 = eq(io.tx_req, UInt<1>("h00")) @[DataMemory.scala 63:49]
    node _T_91 = and(_T_88, _T_90) @[DataMemory.scala 63:46]
    node _T_92 = mux(_T_91, io.op.op2, UInt<1>("h00")) @[DataMemory.scala 63:21]
    io.tx <= _T_92 @[DataMemory.scala 63:15]
    node _T_93 = neq(io.rx, UInt<1>("h00")) @[DataMemory.scala 65:21]
    when _T_93 : @[DataMemory.scala 65:31]
      node _T_95 = add(rx_cnt, UInt<1>("h01")) @[DataMemory.scala 66:34]
      node _T_96 = tail(_T_95, 1) @[DataMemory.scala 66:34]
      rx_cnt <= _T_96 @[DataMemory.scala 66:24]
      infer mport _T_97 = data_mem[UInt<9>("h01ff")], clock
      _T_97 <= rx_cnt @[DataMemory.scala 67:35]
      infer mport _T_98 = data_mem[UInt<9>("h01ef")], clock
      _T_98 <= io.rx @[DataMemory.scala 68:35]
      skip @[DataMemory.scala 65:31]
    infer mport _T_99 = data_mem[UInt<9>("h01ff")], clock
    io.rx_cnt <= _T_99 @[DataMemory.scala 71:19]
    infer mport _T_100 = data_mem[UInt<9>("h01ef")], clock
    io.rx_out <= _T_100 @[DataMemory.scala 72:19]
    
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
    output io : {rs_id : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd_ex : UInt<5>, flip mem_r : UInt<1>, flip tx_req : UInt<1>, stall : UInt<1>, flip branch : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    node _T_9 = eq(io.rd_ex, io.rs_id.rs1) @[DetectHazardUnit.scala 26:45]
    node _T_10 = eq(io.rd_ex, io.rs_id.rs2) @[DetectHazardUnit.scala 26:76]
    node _T_11 = or(_T_9, _T_10) @[DetectHazardUnit.scala 26:63]
    node _T_12 = and(io.mem_r, _T_11) @[DetectHazardUnit.scala 26:31]
    node _T_13 = or(_T_12, io.tx_req) @[DetectHazardUnit.scala 26:96]
    node _T_14 = or(_T_13, io.branch) @[DetectHazardUnit.scala 26:109]
    io.stall <= _T_14 @[DetectHazardUnit.scala 26:18]
    
  module Rx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    node TICK_HALF = div(UInt<9>("h01b2"), UInt<2>("h02")) @[UART.scala 101:29]
    reg data : UInt<9>, clock with : (reset => (reset, UInt<9>("h01ff"))) @[UART.scala 105:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, TICK_HALF)) @[UART.scala 106:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 107:28]
    reg valid : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[UART.scala 108:28]
    node _T_13 = and(valid, io.deq.ready) @[UART.scala 110:17]
    when _T_13 : @[UART.scala 110:34]
      valid <= UInt<1>("h00") @[UART.scala 111:15]
      skip @[UART.scala 110:34]
    node _T_14 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_14 : @[Conditional.scala 29:59]
      node _T_15 = eq(io.rxd, UInt<1>("h00")) @[UART.scala 116:26]
      when _T_15 : @[UART.scala 116:36]
        node _T_16 = neq(ticks, UInt<1>("h00")) @[UART.scala 117:29]
        when _T_16 : @[UART.scala 117:38]
          node _T_18 = sub(ticks, UInt<1>("h01")) @[UART.scala 118:36]
          node _T_19 = asUInt(_T_18) @[UART.scala 118:36]
          node _T_20 = tail(_T_19, 1) @[UART.scala 118:36]
          ticks <= _T_20 @[UART.scala 118:27]
          skip @[UART.scala 117:38]
        node _T_22 = eq(_T_16, UInt<1>("h00")) @[UART.scala 117:38]
        when _T_22 : @[UART.scala 119:30]
          ticks <= UInt<9>("h01b2") @[UART.scala 120:27]
          state <= UInt<4>("h0a") @[UART.scala 121:27]
          valid <= UInt<1>("h00") @[UART.scala 122:27]
          skip @[UART.scala 119:30]
        skip @[UART.scala 116:36]
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
      node _T_40 = eq(ticks, UInt<1>("h00")) @[UART.scala 128:25]
      when _T_40 : @[UART.scala 128:35]
        node _T_41 = shr(data, 1) @[UART.scala 129:43]
        node _T_42 = cat(io.rxd, _T_41) @[Cat.scala 30:58]
        data <= _T_42 @[UART.scala 129:23]
        ticks <= UInt<9>("h01b2") @[UART.scala 130:23]
        node _T_44 = sub(state, UInt<1>("h01")) @[UART.scala 131:32]
        node _T_45 = asUInt(_T_44) @[UART.scala 131:32]
        node _T_46 = tail(_T_45, 1) @[UART.scala 131:32]
        state <= _T_46 @[UART.scala 131:23]
        skip @[UART.scala 128:35]
      node _T_48 = eq(_T_40, UInt<1>("h00")) @[UART.scala 128:35]
      when _T_48 : @[UART.scala 132:26]
        node _T_50 = sub(ticks, UInt<1>("h01")) @[UART.scala 133:32]
        node _T_51 = asUInt(_T_50) @[UART.scala 133:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 133:32]
        ticks <= _T_52 @[UART.scala 133:23]
        skip @[UART.scala 132:26]
      skip @[Conditional.scala 29:59]
    node _T_53 = eq(UInt<4>("h01"), state) @[Conditional.scala 29:28]
    when _T_53 : @[Conditional.scala 29:59]
      node _T_54 = eq(ticks, TICK_HALF) @[UART.scala 138:25]
      when _T_54 : @[UART.scala 138:40]
        node _T_56 = sub(ticks, UInt<1>("h01")) @[UART.scala 139:32]
        node _T_57 = asUInt(_T_56) @[UART.scala 139:32]
        node _T_58 = tail(_T_57, 1) @[UART.scala 139:32]
        ticks <= _T_58 @[UART.scala 139:23]
        state <= UInt<4>("h00") @[UART.scala 140:23]
        valid <= UInt<1>("h01") @[UART.scala 141:23]
        skip @[UART.scala 138:40]
      node _T_60 = eq(_T_54, UInt<1>("h00")) @[UART.scala 138:40]
      when _T_60 : @[UART.scala 142:26]
        node _T_62 = sub(ticks, UInt<1>("h01")) @[UART.scala 143:32]
        node _T_63 = asUInt(_T_62) @[UART.scala 143:32]
        node _T_64 = tail(_T_63, 1) @[UART.scala 143:32]
        ticks <= _T_64 @[UART.scala 143:23]
        skip @[UART.scala 142:26]
      skip @[Conditional.scala 29:59]
    io.deq.valid <= valid @[UART.scala 148:18]
    node _T_65 = bits(data, 7, 0) @[UART.scala 150:25]
    node _T_66 = neq(_T_65, UInt<1>("h00")) @[UART.scala 150:32]
    node _T_67 = and(valid, _T_66) @[UART.scala 150:17]
    when _T_67 : @[UART.scala 150:43]
      node _T_68 = bits(data, 7, 0) @[UART.scala 151:29]
      io.deq.bits <= _T_68 @[UART.scala 151:22]
      data <= UInt<1>("h00") @[UART.scala 152:14]
      skip @[UART.scala 150:43]
    node _T_70 = eq(_T_67, UInt<1>("h00")) @[UART.scala 150:43]
    when _T_70 : @[UART.scala 153:18]
      io.deq.bits <= UInt<1>("h00") @[UART.scala 154:22]
      skip @[UART.scala 153:18]
    
  module Tx : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, txd : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg data : UInt<9>, clock with : (reset => (reset, UInt<9>("h01ff"))) @[UART.scala 66:28]
    reg ticks : UInt<32>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 67:28]
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[UART.scala 68:28]
    node _T_15 = eq(state, UInt<4>("h00")) @[UART.scala 70:27]
    io.enq.ready <= _T_15 @[UART.scala 70:18]
    node _T_16 = eq(UInt<4>("h00"), state) @[Conditional.scala 29:28]
    when _T_16 : @[Conditional.scala 29:59]
      when io.enq.valid : @[UART.scala 74:33]
        node _T_18 = cat(io.enq.bits, UInt<1>("h00")) @[Cat.scala 30:58]
        data <= _T_18 @[UART.scala 75:23]
        ticks <= UInt<1>("h00") @[UART.scala 76:23]
        state <= UInt<4>("h0b") @[UART.scala 77:23]
        skip @[UART.scala 74:33]
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
      node _T_40 = eq(ticks, UInt<9>("h01b2")) @[UART.scala 82:25]
      when _T_40 : @[UART.scala 82:39]
        node _T_42 = shr(data, 1) @[UART.scala 83:43]
        node _T_43 = cat(UInt<1>("h01"), _T_42) @[Cat.scala 30:58]
        data <= _T_43 @[UART.scala 83:23]
        ticks <= UInt<1>("h00") @[UART.scala 84:23]
        node _T_45 = sub(state, UInt<1>("h01")) @[UART.scala 85:32]
        node _T_46 = asUInt(_T_45) @[UART.scala 85:32]
        node _T_47 = tail(_T_46, 1) @[UART.scala 85:32]
        state <= _T_47 @[UART.scala 85:23]
        skip @[UART.scala 82:39]
      node _T_49 = eq(_T_40, UInt<1>("h00")) @[UART.scala 82:39]
      when _T_49 : @[UART.scala 86:26]
        node _T_51 = add(ticks, UInt<1>("h01")) @[UART.scala 87:32]
        node _T_52 = tail(_T_51, 1) @[UART.scala 87:32]
        ticks <= _T_52 @[UART.scala 87:23]
        skip @[UART.scala 86:26]
      skip @[Conditional.scala 29:59]
    node _T_53 = bits(data, 0, 0) @[UART.scala 91:19]
    io.txd <= _T_53 @[UART.scala 91:12]
    
  module UART : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, flip in : UInt<8>, out : UInt<8>, txd : UInt<1>, tx_req : UInt<1>, reg : UInt<8>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst rx of Rx @[UART.scala 34:21]
    rx.io is invalid
    rx.clock <= clock
    rx.reset <= reset
    inst tx of Tx @[UART.scala 35:21]
    tx.io is invalid
    tx.clock <= clock
    tx.reset <= reset
    reg reg : UInt<8>, clock with : (reset => (reset, UInt<1>("h00"))) @[UART.scala 36:22]
    rx.io.rxd <= io.rxd @[UART.scala 38:15]
    io.reg <= reg @[UART.scala 40:12]
    node _T_9 = neq(reg, UInt<1>("h00")) @[UART.scala 41:28]
    tx.io.enq.valid <= _T_9 @[UART.scala 41:21]
    node _T_10 = eq(reg, UInt<1>("h00")) @[UART.scala 43:15]
    when _T_10 : @[UART.scala 43:25]
      node _T_11 = neq(io.in, UInt<1>("h00")) @[UART.scala 44:21]
      when _T_11 : @[UART.scala 44:31]
        reg <= io.in @[UART.scala 44:37]
        skip @[UART.scala 44:31]
      skip @[UART.scala 43:25]
    node _T_13 = eq(_T_10, UInt<1>("h00")) @[UART.scala 43:25]
    node _T_14 = and(_T_13, tx.io.enq.ready) @[UART.scala 45:35]
    when _T_14 : @[UART.scala 45:35]
      tx.io.enq.bits <= reg @[UART.scala 46:24]
      skip @[UART.scala 45:35]
    node _T_16 = eq(_T_10, UInt<1>("h00")) @[UART.scala 43:25]
    node _T_18 = eq(tx.io.enq.ready, UInt<1>("h00")) @[UART.scala 45:35]
    node _T_19 = and(_T_16, _T_18) @[UART.scala 45:35]
    when _T_19 : @[UART.scala 47:18]
      reg <= UInt<1>("h00") @[UART.scala 48:13]
      skip @[UART.scala 47:18]
    node _T_21 = eq(tx.io.enq.ready, UInt<1>("h00")) @[UART.scala 51:18]
    node _T_22 = neq(reg, UInt<1>("h00")) @[UART.scala 51:44]
    node _T_23 = and(_T_22, tx.io.enq.ready) @[UART.scala 51:53]
    node _T_24 = or(_T_21, _T_23) @[UART.scala 51:35]
    io.tx_req <= _T_24 @[UART.scala 51:15]
    io.txd <= tx.io.txd @[UART.scala 52:15]
    io.out <= rx.io.deq.bits @[UART.scala 53:15]
    
  module PipelineIF_ID : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stall : UInt<1>, in : {flip pc_next : UInt<32>, flip inst : UInt<32>}, flip out : {flip pc_next : UInt<32>, flip inst : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg reg : {flip pc_next : UInt<32>, flip inst : UInt<32>}, clock @[Pipeline.scala 22:34]
    reg.inst <= io.in.inst @[Pipeline.scala 22:34]
    reg.pc_next <= io.in.pc_next @[Pipeline.scala 22:34]
    when io.stall : @[Pipeline.scala 24:33]
      reg.inst <= reg.inst @[Pipeline.scala 24:39]
      reg.pc_next <= reg.pc_next @[Pipeline.scala 24:39]
      skip @[Pipeline.scala 24:33]
    io.out.inst <= reg.inst @[Pipeline.scala 25:24]
    io.out.pc_next <= reg.pc_next @[Pipeline.scala 25:24]
    
  module PipelineID_EX : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}, flip out : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_72 : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, EX : {flip opcode : UInt<7>, flip alu_sel : UInt<1>, alu_op : {flip func : UInt<3>, flip alt : UInt<1>}}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, rs : {flip rs1 : UInt<5>, flip rs2 : UInt<5>}, flip rd : UInt<5>, flip imm : UInt<32>, flip pc_next : UInt<32>}, clock @[Pipeline.scala 34:34]
    _T_72.pc_next <= io.in.pc_next @[Pipeline.scala 34:34]
    _T_72.imm <= io.in.imm @[Pipeline.scala 34:34]
    _T_72.rd <= io.in.rd @[Pipeline.scala 34:34]
    _T_72.rs.rs2 <= io.in.rs.rs2 @[Pipeline.scala 34:34]
    _T_72.rs.rs1 <= io.in.rs.rs1 @[Pipeline.scala 34:34]
    _T_72.op.op2 <= io.in.op.op2 @[Pipeline.scala 34:34]
    _T_72.op.op1 <= io.in.op.op1 @[Pipeline.scala 34:34]
    _T_72.EX.alu_op.alt <= io.in.EX.alu_op.alt @[Pipeline.scala 34:34]
    _T_72.EX.alu_op.func <= io.in.EX.alu_op.func @[Pipeline.scala 34:34]
    _T_72.EX.alu_sel <= io.in.EX.alu_sel @[Pipeline.scala 34:34]
    _T_72.EX.opcode <= io.in.EX.opcode @[Pipeline.scala 34:34]
    _T_72.MEM.func <= io.in.MEM.func @[Pipeline.scala 34:34]
    _T_72.MEM.read <= io.in.MEM.read @[Pipeline.scala 34:34]
    _T_72.MEM.write <= io.in.MEM.write @[Pipeline.scala 34:34]
    _T_72.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 34:34]
    _T_72.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 34:34]
    _T_72.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 34:34]
    io.out.pc_next <= _T_72.pc_next @[Pipeline.scala 34:24]
    io.out.imm <= _T_72.imm @[Pipeline.scala 34:24]
    io.out.rd <= _T_72.rd @[Pipeline.scala 34:24]
    io.out.rs.rs2 <= _T_72.rs.rs2 @[Pipeline.scala 34:24]
    io.out.rs.rs1 <= _T_72.rs.rs1 @[Pipeline.scala 34:24]
    io.out.op.op2 <= _T_72.op.op2 @[Pipeline.scala 34:24]
    io.out.op.op1 <= _T_72.op.op1 @[Pipeline.scala 34:24]
    io.out.EX.alu_op.alt <= _T_72.EX.alu_op.alt @[Pipeline.scala 34:24]
    io.out.EX.alu_op.func <= _T_72.EX.alu_op.func @[Pipeline.scala 34:24]
    io.out.EX.alu_sel <= _T_72.EX.alu_sel @[Pipeline.scala 34:24]
    io.out.EX.opcode <= _T_72.EX.opcode @[Pipeline.scala 34:24]
    io.out.MEM.func <= _T_72.MEM.func @[Pipeline.scala 34:24]
    io.out.MEM.read <= _T_72.MEM.read @[Pipeline.scala 34:24]
    io.out.MEM.write <= _T_72.MEM.write @[Pipeline.scala 34:24]
    io.out.MEM.branch <= _T_72.MEM.branch @[Pipeline.scala 34:24]
    io.out.WB.rd_mem <= _T_72.WB.rd_mem @[Pipeline.scala 34:24]
    io.out.WB.reg_w <= _T_72.WB.reg_w @[Pipeline.scala 34:24]
    
  module PipelineEX_MEM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>, flip branch_t : UInt<32>}, flip out : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>, flip branch_t : UInt<32>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_52 : {flip zero : UInt<1>, WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, MEM : {flip branch : UInt<1>, flip write : UInt<1>, flip read : UInt<1>, flip func : UInt<3>}, op : {flip op1 : UInt<32>, flip op2 : UInt<32>}, flip rd : UInt<5>, flip pc_next : UInt<32>, flip branch_t : UInt<32>}, clock @[Pipeline.scala 43:34]
    _T_52.branch_t <= io.in.branch_t @[Pipeline.scala 43:34]
    _T_52.pc_next <= io.in.pc_next @[Pipeline.scala 43:34]
    _T_52.rd <= io.in.rd @[Pipeline.scala 43:34]
    _T_52.op.op2 <= io.in.op.op2 @[Pipeline.scala 43:34]
    _T_52.op.op1 <= io.in.op.op1 @[Pipeline.scala 43:34]
    _T_52.MEM.func <= io.in.MEM.func @[Pipeline.scala 43:34]
    _T_52.MEM.read <= io.in.MEM.read @[Pipeline.scala 43:34]
    _T_52.MEM.write <= io.in.MEM.write @[Pipeline.scala 43:34]
    _T_52.MEM.branch <= io.in.MEM.branch @[Pipeline.scala 43:34]
    _T_52.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 43:34]
    _T_52.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 43:34]
    _T_52.zero <= io.in.zero @[Pipeline.scala 43:34]
    io.out.branch_t <= _T_52.branch_t @[Pipeline.scala 43:24]
    io.out.pc_next <= _T_52.pc_next @[Pipeline.scala 43:24]
    io.out.rd <= _T_52.rd @[Pipeline.scala 43:24]
    io.out.op.op2 <= _T_52.op.op2 @[Pipeline.scala 43:24]
    io.out.op.op1 <= _T_52.op.op1 @[Pipeline.scala 43:24]
    io.out.MEM.func <= _T_52.MEM.func @[Pipeline.scala 43:24]
    io.out.MEM.read <= _T_52.MEM.read @[Pipeline.scala 43:24]
    io.out.MEM.write <= _T_52.MEM.write @[Pipeline.scala 43:24]
    io.out.MEM.branch <= _T_52.MEM.branch @[Pipeline.scala 43:24]
    io.out.WB.rd_mem <= _T_52.WB.rd_mem @[Pipeline.scala 43:24]
    io.out.WB.reg_w <= _T_52.WB.reg_w @[Pipeline.scala 43:24]
    io.out.zero <= _T_52.zero @[Pipeline.scala 43:24]
    
  module PipelineMEM_WB : 
    input clock : Clock
    input reset : UInt<1>
    output io : {in : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}, flip out : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg _T_24 : {WB : {flip reg_w : UInt<1>, flip rd_mem : UInt<1>}, flip alu_res : UInt<32>, flip mem_res : UInt<32>, flip rd : UInt<5>}, clock @[Pipeline.scala 52:34]
    _T_24.rd <= io.in.rd @[Pipeline.scala 52:34]
    _T_24.mem_res <= io.in.mem_res @[Pipeline.scala 52:34]
    _T_24.alu_res <= io.in.alu_res @[Pipeline.scala 52:34]
    _T_24.WB.rd_mem <= io.in.WB.rd_mem @[Pipeline.scala 52:34]
    _T_24.WB.reg_w <= io.in.WB.reg_w @[Pipeline.scala 52:34]
    io.out.rd <= _T_24.rd @[Pipeline.scala 52:24]
    io.out.mem_res <= _T_24.mem_res @[Pipeline.scala 52:24]
    io.out.alu_res <= _T_24.alu_res @[Pipeline.scala 52:24]
    io.out.WB.rd_mem <= _T_24.WB.rd_mem @[Pipeline.scala 52:24]
    io.out.WB.reg_w <= _T_24.WB.reg_w @[Pipeline.scala 52:24]
    
  module CPU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rxd : UInt<1>, txd : UInt<1>, rx_out : UInt<8>, rx_cnt : UInt<8>, flip rx_in : UInt<8>, pc : UInt<32>}
    
    clock is invalid
    reset is invalid
    io is invalid
    inst instMem of InstructionMemory @[CPU.scala 92:29]
    instMem.io is invalid
    instMem.clock <= clock
    instMem.reset <= reset
    inst counter of ProgramCounter @[CPU.scala 93:29]
    counter.io is invalid
    counter.clock <= clock
    counter.reset <= reset
    inst decoder of Decoder @[CPU.scala 94:29]
    decoder.io is invalid
    decoder.clock <= clock
    decoder.reset <= reset
    inst control of Control @[CPU.scala 95:29]
    control.io is invalid
    control.clock <= clock
    control.reset <= reset
    inst regs of Registers @[CPU.scala 96:29]
    regs.io is invalid
    regs.clock <= clock
    regs.reset <= reset
    inst alu of ALU @[CPU.scala 97:29]
    alu.io is invalid
    alu.clock <= clock
    alu.reset <= reset
    inst dataMem of DataMemory @[CPU.scala 98:29]
    dataMem.io is invalid
    dataMem.clock <= clock
    dataMem.reset <= reset
    inst fwdUnit of ForwardingUnit @[CPU.scala 99:29]
    fwdUnit.io is invalid
    fwdUnit.clock <= clock
    fwdUnit.reset <= reset
    inst hazardUnit of DetectHazardUnit @[CPU.scala 100:29]
    hazardUnit.io is invalid
    hazardUnit.clock <= clock
    hazardUnit.reset <= reset
    inst uart of UART @[CPU.scala 101:29]
    uart.io is invalid
    uart.clock <= clock
    uart.reset <= reset
    inst IF_ID of PipelineIF_ID @[CPU.scala 105:29]
    IF_ID.io is invalid
    IF_ID.clock <= clock
    IF_ID.reset <= reset
    inst ID_EX of PipelineID_EX @[CPU.scala 106:29]
    ID_EX.io is invalid
    ID_EX.clock <= clock
    ID_EX.reset <= reset
    inst EX_MEM of PipelineEX_MEM @[CPU.scala 107:29]
    EX_MEM.io is invalid
    EX_MEM.clock <= clock
    EX_MEM.reset <= reset
    inst MEM_WB of PipelineMEM_WB @[CPU.scala 108:29]
    MEM_WB.io is invalid
    MEM_WB.clock <= clock
    MEM_WB.reset <= reset
    counter.io.jump <= control.io.jump @[CPU.scala 112:29]
    counter.io.stall <= hazardUnit.io.stall @[CPU.scala 113:29]
    node _T_54 = and(EX_MEM.io.out.zero, EX_MEM.io.out.MEM.branch) @[CPU.scala 114:52]
    node _T_55 = neq(dataMem.io.tx, UInt<1>("h00")) @[CPU.scala 114:98]
    node _T_56 = or(_T_54, _T_55) @[CPU.scala 114:81]
    counter.io.branch <= _T_56 @[CPU.scala 114:29]
    counter.io.branch_t <= EX_MEM.io.out.branch_t @[CPU.scala 115:29]
    node _T_57 = add(EX_MEM.io.out.pc_next, decoder.io.imm) @[CPU.scala 116:54]
    node _T_58 = tail(_T_57, 1) @[CPU.scala 116:54]
    counter.io.jump_t <= _T_58 @[CPU.scala 116:29]
    instMem.io.pc <= counter.io.pc @[CPU.scala 117:29]
    IF_ID.io.stall <= hazardUnit.io.stall @[CPU.scala 119:29]
    IF_ID.io.in.pc_next <= counter.io.pc_next @[CPU.scala 120:29]
    IF_ID.io.in.inst <= instMem.io.inst @[CPU.scala 121:29]
    decoder.io.inst <= IF_ID.io.out.inst @[CPU.scala 125:29]
    regs.io.rs.rs2 <= decoder.io.rs.rs2 @[CPU.scala 126:29]
    regs.io.rs.rs1 <= decoder.io.rs.rs1 @[CPU.scala 126:29]
    hazardUnit.io.rs_id.rs2 <= decoder.io.rs.rs2 @[CPU.scala 128:29]
    hazardUnit.io.rs_id.rs1 <= decoder.io.rs.rs1 @[CPU.scala 128:29]
    hazardUnit.io.rd_ex <= ID_EX.io.out.rd @[CPU.scala 129:29]
    hazardUnit.io.mem_r <= ID_EX.io.out.MEM.read @[CPU.scala 130:29]
    hazardUnit.io.tx_req <= uart.io.tx_req @[CPU.scala 131:29]
    node _T_59 = and(EX_MEM.io.out.zero, EX_MEM.io.out.MEM.branch) @[CPU.scala 132:51]
    hazardUnit.io.branch <= _T_59 @[CPU.scala 132:29]
    control.io.stall <= hazardUnit.io.stall @[CPU.scala 134:29]
    control.io.ctrl.funct7 <= decoder.io.ctrl.funct7 @[CPU.scala 135:29]
    control.io.ctrl.funct3 <= decoder.io.ctrl.funct3 @[CPU.scala 135:29]
    control.io.ctrl.opcode <= decoder.io.ctrl.opcode @[CPU.scala 135:29]
    ID_EX.io.in.WB.rd_mem <= control.io.WB.rd_mem @[CPU.scala 137:29]
    ID_EX.io.in.WB.reg_w <= control.io.WB.reg_w @[CPU.scala 137:29]
    ID_EX.io.in.MEM.func <= control.io.MEM.func @[CPU.scala 138:29]
    ID_EX.io.in.MEM.read <= control.io.MEM.read @[CPU.scala 138:29]
    ID_EX.io.in.MEM.write <= control.io.MEM.write @[CPU.scala 138:29]
    ID_EX.io.in.MEM.branch <= control.io.MEM.branch @[CPU.scala 138:29]
    ID_EX.io.in.EX.alu_op.alt <= control.io.EX.alu_op.alt @[CPU.scala 139:29]
    ID_EX.io.in.EX.alu_op.func <= control.io.EX.alu_op.func @[CPU.scala 139:29]
    ID_EX.io.in.EX.alu_sel <= control.io.EX.alu_sel @[CPU.scala 139:29]
    ID_EX.io.in.EX.opcode <= control.io.EX.opcode @[CPU.scala 139:29]
    ID_EX.io.in.pc_next <= IF_ID.io.out.pc_next @[CPU.scala 140:29]
    ID_EX.io.in.op.op2 <= regs.io.op.op2 @[CPU.scala 141:29]
    ID_EX.io.in.op.op1 <= regs.io.op.op1 @[CPU.scala 141:29]
    ID_EX.io.in.imm <= decoder.io.imm @[CPU.scala 142:29]
    ID_EX.io.in.rs.rs2 <= decoder.io.rs.rs2 @[CPU.scala 143:29]
    ID_EX.io.in.rs.rs1 <= decoder.io.rs.rs1 @[CPU.scala 143:29]
    ID_EX.io.in.rd <= decoder.io.rd @[CPU.scala 144:29]
    fwdUnit.io.rs.rs2 <= ID_EX.io.out.rs.rs2 @[CPU.scala 148:29]
    fwdUnit.io.rs.rs1 <= ID_EX.io.out.rs.rs1 @[CPU.scala 148:29]
    fwdUnit.io.rd_mem <= EX_MEM.io.out.rd @[CPU.scala 149:29]
    fwdUnit.io.rd_wb <= MEM_WB.io.out.rd @[CPU.scala 150:29]
    fwdUnit.io.reg_w_mem <= EX_MEM.io.out.WB.reg_w @[CPU.scala 151:29]
    fwdUnit.io.reg_w_wb <= MEM_WB.io.out.WB.reg_w @[CPU.scala 152:29]
    alu.io.opcode <= ID_EX.io.out.EX.opcode @[CPU.scala 154:29]
    alu.io.alu_op.alt <= ID_EX.io.out.EX.alu_op.alt @[CPU.scala 155:29]
    alu.io.alu_op.func <= ID_EX.io.out.EX.alu_op.func @[CPU.scala 155:29]
    node _T_60 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_61 = mux(_T_60, ID_EX.io.out.op.op1, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_62 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_63 = mux(_T_62, regs.io.res, _T_61) @[Mux.scala 46:16]
    node _T_64 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs1) @[Mux.scala 46:19]
    node _T_65 = mux(_T_64, EX_MEM.io.out.op.op1, _T_63) @[Mux.scala 46:16]
    alu.io.op.op1 <= _T_65 @[CPU.scala 157:19]
    node _T_66 = eq(UInt<1>("h00"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_67 = mux(_T_66, ID_EX.io.out.op.op2, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_68 = eq(UInt<1>("h01"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node _T_69 = mux(_T_68, regs.io.res, _T_67) @[Mux.scala 46:16]
    node _T_70 = eq(UInt<2>("h02"), fwdUnit.io.fwd_rs2) @[Mux.scala 46:19]
    node op2 = mux(_T_70, EX_MEM.io.out.op.op1, _T_69) @[Mux.scala 46:16]
    node _T_71 = mux(ID_EX.io.out.EX.alu_sel, ID_EX.io.out.imm, op2) @[CPU.scala 166:25]
    alu.io.op.op2 <= _T_71 @[CPU.scala 166:19]
    node _T_72 = mux(uart.io.tx_req, UInt<1>("h00"), ID_EX.io.out.MEM.branch) @[CPU.scala 168:35]
    EX_MEM.io.in.MEM.branch <= _T_72 @[CPU.scala 168:29]
    node _T_73 = mux(uart.io.tx_req, UInt<1>("h00"), ID_EX.io.out.MEM.write) @[CPU.scala 169:35]
    EX_MEM.io.in.MEM.write <= _T_73 @[CPU.scala 169:29]
    node _T_74 = mux(uart.io.tx_req, UInt<1>("h00"), ID_EX.io.out.MEM.read) @[CPU.scala 170:35]
    EX_MEM.io.in.MEM.read <= _T_74 @[CPU.scala 170:29]
    node _T_76 = mux(uart.io.tx_req, UInt<3>("h00"), ID_EX.io.out.MEM.func) @[CPU.scala 171:35]
    EX_MEM.io.in.MEM.func <= _T_76 @[CPU.scala 171:29]
    node _T_77 = mux(uart.io.tx_req, UInt<1>("h00"), ID_EX.io.out.WB.reg_w) @[CPU.scala 172:35]
    EX_MEM.io.in.WB.reg_w <= _T_77 @[CPU.scala 172:29]
    node _T_78 = mux(uart.io.tx_req, UInt<1>("h00"), ID_EX.io.out.WB.rd_mem) @[CPU.scala 173:35]
    EX_MEM.io.in.WB.rd_mem <= _T_78 @[CPU.scala 173:29]
    EX_MEM.io.in.pc_next <= ID_EX.io.out.pc_next @[CPU.scala 175:29]
    node _T_79 = shl(ID_EX.io.out.imm, 1) @[CPU.scala 176:73]
    node _T_80 = add(ID_EX.io.out.pc_next, _T_79) @[CPU.scala 176:53]
    node _T_81 = tail(_T_80, 1) @[CPU.scala 176:53]
    EX_MEM.io.in.branch_t <= _T_81 @[CPU.scala 176:29]
    EX_MEM.io.in.op.op2 <= op2 @[CPU.scala 177:29]
    EX_MEM.io.in.zero <= alu.io.zero @[CPU.scala 178:29]
    EX_MEM.io.in.op.op1 <= alu.io.res @[CPU.scala 179:29]
    EX_MEM.io.in.rd <= ID_EX.io.out.rd @[CPU.scala 180:29]
    dataMem.io.mem.func <= EX_MEM.io.out.MEM.func @[CPU.scala 184:29]
    dataMem.io.mem.read <= EX_MEM.io.out.MEM.read @[CPU.scala 184:29]
    dataMem.io.mem.write <= EX_MEM.io.out.MEM.write @[CPU.scala 184:29]
    dataMem.io.mem.branch <= EX_MEM.io.out.MEM.branch @[CPU.scala 184:29]
    dataMem.io.op.op2 <= EX_MEM.io.out.op.op2 @[CPU.scala 185:29]
    dataMem.io.op.op1 <= EX_MEM.io.out.op.op1 @[CPU.scala 185:29]
    dataMem.io.tx_req <= uart.io.tx_req @[CPU.scala 186:29]
    MEM_WB.io.in.WB.rd_mem <= EX_MEM.io.out.WB.rd_mem @[CPU.scala 188:29]
    MEM_WB.io.in.WB.reg_w <= EX_MEM.io.out.WB.reg_w @[CPU.scala 188:29]
    MEM_WB.io.in.rd <= EX_MEM.io.out.rd @[CPU.scala 189:29]
    MEM_WB.io.in.mem_res <= dataMem.io.res @[CPU.scala 190:29]
    MEM_WB.io.in.alu_res <= EX_MEM.io.out.op.op1 @[CPU.scala 191:29]
    regs.io.rd <= MEM_WB.io.out.rd @[CPU.scala 195:29]
    regs.io.reg_w <= MEM_WB.io.out.WB.reg_w @[CPU.scala 196:29]
    node _T_82 = mux(MEM_WB.io.out.WB.rd_mem, MEM_WB.io.out.mem_res, MEM_WB.io.out.alu_res) @[CPU.scala 197:35]
    regs.io.res <= _T_82 @[CPU.scala 197:29]
    uart.io.rxd <= io.rxd @[CPU.scala 201:29]
    dataMem.io.rx <= io.rx_in @[CPU.scala 202:29]
    uart.io.in <= dataMem.io.tx @[CPU.scala 203:29]
    io.txd <= uart.io.txd @[CPU.scala 204:29]
    io.rx_cnt <= dataMem.io.rx_cnt @[CPU.scala 206:29]
    io.pc <= counter.io.pc @[CPU.scala 210:15]
    
