        ; SYMBOLIC DISASSEMBLY OF FILE EPROM_A0.BIN
        ; DATE: 03-09-2023, TIME: 19:34:27  (c)2023 BY N. KOLLEK
        ;
        ORG $A000
        ;
LA000:  JSR LA430         ;A000 20 30 A4 
LA003:  JSR LA009         ;A003 20 09 A0 
        JMP LA414         ;A006 4C 14 A4 
LA009:  SEI               ;A009 78        
        PHA               ;A00A 48        
        TXA               ;A00B 8A        
        PHA               ;A00C 48        
        LDX #L00          ;A00D A2 00 
LA00F:  LDA LA056         ;A00F BD 56 A0 
        BEQ LA01A         ;A012 F0 06 
        JSR LFFD2         ;A014 20 D2 FF 
        INX               ;A017 E8        
        BNE LA00F         ;A018 D0 F5 
LA01A:  PLA               ;A01A 68        
        TAX               ;A01B AA        
        PLA               ;A01C 68        
LA01D:  LDA #L00          ;A01D A9 00 
        STA L0F           ;A01F 85 0F 
        STA L10           ;A021 85 10 
        LDA #L00          ;A023 A9 00 
        STA L01           ;A025 85 01 
        LDA #L10          ;A027 A9 10 
        STA L02           ;A029 85 02 
        LDA #LFF          ;A02B A9 FF 
        STA LE822         ;A02D 8D 22 E8 
        STA LE843         ;A030 8D 43 E8 
        LDA L00           ;A033 A5 00 
        CMP #L18          ;A035 C9 18 
        BEQ LA045         ;A037 F0 0C 
        LDA #LA0          ;A039 A9 A0 
        STA L802F         ;A03B 8D 2F 80 
        LDA #LF2          ;A03E A9 F2 
        STA LE840         ;A040 8D 40 E8 
        BNE LA04F         ;A043 D0 0A 
LA045:  LDA #LF0          ;A045 A9 F0 
        STA LE840         ;A047 8D 40 E8 
        LDA #LA0          ;A04A A9 A0 
        STA L8028         ;A04C 8D 28 80 
LA04F:  LDA #L00          ;A04F A9 00 
        STA LE84F         ;A051 8D 4F E8 
        CLI               ;A054 58        
        RTS               ;A055 60        
LA056:  DB                ;A056 93        
        ORA L2020         ;A057 0D 20 20 
        DB                ;A05A 32         / '2'
        AND L31,X         ;A05B 35 31 
        ROL L20,X         ;A05D 36 20 
        JSR L3220         ;A05F 20 20 32 
        AND L33,X         ;A062 35 33 
        DB                ;A064 32         / '2'
        JSR L5045         ;A065 20 45 50 
        DB                ;A068 52         / 'R'
        DB                ;A069 4F         / 'O'
        EOR L5020         ;A06A 4D 20 50 
        DB                ;A06D 52         / 'R'
        DB                ;A06E 4F         / 'O'
        DB                ;A06F 47         / 'G'
        DB                ;A070 52         / 'R'
        EOR (L4D,X)       ;A071 41 4D 
        EOR L4E49         ;A073 4D 49 4E 
        DB                ;A076 47         / 'G'
        ORA L0D0D         ;A077 0D 0D 0D 
        AND (L2E),Y       ;A07A 31 2E 
        JSR L5245         ;A07C 20 45 52 
        EOR (L53,X)       ;A07F 41 53 
        EOR L20           ;A081 45 20 
        DB                ;A083 43         / 'C'
        PHA               ;A084 48        
        EOR L43           ;A085 45 43 
        DB                ;A087 4B         / 'K'
        ORA L320D         ;A088 0D 0D 32 
        ROL L4C20         ;A08B 2E 20 4C 
        DB                ;A08E 4F         / 'O'
        EOR (L44,X)       ;A08F 41 44 
        JSR L5045         ;A091 20 45 50 
        DB                ;A094 52         / 'R'
        DB                ;A095 4F         / 'O'
        EOR L4420         ;A096 4D 20 44 
        EOR (L54,X)       ;A099 41 54 
        EOR (L0D,X)       ;A09B 41 0D 
        ORA L2E33         ;A09D 0D 33 2E 
        JSR L5045         ;A0A0 20 45 50 
        DB                ;A0A3 52         / 'R'
        DB                ;A0A4 4F         / 'O'
        EOR L5020         ;A0A5 4D 20 50 
        DB                ;A0A8 52         / 'R'
        DB                ;A0A9 4F         / 'O'
        DB                ;A0AA 47         / 'G'
        DB                ;A0AB 52         / 'R'
        EOR (L4D,X)       ;A0AC 41 4D 
        EOR L4E49         ;A0AE 4D 49 4E 
        DB                ;A0B1 47         / 'G'
        ORA L340D         ;A0B2 0D 0D 34 
        ROL L4520         ;A0B5 2E 20 45 
        BVC LA10C         ;A0B8 50 52 
        DB                ;A0BA 4F         / 'O'
        EOR L5620         ;A0BB 4D 20 56 
        EOR L52           ;A0BE 45 52 
        EOR #L46          ;A0C0 49 46      / 'F'
        EOR L0D0D         ;A0C2 59 0D 0D 
        AND L2E,X         ;A0C5 35 2E 
        JSR L454E         ;A0C7 20 4E 45 
        DB                ;A0CA 57         / 'W'
        JSR L4553         ;A0CB 20 53 45 
        DB                ;A0CE 54         / 'T'
        EOR L50,X         ;A0CF 55 50 
        ORA L360D         ;A0D1 0D 0D 36 
        ROL L4520         ;A0D4 2E 20 45 
        CLI               ;A0D7 58        
        EOR #L54          ;A0D8 49 54      / 'T'
        ORA L0D0D         ;A0DA 0D 0D 0D 
        EOR L4E           ;A0DD 45 4E 
        DB                ;A0DF 54         / 'T'
        EOR L52           ;A0E0 45 52 
        JSR L5546         ;A0E2 20 46 55 
        LSR L5443         ;A0E5 4E 43 54 
        EOR #L4F          ;A0E8 49 4F      / 'O'
        LSR L203A         ;A0EA 4E 3A 20 
        ORA L000D         ;A0ED 0D 0D 00 
