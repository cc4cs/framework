;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Fri Feb 12 20:22:10 2021
;--------------------------------------------------------
	.module scdn
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _astar
	.globl _heuristic
	.globl _absolute
	.globl _set_estimates
	.globl _remove_min
	.globl _insert
	.globl _init_camefrom
	.globl _make_oriented
	.globl _resetValues
	.globl _j
	.globl _i
	.globl _priority
	.globl _current
	.globl _came_from
	.globl _frontier_size
	.globl _frontier
	.globl _a
	.globl _P3
	.globl _P2
	.globl _P1
	.globl _P0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_P0::
	.ds 2
_P1::
	.ds 2
_P2::
	.ds 2
_P3::
	.ds 2
_a::
	.ds 16
_frontier::
	.ds 4
_frontier_size::
	.ds 1
_came_from::
	.ds 4
_current::
	.ds 1
_priority::
	.ds 1
_i::
	.ds 1
_j::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	./values_8051.h:5: int8_t a[size][size] = {{-93, 107, 12, -113},{-4, 80, 11, 51},{19, 51, 54, 65},{42, 121, -123, -110}};
	mov	_a,#0xA3
	mov	(_a + 0x0001),#0x6B
	mov	(_a + 0x0002),#0x0C
	mov	(_a + 0x0003),#0x8F
	mov	(_a + 0x0004),#0xFC
	mov	(_a + 0x0005),#0x50
	mov	(_a + 0x0006),#0x0B
	mov	(_a + 0x0007),#0x33
	mov	(_a + 0x0008),#0x13
	mov	(_a + 0x0009),#0x33
	mov	(_a + 0x000a),#0x36
	mov	(_a + 0x000b),#0x41
	mov	(_a + 0x000c),#0x2A
	mov	(_a + 0x000d),#0x79
	mov	(_a + 0x000e),#0x85
	mov	(_a + 0x000f),#0x92
;	scdn.c:11: TARGET_TYPE frontier_size = 0;
	mov	_frontier_size,#0x00
;	scdn.c:14: TARGET_INDEX current = 0;
	mov	_current,#0x00
;	scdn.c:16: TARGET_TYPE priority = 0;
	mov	_priority,#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'resetValues'
;------------------------------------------------------------
;	scdn.c:20: void resetValues()
;	-----------------------------------------
;	 function resetValues
;	-----------------------------------------
_resetValues:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	scdn.c:22: P0 = 0;
	clr	a
	mov	_P0,a
	mov	(_P0 + 1),a
;	scdn.c:23: P1 = 0;
	mov	_P1,a
	mov	(_P1 + 1),a
;	scdn.c:24: P2 = 0;
	mov	_P2,a
	mov	(_P2 + 1),a
;	scdn.c:25: P3 = 0;
	mov	_P3,a
	mov	(_P3 + 1),a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'make_oriented'
