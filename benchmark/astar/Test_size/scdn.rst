                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Fri Feb 12 20:22:10 2021
                                      5 ;--------------------------------------------------------
                                      6 	.module scdn
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _astar
                                     14 	.globl _heuristic
                                     15 	.globl _absolute
                                     16 	.globl _set_estimates
                                     17 	.globl _remove_min
                                     18 	.globl _insert
                                     19 	.globl _init_camefrom
                                     20 	.globl _make_oriented
                                     21 	.globl _resetValues
                                     22 	.globl _j
                                     23 	.globl _i
                                     24 	.globl _priority
                                     25 	.globl _current
                                     26 	.globl _came_from
                                     27 	.globl _frontier_size
                                     28 	.globl _frontier
                                     29 	.globl _a
                                     30 	.globl _P3
                                     31 	.globl _P2
                                     32 	.globl _P1
                                     33 	.globl _P0
                                     34 ;--------------------------------------------------------
                                     35 ; special function registers
                                     36 ;--------------------------------------------------------
                                     37 	.area RSEG    (ABS,DATA)
      000000                         38 	.org 0x0000
                                     39 ;--------------------------------------------------------
                                     40 ; special function bits
                                     41 ;--------------------------------------------------------
                                     42 	.area RSEG    (ABS,DATA)
      000000                         43 	.org 0x0000
                                     44 ;--------------------------------------------------------
                                     45 ; overlayable register banks
                                     46 ;--------------------------------------------------------
                                     47 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                         48 	.ds 8
                                     49 ;--------------------------------------------------------
                                     50 ; internal ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area DSEG    (DATA)
      000008                         53 _P0::
      000008                         54 	.ds 2
      00000A                         55 _P1::
      00000A                         56 	.ds 2
      00000C                         57 _P2::
      00000C                         58 	.ds 2
      00000E                         59 _P3::
      00000E                         60 	.ds 2
      000010                         61 _a::
      000010                         62 	.ds 16
      000020                         63 _frontier::
      000020                         64 	.ds 4
      000024                         65 _frontier_size::
      000024                         66 	.ds 1
      000025                         67 _came_from::
      000025                         68 	.ds 4
      000029                         69 _current::
      000029                         70 	.ds 1
      00002A                         71 _priority::
      00002A                         72 	.ds 1
      00002B                         73 _i::
      00002B                         74 	.ds 1
      00002C                         75 _j::
      00002C                         76 	.ds 1
                                     77 ;--------------------------------------------------------
                                     78 ; overlayable items in internal ram 
                                     79 ;--------------------------------------------------------
                                     80 ;--------------------------------------------------------
                                     81 ; Stack segment in internal ram 
                                     82 ;--------------------------------------------------------
                                     83 	.area	SSEG
      00002E                         84 __start__stack:
      00002E                         85 	.ds	1
                                     86 
                                     87 ;--------------------------------------------------------
                                     88 ; indirectly addressable internal ram data
                                     89 ;--------------------------------------------------------
                                     90 	.area ISEG    (DATA)
                                     91 ;--------------------------------------------------------
                                     92 ; absolute internal ram data
                                     93 ;--------------------------------------------------------
                                     94 	.area IABS    (ABS,DATA)
                                     95 	.area IABS    (ABS,DATA)
                                     96 ;--------------------------------------------------------
                                     97 ; bit data
                                     98 ;--------------------------------------------------------
                                     99 	.area BSEG    (BIT)
                                    100 ;--------------------------------------------------------
                                    101 ; paged external ram data
                                    102 ;--------------------------------------------------------
                                    103 	.area PSEG    (PAG,XDATA)
                                    104 ;--------------------------------------------------------
                                    105 ; external ram data
                                    106 ;--------------------------------------------------------
                                    107 	.area XSEG    (XDATA)
                                    108 ;--------------------------------------------------------
                                    109 ; absolute external ram data
                                    110 ;--------------------------------------------------------
                                    111 	.area XABS    (ABS,XDATA)
                                    112 ;--------------------------------------------------------
                                    113 ; external initialized ram data
                                    114 ;--------------------------------------------------------
                                    115 	.area XISEG   (XDATA)
                                    116 	.area HOME    (CODE)
                                    117 	.area GSINIT0 (CODE)
                                    118 	.area GSINIT1 (CODE)
                                    119 	.area GSINIT2 (CODE)
                                    120 	.area GSINIT3 (CODE)
                                    121 	.area GSINIT4 (CODE)
                                    122 	.area GSINIT5 (CODE)
                                    123 	.area GSINIT  (CODE)
                                    124 	.area GSFINAL (CODE)
                                    125 	.area CSEG    (CODE)
                                    126 ;--------------------------------------------------------
                                    127 ; interrupt vector 
                                    128 ;--------------------------------------------------------
                                    129 	.area HOME    (CODE)
      000000                        130 __interrupt_vect:
      000000 02 00 06         [24]  131 	ljmp	__sdcc_gsinit_startup
                                    132 ;--------------------------------------------------------
                                    133 ; global & static initialisations
                                    134 ;--------------------------------------------------------
                                    135 	.area HOME    (CODE)
                                    136 	.area GSINIT  (CODE)
                                    137 	.area GSFINAL (CODE)
                                    138 	.area GSINIT  (CODE)
                                    139 	.globl __sdcc_gsinit_startup
                                    140 	.globl __sdcc_program_startup
                                    141 	.globl __start__stack
                                    142 	.globl __mcs51_genXINIT
                                    143 	.globl __mcs51_genXRAMCLEAR
                                    144 	.globl __mcs51_genRAMCLEAR
                                    145 ;	./values_8051.h:5: int8_t a[size][size] = {{-93, 107, 12, -113},{-4, 80, 11, 51},{19, 51, 54, 65},{42, 121, -123, -110}};
      00005F 75 10 A3         [24]  146 	mov	_a,#0xA3
      000062 75 11 6B         [24]  147 	mov	(_a + 0x0001),#0x6B
      000065 75 12 0C         [24]  148 	mov	(_a + 0x0002),#0x0C
      000068 75 13 8F         [24]  149 	mov	(_a + 0x0003),#0x8F
      00006B 75 14 FC         [24]  150 	mov	(_a + 0x0004),#0xFC
      00006E 75 15 50         [24]  151 	mov	(_a + 0x0005),#0x50
      000071 75 16 0B         [24]  152 	mov	(_a + 0x0006),#0x0B
      000074 75 17 33         [24]  153 	mov	(_a + 0x0007),#0x33
      000077 75 18 13         [24]  154 	mov	(_a + 0x0008),#0x13
      00007A 75 19 33         [24]  155 	mov	(_a + 0x0009),#0x33
      00007D 75 1A 36         [24]  156 	mov	(_a + 0x000a),#0x36
      000080 75 1B 41         [24]  157 	mov	(_a + 0x000b),#0x41
      000083 75 1C 2A         [24]  158 	mov	(_a + 0x000c),#0x2A
      000086 75 1D 79         [24]  159 	mov	(_a + 0x000d),#0x79
      000089 75 1E 85         [24]  160 	mov	(_a + 0x000e),#0x85
      00008C 75 1F 92         [24]  161 	mov	(_a + 0x000f),#0x92
                                    162 ;	scdn.c:11: TARGET_TYPE frontier_size = 0;
      00008F 75 24 00         [24]  163 	mov	_frontier_size,#0x00
                                    164 ;	scdn.c:14: TARGET_INDEX current = 0;
      000092 75 29 00         [24]  165 	mov	_current,#0x00
                                    166 ;	scdn.c:16: TARGET_TYPE priority = 0;
      000095 75 2A 00         [24]  167 	mov	_priority,#0x00
                                    168 	.area GSFINAL (CODE)
      000098 02 00 03         [24]  169 	ljmp	__sdcc_program_startup
                                    170 ;--------------------------------------------------------
                                    171 ; Home
                                    172 ;--------------------------------------------------------
                                    173 	.area HOME    (CODE)
                                    174 	.area HOME    (CODE)
      000003                        175 __sdcc_program_startup:
      000003 02 04 3E         [24]  176 	ljmp	_main
                                    177 ;	return from main will return to caller
                                    178 ;--------------------------------------------------------
                                    179 ; code
                                    180 ;--------------------------------------------------------
                                    181 	.area CSEG    (CODE)
                                    182 ;------------------------------------------------------------
                                    183 ;Allocation info for local variables in function 'resetValues'
                                    184 ;------------------------------------------------------------
                                    185 ;	scdn.c:20: void resetValues()
                                    186 ;	-----------------------------------------
                                    187 ;	 function resetValues
                                    188 ;	-----------------------------------------
      00009B                        189 _resetValues:
                           000007   190 	ar7 = 0x07
                           000006   191 	ar6 = 0x06
                           000005   192 	ar5 = 0x05
                           000004   193 	ar4 = 0x04
                           000003   194 	ar3 = 0x03
                           000002   195 	ar2 = 0x02
                           000001   196 	ar1 = 0x01
                           000000   197 	ar0 = 0x00
                                    198 ;	scdn.c:22: P0 = 0;
      00009B E4               [12]  199 	clr	a
      00009C F5 08            [12]  200 	mov	_P0,a
      00009E F5 09            [12]  201 	mov	(_P0 + 1),a
                                    202 ;	scdn.c:23: P1 = 0;
      0000A0 F5 0A            [12]  203 	mov	_P1,a
      0000A2 F5 0B            [12]  204 	mov	(_P1 + 1),a
                                    205 ;	scdn.c:24: P2 = 0;
      0000A4 F5 0C            [12]  206 	mov	_P2,a
      0000A6 F5 0D            [12]  207 	mov	(_P2 + 1),a
                                    208 ;	scdn.c:25: P3 = 0;
      0000A8 F5 0E            [12]  209 	mov	_P3,a
      0000AA F5 0F            [12]  210 	mov	(_P3 + 1),a
      0000AC 22               [24]  211 	ret
                                    212 ;------------------------------------------------------------
                                    213 ;Allocation info for local variables in function 'make_oriented'
                                    214 ;------------------------------------------------------------
                                    215 ;	scdn.c:67: void make_oriented()
                                    216 ;	-----------------------------------------
                                    217 ;	 function make_oriented
                                    218 ;	-----------------------------------------
      0000AD                        219 _make_oriented:
                                    220 ;	scdn.c:69: for(i = 0; 
      0000AD 75 2B 00         [24]  221 	mov	_i,#0x00
      0000B0                        222 00112$:
                                    223 ;	scdn.c:73: a[i][i] = -1;
      0000B0 E5 2B            [12]  224 	mov	a,_i
      0000B2 25 2B            [12]  225 	add	a,_i
      0000B4 25 E0            [12]  226 	add	a,acc
      0000B6 24 10            [12]  227 	add	a,#_a
      0000B8 FF               [12]  228 	mov	r7,a
      0000B9 25 2B            [12]  229 	add	a,_i
      0000BB F8               [12]  230 	mov	r0,a
      0000BC 76 FF            [12]  231 	mov	@r0,#0xFF
                                    232 ;	scdn.c:76: a[size-1][i] = -1;
      0000BE E5 2B            [12]  233 	mov	a,_i
      0000C0 24 1C            [12]  234 	add	a,#(_a + 0x000c)
      0000C2 F8               [12]  235 	mov	r0,a
      0000C3 76 FF            [12]  236 	mov	@r0,#0xFF
                                    237 ;	scdn.c:78: for(j = 0; 
      0000C5 75 2C 00         [24]  238 	mov	_j,#0x00
      0000C8                        239 00110$:
                                    240 ;	scdn.c:82: if(a[i][j] < 0
      0000C8 E5 2B            [12]  241 	mov	a,_i
      0000CA 25 2B            [12]  242 	add	a,_i
      0000CC 25 E0            [12]  243 	add	a,acc
      0000CE FF               [12]  244 	mov	r7,a
      0000CF 24 10            [12]  245 	add	a,#_a
      0000D1 25 2C            [12]  246 	add	a,_j
      0000D3 F9               [12]  247 	mov	r1,a
      0000D4 E7               [12]  248 	mov	a,@r1
      0000D5 FE               [12]  249 	mov	r6,a
      0000D6 30 E7 35         [24]  250 	jnb	acc.7,00104$
                                    251 ;	scdn.c:84: && a[i][j] != -1 )
      0000D9 E5 2C            [12]  252 	mov	a,_j
      0000DB B5 2B 02         [24]  253 	cjne	a,_i,00138$
      0000DE 80 2E            [24]  254 	sjmp	00104$
      0000E0                        255 00138$:
      0000E0 EF               [12]  256 	mov	a,r7
      0000E1 24 10            [12]  257 	add	a,#_a
      0000E3 25 2C            [12]  258 	add	a,_j
      0000E5 F9               [12]  259 	mov	r1,a
      0000E6 87 06            [24]  260 	mov	ar6,@r1
      0000E8 BE FF 02         [24]  261 	cjne	r6,#0xFF,00139$
      0000EB 80 21            [24]  262 	sjmp	00104$
      0000ED                        263 00139$:
                                    264 ;	scdn.c:86: a[i][j] *= -1;
      0000ED EF               [12]  265 	mov	a,r7
      0000EE 24 10            [12]  266 	add	a,#_a
      0000F0 FF               [12]  267 	mov	r7,a
      0000F1 25 2C            [12]  268 	add	a,_j
      0000F3 F9               [12]  269 	mov	r1,a
      0000F4 E5 2C            [12]  270 	mov	a,_j
      0000F6 2F               [12]  271 	add	a,r7
      0000F7 F8               [12]  272 	mov	r0,a
      0000F8 86 07            [24]  273 	mov	ar7,@r0
      0000FA C3               [12]  274 	clr	c
      0000FB E4               [12]  275 	clr	a
      0000FC 9F               [12]  276 	subb	a,r7
      0000FD F7               [12]  277 	mov	@r1,a
                                    278 ;	scdn.c:87: a[j][i] = -1;
      0000FE E5 2C            [12]  279 	mov	a,_j
      000100 25 2C            [12]  280 	add	a,_j
      000102 25 E0            [12]  281 	add	a,acc
      000104 24 10            [12]  282 	add	a,#_a
      000106 FF               [12]  283 	mov	r7,a
      000107 25 2B            [12]  284 	add	a,_i
      000109 F8               [12]  285 	mov	r0,a
      00010A 76 FF            [12]  286 	mov	@r0,#0xFF
      00010C 80 1E            [24]  287 	sjmp	00111$
      00010E                        288 00104$:
                                    289 ;	scdn.c:92: if(a[j][i] >= 0)
      00010E E5 2C            [12]  290 	mov	a,_j
      000110 25 2C            [12]  291 	add	a,_j
      000112 25 E0            [12]  292 	add	a,acc
      000114 24 10            [12]  293 	add	a,#_a
      000116 25 2B            [12]  294 	add	a,_i
      000118 F9               [12]  295 	mov	r1,a
      000119 E7               [12]  296 	mov	a,@r1
      00011A FF               [12]  297 	mov	r7,a
      00011B 20 E7 0E         [24]  298 	jb	acc.7,00111$
                                    299 ;	scdn.c:93: a[i][j] = -1;
      00011E E5 2B            [12]  300 	mov	a,_i
      000120 25 2B            [12]  301 	add	a,_i
      000122 25 E0            [12]  302 	add	a,acc
      000124 24 10            [12]  303 	add	a,#_a
      000126 FF               [12]  304 	mov	r7,a
      000127 25 2C            [12]  305 	add	a,_j
      000129 F8               [12]  306 	mov	r0,a
      00012A 76 FF            [12]  307 	mov	@r0,#0xFF
      00012C                        308 00111$:
                                    309 ;	scdn.c:80: j++)
      00012C 05 2C            [12]  310 	inc	_j
                                    311 ;	scdn.c:79: j < size; 
      00012E 74 FC            [12]  312 	mov	a,#0x100 - 0x04
      000130 25 2C            [12]  313 	add	a,_j
      000132 40 03            [24]  314 	jc	00141$
      000134 02 00 C8         [24]  315 	ljmp	00110$
      000137                        316 00141$:
                                    317 ;	scdn.c:71: i++)
      000137 05 2B            [12]  318 	inc	_i
                                    319 ;	scdn.c:70: i < size; 
      000139 74 FC            [12]  320 	mov	a,#0x100 - 0x04
      00013B 25 2B            [12]  321 	add	a,_i
      00013D 40 03            [24]  322 	jc	00142$
      00013F 02 00 B0         [24]  323 	ljmp	00112$
      000142                        324 00142$:
      000142 22               [24]  325 	ret
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'init_camefrom'
                                    328 ;------------------------------------------------------------
                                    329 ;	scdn.c:100: void init_camefrom()
                                    330 ;	-----------------------------------------
                                    331 ;	 function init_camefrom
                                    332 ;	-----------------------------------------
      000143                        333 _init_camefrom:
                                    334 ;	scdn.c:102: for(i = 0;
      000143 75 2B 00         [24]  335 	mov	_i,#0x00
      000146                        336 00102$:
                                    337 ;	scdn.c:105: came_from[i] = -1;
      000146 E5 2B            [12]  338 	mov	a,_i
      000148 24 25            [12]  339 	add	a,#_came_from
      00014A F8               [12]  340 	mov	r0,a
      00014B 76 FF            [12]  341 	mov	@r0,#0xFF
                                    342 ;	scdn.c:104: i++)
      00014D 05 2B            [12]  343 	inc	_i
                                    344 ;	scdn.c:103: i < size;
      00014F 74 FC            [12]  345 	mov	a,#0x100 - 0x04
      000151 25 2B            [12]  346 	add	a,_i
      000153 50 F1            [24]  347 	jnc	00102$
      000155 22               [24]  348 	ret
                                    349 ;------------------------------------------------------------
                                    350 ;Allocation info for local variables in function 'insert'
                                    351 ;------------------------------------------------------------
                                    352 ;priority                  Allocated to stack - _bp -3
                                    353 ;node                      Allocated to registers r7 
                                    354 ;------------------------------------------------------------
                                    355 ;	scdn.c:108: void insert(TARGET_INDEX node, TARGET_TYPE priority)
                                    356 ;	-----------------------------------------
                                    357 ;	 function insert
                                    358 ;	-----------------------------------------
      000156                        359 _insert:
      000156 C0 2D            [24]  360 	push	_bp
      000158 85 81 2D         [24]  361 	mov	_bp,sp
                                    362 ;	scdn.c:110: frontier[node] = priority;
      00015B E5 82            [12]  363 	mov	a,dpl
      00015D 24 20            [12]  364 	add	a,#_frontier
      00015F F8               [12]  365 	mov	r0,a
      000160 E5 2D            [12]  366 	mov	a,_bp
      000162 24 FD            [12]  367 	add	a,#0xfd
      000164 F9               [12]  368 	mov	r1,a
      000165 E7               [12]  369 	mov	a,@r1
      000166 F6               [12]  370 	mov	@r0,a
                                    371 ;	scdn.c:111: ++frontier_size;
      000167 05 24            [12]  372 	inc	_frontier_size
      000169 D0 2D            [24]  373 	pop	_bp
      00016B 22               [24]  374 	ret
                                    375 ;------------------------------------------------------------
                                    376 ;Allocation info for local variables in function 'remove_min'
                                    377 ;------------------------------------------------------------
                                    378 ;min                       Allocated to registers r7 
                                    379 ;------------------------------------------------------------
                                    380 ;	scdn.c:114: void remove_min()
                                    381 ;	-----------------------------------------
                                    382 ;	 function remove_min
                                    383 ;	-----------------------------------------
      00016C                        384 _remove_min:
                                    385 ;	scdn.c:116: TARGET_TYPE min = 127;
      00016C 7F 7F            [12]  386 	mov	r7,#0x7F
                                    387 ;	scdn.c:118: for(i  = 0;
      00016E 75 2B 00         [24]  388 	mov	_i,#0x00
      000171                        389 00105$:
                                    390 ;	scdn.c:122: if(frontier[i] <= min && 
      000171 E5 2B            [12]  391 	mov	a,_i
      000173 24 20            [12]  392 	add	a,#_frontier
      000175 F9               [12]  393 	mov	r1,a
      000176 87 06            [24]  394 	mov	ar6,@r1
      000178 C3               [12]  395 	clr	c
      000179 EF               [12]  396 	mov	a,r7
      00017A 64 80            [12]  397 	xrl	a,#0x80
      00017C 8E F0            [24]  398 	mov	b,r6
      00017E 63 F0 80         [24]  399 	xrl	b,#0x80
      000181 95 F0            [12]  400 	subb	a,b
      000183 40 08            [24]  401 	jc	00106$
                                    402 ;	scdn.c:123: frontier[i] != 0)
      000185 EE               [12]  403 	mov	a,r6
      000186 60 05            [24]  404 	jz	00106$
                                    405 ;	scdn.c:125: min = frontier[i];
      000188 8E 07            [24]  406 	mov	ar7,r6
                                    407 ;	scdn.c:126: current = i;
      00018A 85 2B 29         [24]  408 	mov	_current,_i
      00018D                        409 00106$:
                                    410 ;	scdn.c:120: i++)
      00018D 05 2B            [12]  411 	inc	_i
                                    412 ;	scdn.c:119: i < size; 
      00018F 74 FC            [12]  413 	mov	a,#0x100 - 0x04
      000191 25 2B            [12]  414 	add	a,_i
      000193 50 DC            [24]  415 	jnc	00105$
                                    416 ;	scdn.c:130: --frontier_size;
      000195 15 24            [12]  417 	dec	_frontier_size
                                    418 ;	scdn.c:131: frontier[current] = 0;
      000197 E5 29            [12]  419 	mov	a,_current
      000199 24 20            [12]  420 	add	a,#_frontier
      00019B F8               [12]  421 	mov	r0,a
      00019C 76 00            [12]  422 	mov	@r0,#0x00
      00019E 22               [24]  423 	ret
                                    424 ;------------------------------------------------------------
                                    425 ;Allocation info for local variables in function 'set_estimates'
                                    426 ;------------------------------------------------------------
                                    427 ;	scdn.c:134: void set_estimates()
                                    428 ;	-----------------------------------------
                                    429 ;	 function set_estimates
                                    430 ;	-----------------------------------------
      00019F                        431 _set_estimates:
                                    432 ;	scdn.c:136: for(i = 0; 
      00019F 75 2B 00         [24]  433 	mov	_i,#0x00
      0001A2                        434 00105$:
                                    435 ;	scdn.c:140: if(i == 0)
      0001A2 E5 2B            [12]  436 	mov	a,_i
                                    437 ;	scdn.c:141: a[0][0] = 0;
      0001A4 70 04            [24]  438 	jnz	00102$
      0001A6 F5 10            [12]  439 	mov	_a,a
      0001A8 80 0E            [24]  440 	sjmp	00106$
      0001AA                        441 00102$:
                                    442 ;	scdn.c:143: a[i][i] = 127;
      0001AA E5 2B            [12]  443 	mov	a,_i
      0001AC 25 2B            [12]  444 	add	a,_i
      0001AE 25 E0            [12]  445 	add	a,acc
      0001B0 24 10            [12]  446 	add	a,#_a
      0001B2 FF               [12]  447 	mov	r7,a
      0001B3 25 2B            [12]  448 	add	a,_i
      0001B5 F8               [12]  449 	mov	r0,a
      0001B6 76 7F            [12]  450 	mov	@r0,#0x7F
      0001B8                        451 00106$:
                                    452 ;	scdn.c:138: i++)
      0001B8 05 2B            [12]  453 	inc	_i
                                    454 ;	scdn.c:137: i < size; 
      0001BA 74 FC            [12]  455 	mov	a,#0x100 - 0x04
      0001BC 25 2B            [12]  456 	add	a,_i
      0001BE 50 E2            [24]  457 	jnc	00105$
      0001C0 22               [24]  458 	ret
                                    459 ;------------------------------------------------------------
                                    460 ;Allocation info for local variables in function 'absolute'
                                    461 ;------------------------------------------------------------
                                    462 ;n                         Allocated to registers r7 
                                    463 ;------------------------------------------------------------
                                    464 ;	scdn.c:148: TARGET_TYPE absolute(TARGET_TYPE n)
                                    465 ;	-----------------------------------------
                                    466 ;	 function absolute
                                    467 ;	-----------------------------------------
      0001C1                        468 _absolute:
      0001C1 AF 82            [24]  469 	mov	r7,dpl
                                    470 ;	scdn.c:150: return n > 0 ? n : -n; 
      0001C3 C3               [12]  471 	clr	c
      0001C4 74 80            [12]  472 	mov	a,#(0x00 ^ 0x80)
      0001C6 8F F0            [24]  473 	mov	b,r7
      0001C8 63 F0 80         [24]  474 	xrl	b,#0x80
      0001CB 95 F0            [12]  475 	subb	a,b
      0001CD 50 04            [24]  476 	jnc	00103$
      0001CF 8F 06            [24]  477 	mov	ar6,r7
      0001D1 80 04            [24]  478 	sjmp	00104$
      0001D3                        479 00103$:
      0001D3 C3               [12]  480 	clr	c
      0001D4 E4               [12]  481 	clr	a
      0001D5 9F               [12]  482 	subb	a,r7
      0001D6 FE               [12]  483 	mov	r6,a
      0001D7                        484 00104$:
      0001D7 8E 82            [24]  485 	mov	dpl,r6
      0001D9 22               [24]  486 	ret
                                    487 ;------------------------------------------------------------
                                    488 ;Allocation info for local variables in function 'heuristic'
                                    489 ;------------------------------------------------------------
                                    490 ;current                   Allocated to stack - _bp -3
                                    491 ;path_cost                 Allocated to stack - _bp -4
                                    492 ;goal                      Allocated to registers r7 
                                    493 ;------------------------------------------------------------
                                    494 ;	scdn.c:153: TARGET_TYPE heuristic(TARGET_INDEX goal, TARGET_INDEX current, TARGET_TYPE path_cost)
                                    495 ;	-----------------------------------------
                                    496 ;	 function heuristic
                                    497 ;	-----------------------------------------
      0001DA                        498 _heuristic:
      0001DA C0 2D            [24]  499 	push	_bp
      0001DC 85 81 2D         [24]  500 	mov	_bp,sp
      0001DF AF 82            [24]  501 	mov	r7,dpl
                                    502 ;	scdn.c:156: if(a[current][goal] > -1) 
      0001E1 E5 2D            [12]  503 	mov	a,_bp
      0001E3 24 FD            [12]  504 	add	a,#0xfd
      0001E5 F8               [12]  505 	mov	r0,a
      0001E6 E6               [12]  506 	mov	a,@r0
      0001E7 25 E0            [12]  507 	add	a,acc
      0001E9 25 E0            [12]  508 	add	a,acc
      0001EB 24 10            [12]  509 	add	a,#_a
      0001ED FE               [12]  510 	mov	r6,a
      0001EE 2F               [12]  511 	add	a,r7
      0001EF F9               [12]  512 	mov	r1,a
      0001F0 87 07            [24]  513 	mov	ar7,@r1
      0001F2 C3               [12]  514 	clr	c
      0001F3 74 7F            [12]  515 	mov	a,#(0xFF ^ 0x80)
      0001F5 8F F0            [24]  516 	mov	b,r7
      0001F7 63 F0 80         [24]  517 	xrl	b,#0x80
      0001FA 95 F0            [12]  518 	subb	a,b
      0001FC 50 05            [24]  519 	jnc	00102$
                                    520 ;	scdn.c:157: return 1;
      0001FE 75 82 01         [24]  521 	mov	dpl,#0x01
      000201 80 1F            [24]  522 	sjmp	00103$
      000203                        523 00102$:
                                    524 ;	scdn.c:161: return absolute((int8_t)0 - (size/2)) + absolute(path_cost - (size/2));
      000203 75 82 FE         [24]  525 	mov	dpl,#0xFE
      000206 12 01 C1         [24]  526 	lcall	_absolute
      000209 AF 82            [24]  527 	mov	r7,dpl
      00020B E5 2D            [12]  528 	mov	a,_bp
      00020D 24 FC            [12]  529 	add	a,#0xfc
      00020F F8               [12]  530 	mov	r0,a
      000210 E6               [12]  531 	mov	a,@r0
      000211 24 FE            [12]  532 	add	a,#0xFE
      000213 F5 82            [12]  533 	mov	dpl,a
      000215 C0 07            [24]  534 	push	ar7
      000217 12 01 C1         [24]  535 	lcall	_absolute
      00021A AE 82            [24]  536 	mov	r6,dpl
      00021C D0 07            [24]  537 	pop	ar7
      00021E EE               [12]  538 	mov	a,r6
      00021F 2F               [12]  539 	add	a,r7
      000220 F5 82            [12]  540 	mov	dpl,a
      000222                        541 00103$:
      000222 D0 2D            [24]  542 	pop	_bp
      000224 22               [24]  543 	ret
                                    544 ;------------------------------------------------------------
                                    545 ;Allocation info for local variables in function 'astar'
                                    546 ;------------------------------------------------------------
                                    547 ;goal                      Allocated to stack - _bp -3
                                    548 ;a                         Allocated to stack - _bp -6
                                    549 ;size                      Allocated to registers r7 
                                    550 ;sloc0                     Allocated to stack - _bp +1
                                    551 ;sloc1                     Allocated to stack - _bp +4
                                    552 ;------------------------------------------------------------
                                    553 ;	scdn.c:164: void astar(TARGET_INDEX size, TARGET_INDEX goal, TARGET_TYPE a[size][size])
                                    554 ;	-----------------------------------------
                                    555 ;	 function astar
                                    556 ;	-----------------------------------------
      000225                        557 _astar:
      000225 C0 2D            [24]  558 	push	_bp
      000227 E5 81            [12]  559 	mov	a,sp
      000229 F5 2D            [12]  560 	mov	_bp,a
      00022B 24 05            [12]  561 	add	a,#0x05
      00022D F5 81            [12]  562 	mov	sp,a
      00022F AF 82            [24]  563 	mov	r7,dpl
                                    564 ;	scdn.c:166: set_estimates();
      000231 C0 07            [24]  565 	push	ar7
      000233 12 01 9F         [24]  566 	lcall	_set_estimates
                                    567 ;	scdn.c:167: insert(0,0);
      000236 E4               [12]  568 	clr	a
      000237 C0 E0            [24]  569 	push	acc
      000239 75 82 00         [24]  570 	mov	dpl,#0x00
      00023C 12 01 56         [24]  571 	lcall	_insert
      00023F 15 81            [12]  572 	dec	sp
      000241 D0 07            [24]  573 	pop	ar7
                                    574 ;	scdn.c:169: while(frontier_size > 0)
      000243                        575 00107$:
      000243 C3               [12]  576 	clr	c
      000244 74 80            [12]  577 	mov	a,#(0x00 ^ 0x80)
      000246 85 24 F0         [24]  578 	mov	b,_frontier_size
      000249 63 F0 80         [24]  579 	xrl	b,#0x80
      00024C 95 F0            [12]  580 	subb	a,b
      00024E 40 03            [24]  581 	jc	00136$
      000250 02 04 38         [24]  582 	ljmp	00113$
      000253                        583 00136$:
                                    584 ;	scdn.c:171: remove_min();
      000253 C0 07            [24]  585 	push	ar7
      000255 12 01 6C         [24]  586 	lcall	_remove_min
      000258 D0 07            [24]  587 	pop	ar7
                                    588 ;	scdn.c:173: if(current == goal)
      00025A E5 2D            [12]  589 	mov	a,_bp
      00025C 24 FD            [12]  590 	add	a,#0xfd
      00025E F8               [12]  591 	mov	r0,a
      00025F E6               [12]  592 	mov	a,@r0
      000260 B5 29 03         [24]  593 	cjne	a,_current,00137$
      000263 02 04 38         [24]  594 	ljmp	00113$
      000266                        595 00137$:
                                    596 ;	scdn.c:176: for(i = 0; 
      000266 75 2B 00         [24]  597 	mov	_i,#0x00
      000269                        598 00111$:
                                    599 ;	scdn.c:177: i < size; 
      000269 C3               [12]  600 	clr	c
      00026A E5 2B            [12]  601 	mov	a,_i
      00026C 9F               [12]  602 	subb	a,r7
      00026D 50 D4            [24]  603 	jnc	00107$
                                    604 ;	scdn.c:180: if(a[current][i] != -1 &&
      00026F E5 29            [12]  605 	mov	a,_current
      000271 75 F0 04         [24]  606 	mov	b,#0x04
      000274 A4               [48]  607 	mul	ab
      000275 FD               [12]  608 	mov	r5,a
      000276 AE F0            [24]  609 	mov	r6,b
      000278 E5 2D            [12]  610 	mov	a,_bp
      00027A 24 FA            [12]  611 	add	a,#0xfa
      00027C F8               [12]  612 	mov	r0,a
      00027D ED               [12]  613 	mov	a,r5
      00027E 26               [12]  614 	add	a,@r0
      00027F FA               [12]  615 	mov	r2,a
      000280 EE               [12]  616 	mov	a,r6
      000281 08               [12]  617 	inc	r0
      000282 36               [12]  618 	addc	a,@r0
      000283 FB               [12]  619 	mov	r3,a
      000284 08               [12]  620 	inc	r0
      000285 86 04            [24]  621 	mov	ar4,@r0
      000287 E5 2B            [12]  622 	mov	a,_i
      000289 2A               [12]  623 	add	a,r2
      00028A FA               [12]  624 	mov	r2,a
      00028B E4               [12]  625 	clr	a
      00028C 3B               [12]  626 	addc	a,r3
      00028D FB               [12]  627 	mov	r3,a
      00028E 8A 82            [24]  628 	mov	dpl,r2
      000290 8B 83            [24]  629 	mov	dph,r3
      000292 8C F0            [24]  630 	mov	b,r4
      000294 12 04 7B         [24]  631 	lcall	__gptrget
      000297 FA               [12]  632 	mov	r2,a
      000298 BA FF 03         [24]  633 	cjne	r2,#0xFF,00139$
      00029B 02 04 33         [24]  634 	ljmp	00112$
      00029E                        635 00139$:
                                    636 ;	scdn.c:181: a[current][current] + a[current][i] < a[i][i])
      00029E C0 07            [24]  637 	push	ar7
      0002A0 E5 2D            [12]  638 	mov	a,_bp
      0002A2 24 FA            [12]  639 	add	a,#0xfa
      0002A4 F8               [12]  640 	mov	r0,a
      0002A5 A9 2D            [24]  641 	mov	r1,_bp
      0002A7 09               [12]  642 	inc	r1
      0002A8 ED               [12]  643 	mov	a,r5
      0002A9 26               [12]  644 	add	a,@r0
      0002AA F7               [12]  645 	mov	@r1,a
      0002AB EE               [12]  646 	mov	a,r6
      0002AC 08               [12]  647 	inc	r0
      0002AD 36               [12]  648 	addc	a,@r0
      0002AE 09               [12]  649 	inc	r1
      0002AF F7               [12]  650 	mov	@r1,a
      0002B0 08               [12]  651 	inc	r0
      0002B1 09               [12]  652 	inc	r1
      0002B2 E6               [12]  653 	mov	a,@r0
      0002B3 F7               [12]  654 	mov	@r1,a
      0002B4 A8 2D            [24]  655 	mov	r0,_bp
      0002B6 08               [12]  656 	inc	r0
      0002B7 E5 29            [12]  657 	mov	a,_current
      0002B9 26               [12]  658 	add	a,@r0
      0002BA FB               [12]  659 	mov	r3,a
      0002BB E4               [12]  660 	clr	a
      0002BC 08               [12]  661 	inc	r0
      0002BD 36               [12]  662 	addc	a,@r0
      0002BE FC               [12]  663 	mov	r4,a
      0002BF 08               [12]  664 	inc	r0
      0002C0 86 07            [24]  665 	mov	ar7,@r0
      0002C2 8B 82            [24]  666 	mov	dpl,r3
      0002C4 8C 83            [24]  667 	mov	dph,r4
      0002C6 8F F0            [24]  668 	mov	b,r7
      0002C8 12 04 7B         [24]  669 	lcall	__gptrget
      0002CB FB               [12]  670 	mov	r3,a
      0002CC E5 2D            [12]  671 	mov	a,_bp
      0002CE 24 04            [12]  672 	add	a,#0x04
      0002D0 F8               [12]  673 	mov	r0,a
      0002D1 A6 03            [24]  674 	mov	@r0,ar3
      0002D3 EB               [12]  675 	mov	a,r3
      0002D4 33               [12]  676 	rlc	a
      0002D5 95 E0            [12]  677 	subb	a,acc
      0002D7 08               [12]  678 	inc	r0
      0002D8 F6               [12]  679 	mov	@r0,a
      0002D9 A8 2D            [24]  680 	mov	r0,_bp
      0002DB 08               [12]  681 	inc	r0
      0002DC E5 2B            [12]  682 	mov	a,_i
      0002DE 26               [12]  683 	add	a,@r0
      0002DF FA               [12]  684 	mov	r2,a
      0002E0 E4               [12]  685 	clr	a
      0002E1 08               [12]  686 	inc	r0
      0002E2 36               [12]  687 	addc	a,@r0
      0002E3 FC               [12]  688 	mov	r4,a
      0002E4 08               [12]  689 	inc	r0
      0002E5 86 07            [24]  690 	mov	ar7,@r0
      0002E7 8A 82            [24]  691 	mov	dpl,r2
      0002E9 8C 83            [24]  692 	mov	dph,r4
      0002EB 8F F0            [24]  693 	mov	b,r7
      0002ED 12 04 7B         [24]  694 	lcall	__gptrget
      0002F0 FA               [12]  695 	mov	r2,a
      0002F1 33               [12]  696 	rlc	a
      0002F2 95 E0            [12]  697 	subb	a,acc
      0002F4 FF               [12]  698 	mov	r7,a
      0002F5 E5 2D            [12]  699 	mov	a,_bp
      0002F7 24 04            [12]  700 	add	a,#0x04
      0002F9 F8               [12]  701 	mov	r0,a
      0002FA A9 2D            [24]  702 	mov	r1,_bp
      0002FC 09               [12]  703 	inc	r1
      0002FD EA               [12]  704 	mov	a,r2
      0002FE 26               [12]  705 	add	a,@r0
      0002FF F7               [12]  706 	mov	@r1,a
      000300 EF               [12]  707 	mov	a,r7
      000301 08               [12]  708 	inc	r0
      000302 36               [12]  709 	addc	a,@r0
      000303 09               [12]  710 	inc	r1
      000304 F7               [12]  711 	mov	@r1,a
      000305 E5 2D            [12]  712 	mov	a,_bp
      000307 24 04            [12]  713 	add	a,#0x04
      000309 F8               [12]  714 	mov	r0,a
      00030A E5 2B            [12]  715 	mov	a,_i
      00030C 75 F0 04         [24]  716 	mov	b,#0x04
      00030F A4               [48]  717 	mul	ab
      000310 F6               [12]  718 	mov	@r0,a
      000311 08               [12]  719 	inc	r0
      000312 A6 F0            [24]  720 	mov	@r0,b
      000314 E5 2D            [12]  721 	mov	a,_bp
      000316 24 FA            [12]  722 	add	a,#0xfa
      000318 F8               [12]  723 	mov	r0,a
      000319 E5 2D            [12]  724 	mov	a,_bp
      00031B 24 04            [12]  725 	add	a,#0x04
      00031D F9               [12]  726 	mov	r1,a
      00031E E7               [12]  727 	mov	a,@r1
      00031F 26               [12]  728 	add	a,@r0
      000320 FB               [12]  729 	mov	r3,a
      000321 09               [12]  730 	inc	r1
      000322 E7               [12]  731 	mov	a,@r1
      000323 08               [12]  732 	inc	r0
      000324 36               [12]  733 	addc	a,@r0
      000325 FC               [12]  734 	mov	r4,a
      000326 08               [12]  735 	inc	r0
      000327 86 07            [24]  736 	mov	ar7,@r0
      000329 E5 2B            [12]  737 	mov	a,_i
      00032B 2B               [12]  738 	add	a,r3
      00032C FB               [12]  739 	mov	r3,a
      00032D E4               [12]  740 	clr	a
      00032E 3C               [12]  741 	addc	a,r4
      00032F FC               [12]  742 	mov	r4,a
      000330 8B 82            [24]  743 	mov	dpl,r3
      000332 8C 83            [24]  744 	mov	dph,r4
      000334 8F F0            [24]  745 	mov	b,r7
      000336 12 04 7B         [24]  746 	lcall	__gptrget
      000339 FB               [12]  747 	mov	r3,a
      00033A 33               [12]  748 	rlc	a
      00033B 95 E0            [12]  749 	subb	a,acc
      00033D FF               [12]  750 	mov	r7,a
      00033E A8 2D            [24]  751 	mov	r0,_bp
      000340 08               [12]  752 	inc	r0
      000341 C3               [12]  753 	clr	c
      000342 E6               [12]  754 	mov	a,@r0
      000343 9B               [12]  755 	subb	a,r3
      000344 08               [12]  756 	inc	r0
      000345 E6               [12]  757 	mov	a,@r0
      000346 64 80            [12]  758 	xrl	a,#0x80
      000348 8F F0            [24]  759 	mov	b,r7
      00034A 63 F0 80         [24]  760 	xrl	b,#0x80
      00034D 95 F0            [12]  761 	subb	a,b
      00034F D0 07            [24]  762 	pop	ar7
      000351 40 03            [24]  763 	jc	00140$
      000353 02 04 33         [24]  764 	ljmp	00112$
      000356                        765 00140$:
                                    766 ;	scdn.c:183: a[i][i] = a[current][current] + a[current][i];
      000356 C0 07            [24]  767 	push	ar7
      000358 E5 2D            [12]  768 	mov	a,_bp
      00035A 24 FA            [12]  769 	add	a,#0xfa
      00035C F8               [12]  770 	mov	r0,a
      00035D E5 2D            [12]  771 	mov	a,_bp
      00035F 24 04            [12]  772 	add	a,#0x04
      000361 F9               [12]  773 	mov	r1,a
      000362 E7               [12]  774 	mov	a,@r1
      000363 26               [12]  775 	add	a,@r0
      000364 FA               [12]  776 	mov	r2,a
      000365 09               [12]  777 	inc	r1
      000366 E7               [12]  778 	mov	a,@r1
      000367 08               [12]  779 	inc	r0
      000368 36               [12]  780 	addc	a,@r0
      000369 FB               [12]  781 	mov	r3,a
      00036A 08               [12]  782 	inc	r0
      00036B 86 04            [24]  783 	mov	ar4,@r0
      00036D A8 2D            [24]  784 	mov	r0,_bp
      00036F 08               [12]  785 	inc	r0
      000370 E5 2B            [12]  786 	mov	a,_i
      000372 2A               [12]  787 	add	a,r2
      000373 F6               [12]  788 	mov	@r0,a
      000374 E4               [12]  789 	clr	a
      000375 3B               [12]  790 	addc	a,r3
      000376 08               [12]  791 	inc	r0
      000377 F6               [12]  792 	mov	@r0,a
      000378 08               [12]  793 	inc	r0
      000379 A6 04            [24]  794 	mov	@r0,ar4
      00037B E5 2D            [12]  795 	mov	a,_bp
      00037D 24 FA            [12]  796 	add	a,#0xfa
      00037F F8               [12]  797 	mov	r0,a
      000380 ED               [12]  798 	mov	a,r5
      000381 26               [12]  799 	add	a,@r0
      000382 FD               [12]  800 	mov	r5,a
      000383 EE               [12]  801 	mov	a,r6
      000384 08               [12]  802 	inc	r0
      000385 36               [12]  803 	addc	a,@r0
      000386 FE               [12]  804 	mov	r6,a
      000387 08               [12]  805 	inc	r0
      000388 86 07            [24]  806 	mov	ar7,@r0
      00038A E5 29            [12]  807 	mov	a,_current
      00038C 2D               [12]  808 	add	a,r5
      00038D FA               [12]  809 	mov	r2,a
      00038E E4               [12]  810 	clr	a
      00038F 3E               [12]  811 	addc	a,r6
      000390 FB               [12]  812 	mov	r3,a
      000391 8F 04            [24]  813 	mov	ar4,r7
      000393 E5 2B            [12]  814 	mov	a,_i
      000395 2D               [12]  815 	add	a,r5
      000396 FD               [12]  816 	mov	r5,a
      000397 E4               [12]  817 	clr	a
      000398 3E               [12]  818 	addc	a,r6
      000399 FE               [12]  819 	mov	r6,a
      00039A 8D 82            [24]  820 	mov	dpl,r5
      00039C 8E 83            [24]  821 	mov	dph,r6
      00039E 8F F0            [24]  822 	mov	b,r7
      0003A0 12 04 7B         [24]  823 	lcall	__gptrget
      0003A3 FD               [12]  824 	mov	r5,a
      0003A4 8A 82            [24]  825 	mov	dpl,r2
      0003A6 8B 83            [24]  826 	mov	dph,r3
      0003A8 8C F0            [24]  827 	mov	b,r4
      0003AA 12 04 7B         [24]  828 	lcall	__gptrget
      0003AD 2D               [12]  829 	add	a,r5
      0003AE FD               [12]  830 	mov	r5,a
      0003AF A8 2D            [24]  831 	mov	r0,_bp
      0003B1 08               [12]  832 	inc	r0
      0003B2 86 82            [24]  833 	mov	dpl,@r0
      0003B4 08               [12]  834 	inc	r0
      0003B5 86 83            [24]  835 	mov	dph,@r0
      0003B7 08               [12]  836 	inc	r0
      0003B8 86 F0            [24]  837 	mov	b,@r0
      0003BA ED               [12]  838 	mov	a,r5
      0003BB 12 04 60         [24]  839 	lcall	__gptrput
                                    840 ;	scdn.c:184: priority = a[i][i] + heuristic(goal, i, a[i][i]);
      0003BE E5 2B            [12]  841 	mov	a,_i
      0003C0 75 F0 04         [24]  842 	mov	b,#0x04
      0003C3 A4               [48]  843 	mul	ab
      0003C4 FE               [12]  844 	mov	r6,a
      0003C5 AF F0            [24]  845 	mov	r7,b
      0003C7 E5 2D            [12]  846 	mov	a,_bp
      0003C9 24 FA            [12]  847 	add	a,#0xfa
      0003CB F8               [12]  848 	mov	r0,a
      0003CC EE               [12]  849 	mov	a,r6
      0003CD 26               [12]  850 	add	a,@r0
      0003CE FE               [12]  851 	mov	r6,a
      0003CF EF               [12]  852 	mov	a,r7
      0003D0 08               [12]  853 	inc	r0
      0003D1 36               [12]  854 	addc	a,@r0
      0003D2 FF               [12]  855 	mov	r7,a
      0003D3 08               [12]  856 	inc	r0
      0003D4 86 05            [24]  857 	mov	ar5,@r0
      0003D6 E5 2B            [12]  858 	mov	a,_i
      0003D8 2E               [12]  859 	add	a,r6
      0003D9 FA               [12]  860 	mov	r2,a
      0003DA E4               [12]  861 	clr	a
      0003DB 3F               [12]  862 	addc	a,r7
      0003DC FB               [12]  863 	mov	r3,a
      0003DD 8D 04            [24]  864 	mov	ar4,r5
      0003DF E5 2B            [12]  865 	mov	a,_i
      0003E1 2E               [12]  866 	add	a,r6
      0003E2 FE               [12]  867 	mov	r6,a
      0003E3 E4               [12]  868 	clr	a
      0003E4 3F               [12]  869 	addc	a,r7
      0003E5 FF               [12]  870 	mov	r7,a
      0003E6 8E 82            [24]  871 	mov	dpl,r6
      0003E8 8F 83            [24]  872 	mov	dph,r7
      0003EA 8D F0            [24]  873 	mov	b,r5
      0003EC 12 04 7B         [24]  874 	lcall	__gptrget
      0003EF FE               [12]  875 	mov	r6,a
      0003F0 C0 04            [24]  876 	push	ar4
      0003F2 C0 03            [24]  877 	push	ar3
      0003F4 C0 02            [24]  878 	push	ar2
      0003F6 C0 06            [24]  879 	push	ar6
      0003F8 C0 2B            [24]  880 	push	_i
      0003FA E5 2D            [12]  881 	mov	a,_bp
      0003FC 24 FD            [12]  882 	add	a,#0xfd
      0003FE F8               [12]  883 	mov	r0,a
      0003FF 86 82            [24]  884 	mov	dpl,@r0
      000401 12 01 DA         [24]  885 	lcall	_heuristic
      000404 AF 82            [24]  886 	mov	r7,dpl
      000406 15 81            [12]  887 	dec	sp
      000408 15 81            [12]  888 	dec	sp
      00040A D0 02            [24]  889 	pop	ar2
      00040C D0 03            [24]  890 	pop	ar3
      00040E D0 04            [24]  891 	pop	ar4
      000410 8A 82            [24]  892 	mov	dpl,r2
      000412 8B 83            [24]  893 	mov	dph,r3
      000414 8C F0            [24]  894 	mov	b,r4
      000416 12 04 7B         [24]  895 	lcall	__gptrget
      000419 2F               [12]  896 	add	a,r7
      00041A F5 2A            [12]  897 	mov	_priority,a
                                    898 ;	scdn.c:185: insert(i, priority);
      00041C C0 07            [24]  899 	push	ar7
      00041E C0 2A            [24]  900 	push	_priority
      000420 85 2B 82         [24]  901 	mov	dpl,_i
      000423 12 01 56         [24]  902 	lcall	_insert
      000426 15 81            [12]  903 	dec	sp
      000428 D0 07            [24]  904 	pop	ar7
                                    905 ;	scdn.c:187: came_from[i] = current;
      00042A E5 2B            [12]  906 	mov	a,_i
      00042C 24 25            [12]  907 	add	a,#_came_from
      00042E F8               [12]  908 	mov	r0,a
      00042F A6 29            [24]  909 	mov	@r0,_current
                                    910 ;	scdn.c:178: i++)
      000431 D0 07            [24]  911 	pop	ar7
                                    912 ;	scdn.c:187: came_from[i] = current;
      000433                        913 00112$:
                                    914 ;	scdn.c:178: i++)
      000433 05 2B            [12]  915 	inc	_i
      000435 02 02 69         [24]  916 	ljmp	00111$
      000438                        917 00113$:
      000438 85 2D 81         [24]  918 	mov	sp,_bp
      00043B D0 2D            [24]  919 	pop	_bp
      00043D 22               [24]  920 	ret
                                    921 ;------------------------------------------------------------
                                    922 ;Allocation info for local variables in function 'main'
                                    923 ;------------------------------------------------------------
                                    924 ;	scdn.c:194: void main()
                                    925 ;	-----------------------------------------
                                    926 ;	 function main
                                    927 ;	-----------------------------------------
      00043E                        928 _main:
                                    929 ;	scdn.c:196: make_oriented();
      00043E 12 00 AD         [24]  930 	lcall	_make_oriented
                                    931 ;	scdn.c:197: astar(size, goal, a);
      000441 74 10            [12]  932 	mov	a,#_a
      000443 C0 E0            [24]  933 	push	acc
      000445 74 00            [12]  934 	mov	a,#(_a >> 8)
      000447 C0 E0            [24]  935 	push	acc
      000449 74 40            [12]  936 	mov	a,#0x40
      00044B C0 E0            [24]  937 	push	acc
      00044D 74 45            [12]  938 	mov	a,#0x45
      00044F C0 E0            [24]  939 	push	acc
      000451 75 82 04         [24]  940 	mov	dpl,#0x04
      000454 12 02 25         [24]  941 	lcall	_astar
      000457 E5 81            [12]  942 	mov	a,sp
      000459 24 FC            [12]  943 	add	a,#0xfc
      00045B F5 81            [12]  944 	mov	sp,a
                                    945 ;	scdn.c:198: resetValues();
      00045D 02 00 9B         [24]  946 	ljmp	_resetValues
                                    947 	.area CSEG    (CODE)
                                    948 	.area CONST   (CODE)
                                    949 	.area XINIT   (CODE)
                                    950 	.area CABS    (ABS,CODE)