LA0F0:  ORA L0D0D         ;A0F0 0D 0D 0D 
        ROL A             ;A0F3 2A        
        ROL A             ;A0F4 2A        
        ROL A             ;A0F5 2A        
        JSR L5250         ;A0F6 20 50 52 
        DB                ;A0F9 4F         / 'O'
        DB                ;A0FA 47         / 'G'
        DB                ;A0FB 52         / 'R'
        EOR (L4D,X)       ;A0FC 41 4D 
        EOR L4E49         ;A0FE 4D 49 4E 
        DB                ;A101 47         / 'G'
        JSR L4552         ;A102 20 52 45 
        EOR (L44,X)       ;A105 41 44 
        EOR L000D         ;A107 59 0D 00 
LA10A:  ORA L0D0D         ;A10A 0D 0D 0D 
        ROL A             ;A10D 2A        
        ROL A             ;A10E 2A        
        ROL A             ;A10F 2A        
        JSR L5045         ;A110 20 45 50 
        DB                ;A113 52         / 'R'
        DB                ;A114 4F         / 'O'
        EOR L4C20         ;A115 4D 20 4C 
        DB                ;A118 4F         / 'O'
        EOR (L44,X)       ;A119 41 44 
        EOR L44           ;A11B 45 44 
        JSR L3124         ;A11D 20 24 31 
        BMI LA152         ;A120 30 30 
        BMI LA131         ;A122 30 0D 
        BRK               ;A124 00        
LA125:  ORA L0D0D         ;A125 0D 0D 0D 
        ROL A             ;A128 2A        
        ROL A             ;A129 2A        
        ROL A             ;A12A 2A        
        JSR L5045         ;A12B 20 45 50 
        DB                ;A12E 52         / 'R'
        DB                ;A12F 4F         / 'O'
        EOR L4520         ;A130 4D 20 45 
        DB                ;A133 52         / 'R'
        EOR (L53,X)       ;A134 41 53 
        EOR L44           ;A136 45 44 
        ORA L0D00         ;A138 0D 00 0D 
        ORA L2A0D         ;A13B 0D 0D 2A 
        ROL A             ;A13E 2A        
        ROL A             ;A13F 2A        
        JSR L4556         ;A140 20 56 45 
        DB                ;A143 52         / 'R'
        EOR #L46          ;A144 49 46      / 'F'
        EOR L4320         ;A146 59 20 43 
        DB                ;A149 4F         / 'O'
        EOR L4C50         ;A14A 4D 50 4C 
        EOR L54           ;A14D 45 54 
        EOR L0D           ;A14F 45 0D 
        BRK               ;A151 00        
LA152:  ROL A             ;A152 2A        
        ROL A             ;A153 2A        
        ROL A             ;A154 2A        
        JSR L4556         ;A155 20 56 45 
        DB                ;A158 52         / 'R'
        EOR #L46          ;A159 49 46      / 'F'
        EOR L4520         ;A15B 59 20 45 
        DB                ;A15E 52         / 'R'
        DB                ;A15F 52         / 'R'
        DB                ;A160 4F         / 'O'
        DB                ;A161 52         / 'R'
        JSR L4E49         ;A162 20 49 4E 
        DB                ;A165 3A         / ':'
        BRK               ;A166 00        
LA167:  ROL A             ;A167 2A        
        ROL A             ;A168 2A        
        ROL A             ;A169 2A        
        JSR L5245         ;A16A 20 45 52 
        EOR (L53,X)       ;A16D 41 53 
        EOR L20           ;A16F 45 20 
        EOR L52           ;A171 45 52 
        DB                ;A173 52         / 'R'
        DB                ;A174 4F         / 'O'
        DB                ;A175 52         / 'R'
        JSR L4E49         ;A176 20 49 4E 
        DB                ;A179 3A         / ':'
        JSR L9300         ;A17A 20 00 93 
        ORA L5954         ;A17D 0D 54 59 
        BVC LA1C7         ;A180 50 45 
        JSR L2030         ;A182 20 30 20 
        LSR L4F           ;A185 46 4F 
        DB                ;A187 52         / 'R'
        JSR L3532         ;A188 20 32 35 
        AND (L36),Y       ;A18B 31 36 
        JSR L4F20         ;A18D 20 20 4F 
        DB                ;A190 52         / 'R'
        JSR L2031         ;A191 20 31 20 
        LSR L4F           ;A194 46 4F 
        DB                ;A196 52         / 'R'
        JSR L3532         ;A197 20 32 35 
        DB                ;A19A 33         / '3'
        DB                ;A19B 32         / '2'
        DB                ;A19C 3A         / ':'
        BRK               ;A19D 00        