;------------------------------------------------------------
;	scdn.c:67: void make_oriented()
;	-----------------------------------------
;	 function make_oriented
;	-----------------------------------------
_make_oriented:
;	scdn.c:69: for(i = 0; 
	mov	_i,#0x00
00112$:
;	scdn.c:73: a[i][i] = -1;
	mov	a,_i
	add	a,_i
	add	a,acc
	add	a,#_a
	mov	r7,a
	add	a,_i
	mov	r0,a
	mov	@r0,#0xFF
;	scdn.c:76: a[size-1][i] = -1;
	mov	a,_i
	add	a,#(_a + 0x000c)
	mov	r0,a
	mov	@r0,#0xFF
;	scdn.c:78: for(j = 0; 
	mov	_j,#0x00
00110$:
;	scdn.c:82: if(a[i][j] < 0
	mov	a,_i
	add	a,_i
	add	a,acc
	mov	r7,a
	add	a,#_a
	add	a,_j
	mov	r1,a
	mov	a,@r1
	mov	r6,a
	jnb	acc.7,00104$
;	scdn.c:84: && a[i][j] != -1 )
	mov	a,_j
	cjne	a,_i,00138$
	sjmp	00104$
00138$:
	mov	a,r7
	add	a,#_a
	add	a,_j
	mov	r1,a
	mov	ar6,@r1
	cjne	r6,#0xFF,00139$
	sjmp	00104$
00139$:
;	scdn.c:86: a[i][j] *= -1;
	mov	a,r7
	add	a,#_a
	mov	r7,a
	add	a,_j
	mov	r1,a
	mov	a,_j
	add	a,r7
	mov	r0,a
	mov	ar7,@r0
	clr	c
	clr	a
	subb	a,r7
	mov	@r1,a
;	scdn.c:87: a[j][i] = -1;
	mov	a,_j
	add	a,_j
	add	a,acc
	add	a,#_a
	mov	r7,a
	add	a,_i
	mov	r0,a
	mov	@r0,#0xFF
	sjmp	00111$
00104$:
;	scdn.c:92: if(a[j][i] >= 0)
	mov	a,_j
	add	a,_j
	add	a,acc
	add	a,#_a
	add	a,_i
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	jb	acc.7,00111$
;	scdn.c:93: a[i][j] = -1;
	mov	a,_i
	add	a,_i
	add	a,acc
	add	a,#_a
	mov	r7,a
	add	a,_j
	mov	r0,a
	mov	@r0,#0xFF
00111$:
;	scdn.c:80: j++)
	inc	_j
;	scdn.c:79: j < size; 
	mov	a,#0x100 - 0x04
	add	a,_j
	jc	00141$
	ljmp	00110$
00141$:
;	scdn.c:71: i++)
	inc	_i
;	scdn.c:70: i < size; 
	mov	a,#0x100 - 0x04
	add	a,_i
	jc	00142$
	ljmp	00112$
00142$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_camefrom'
;------------------------------------------------------------
;	scdn.c:100: void init_camefrom()
;	-----------------------------------------
;	 function init_camefrom
;	-----------------------------------------
_init_camefrom:
;	scdn.c:102: for(i = 0;
	mov	_i,#0x00
00102$:
;	scdn.c:105: came_from[i] = -1;
	mov	a,_i
	add	a,#_came_from
	mov	r0,a
	mov	@r0,#0xFF
;	scdn.c:104: i++)
	inc	_i
;	scdn.c:103: i < size;
	mov	a,#0x100 - 0x04
	add	a,_i
	jnc	00102$
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'insert'
;------------------------------------------------------------
;priority                  Allocated to stack - _bp -3
;node                      Allocated to registers r7 
;------------------------------------------------------------
;	scdn.c:108: void insert(TARGET_INDEX node, TARGET_TYPE priority)
;	-----------------------------------------
;	 function insert
;	-----------------------------------------
_insert:
	push	_bp
	mov	_bp,sp
;	scdn.c:110: frontier[node] = priority;
	mov	a,dpl
	add	a,#_frontier
	mov	r0,a
	mov	a,_bp
	add	a,#0xfd
	mov	r1,a
	mov	a,@r1
	mov	@r0,a
;	scdn.c:111: ++frontier_size;
	inc	_frontier_size
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'remove_min'
;------------------------------------------------------------
;min                       Allocated to registers r7 
;------------------------------------------------------------
;	scdn.c:114: void remove_min()
;	-----------------------------------------
;	 function remove_min
;	-----------------------------------------
_remove_min:
;	scdn.c:116: TARGET_TYPE min = 127;
	mov	r7,#0x7F
;	scdn.c:118: for(i  = 0;
	mov	_i,#0x00
00105$:
;	scdn.c:122: if(frontier[i] <= min && 
	mov	a,_i
	add	a,#_frontier
	mov	r1,a
	mov	ar6,@r1
	clr	c
	mov	a,r7
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	00106$
;	scdn.c:123: frontier[i] != 0)
	mov	a,r6
	jz	00106$
;	scdn.c:125: min = frontier[i];
	mov	ar7,r6
;	scdn.c:126: current = i;
	mov	_current,_i
00106$:
;	scdn.c:120: i++)
	inc	_i
;	scdn.c:119: i < size; 
	mov	a,#0x100 - 0x04
	add	a,_i
	jnc	00105$
;	scdn.c:130: --frontier_size;
	dec	_frontier_size