LA19E:  PHA               ;A19E 48        
        LDA L0F           ;A19F A5 0F 
        STA LE84F         ;A1A1 8D 4F E8 
        JSR LA1D0         ;A1A4 20 D0 A1 
        ORA #L40          ;A1A7 09 40      / '@'
        STA LE84F         ;A1A9 8D 4F E8 
        JSR LA1D0         ;A1AC 20 D0 A1 
        AND #L3F          ;A1AF 29 3F      / '?'
        STA LE84F         ;A1B1 8D 4F E8 
        JSR LA1D0         ;A1B4 20 D0 A1 
        LDA L10           ;A1B7 A5 10 
        STA LE84F         ;A1B9 8D 4F E8 
        JSR LA1D0         ;A1BC 20 D0 A1 
        ORA #L80          ;A1BF 09 80 
        STA LE84F         ;A1C1 8D 4F E8 
        JSR LA1D0         ;A1C4 20 D0 A1 
LA1C7:  AND #L3F          ;A1C7 29 3F      / '?'
        JSR LA1D0         ;A1C9 20 D0 A1 
        STA LE84F         ;A1CC 8D 4F E8 
        PLA               ;A1CF 68        
LA1D0:  RTS               ;A1D0 60        
LA1D1:  JSR LA19E         ;A1D1 20 9E A1 
        STA LE822         ;A1D4 8D 22 E8 
        LDA L00           ;A1D7 A5 00 
        CMP #L18          ;A1D9 C9 18 
        BEQ LA1E4         ;A1DB F0 07 
        LDA #LF0          ;A1DD A9 F0 
        STA LE840         ;A1DF 8D 40 E8 
        BNE LA1F7         ;A1E2 D0 13 
LA1E4:  LDA #L04          ;A1E4 A9 04 
        STA LE840         ;A1E6 8D 40 E8 
        JSR LA1D0         ;A1E9 20 D0 A1 
        JSR LA1D0         ;A1EC 20 D0 A1 
        JSR LA1D0         ;A1EF 20 D0 A1 
        ORA #L02          ;A1F2 09 02 
        STA LE840         ;A1F4 8D 40 E8 
LA1F7:  JSR LA23B         ;A1F7 20 3B A2 
        LDA L00           ;A1FA A5 00 
        CMP #L18          ;A1FC C9 18 
        BEQ LA207         ;A1FE F0 07 
        LDA #LF2          ;A200 A9 F2 
        STA LE840         ;A202 8D 40 E8 
        BNE LA211         ;A205 D0 0A 
LA207:  LDA #L04          ;A207 A9 04 
        STA LE840         ;A209 8D 40 E8 
        LDA #LF0          ;A20C A9 F0 
        STA LE840         ;A20E 8D 40 E8 
LA211:  LDA #LFF          ;A211 A9 FF 
        STA LE822         ;A213 8D 22 E8 
        RTS               ;A216 60        
LA217:  JSR LA19E         ;A217 20 9E A1 
        LDA #LFF          ;A21A A9 FF 
        STA LE822         ;A21C 8D 22 E8 
        LDA L00           ;A21F A5 00 
        CMP #L18          ;A221 C9 18 
        BEQ LA22A         ;A223 F0 05 
        LDA #LF0          ;A225 A9 F0 
        STA LE840         ;A227 8D 40 E8 
LA22A:  LDA LE820         ;A22A AD 20 E8 
        PHA               ;A22D 48        
        LDA L00           ;A22E A5 00 
        CMP #L18          ;A230 C9 18 
        BEQ LA239         ;A232 F0 05 
        LDA #LF2          ;A234 A9 F2 
        STA LE840         ;A236 8D 40 E8 
LA239:  PLA               ;A239 68        
        RTS               ;A23A 60        
LA23B:  TXA               ;A23B 8A        
        PHA               ;A23C 48        
        TYA               ;A23D 98        
        PHA               ;A23E 48        
        LDY #L00          ;A23F A0 00 
        LDX #L27          ;A241 A2 27      / '''
LA243:  DEY               ;A243 88        
        BNE LA243         ;A244 D0 FD 
        DEX               ;A246 CA        
        BNE LA243         ;A247 D0 FA 
        PLA               ;A249 68        
        TAY               ;A24A A8        
        PLA               ;A24B 68        
        TAX               ;A24C AA        
        RTS               ;A24D 60        
LA24E:  LDA L01           ;A24E A5 01 
        PHA               ;A250 48        
        AND #L3F          ;A251 29 3F      / '?'
        STA L0F           ;A253 85 0F 
        LDA L02           ;A255 A5 02 
        STA L10           ;A257 85 10 
        PLA               ;A259 68        
        ROL A             ;A25A 2A        
        ROL L10           ;A25B 26 10 
        ROL A             ;A25D 2A        
        ROL L10           ;A25E 26 10 
        LDA L10           ;A260 A5 10 
        AND #L3F          ;A262 29 3F      / '?'
        STA L10           ;A264 85 10 
LA266:  RTS               ;A266 60        
        NOP               ;A267 EA        
        LDX #LB4          ;A268 A2 B4 
        LDX #L74          ;A26A A2 74      / 't'
        LDX #L53          ;A26C A2 53      / 'S'
        DB                ;A26E A3        
        DB                ;A26F FF        
        DB                ;A270 9F        
        DB                ;A271 72         / 'r'
        LDX #L58          ;A272 A2 58      / 'X'
        RTS               ;A274 60        
        JSR LA01D         ;A275 20 1D A0 
        SEI               ;A278 78        
LA279:  LDY #L00          ;A279 A0 00 
        LDA (L01),Y       ;A27B B1 01 
        JSR LA1D1         ;A27D 20 D1 A1 
        INC L01           ;A280 E6 01 
        BNE LA28D         ;A282 D0 09 
        INC L02           ;A284 E6 02 
        LDA L02           ;A286 A5 02 
        AND #L0F          ;A288 29 0F 
        JSR LA3A5         ;A28A 20 A5 A3 
LA28D:  LDA L02           ;A28D A5 02 
        CMP L00           ;A28F C5 00 
        BEQ LA29C         ;A291 F0 09 
        JSR LA24E         ;A293 20 4E A2 
        JSR LA398         ;A296 20 98 A3 
        CLC               ;A299 18        
        BCC LA279         ;A29A 90 DD 
LA29C:  PHA               ;A29C 48        
        TXA               ;A29D 8A        
        PHA               ;A29E 48        
        LDX #L00          ;A29F A2 00 
LA2A1:  LDA LA0F0         ;A2A1 BD F0 A0 
        BEQ LA2AC         ;A2A4 F0 06 
        JSR LFFD2         ;A2A6 20 D2 FF 
        INX               ;A2A9 E8        
        BNE LA2A1         ;A2AA D0 F5 
LA2AC:  PLA               ;A2AC 68        
        TAX               ;A2AD AA        
        PLA               ;A2AE 68        
        JSR LA392         ;A2AF 20 92 A3 
        JMP LA003         ;A2B2 4C 03 A0 
        JSR LA01D         ;A2B5 20 1D A0 
        SEI               ;A2B8 78        
LA2B9:  LDY #L00          ;A2B9 A0 00 
        JSR LA217         ;A2BB 20 17 A2 
        STA (L01),Y       ;A2BE 91 01 
        INC L01           ;A2C0 E6 01 
        BNE LA2C6         ;A2C2 D0 02 
        INC L02           ;A2C4 E6 02 
LA2C6:  LDA L02           ;A2C6 A5 02 
        CMP L00           ;A2C8 C5 00 
        BEQ LA2D2         ;A2CA F0 06 
        JSR LA24E         ;A2CC 20 4E A2 
        CLC               ;A2CF 18        
        BCC LA2B9         ;A2D0 90 E7 
LA2D2:  PHA               ;A2D2 48        
        TXA               ;A2D3 8A        
        PHA               ;A2D4 48        
        LDX #L00          ;A2D5 A2 00 
LA2D7:  LDA LA10A         ;A2D7 BD 0A A1 
        BEQ LA2E2         ;A2DA F0 06 
        JSR LFFD2         ;A2DC 20 D2 FF 
        INX               ;A2DF E8        
        BNE LA2D7         ;A2E0 D0 F5 
LA2E2:  PLA               ;A2E2 68        
        TAX               ;A2E3 AA        
        PLA               ;A2E4 68        
        JSR LA392         ;A2E5 20 92 A3 
        JMP LA003         ;A2E8 4C 03 A0 
        JSR LA01D         ;A2EB 20 1D A0 
        SEI               ;A2EE 78        
LA2EF:  JSR LA217         ;A2EF 20 17 A2 
        CMP #LFF          ;A2F2 C9 FF 
        BEQ LA326         ;A2F4 F0 30 
        PHA               ;A2F6 48        
        PHA               ;A2F7 48        
        TXA               ;A2F8 8A        
        PHA               ;A2F9 48        
        LDX #L00          ;A2FA A2 00 
LA2FC:  LDA LA167         ;A2FC BD 67 A1 
        BEQ LA307         ;A2FF F0 06 
        JSR LFFD2         ;A301 20 D2 FF 
        INX               ;A304 E8        
        BNE LA2FC         ;A305 D0 F5 
LA307:  PLA               ;A307 68        
        TAX               ;A308 AA        
        PLA               ;A309 68        
        LDA L02           ;A30A A5 02 
        JSR LA3A5         ;A30C 20 A5 A3 
        LDA L01           ;A30F A5 01 
        JSR LA3A5         ;A311 20 A5 A3 
        JSR LA3BE         ;A314 20 BE A3 
        LDA #L3D          ;A317 A9 3D      / '='
        JSR LFFD2         ;A319 20 D2 FF 
        JSR LA3BE         ;A31C 20 BE A3 
        PLA               ;A31F 68        
        JSR LA3A5         ;A320 20 A5 A3 
        JSR LA3C3         ;A323 20 C3 A3 