;	scdn.c:131: frontier[current] = 0;
	mov	a,_current
	add	a,#_frontier
	mov	r0,a
	mov	@r0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_estimates'
;------------------------------------------------------------
;	scdn.c:134: void set_estimates()
;	-----------------------------------------
;	 function set_estimates
;	-----------------------------------------
_set_estimates:
;	scdn.c:136: for(i = 0; 
	mov	_i,#0x00
00105$:
;	scdn.c:140: if(i == 0)
	mov	a,_i
;	scdn.c:141: a[0][0] = 0;
	jnz	00102$
	mov	_a,a
	sjmp	00106$
00102$:
;	scdn.c:143: a[i][i] = 127;
	mov	a,_i
	add	a,_i
	add	a,acc
	add	a,#_a
	mov	r7,a
	add	a,_i
	mov	r0,a
	mov	@r0,#0x7F
00106$:
;	scdn.c:138: i++)
	inc	_i
;	scdn.c:137: i < size; 
	mov	a,#0x100 - 0x04
	add	a,_i
	jnc	00105$
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'absolute'
;------------------------------------------------------------
;n                         Allocated to registers r7 
;------------------------------------------------------------
;	scdn.c:148: TARGET_TYPE absolute(TARGET_TYPE n)
;	-----------------------------------------
;	 function absolute
;	-----------------------------------------
_absolute:
	mov	r7,dpl
;	scdn.c:150: return n > 0 ? n : -n; 
	clr	c
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00103$
	mov	ar6,r7
	sjmp	00104$
00103$:
	clr	c
	clr	a
	subb	a,r7
	mov	r6,a
00104$:
	mov	dpl,r6
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'heuristic'
;------------------------------------------------------------
;current                   Allocated to stack - _bp -3
;path_cost                 Allocated to stack - _bp -4
;goal                      Allocated to registers r7 
;------------------------------------------------------------
;	scdn.c:153: TARGET_TYPE heuristic(TARGET_INDEX goal, TARGET_INDEX current, TARGET_TYPE path_cost)
;	-----------------------------------------
;	 function heuristic
;	-----------------------------------------
_heuristic:
	push	_bp
	mov	_bp,sp
	mov	r7,dpl
;	scdn.c:156: if(a[current][goal] > -1) 
	mov	a,_bp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,acc
	add	a,acc
	add	a,#_a
	mov	r6,a
	add	a,r7
	mov	r1,a
	mov	ar7,@r1
	clr	c
	mov	a,#(0xFF ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00102$
;	scdn.c:157: return 1;
	mov	dpl,#0x01
	sjmp	00103$
00102$:
;	scdn.c:161: return absolute((int8_t)0 - (size/2)) + absolute(path_cost - (size/2));
	mov	dpl,#0xFE
	lcall	_absolute
	mov	r7,dpl
	mov	a,_bp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	add	a,#0xFE
	mov	dpl,a
	push	ar7
	lcall	_absolute
	mov	r6,dpl
	pop	ar7
	mov	a,r6
	add	a,r7
	mov	dpl,a
00103$:
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'astar'
;------------------------------------------------------------
;goal                      Allocated to stack - _bp -3
;a                         Allocated to stack - _bp -6
;size                      Allocated to registers r7 
;sloc0                     Allocated to stack - _bp +1
;sloc1                     Allocated to stack - _bp +4
;------------------------------------------------------------
;	scdn.c:164: void astar(TARGET_INDEX size, TARGET_INDEX goal, TARGET_TYPE a[size][size])
;	-----------------------------------------
;	 function astar
;	-----------------------------------------
_astar:
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x05
	mov	sp,a
	mov	r7,dpl
;	scdn.c:166: set_estimates();
	push	ar7
	lcall	_set_estimates
;	scdn.c:167: insert(0,0);
	clr	a
	push	acc
	mov	dpl,#0x00
	lcall	_insert
	dec	sp
	pop	ar7
;	scdn.c:169: while(frontier_size > 0)
00107$:
	clr	c
	mov	a,#(0x00 ^ 0x80)
	mov	b,_frontier_size
	xrl	b,#0x80
	subb	a,b
	jc	00136$
	ljmp	00113$