LA326:  INC L01           ;A326 E6 01 
        BNE LA32C         ;A328 D0 02 
        INC L02           ;A32A E6 02 
LA32C:  LDA L02           ;A32C A5 02 
        CMP L00           ;A32E C5 00 
        BEQ LA33B         ;A330 F0 09 
        JSR LA24E         ;A332 20 4E A2 
        JSR LA398         ;A335 20 98 A3 
        CLC               ;A338 18        
        BCC LA2EF         ;A339 90 B4 
LA33B:  PHA               ;A33B 48        
        TXA               ;A33C 8A        
        PHA               ;A33D 48        
        LDX #L00          ;A33E A2 00 
LA340:  LDA LA125         ;A340 BD 25 A1 
        BEQ LA34B         ;A343 F0 06 
        JSR LFFD2         ;A345 20 D2 FF 
        INX               ;A348 E8        
        BNE LA340         ;A349 D0 F5 
LA34B:  PLA               ;A34B 68        
        TAX               ;A34C AA        
        PLA               ;A34D 68        
        JSR LA392         ;A34E 20 92 A3 
        JMP LA003         ;A351 4C 03 A0 
        JSR LA01D         ;A354 20 1D A0 
        SEI               ;A357 78        
LA358:  LDY #L00          ;A358 A0 00 
        JSR LA217         ;A35A 20 17 A2 
        CMP (L01),Y       ;A35D D1 01 
        BEQ LA364         ;A35F F0 03 
        JSR LA3C8         ;A361 20 C8 A3 
LA364:  INC L01           ;A364 E6 01 
        BNE LA36A         ;A366 D0 02 
        INC L02           ;A368 E6 02 
LA36A:  LDA L02           ;A36A A5 02 
        CMP L00           ;A36C C5 00 
        BEQ LA379         ;A36E F0 09 
        JSR LA24E         ;A370 20 4E A2 
        JSR LA398         ;A373 20 98 A3 
        CLC               ;A376 18        
        BCC LA358         ;A377 90 DF 
LA379:  PHA               ;A379 48        
        TXA               ;A37A 8A        
        PHA               ;A37B 48        
        LDX #L00          ;A37C A2 00 
LA37E:  LDA LA13A         ;A37E BD 3A A1 
        BEQ LA389         ;A381 F0 06 
        JSR LFFD2         ;A383 20 D2 FF 
        INX               ;A386 E8        
        BNE LA37E         ;A387 D0 F5 
LA389:  PLA               ;A389 68        
        TAX               ;A38A AA        
        PLA               ;A38B 68        
        JSR LA392         ;A38C 20 92 A3 
        JMP LA003         ;A38F 4C 03 A0 
LA392:  JSR LFFE4         ;A392 20 E4 FF 
        BEQ LA392         ;A395 F0 FB 
        RTS               ;A397 60        
LA398:  CLI               ;A398 58        
        JSR LFFE4         ;A399 20 E4 FF 
        BNE LA3A0         ;A39C D0 02 
        SEI               ;A39E 78        
        RTS               ;A39F 60        
LA3A0:  PLA               ;A3A0 68        
        PLA               ;A3A1 68        
        JMP LA003         ;A3A2 4C 03 A0 
LA3A5:  PHA               ;A3A5 48        
        LSR A             ;A3A6 4A        
        LSR A             ;A3A7 4A        
        LSR A             ;A3A8 4A        
        LSR A             ;A3A9 4A        
        JSR LA3AE         ;A3AA 20 AE A3 
        PLA               ;A3AD 68        
LA3AE:  AND #L0F          ;A3AE 29 0F 
        CMP #L0A          ;A3B0 C9 0A 
        BCC LA3B7         ;A3B2 90 03 
        CLC               ;A3B4 18        
        ADC #L07          ;A3B5 69 07 
LA3B7:  CLC               ;A3B7 18        
        ADC #L30          ;A3B8 69 30      / '0'
        JSR LFFD2         ;A3BA 20 D2 FF 
        RTS               ;A3BD 60        
LA3BE:  LDA #L20          ;A3BE A9 20      / ' '
        JMP LFFD2         ;A3C0 4C D2 FF 
LA3C3:  LDA #L0D          ;A3C3 A9 0D 
        JMP LFFD2         ;A3C5 4C D2 FF 
LA3C8:  PHA               ;A3C8 48        
        PHA               ;A3C9 48        
        TXA               ;A3CA 8A        
        PHA               ;A3CB 48        
        LDX #L00          ;A3CC A2 00 
LA3CE:  LDA LA152         ;A3CE BD 52 A1 
        BEQ LA3D9         ;A3D1 F0 06 
        JSR LFFD2         ;A3D3 20 D2 FF 
        INX               ;A3D6 E8        
        BNE LA3CE         ;A3D7 D0 F5 
LA3D9:  PLA               ;A3D9 68        
        TAX               ;A3DA AA        
        PLA               ;A3DB 68        
        LDA L02           ;A3DC A5 02 
        JSR LA3A5         ;A3DE 20 A5 A3 
        LDA L01           ;A3E1 A5 01 
        JSR LA3A5         ;A3E3 20 A5 A3 
        JSR LA3BE         ;A3E6 20 BE A3 
        JSR LA3BE         ;A3E9 20 BE A3 
        LDA #L45          ;A3EC A9 45      / 'E'
        JSR LFFD2         ;A3EE 20 D2 FF 
        LDA #L3A          ;A3F1 A9 3A      / ':'
        JSR LFFD2         ;A3F3 20 D2 FF 
        PLA               ;A3F6 68        
        JSR LA3A5         ;A3F7 20 A5 A3 
        JSR LA3BE         ;A3FA 20 BE A3 
        JSR LA3BE         ;A3FD 20 BE A3 
        LDA #L52          ;A400 A9 52      / 'R'
        JSR LFFD2         ;A402 20 D2 FF 
        LDA #L3A          ;A405 A9 3A      / ':'
        JSR LFFD2         ;A407 20 D2 FF 
        LDY #L00          ;A40A A0 00 
        LDA (L01),Y       ;A40C B1 01 
        JSR LA3A5         ;A40E 20 A5 A3 
        JMP LA3C3         ;A411 4C C3 A3 
LA414:  CLI               ;A414 58        
        CLD               ;A415 D8        
LA416:  JSR LFFE4         ;A416 20 E4 FF 
        BEQ LA416         ;A419 F0 FB 
        CMP #L31          ;A41B C9 31      / '1'
        BCC LA416         ;A41D 90 F7 
        CMP #L37          ;A41F C9 37      / '7'
        BCS LA416         ;A421 B0 F3 
        AND #L0F          ;A423 29 0F 
        ASL A             ;A425 0A        
        TAX               ;A426 AA        
        LDA LA266         ;A427 BD 66 A2 
        PHA               ;A42A 48        
        LDA LA265         ;A42B BD 65 A2 
        PHA               ;A42E 48        
        RTS               ;A42F 60        
LA430:  PHA               ;A430 48        
        TXA               ;A431 8A        
        PHA               ;A432 48        
        LDX #L00          ;A433 A2 00 
LA435:  LDA LA17C         ;A435 BD 7C A1 
        BEQ LA440         ;A438 F0 06 
        JSR LFFD2         ;A43A 20 D2 FF 
        INX               ;A43D E8        
        BNE LA435         ;A43E D0 F5 
LA440:  PLA               ;A440 68        
        TAX               ;A441 AA        
        PLA               ;A442 68        
LA443:  JSR LFFE4         ;A443 20 E4 FF 
        BEQ LA443         ;A446 F0 FB 
        CMP #L30          ;A448 C9 30      / '0'
        BEQ LA455         ;A44A F0 09 
        CMP #L31          ;A44C C9 31      / '1'
        BNE LA443         ;A44E D0 F3 
        LDA #L20          ;A450 A9 20      / ' '
        STA L00           ;A452 85 00 
        RTS               ;A454 60        