00136$:
;	scdn.c:171: remove_min();
	push	ar7
	lcall	_remove_min
	pop	ar7
;	scdn.c:173: if(current == goal)
	mov	a,_bp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	cjne	a,_current,00137$
	ljmp	00113$
00137$:
;	scdn.c:176: for(i = 0; 
	mov	_i,#0x00
00111$:
;	scdn.c:177: i < size; 
	clr	c
	mov	a,_i
	subb	a,r7
	jnc	00107$
;	scdn.c:180: if(a[current][i] != -1 &&
	mov	a,_current
	mov	b,#0x04
	mul	ab
	mov	r5,a
	mov	r6,b
	mov	a,_bp
	add	a,#0xfa
	mov	r0,a
	mov	a,r5
	add	a,@r0
	mov	r2,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	a,_i
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	cjne	r2,#0xFF,00139$
	ljmp	00112$
00139$:
;	scdn.c:181: a[current][current] + a[current][i] < a[i][i])
	push	ar7
	mov	a,_bp
	add	a,#0xfa
	mov	r0,a
	mov	r1,_bp
	inc	r1
	mov	a,r5
	add	a,@r0
	mov	@r1,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	r0,_bp
	inc	r0
	mov	a,_current
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	@r0,ar3
	mov	a,r3
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	mov	r0,_bp
	inc	r0
	mov	a,_i
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	r1,_bp
	inc	r1
	mov	a,r2
	add	a,@r0
	mov	@r1,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	a,_i
	mov	b,#0x04
	mul	ab
	mov	@r0,a
	inc	r0
	mov	@r0,b
	mov	a,_bp
	add	a,#0xfa
	mov	r0,a
	mov	a,_bp
	add	a,#0x04
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r3,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar7,@r0
	mov	a,_i
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	r0,_bp
	inc	r0
	clr	c
	mov	a,@r0
	subb	a,r3
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	pop	ar7
	jc	00140$
	ljmp	00112$
00140$:
;	scdn.c:183: a[i][i] = a[current][current] + a[current][i];
	push	ar7
	mov	a,_bp
	add	a,#0xfa
	mov	r0,a
	mov	a,_bp
	add	a,#0x04
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r2,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	r0,_bp
	inc	r0
	mov	a,_i
	add	a,r2
	mov	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar4
	mov	a,_bp
	add	a,#0xfa
	mov	r0,a
	mov	a,r5
	add	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,_current
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	a,_i
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	add	a,r5
	mov	r5,a
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
;	scdn.c:184: priority = a[i][i] + heuristic(goal, i, a[i][i]);
	mov	a,_i
	mov	b,#0x04
	mul	ab
	mov	r6,a
	mov	r7,b
	mov	a,_bp
	add	a,#0xfa
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,_i
	add	a,r6
	mov	r2,a
	clr	a
	addc	a,r7
	mov	r3,a
	mov	ar4,r5
	mov	a,_i
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	push	ar4
	push	ar3
	push	ar2
	push	ar6
	push	_i
	mov	a,_bp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	lcall	_heuristic
	mov	r7,dpl
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	add	a,r7
	mov	_priority,a
;	scdn.c:185: insert(i, priority);
	push	ar7
	push	_priority
	mov	dpl,_i
	lcall	_insert
	dec	sp
	pop	ar7
;	scdn.c:187: came_from[i] = current;
	mov	a,_i
	add	a,#_came_from
	mov	r0,a
	mov	@r0,_current
;	scdn.c:178: i++)
	pop	ar7
;	scdn.c:187: came_from[i] = current;
00112$:
;	scdn.c:178: i++)
	inc	_i
	ljmp	00111$
00113$:
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	scdn.c:194: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	scdn.c:196: make_oriented();
	lcall	_make_oriented
;	scdn.c:197: astar(size, goal, a);
	mov	a,#_a
	push	acc
	mov	a,#(_a >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#0x45
	push	acc
	mov	dpl,#0x04
	lcall	_astar
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	scdn.c:198: resetValues();
	ljmp	_resetValues
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