LA455:  LDA #L18          ;A455 A9 18 
        STA L00           ;A457 85 00 
        RTS               ;A459 60        
        BRK               ;A45A 00        
        BRK               ;A45B 00        
        BRK               ;A45C 00        
        BRK               ;A45D 00        
        BRK               ;A45E 00        
        BRK               ;A45F 00        
        DB                ;A460 FF        
        DB                ;A461 FF        
        DB                ;A462 FF        
        DB                ;A463 FF        
        DB                ;A464 FF        
        DB                ;A465 FF        
        DB                ;A466 FF        
        DB                ;A467 FF        
        DB                ;A468 FF        
        DB                ;A469 FF        
        DB                ;A46A FF        
        DB                ;A46B FF        
        DB                ;A46C FF        
        DB                ;A46D FF        
        DB                ;A46E FF        
        DB                ;A46F FF        
        DB                ;A470 FF        
        DB                ;A471 FF        
        DB                ;A472 FF        
        DB                ;A473 FF        
        DB                ;A474 FF        
        DB                ;A475 FF        
        DB                ;A476 FF        
        DB                ;A477 FF        
        DB                ;A478 FF        
        DB                ;A479 FF        
        DB                ;A47A FF        
        DB                ;A47B FF        
        DB                ;A47C FF        
        DB                ;A47D FF        
        DB                ;A47E FF        
        DB                ;A47F FF        
        DB                ;A480 FF        
        DB                ;A481 FF        
        DB                ;A482 FF        
        DB                ;A483 FF        
        DB                ;A484 FF        
        DB                ;A485 FF        
        DB                ;A486 FF        
        DB                ;A487 FF        
        DB                ;A488 FF        
        DB                ;A489 FF        
        DB                ;A48A FF        
        DB                ;A48B FF        
        DB                ;A48C FF        
        DB                ;A48D FF        
        DB                ;A48E FF        
        DB                ;A48F FF        
        DB                ;A490 FF        
        DB                ;A491 FF        
        DB                ;A492 FF        
        DB                ;A493 FF        
        DB                ;A494 FF        
        DB                ;A495 FF        
        DB                ;A496 FF        
        DB                ;A497 FF        
        DB                ;A498 FF        
        DB                ;A499 FF        
        DB                ;A49A FF        
        DB                ;A49B FF        
        DB                ;A49C FF        
        DB                ;A49D FF        
        DB                ;A49E FF        
        DB                ;A49F FF        
        DB                ;A4A0 FF        
        DB                ;A4A1 FF        
        DB                ;A4A2 FF        
        DB                ;A4A3 FF        
        DB                ;A4A4 FF        
        DB                ;A4A5 FF        
        DB                ;A4A6 FF        
        DB                ;A4A7 FF        
        DB                ;A4A8 FF        
        DB                ;A4A9 FF        
        DB                ;A4AA FF        
        DB                ;A4AB FF        
        DB                ;A4AC FF        
        DB                ;A4AD FF        
        DB                ;A4AE FF        
        DB                ;A4AF FF        
        DB                ;A4B0 FF        
        DB                ;A4B1 FF        
        DB                ;A4B2 FF        
        DB                ;A4B3 FF        
        DB                ;A4B4 FF        
        DB                ;A4B5 FF        
        DB                ;A4B6 FF        
        DB                ;A4B7 FF        
        DB                ;A4B8 FF        
        DB                ;A4B9 FF        
        DB                ;A4BA FF        
        DB                ;A4BB FF        
        DB                ;A4BC FF        
        DB                ;A4BD FF        
        DB                ;A4BE FF        
        DB                ;A4BF FF        
        DB                ;A4C0 FF        
        DB                ;A4C1 FF        
        DB                ;A4C2 FF        
        DB                ;A4C3 FF        
        DB                ;A4C4 FF        
        DB                ;A4C5 FF        
        DB                ;A4C6 FF        
        DB                ;A4C7 FF        
        DB                ;A4C8 FF        
        DB                ;A4C9 FF        
        DB                ;A4CA FF        
        DB                ;A4CB FF        
        DB                ;A4CC FF        
        DB                ;A4CD FF        
        DB                ;A4CE FF        
        DB                ;A4CF FF        
        DB                ;A4D0 FF        
        DB                ;A4D1 FF        
        DB                ;A4D2 FF        
        DB                ;A4D3 FF        
        DB                ;A4D4 FF        
        DB                ;A4D5 FF        
        DB                ;A4D6 FF        
        DB                ;A4D7 FF        
        DB                ;A4D8 FF        
        DB                ;A4D9 FF        
        DB                ;A4DA FF        
        DB                ;A4DB FF        
        DB                ;A4DC FF        
        DB                ;A4DD FF        
        DB                ;A4DE FF        
        DB                ;A4DF FF        
        DB                ;A4E0 FF        
        DB                ;A4E1 FF        
        DB                ;A4E2 FF        
        DB                ;A4E3 FF        
        DB                ;A4E4 FF        
        DB                ;A4E5 FF        
        DB                ;A4E6 FF        
        DB                ;A4E7 FF        
        DB                ;A4E8 FF        
        DB                ;A4E9 FF        
        DB                ;A4EA FF        
        DB                ;A4EB FF        
        DB                ;A4EC FF        
        DB                ;A4ED FF        
        DB                ;A4EE FF        
        DB                ;A4EF FF        
        DB                ;A4F0 FF        
        DB                ;A4F1 FF        
        DB                ;A4F2 FF        
        DB                ;A4F3 FF        
        DB                ;A4F4 FF        
        DB                ;A4F5 FF        
        DB                ;A4F6 FF        
        DB                ;A4F7 FF        
        DB                ;A4F8 FF        
        DB                ;A4F9 FF        
        DB                ;A4FA FF        
        DB                ;A4FB FF        
        DB                ;A4FC FF        
        DB                ;A4FD FF        
        DB                ;A4FE FF        
        DB                ;A4FF FF        
        ;
        ; EXTERNAL EQUATES:
        ;
L0000   EQU   $0000
L0001   EQU   $0001
L0002   EQU   $0002
L0004   EQU   $0004
L0007   EQU   $0007
L000A   EQU   $000A
L000D   EQU   $000D
L000F   EQU   $000F
L0010   EQU   $0010
L0018   EQU   $0018
L0020   EQU   $0020
L0027   EQU   $0027
L002E   EQU   $002E
L0030   EQU   $0030
L0031   EQU   $0031
L0033   EQU   $0033
L0036   EQU   $0036
L0037   EQU   $0037
L003A   EQU   $003A
L003D   EQU   $003D
L003F   EQU   $003F
L0040   EQU   $0040
L0043   EQU   $0043
L0044   EQU   $0044
L0045   EQU   $0045
L0046   EQU   $0046
L004D   EQU   $004D
L004E   EQU   $004E
L004F   EQU   $004F
L0050   EQU   $0050
L0052   EQU   $0052
L0053   EQU   $0053
L0054   EQU   $0054
L0058   EQU   $0058
L0074   EQU   $0074
L0080   EQU   $0080
L00A0   EQU   $00A0
L00B4   EQU   $00B4
L00F0   EQU   $00F0
L00F2   EQU   $00F2
L00FF   EQU   $00FF
L0D00   EQU   $0D00
L0D0D   EQU   $0D0D
L2020   EQU   $2020
L2030   EQU   $2030
L2031   EQU   $2031
L203A   EQU   $203A
L2A0D   EQU   $2A0D
L2E33   EQU   $2E33
L3124   EQU   $3124
L320D   EQU   $320D
L3220   EQU   $3220
L340D   EQU   $340D
L3532   EQU   $3532
L360D   EQU   $360D
L4320   EQU   $4320
L4420   EQU   $4420
L4520   EQU   $4520
L454E   EQU   $454E
L4552   EQU   $4552
L4553   EQU   $4553
L4556   EQU   $4556
L4C20   EQU   $4C20
L4C50   EQU   $4C50
L4E49   EQU   $4E49
L4F20   EQU   $4F20
L5020   EQU   $5020
L5045   EQU   $5045
L5245   EQU   $5245
L5250   EQU   $5250
L5443   EQU   $5443
L5546   EQU   $5546
L5620   EQU   $5620
L5954   EQU   $5954
L8028   EQU   $8028
L802F   EQU   $802F
L9300   EQU   $9300
LE820   EQU   $E820
LE822   EQU   $E822
LE840   EQU   $E840
LE843   EQU   $E843
LE84F   EQU   $E84F
LFFD2   EQU   $FFD2
LFFE4   EQU   $FFE4
        ;
        ; SYMBOL TABLE REFERENCE:
        ;
        ; L0000 0000    L0001 0001    L0002 0002    L0004 0004    
        ; L0007 0007    L000A 000A    L000D 000D    L000F 000F    
        ; L0010 0010    L0018 0018    L0020 0020    L0027 0027    
        ; L002E 002E    L0030 0030    L0031 0031    L0033 0033    
        ; L0036 0036    L0037 0037    L003A 003A    L003D 003D    
        ; L003F 003F    L0040 0040    L0043 0043    L0044 0044    
        ; L0045 0045    L0046 0046    L004D 004D    L004E 004E    
        ; L004F 004F    L0050 0050    L0052 0052    L0053 0053    
        ; L0054 0054    L0058 0058    L0074 0074    L0080 0080    
        ; L00A0 00A0    L00B4 00B4    L00F0 00F0    L00F2 00F2    
        ; L00FF 00FF    L0D00 0D00    L0D0D 0D0D    L2020 2020    
        ; L2030 2030    L2031 2031    L203A 203A    L2A0D 2A0D    
        ; L2E33 2E33    L3124 3124    L320D 320D    L3220 3220    
        ; L340D 340D    L3532 3532    L360D 360D    L4320 4320    
        ; L4420 4420    L4520 4520    L454E 454E    L4552 4552    
        ; L4553 4553    L4556 4556    L4C20 4C20    L4C50 4C50    
        ; L4E49 4E49    L4F20 4F20    L5020 5020    L5045 5045    
        ; L5245 5245    L5250 5250    L5443 5443    L5546 5546    
        ; L5620 5620    L5954 5954    L8028 8028    L802F 802F    
        ; L9300 9300    LA000 A000    LA003 A003    LA009 A009    
        ; LA00F A00F    LA01A A01A    LA01D A01D    LA045 A045    
        ; LA04F A04F    LA056 A056    LA0F0 A0F0    LA10A A10A    
        ; LA10C A10C    LA125 A125    LA131 A131    LA13A A13A    
        ; LA152 A152    LA167 A167    LA17C A17C    LA19E A19E    
        ; LA1C7 A1C7    LA1D0 A1D0    LA1D1 A1D1    LA1E4 A1E4    
        ; LA1F7 A1F7    LA207 A207    LA211 A211    LA217 A217    
        ; LA22A A22A    LA239 A239    LA23B A23B    LA243 A243    
        ; LA24E A24E    LA265 A265    LA266 A266    LA279 A279    
        ; LA28D A28D    LA29C A29C    LA2A1 A2A1    LA2AC A2AC    
        ; LA2B9 A2B9    LA2C6 A2C6    LA2D2 A2D2    LA2D7 A2D7    
        ; LA2E2 A2E2    LA2EF A2EF    LA2FC A2FC    LA307 A307    
        ; LA326 A326    LA32C A32C    LA33B A33B    LA340 A340    
        ; LA34B A34B    LA358 A358    LA364 A364    LA36A A36A    
        ; LA379 A379    LA37E A37E    LA389 A389    LA392 A392    
        ; LA398 A398    LA3A0 A3A0    LA3A5 A3A5    LA3AE A3AE    
        ; LA3B7 A3B7    LA3BE A3BE    LA3C3 A3C3    LA3C8 A3C8    
        ; LA3CE A3CE    LA3D9 A3D9    LA414 A414    LA416 A416    
        ; LA430 A430    LA435 A435    LA440 A440    LA443 A443    
        ; LA455 A455    LE820 E820    LE822 E822    LE840 E840    
        ; LE843 E843    LE84F E84F    LFFD2 FFD2    LFFE4 FFE4    
        ;
        END
