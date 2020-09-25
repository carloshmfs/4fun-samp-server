
CODE 0	; 0
;program exit point
	halt 0


CODE 3	; 8
	proc	; operator*(Float:,_:)
	; line 70
	;$lcl oper2 10
	;$lcl oper1 c
	; line 70
	break	; c
	push.s 10
	;$par
	push.c 4
	sysreq.c 0	; float
	stack 8
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 1	; floatmul
	stack c
	retn

	proc	; operator+(Float:,_:)
	; line 79
	;$lcl oper2 10
	;$lcl oper1 c
	; line 79
	break	; 5c
	push.s 10
	;$par
	push.c 4
	sysreq.c 0	; float
	stack 8
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2	; floatadd
	stack c
	retn


CODE d	; a8
	proc	; cache_num_rows
	; line b4
	; line b5
	break	; ac
	;$lcl row_count fffffffc
	push.c 0
	;$exp
	; line b6
	break	; b8
	push.adr fffffffc
	;$par
	push.c 4
	sysreq.c 3	; cache_get_row_count
	stack 8
	;$exp
	; line b7
	break	; dc
	load.s.pri fffffffc
	stack 4
	retn


DATA f	; 0
dump 0 
dump 0 

CODE f	; f4
	proc	; OnGameModeInit
	; line 3f
	; line 40
	break	; f8
	push.c 8
	;$par
	push.c 4
	sysreq.c 4	; funcidx
	stack 8
	const.alt ffffffff
	neq
	stor.pri 0
	;$exp
	; line 41
	break	; 130
	push.c 68
	;$par
	push.c 4
	sysreq.c 4	; funcidx
	stack 8
	const.alt ffffffff
	neq
	stor.pri 4
	;$exp
	; line 42
	break	; 168
	push.c cc
	;$par
	push.c 4
	sysreq.c 4	; funcidx
	stack 8
	const.alt ffffffff
	jeq 0
	;$exp
	; line 44
	break	; 19c
	push.c 16c
	;$par
	push.c 11c
	;$par
	push.c 8
	sysreq.c 5	; CallLocalFunction
	stack c
	retn
l.0		; 1cc
	; line 46
	break	; 1cc
	const.pri 1
	retn


DATA f	; 8
dump 4f 6e 50 6c 61 79 65 72 43 6f 6d 6d 61 6e 64 52 
dump 65 63 65 69 76 65 64 0 4f 6e 50 6c 61 79 65 72 
dump 43 6f 6d 6d 61 6e 64 50 65 72 66 6f 72 6d 65 64 
dump 0 7a 63 6d 64 5f 4f 6e 47 61 6d 65 4d 6f 64 65 
dump 49 6e 69 74 0 7a 63 6d 64 5f 4f 6e 47 61 6d 65 
dump 4d 6f 64 65 49 6e 69 74 0 0 

CODE f	; 1dc
	proc	; OnPlayerCommandText
	; line 54
	;$lcl cmdtext 10
	;$lcl playerid c
	; line 55
	break	; 1e0
	load.pri 0
	jzer 2
	push.s 10
	;$par
	push.adr c
	;$par
	push.c 1d0
	;$par
	push.c 170
	;$par
	push.c 10
	sysreq.c 5	; CallLocalFunction
	stack 14
	not
	jzer 2
	const.pri 1
	jump 3
l.2
	zero.pri
l.3
	jzer 1
	;$exp
	; line 57
	break	; 254
	const.pri 1
	retn
l.1		; 264
	; line 59
	break	; 264
	;$lcl pos fffffffc
	push.c 0
	;$exp
	;$lcl funcname ffffff7c
	stack ffffff80
	zero.pri
	addr.alt ffffff7c
	fill 80
	; line 5c
	break	; 28c
l.4		; 290
	; line 5c
	break	; 290
	load.s.pri 10
	push.pri
	inc.s fffffffc
	load.s.pri fffffffc
	pop.alt
	idxaddr
	load.i
	const.alt 20
	jsleq 5
	;$exp
	; line 5e
	break	; 2cc
	addr.pri ffffff7c
	push.pri
	load.s.pri fffffffc
	add.c -1
	bounds 1f
	pop.alt
	idxaddr
	push.pri
	load.s.pri fffffffc
	load.s.alt 10
	idxaddr
	load.i
	push.pri
	;$par
	push.c 4
	sysreq.c 6	; tolower
	stack 8
	pop.alt
	stor.i
	;$exp
	jump 4
l.5		; 344
	; line 60
	break	; 344
	push.adr ffffff7c
	;$par
	push.c 1dc
	;$par
	push.c 20
	;$par
	push.adr ffffff7c
	;$par
	push.c 10
	sysreq.c 7	; format
	stack 14
	;$exp
	; line 61
	break	; 380
l.6		; 384
	; line 61
	break	; 384
	load.s.pri fffffffc
	load.s.alt 10
	idxaddr
	load.i
	eq.c.pri 20
	jzer 7
	;$exp
	; line 61
	break	; 3b0
	inc.s fffffffc
	;$exp
	jump 6
l.7		; 3c4
	; line 62
	break	; 3c4
	load.s.pri fffffffc
	load.s.alt 10
	idxaddr
	load.i
	not
	jzer 8
	;$exp
	; line 64
	break	; 3ec
	load.pri 4
	jzer 9
	;$exp
	; line 66
	break	; 400
	push.c 278
	;$par
	push.adr c
	;$par
	push.c 26c
	;$par
	push.adr ffffff7c
	;$par
	push.c 10
	sysreq.c 5	; CallLocalFunction
	stack 14
	heap 4
	stor.i
	push.alt
	;$par
	push.s 10
	;$par
	push.adr c
	;$par
	push.c 25c
	;$par
	push.c 1f8
	;$par
	push.c 14
	sysreq.c 5	; CallLocalFunction
	stack 18
	heap fffffffc
	stack 84
	retn
l.9		; 498
	; line 68
	break	; 498
	push.c 28c
	;$par
	push.adr c
	;$par
	push.c 280
	;$par
	push.adr ffffff7c
	;$par
	push.c 10
	sysreq.c 5	; CallLocalFunction
	stack 14
	stack 84
	retn
l.8		; 4e0
	; line 6a
	break	; 4e0
	load.pri 4
	jzer a
	;$exp
	; line 6c
	break	; 4f4
	load.s.pri fffffffc
	load.s.alt 10
	idxaddr
	push.pri
	;$par
	push.adr c
	;$par
	push.c 308
	;$par
	push.adr ffffff7c
	;$par
	push.c 10
	sysreq.c 5	; CallLocalFunction
	stack 14
	heap 4
	stor.i
	push.alt
	;$par
	push.s 10
	;$par
	push.adr c
	;$par
	push.c 2f8
	;$par
	push.c 294
	;$par
	push.c 14
	sysreq.c 5	; CallLocalFunction
	stack 18
	heap fffffffc
	stack 84
	retn
l.a		; 59c
	; line 6e
	break	; 59c
	load.s.pri fffffffc
	load.s.alt 10
	idxaddr
	push.pri
	;$par
	push.adr c
	;$par
	push.c 314
	;$par
	push.adr ffffff7c
	;$par
	push.c 10
	sysreq.c 5	; CallLocalFunction
	stack 14
	stack 84
	retn


DATA f	; 170
dump 4f 6e 50 6c 61 79 65 72 43 6f 6d 6d 61 6e 64 52 
dump 65 63 65 69 76 65 64 0 69 73 0 63 6d 64 5f 25 
dump 73 0 4f 6e 50 6c 61 79 65 72 43 6f 6d 6d 61 6e 
dump 64 50 65 72 66 6f 72 6d 65 64 0 69 73 69 0 69 
dump 73 0 1 0 69 73 0 1 0 4f 6e 50 6c 61 79 65 
dump 72 43 6f 6d 6d 61 6e 64 50 65 72 66 6f 72 6d 65 
dump 64 0 69 73 69 0 69 73 0 69 73 0 

DATA 10	; 320
dump 0 

CODE 10	; 5f4
	proc	; OnFilterScriptInit
	; line 93
	; line 94
	break	; 5f8
	;$lcl name ffffff9c
	stack ffffff9c
	zero.pri
	addr.alt ffffff9c
	fill 64
	; line 97
	break	; 618
	push.c 18
	;$par
	push.c ffff
	;$par
	push.c 0
	sysreq.c 8	; GetMaxPlayers
	stack 4
	push.pri
	;$par
	push.c c
	sysreq.c 9	; SSCANF_Init
	stack 10
	;$exp
	; line 98
	break	; 660
	const.pri 1
	stor.pri 320
	;$exp
	; line 9b
	break	; 674
	;$lcl i ffffff98
	push.c 0
	;$exp
	jump d
l.b		; 688
	; line 9b
	break	; 688
	inc.s ffffff98
	;$exp
l.d
	load.s.pri ffffff98
	const.alt 3e8
	jsgeq c
	;$exp
	; line 9d
	break	; 6ac
	push.s ffffff98
	;$par
	push.c 4
	sysreq.c a	; IsPlayerConnected
	stack 8
	jzer f
	push.s ffffff98
	;$par
	push.c 4
	sysreq.c b	; SSCANF_IsConnected
	stack 8
	not
	jzer f
	const.pri 1
	jump 10
l.f
	zero.pri
l.10
	jzer e
	;$exp
	; line 9f
	break	; 720
	push.c 19
	;$par
	push.adr ffffff9c
	;$par
	push.s ffffff98
	;$par
	push.c c
	sysreq.c c	; GetPlayerName
	stack 10
	;$exp
	; line a0
	break	; 754
	push.s ffffff98
	;$par
	push.c 4
	sysreq.c d	; IsPlayerNPC
	stack 8
	push.pri
	;$par
	push.adr ffffff9c
	;$par
	push.s ffffff98
	;$par
	push.c c
	sysreq.c e	; SSCANF_Join
	stack 10
	;$exp
l.e		; 7a4
	jump b
l.c		; 7ac
	stack 4
	; line a7
	break	; 7b4
	const.pri 1
	stack 64
	retn

	proc	; zcmd_OnGameModeInit
	; line bd
	; line be
	break	; 7d0
	load.pri 320
	not
	jzer 11
	;$exp
	; line c0
	break	; 7e8
	;$lcl name ffffff9c
	stack ffffff9c
	zero.pri
	addr.alt ffffff9c
	fill 64
	; line c3
	break	; 808
	push.c 18
	;$par
	push.c ffff
	;$par
	push.c 0
	sysreq.c 8	; GetMaxPlayers
	stack 4
	push.pri
	;$par
	push.c c
	sysreq.c 9	; SSCANF_Init
	stack 10
	;$exp
	; line c4
	break	; 850
	const.pri 1
	stor.pri 320
	;$exp
	; line c7
	break	; 864
	;$lcl i ffffff98
	push.c 0
	;$exp
	jump 14
l.12		; 878
	; line c7
	break	; 878
	inc.s ffffff98
	;$exp
l.14
	load.s.pri ffffff98
	const.alt 3e8
	jsgeq 13
	;$exp
	; line c9
	break	; 89c
	push.s ffffff98
	;$par
	push.c 4
	sysreq.c a	; IsPlayerConnected
	stack 8
	jzer 16
	push.s ffffff98
	;$par
	push.c 4
	sysreq.c b	; SSCANF_IsConnected
	stack 8
	not
	jzer 16
	const.pri 1
	jump 17
l.16
	zero.pri
l.17
	jzer 15
	;$exp
	; line cb
	break	; 910
	push.c 19
	;$par
	push.adr ffffff9c
	;$par
	push.s ffffff98
	;$par
	push.c c
	sysreq.c c	; GetPlayerName
	stack 10
	;$exp
	; line cc
	break	; 944
	push.s ffffff98
	;$par
	push.c 4
	sysreq.c d	; IsPlayerNPC
	stack 8
	push.pri
	;$par
	push.adr ffffff9c
	;$par
	push.s ffffff98
	;$par
	push.c c
	sysreq.c e	; SSCANF_Join
	stack 10
	;$exp
l.15		; 994
	jump 12
l.13		; 99c
	stack 4
	stack 64
l.11		; 9ac
	; line d1
	break	; 9ac
	push.c 0
	call SSCANF_OnGameModeInit
	;$exp
	; line d3
	break	; 9c0
	const.pri 1
	retn

	proc	; OnPlayerConnect
	; line ea
	;$lcl playerid c
	; line eb
	break	; 9d4
	;$lcl name ffffff9c
	stack ffffff9c
	zero.pri
	addr.alt ffffff9c
	fill 64
	; line ed
	break	; 9f4
	push.c 19
	;$par
	push.adr ffffff9c
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c c	; GetPlayerName
	stack 10
	;$exp
	; line ee
	break	; a28
	push.s c
	;$par
	push.c 4
	sysreq.c d	; IsPlayerNPC
	stack 8
	push.pri
	;$par
	push.adr ffffff9c
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c e	; SSCANF_Join
	stack 10
	;$exp
	; line f0
	break	; a78
	push.s c
	;$par
	push.c 4
	call SSCANF_OnPlayerConnect
	;$exp
	; line f2
	break	; a94
	const.pri 1
	stack 64
	retn

	proc	; OnPlayerDisconnect
	; line 106
	;$lcl reason 10
	;$lcl playerid c
	; line 108
	break	; ab0
	push.s 10
	;$par
	push.s c
	;$par
	push.c 8
	call SSCANF_OnPlayerDisconnect
	;$exp
	; line 10a
	break	; ad4
	push.s c
	;$par
	push.c 4
	sysreq.c f	; SSCANF_Leave
	stack 8
	;$exp
	; line 10b
	break	; af8
	const.pri 1
	retn

	proc	; sscanf_weapon
	; line 157
	;$lcl string c
	; line 159
	break	; b0c
	load.s.pri c
	load.i
	const.alt 30
	xchg
	sleq
	push.pri
	const.pri 39
	sgeq
	pop.alt
	and
	jzer 18
	;$exp
	; line 15b
	break	; b4c
	;$lcl ret fffffffc
	stack fffffffc
	push.s c
	;$par
	push.c 4
	sysreq.c 10	; strval
	stack 8
	stor.s.pri fffffffc
	;$exp
	; line 15d
	break	; b80
	load.s.pri fffffffc
	zero.alt
	xchg
	sleq
	push.pri
	const.pri 12
	xchg
	sleq
	swap.alt
	and
	pop.alt
	jnz 1a
	const.pri 16
	load.s.alt fffffffc
	sleq
	push.pri
	const.pri 2e
	xchg
	sleq
	swap.alt
	and
	pop.alt
	jnz 1a
	zero.pri
	jump 1b
l.1a
	const.pri 1
l.1b
	jzer 19
	;$exp
	; line 15f
	break	; c18
	load.s.pri fffffffc
	stack 4
	retn
l.19		; c30
	stack 4
	jump 1c
l.18		; c40
	; line 162
	break	; c40
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 324
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1d
	;$exp
	; line 162
	break	; c88
	zero.pri
	retn
l.1d		; c94
	; line 163
	break	; c94
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 344
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1f
	;$exp
	; line 163
	break	; cdc
	const.pri 1
	retn
l.1f		; cec
	; line 164
	break	; cec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 380
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 21
	;$exp
	; line 164
	break	; d34
	const.pri 2
	retn
l.21		; d44
	; line 165
	break	; d44
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 3a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 23
	;$exp
	; line 165
	break	; d8c
	const.pri 3
	retn
l.23		; d9c
	; line 166
	break	; d9c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 3d8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 25
	;$exp
	; line 166
	break	; de4
	const.pri 4
	retn
l.25		; df4
	; line 167
	break	; df4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 3f0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 27
	;$exp
	; line 167
	break	; e3c
	const.pri 5
	retn
l.27		; e4c
	; line 168
	break	; e4c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 424
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 29
	;$exp
	; line 168
	break	; e94
	const.pri 6
	retn
l.29		; ea4
	; line 169
	break	; ea4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 440
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 2b
	;$exp
	; line 169
	break	; eec
	const.pri 7
	retn
l.2b		; efc
	; line 16a
	break	; efc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 464
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 2d
	;$exp
	; line 16a
	break	; f44
	const.pri 8
	retn
l.2d		; f54
	; line 16b
	break	; f54
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 480
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 2f
	;$exp
	; line 16b
	break	; f9c
	const.pri 9
	retn
l.2f		; fac
	; line 16c
	break	; fac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 4a4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 31
	;$exp
	; line 16c
	break	; ff4
	const.pri a
	retn
l.31		; 1004
	; line 16d
	break	; 1004
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 4d8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 33
	;$exp
	; line 16d
	break	; 104c
	const.pri b
	retn
l.33		; 105c
	; line 16e
	break	; 105c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 508
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 35
	;$exp
	; line 16e
	break	; 10a4
	const.pri c
	retn
l.35		; 10b4
	; line 16f
	break	; 10b4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 54c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 37
	;$exp
	; line 16f
	break	; 10fc
	const.pri d
	retn
l.37		; 110c
	; line 170
	break	; 110c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 584
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 39
	;$exp
	; line 170
	break	; 1154
	const.pri e
	retn
l.39		; 1164
	; line 171
	break	; 1164
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 5a4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 3b
	;$exp
	; line 171
	break	; 11ac
	const.pri f
	retn
l.3b		; 11bc
	; line 172
	break	; 11bc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 5b8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 3d
	;$exp
	; line 172
	break	; 1204
	const.pri 10
	retn
l.3d		; 1214
	; line 173
	break	; 1214
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 5dc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 3f
	;$exp
	; line 173
	break	; 125c
	const.pri 11
	retn
l.3f		; 126c
	; line 174
	break	; 126c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 600
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 41
	;$exp
	; line 174
	break	; 12b4
	const.pri 12
	retn
l.41		; 12c4
	; line 175
	break	; 12c4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 624
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 43
	;$exp
	; line 175
	break	; 130c
	const.pri 16
	retn
l.43		; 131c
	; line 176
	break	; 131c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 640
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 45
	;$exp
	; line 176
	break	; 1364
	const.pri 17
	retn
l.45		; 1374
	; line 177
	break	; 1374
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 680
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 47
	;$exp
	; line 177
	break	; 13bc
	const.pri 18
	retn
l.47		; 13cc
	; line 178
	break	; 13cc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 6b4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 49
	;$exp
	; line 178
	break	; 1414
	const.pri 19
	retn
l.49		; 1424
	; line 179
	break	; 1424
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 6d4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 4b
	;$exp
	; line 179
	break	; 146c
	const.pri 1a
	retn
l.4b		; 147c
	; line 17a
	break	; 147c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 718
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 4d
	;$exp
	; line 17a
	break	; 14c4
	const.pri 1b
	retn
l.4d		; 14d4
	; line 17b
	break	; 14d4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 754
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 4f
	;$exp
	; line 17b
	break	; 151c
	const.pri 1c
	retn
l.4f		; 152c
	; line 17c
	break	; 152c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 77c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 51
	;$exp
	; line 17c
	break	; 1574
	const.pri 1c
	retn
l.51		; 1584
	; line 17d
	break	; 1584
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 798
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 53
	;$exp
	; line 17d
	break	; 15cc
	const.pri 1d
	retn
l.53		; 15dc
	; line 17e
	break	; 15dc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 7a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 55
	;$exp
	; line 17e
	break	; 1624
	const.pri 1e
	retn
l.55		; 1634
	; line 17f
	break	; 1634
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 7bc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 57
	;$exp
	; line 17f
	break	; 167c
	const.pri 1f
	retn
l.57		; 168c
	; line 180
	break	; 168c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 7c8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 59
	;$exp
	; line 180
	break	; 16d4
	const.pri 20
	retn
l.59		; 16e4
	; line 181
	break	; 16e4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 7dc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 5b
	;$exp
	; line 181
	break	; 172c
	const.pri 21
	retn
l.5b		; 173c
	; line 182
	break	; 173c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 7f4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 5d
	;$exp
	; line 182
	break	; 1784
	const.pri 22
	retn
l.5d		; 1794
	; line 183
	break	; 1794
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 828
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 5f
	;$exp
	; line 183
	break	; 17dc
	const.pri 23
	retn
l.5f		; 17ec
	; line 184
	break	; 17ec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 838
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 61
	;$exp
	; line 184
	break	; 1834
	const.pri 24
	retn
l.61		; 1844
	; line 185
	break	; 1844
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 87c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 63
	;$exp
	; line 185
	break	; 188c
	const.pri 25
	retn
l.63		; 189c
	; line 186
	break	; 189c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 8b4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 65
	;$exp
	; line 186
	break	; 18e4
	const.pri 26
	retn
l.65		; 18f4
	; line 187
	break	; 18f4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 8d4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 67
	;$exp
	; line 187
	break	; 193c
	const.pri 27
	retn
l.67		; 194c
	; line 188
	break	; 194c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 910
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 69
	;$exp
	; line 188
	break	; 1994
	const.pri 28
	retn
l.69		; 19a4
	; line 189
	break	; 19a4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 938
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 6b
	;$exp
	; line 189
	break	; 19ec
	const.pri 29
	retn
l.6b		; 19fc
	; line 18a
	break	; 19fc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 968
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 6d
	;$exp
	; line 18a
	break	; 1a44
	const.pri 2a
	retn
l.6d		; 1a54
	; line 18b
	break	; 1a54
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 9b0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 6f
	;$exp
	; line 18b
	break	; 1a9c
	const.pri 2b
	retn
l.6f		; 1aac
	; line 18c
	break	; 1aac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 9cc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 71
	;$exp
	; line 18c
	break	; 1af4
	const.pri 2c
	retn
l.71		; 1b04
	; line 18d
	break	; 1b04
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c a1c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 73
	;$exp
	; line 18d
	break	; 1b4c
	const.pri 2d
	retn
l.73		; 1b5c
	; line 18e
	break	; 1b5c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c a5c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 75
	;$exp
	; line 18e
	break	; 1ba4
	const.pri 2e
	retn
l.75		; 1bb4
l.74		; 1bb4
l.72		; 1bb4
l.70		; 1bb4
l.6e		; 1bb4
l.6c		; 1bb4
l.6a		; 1bb4
l.68		; 1bb4
l.66		; 1bb4
l.64		; 1bb4
l.62		; 1bb4
l.60		; 1bb4
l.5e		; 1bb4
l.5c		; 1bb4
l.5a		; 1bb4
l.58		; 1bb4
l.56		; 1bb4
l.54		; 1bb4
l.52		; 1bb4
l.50		; 1bb4
l.4e		; 1bb4
l.4c		; 1bb4
l.4a		; 1bb4
l.48		; 1bb4
l.46		; 1bb4
l.44		; 1bb4
l.42		; 1bb4
l.40		; 1bb4
l.3e		; 1bb4
l.3c		; 1bb4
l.3a		; 1bb4
l.38		; 1bb4
l.36		; 1bb4
l.34		; 1bb4
l.32		; 1bb4
l.30		; 1bb4
l.2e		; 1bb4
l.2c		; 1bb4
l.2a		; 1bb4
l.28		; 1bb4
l.26		; 1bb4
l.24		; 1bb4
l.22		; 1bb4
l.20		; 1bb4
l.1e		; 1bb4
l.1c		; 1bb4
	; line 18f
	break	; 1bb4
	const.pri ffffffff
	retn


DATA 10	; 324
dump 55 6e 61 72 6d 65 64 0 42 72 61 73 73 20 4b 6e 
dump 75 63 6b 6c 65 73 0 47 6f 6c 66 20 43 6c 75 62 
dump 0 4e 69 67 68 74 20 53 74 69 63 6b 0 4b 6e 69 
dump 66 65 0 42 61 73 65 62 61 6c 6c 20 42 61 74 0 
dump 53 68 6f 76 65 6c 0 50 6f 6f 6c 20 63 75 65 0 
dump 4b 61 74 61 6e 61 0 43 68 61 69 6e 73 61 77 0 
dump 50 75 72 70 6c 65 20 44 69 6c 64 6f 0 57 68 69 
dump 74 65 20 44 69 6c 64 6f 0 4c 6f 6e 67 20 57 68 
dump 69 74 65 20 44 69 6c 64 6f 0 57 68 69 74 65 20 
dump 44 69 6c 64 6f 20 32 0 46 6c 6f 77 65 72 73 0 
dump 43 61 6e 65 0 47 72 65 6e 61 64 65 73 0 54 65 
dump 61 72 20 47 61 73 0 4d 6f 6c 6f 74 6f 76 73 0 
dump 50 69 73 74 6f 6c 0 53 69 6c 65 6e 63 65 64 20 
dump 50 69 73 74 6f 6c 0 44 65 73 65 72 74 20 45 61 
dump 67 6c 65 0 53 68 6f 74 67 75 6e 0 53 61 77 6e 
dump 20 4f 66 66 20 53 68 6f 74 67 75 6e 0 43 6f 6d 
dump 62 61 74 20 53 68 6f 74 67 75 6e 0 4d 69 63 72 
dump 6f 20 55 7a 69 0 4d 61 63 20 31 30 0 4d 50 35 
dump 0 41 4b 34 37 0 4d 34 0 54 65 63 39 0 52 69 
dump 66 6c 65 0 53 6e 69 70 65 72 20 52 69 66 6c 65 
dump 0 52 50 47 0 4d 69 73 73 69 6c 65 20 4c 61 75 
dump 6e 63 68 65 72 0 46 6c 61 6d 65 20 54 68 72 6f 
dump 77 65 72 0 4d 69 6e 69 67 75 6e 0 53 61 63 68 
dump 65 6c 20 43 68 61 72 67 65 73 0 44 65 74 6f 6e 
dump 61 74 6f 72 0 53 70 72 61 79 20 50 61 69 6e 74 
dump 0 46 69 72 65 20 45 78 74 69 6e 67 75 69 73 68 
dump 65 72 0 43 61 6d 65 72 61 0 4e 69 67 68 74 76 
dump 69 73 69 6f 6e 20 47 6f 67 67 6c 65 73 0 54 68 
dump 65 72 6d 61 6c 20 47 6f 67 67 6c 65 73 0 50 61 
dump 72 61 63 68 75 74 65 0 

CODE 10	; 1bc4
	proc	; sscanf_vehicle
	; line 193
	;$lcl string c
	; line 195
	break	; 1bc8
	load.s.pri c
	load.i
	const.alt 30
	xchg
	sleq
	push.pri
	const.pri 39
	sgeq
	pop.alt
	and
	jzer 76
	;$exp
	; line 197
	break	; 1c08
	;$lcl ret fffffffc
	stack fffffffc
	push.s c
	;$par
	push.c 4
	sysreq.c 10	; strval
	stack 8
	stor.s.pri fffffffc
	;$exp
	; line 199
	break	; 1c3c
	const.pri 190
	load.s.alt fffffffc
	sleq
	push.pri
	const.pri 263
	sgeq
	pop.alt
	and
	jzer 77
	;$exp
	; line 19b
	break	; 1c74
	load.s.pri fffffffc
	stack 4
	retn
l.77		; 1c8c
	stack 4
	jump 78
l.76		; 1c9c
	; line 19e
	break	; 1c9c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c a84
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 79
	;$exp
	; line 19e
	break	; 1ce4
	const.pri 190
	retn
l.79		; 1cf4
	; line 19f
	break	; 1cf4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ab4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 7b
	;$exp
	; line 19f
	break	; 1d3c
	const.pri 191
	retn
l.7b		; 1d4c
	; line 1a0
	break	; 1d4c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ad4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 7d
	;$exp
	; line 1a0
	break	; 1d94
	const.pri 192
	retn
l.7d		; 1da4
	; line 1a1
	break	; 1da4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c af4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 7f
	;$exp
	; line 1a1
	break	; 1dec
	const.pri 193
	retn
l.7f		; 1dfc
	; line 1a2
	break	; 1dfc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c b20
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 81
	;$exp
	; line 1a2
	break	; 1e44
	const.pri 194
	retn
l.81		; 1e54
	; line 1a3
	break	; 1e54
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c b48
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 83
	;$exp
	; line 1a3
	break	; 1e9c
	const.pri 195
	retn
l.83		; 1eac
	; line 1a4
	break	; 1eac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c b6c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 85
	;$exp
	; line 1a4
	break	; 1ef4
	const.pri 196
	retn
l.85		; 1f04
	; line 1a5
	break	; 1f04
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c b88
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 87
	;$exp
	; line 1a5
	break	; 1f4c
	const.pri 197
	retn
l.87		; 1f5c
	; line 1a6
	break	; 1f5c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c bb0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 89
	;$exp
	; line 1a6
	break	; 1fa4
	const.pri 198
	retn
l.89		; 1fb4
	; line 1a7
	break	; 1fb4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c be0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 8b
	;$exp
	; line 1a7
	break	; 1ffc
	const.pri 199
	retn
l.8b		; 200c
	; line 1a8
	break	; 200c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c c00
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 8d
	;$exp
	; line 1a8
	break	; 2054
	const.pri 19a
	retn
l.8d		; 2064
	; line 1a9
	break	; 2064
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c c1c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 8f
	;$exp
	; line 1a9
	break	; 20ac
	const.pri 19b
	retn
l.8f		; 20bc
	; line 1aa
	break	; 20bc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c c40
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 91
	;$exp
	; line 1aa
	break	; 2104
	const.pri 19c
	retn
l.91		; 2114
	; line 1ab
	break	; 2114
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c c5c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 93
	;$exp
	; line 1ab
	break	; 215c
	const.pri 19d
	retn
l.93		; 216c
	; line 1ac
	break	; 216c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c c70
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 95
	;$exp
	; line 1ac
	break	; 21b4
	const.pri 19e
	retn
l.95		; 21c4
	; line 1ad
	break	; 21c4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c c84
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 97
	;$exp
	; line 1ad
	break	; 220c
	const.pri 19f
	retn
l.97		; 221c
	; line 1ae
	break	; 221c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ca4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 99
	;$exp
	; line 1ae
	break	; 2264
	const.pri 1a0
	retn
l.99		; 2274
	; line 1af
	break	; 2274
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ccc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 9b
	;$exp
	; line 1af
	break	; 22bc
	const.pri 1a1
	retn
l.9b		; 22cc
	; line 1b0
	break	; 22cc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c cf4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 9d
	;$exp
	; line 1b0
	break	; 2314
	const.pri 1a2
	retn
l.9d		; 2324
	; line 1b1
	break	; 2324
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c d18
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 9f
	;$exp
	; line 1b1
	break	; 236c
	const.pri 1a3
	retn
l.9f		; 237c
	; line 1b2
	break	; 237c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c d40
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer a1
	;$exp
	; line 1b2
	break	; 23c4
	const.pri 1a4
	retn
l.a1		; 23d4
	; line 1b3
	break	; 23d4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c d54
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer a3
	;$exp
	; line 1b3
	break	; 241c
	const.pri 1a5
	retn
l.a3		; 242c
	; line 1b4
	break	; 242c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c d80
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer a5
	;$exp
	; line 1b4
	break	; 2474
	const.pri 1a6
	retn
l.a5		; 2484
	; line 1b5
	break	; 2484
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c d9c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer a7
	;$exp
	; line 1b5
	break	; 24cc
	const.pri 1a7
	retn
l.a7		; 24dc
	; line 1b6
	break	; 24dc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c dc8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer a9
	;$exp
	; line 1b6
	break	; 2524
	const.pri 1a8
	retn
l.a9		; 2534
	; line 1b7
	break	; 2534
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c dfc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer ab
	;$exp
	; line 1b7
	break	; 257c
	const.pri 1a9
	retn
l.ab		; 258c
	; line 1b8
	break	; 258c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c e18
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer ad
	;$exp
	; line 1b8
	break	; 25d4
	const.pri 1aa
	retn
l.ad		; 25e4
	; line 1b9
	break	; 25e4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c e38
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer af
	;$exp
	; line 1b9
	break	; 262c
	const.pri 1ab
	retn
l.af		; 263c
	; line 1ba
	break	; 263c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c e5c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer b1
	;$exp
	; line 1ba
	break	; 2684
	const.pri 1ac
	retn
l.b1		; 2694
	; line 1bb
	break	; 2694
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c e84
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer b3
	;$exp
	; line 1bb
	break	; 26dc
	const.pri 1ad
	retn
l.b3		; 26ec
	; line 1bc
	break	; 26ec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ea4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer b5
	;$exp
	; line 1bc
	break	; 2734
	const.pri 1ae
	retn
l.b5		; 2744
	; line 1bd
	break	; 2744
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ec8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer b7
	;$exp
	; line 1bd
	break	; 278c
	const.pri 1af
	retn
l.b7		; 279c
	; line 1be
	break	; 279c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ed8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer b9
	;$exp
	; line 1be
	break	; 27e4
	const.pri 1b0
	retn
l.b9		; 27f4
	; line 1bf
	break	; 27f4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ef0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer bb
	;$exp
	; line 1bf
	break	; 283c
	const.pri 1b1
	retn
l.bb		; 284c
	; line 1c0
	break	; 284c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c f14
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer bd
	;$exp
	; line 1c0
	break	; 2894
	const.pri 1b2
	retn
l.bd		; 28a4
	; line 1c1
	break	; 28a4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c f38
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer bf
	;$exp
	; line 1c1
	break	; 28ec
	const.pri 1b3
	retn
l.bf		; 28fc
	; line 1c2
	break	; 28fc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c f78
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer c1
	;$exp
	; line 1c2
	break	; 2944
	const.pri 1b4
	retn
l.c1		; 2954
	; line 1c3
	break	; 2954
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c f98
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer c3
	;$exp
	; line 1c3
	break	; 299c
	const.pri 1b5
	retn
l.c3		; 29ac
	; line 1c4
	break	; 29ac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c fb0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer c5
	;$exp
	; line 1c4
	break	; 29f4
	const.pri 1b6
	retn
l.c5		; 2a04
	; line 1c5
	break	; 2a04
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c fcc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer c7
	;$exp
	; line 1c5
	break	; 2a4c
	const.pri 1b7
	retn
l.c7		; 2a5c
	; line 1c6
	break	; 2a5c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c ff0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer c9
	;$exp
	; line 1c6
	break	; 2aa4
	const.pri 1b8
	retn
l.c9		; 2ab4
	; line 1c7
	break	; 2ab4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1008
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer cb
	;$exp
	; line 1c7
	break	; 2afc
	const.pri 1b9
	retn
l.cb		; 2b0c
	; line 1c8
	break	; 2b0c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1030
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer cd
	;$exp
	; line 1c8
	break	; 2b54
	const.pri 1ba
	retn
l.cd		; 2b64
	; line 1c9
	break	; 2b64
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 104c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer cf
	;$exp
	; line 1c9
	break	; 2bac
	const.pri 1bb
	retn
l.cf		; 2bbc
	; line 1ca
	break	; 2bbc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1068
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer d1
	;$exp
	; line 1ca
	break	; 2c04
	const.pri 1bc
	retn
l.d1		; 2c14
	; line 1cb
	break	; 2c14
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1088
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer d3
	;$exp
	; line 1cb
	break	; 2c5c
	const.pri 1bd
	retn
l.d3		; 2c6c
	; line 1cc
	break	; 2c6c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 10a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer d5
	;$exp
	; line 1cc
	break	; 2cb4
	const.pri 1be
	retn
l.d5		; 2cc4
	; line 1cd
	break	; 2cc4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 10c8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer d7
	;$exp
	; line 1cd
	break	; 2d0c
	const.pri 1bf
	retn
l.d7		; 2d1c
	; line 1ce
	break	; 2d1c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 10f4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer d9
	;$exp
	; line 1ce
	break	; 2d64
	const.pri 1c0
	retn
l.d9		; 2d74
	; line 1cf
	break	; 2d74
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1118
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer db
	;$exp
	; line 1cf
	break	; 2dbc
	const.pri 1c1
	retn
l.db		; 2dcc
	; line 1d0
	break	; 2dcc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 112c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer dd
	;$exp
	; line 1d0
	break	; 2e14
	const.pri 1c2
	retn
l.dd		; 2e24
	; line 1d1
	break	; 2e24
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1174
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer df
	;$exp
	; line 1d1
	break	; 2e6c
	const.pri 1c3
	retn
l.df		; 2e7c
	; line 1d2
	break	; 2e7c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1194
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer e1
	;$exp
	; line 1d2
	break	; 2ec4
	const.pri 1c4
	retn
l.e1		; 2ed4
	; line 1d3
	break	; 2ed4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 11b4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer e3
	;$exp
	; line 1d3
	break	; 2f1c
	const.pri 1c5
	retn
l.e3		; 2f2c
	; line 1d4
	break	; 2f2c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 11d0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer e5
	;$exp
	; line 1d4
	break	; 2f74
	const.pri 1c6
	retn
l.e5		; 2f84
	; line 1d5
	break	; 2f84
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 11ec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer e7
	;$exp
	; line 1d5
	break	; 2fcc
	const.pri 1c7
	retn
l.e7		; 2fdc
	; line 1d6
	break	; 2fdc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 120c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer e9
	;$exp
	; line 1d6
	break	; 3024
	const.pri 1c8
	retn
l.e9		; 3034
	; line 1d7
	break	; 3034
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1228
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer eb
	;$exp
	; line 1d7
	break	; 307c
	const.pri 1c9
	retn
l.eb		; 308c
	; line 1d8
	break	; 308c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1240
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer ed
	;$exp
	; line 1d8
	break	; 30d4
	const.pri 1ca
	retn
l.ed		; 30e4
	; line 1d9
	break	; 30e4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 125c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer ef
	;$exp
	; line 1d9
	break	; 312c
	const.pri 1cb
	retn
l.ef		; 313c
	; line 1da
	break	; 313c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 12a0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer f1
	;$exp
	; line 1da
	break	; 3184
	const.pri 1cc
	retn
l.f1		; 3194
	; line 1db
	break	; 3194
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 12c0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer f3
	;$exp
	; line 1db
	break	; 31dc
	const.pri 1cd
	retn
l.f3		; 31ec
	; line 1dc
	break	; 31ec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 12e0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer f5
	;$exp
	; line 1dc
	break	; 3234
	const.pri 1ce
	retn
l.f5		; 3244
	; line 1dd
	break	; 3244
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 12fc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer f7
	;$exp
	; line 1dd
	break	; 328c
	const.pri 1cf
	retn
l.f7		; 329c
	; line 1de
	break	; 329c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 131c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer f9
	;$exp
	; line 1de
	break	; 32e4
	const.pri 1d0
	retn
l.f9		; 32f4
	; line 1df
	break	; 32f4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1340
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer fb
	;$exp
	; line 1df
	break	; 333c
	const.pri 1d1
	retn
l.fb		; 334c
	; line 1e0
	break	; 334c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1368
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer fd
	;$exp
	; line 1e0
	break	; 3394
	const.pri 1d2
	retn
l.fd		; 33a4
	; line 1e1
	break	; 33a4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 138c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer ff
	;$exp
	; line 1e1
	break	; 33ec
	const.pri 1d3
	retn
l.ff		; 33fc
	; line 1e2
	break	; 33fc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 13ac
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 101
	;$exp
	; line 1e2
	break	; 3444
	const.pri 1d4
	retn
l.101		; 3454
	; line 1e3
	break	; 3454
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 13cc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 103
	;$exp
	; line 1e3
	break	; 349c
	const.pri 1d5
	retn
l.103		; 34ac
	; line 1e4
	break	; 34ac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 13ec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 105
	;$exp
	; line 1e4
	break	; 34f4
	const.pri 1d6
	retn
l.105		; 3504
	; line 1e5
	break	; 3504
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 140c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 107
	;$exp
	; line 1e5
	break	; 354c
	const.pri 1d7
	retn
l.107		; 355c
	; line 1e6
	break	; 355c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1420
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 109
	;$exp
	; line 1e6
	break	; 35a4
	const.pri 1d8
	retn
l.109		; 35b4
	; line 1e7
	break	; 35b4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 144c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 10b
	;$exp
	; line 1e7
	break	; 35fc
	const.pri 1d9
	retn
l.10b		; 360c
	; line 1e8
	break	; 360c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1468
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 10d
	;$exp
	; line 1e8
	break	; 3654
	const.pri 1da
	retn
l.10d		; 3664
	; line 1e9
	break	; 3664
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1484
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 10f
	;$exp
	; line 1e9
	break	; 36ac
	const.pri 1db
	retn
l.10f		; 36bc
	; line 1ea
	break	; 36bc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 149c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 111
	;$exp
	; line 1ea
	break	; 3704
	const.pri 1dc
	retn
l.111		; 3714
	; line 1eb
	break	; 3714
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 14bc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 113
	;$exp
	; line 1eb
	break	; 375c
	const.pri 1dd
	retn
l.113		; 376c
	; line 1ec
	break	; 376c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 14d8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 115
	;$exp
	; line 1ec
	break	; 37b4
	const.pri 1de
	retn
l.115		; 37c4
	; line 1ed
	break	; 37c4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 14f4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 117
	;$exp
	; line 1ed
	break	; 380c
	const.pri 1df
	retn
l.117		; 381c
	; line 1ee
	break	; 381c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1510
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 119
	;$exp
	; line 1ee
	break	; 3864
	const.pri 1e0
	retn
l.119		; 3874
	; line 1ef
	break	; 3874
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1528
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 11b
	;$exp
	; line 1ef
	break	; 38bc
	const.pri 1e1
	retn
l.11b		; 38cc
	; line 1f0
	break	; 38cc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1538
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 11d
	;$exp
	; line 1f0
	break	; 3914
	const.pri 1e2
	retn
l.11d		; 3924
	; line 1f1
	break	; 3924
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1558
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 11f
	;$exp
	; line 1f1
	break	; 396c
	const.pri 1e3
	retn
l.11f		; 397c
	; line 1f2
	break	; 397c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1574
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 121
	;$exp
	; line 1f2
	break	; 39c4
	const.pri 1e4
	retn
l.121		; 39d4
	; line 1f3
	break	; 39d4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1594
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 123
	;$exp
	; line 1f3
	break	; 3a1c
	const.pri 1e5
	retn
l.123		; 3a2c
	; line 1f4
	break	; 3a2c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 15b4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 125
	;$exp
	; line 1f4
	break	; 3a74
	const.pri 1e6
	retn
l.125		; 3a84
	; line 1f5
	break	; 3a84
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 15cc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 127
	;$exp
	; line 1f5
	break	; 3acc
	const.pri 1e7
	retn
l.127		; 3adc
	; line 1f6
	break	; 3adc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 15f0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 129
	;$exp
	; line 1f6
	break	; 3b24
	const.pri 1e8
	retn
l.129		; 3b34
	; line 1f7
	break	; 3b34
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1638
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 12b
	;$exp
	; line 1f7
	break	; 3b7c
	const.pri 1e9
	retn
l.12b		; 3b8c
	; line 1f8
	break	; 3b8c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1658
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 12d
	;$exp
	; line 1f8
	break	; 3bd4
	const.pri 1ea
	retn
l.12d		; 3be4
	; line 1f9
	break	; 3be4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1688
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 12f
	;$exp
	; line 1f9
	break	; 3c2c
	const.pri 1eb
	retn
l.12f		; 3c3c
	; line 1fa
	break	; 3c3c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 16a0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 131
	;$exp
	; line 1fa
	break	; 3c84
	const.pri 1ec
	retn
l.131		; 3c94
	; line 1fb
	break	; 3c94
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 16c8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 133
	;$exp
	; line 1fb
	break	; 3cdc
	const.pri 1ed
	retn
l.133		; 3cec
	; line 1fc
	break	; 3cec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 16e4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 135
	;$exp
	; line 1fc
	break	; 3d34
	const.pri 1ee
	retn
l.135		; 3d44
	; line 1fd
	break	; 3d44
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 171c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 137
	;$exp
	; line 1fd
	break	; 3d8c
	const.pri 1ef
	retn
l.137		; 3d9c
	; line 1fe
	break	; 3d9c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1740
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 139
	;$exp
	; line 1fe
	break	; 3de4
	const.pri 1f0
	retn
l.139		; 3df4
	; line 1ff
	break	; 3df4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 177c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 13b
	;$exp
	; line 1ff
	break	; 3e3c
	const.pri 1f1
	retn
l.13b		; 3e4c
	; line 200
	break	; 3e4c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 17bc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 13d
	;$exp
	; line 200
	break	; 3e94
	const.pri 1f2
	retn
l.13d		; 3ea4
	; line 201
	break	; 3ea4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 17e0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 13f
	;$exp
	; line 201
	break	; 3eec
	const.pri 1f3
	retn
l.13f		; 3efc
	; line 202
	break	; 3efc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 17fc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 141
	;$exp
	; line 202
	break	; 3f44
	const.pri 1f4
	retn
l.141		; 3f54
	; line 203
	break	; 3f54
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1810
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 143
	;$exp
	; line 203
	break	; 3f9c
	const.pri 1f5
	retn
l.143		; 3fac
	; line 204
	break	; 3fac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1838
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 145
	;$exp
	; line 204
	break	; 3ff4
	const.pri 1f6
	retn
l.145		; 4004
	; line 205
	break	; 4004
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1870
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 147
	;$exp
	; line 205
	break	; 404c
	const.pri 1f7
	retn
l.147		; 405c
	; line 206
	break	; 405c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 18a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 149
	;$exp
	; line 206
	break	; 40a4
	const.pri 1f8
	retn
l.149		; 40b4
	; line 207
	break	; 40b4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 18ec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 14b
	;$exp
	; line 207
	break	; 40fc
	const.pri 1f9
	retn
l.14b		; 410c
	; line 208
	break	; 410c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 190c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 14d
	;$exp
	; line 208
	break	; 4154
	const.pri 1fa
	retn
l.14d		; 4164
	; line 209
	break	; 4164
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1930
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 14f
	;$exp
	; line 209
	break	; 41ac
	const.pri 1fb
	retn
l.14f		; 41bc
	; line 20a
	break	; 41bc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1950
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 151
	;$exp
	; line 20a
	break	; 4204
	const.pri 1fc
	retn
l.151		; 4214
	; line 20b
	break	; 4214
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1970
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 153
	;$exp
	; line 20b
	break	; 425c
	const.pri 1fd
	retn
l.153		; 426c
	; line 20c
	break	; 426c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1984
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 155
	;$exp
	; line 20c
	break	; 42b4
	const.pri 1fe
	retn
l.155		; 42c4
	; line 20d
	break	; 42c4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 19bc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 157
	;$exp
	; line 20d
	break	; 430c
	const.pri 1ff
	retn
l.157		; 431c
	; line 20e
	break	; 431c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 19d8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 159
	;$exp
	; line 20e
	break	; 4364
	const.pri 200
	retn
l.159		; 4374
	; line 20f
	break	; 4374
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1a04
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 15b
	;$exp
	; line 20f
	break	; 43bc
	const.pri 201
	retn
l.15b		; 43cc
	; line 210
	break	; 43cc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1a30
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 15d
	;$exp
	; line 210
	break	; 4414
	const.pri 202
	retn
l.15d		; 4424
	; line 211
	break	; 4424
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1a4c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 15f
	;$exp
	; line 211
	break	; 446c
	const.pri 203
	retn
l.15f		; 447c
	; line 212
	break	; 447c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1a74
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 161
	;$exp
	; line 212
	break	; 44c4
	const.pri 204
	retn
l.161		; 44d4
	; line 213
	break	; 44d4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1a90
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 163
	;$exp
	; line 213
	break	; 451c
	const.pri 205
	retn
l.163		; 452c
	; line 214
	break	; 452c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1ab4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 165
	;$exp
	; line 214
	break	; 4574
	const.pri 206
	retn
l.165		; 4584
	; line 215
	break	; 4584
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1adc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 167
	;$exp
	; line 215
	break	; 45cc
	const.pri 207
	retn
l.167		; 45dc
	; line 216
	break	; 45dc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1af8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 169
	;$exp
	; line 216
	break	; 4624
	const.pri 208
	retn
l.169		; 4634
	; line 217
	break	; 4634
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1b10
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 16b
	;$exp
	; line 217
	break	; 467c
	const.pri 209
	retn
l.16b		; 468c
	; line 218
	break	; 468c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1b30
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 16d
	;$exp
	; line 218
	break	; 46d4
	const.pri 20a
	retn
l.16d		; 46e4
	; line 219
	break	; 46e4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1b50
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 16f
	;$exp
	; line 219
	break	; 472c
	const.pri 20b
	retn
l.16f		; 473c
	; line 21a
	break	; 473c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1b70
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 171
	;$exp
	; line 21a
	break	; 4784
	const.pri 20c
	retn
l.171		; 4794
	; line 21b
	break	; 4794
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1ba4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 173
	;$exp
	; line 21b
	break	; 47dc
	const.pri 20d
	retn
l.173		; 47ec
	; line 21c
	break	; 47ec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1bc8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 175
	;$exp
	; line 21c
	break	; 4834
	const.pri 20e
	retn
l.175		; 4844
	; line 21d
	break	; 4844
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1be8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 177
	;$exp
	; line 21d
	break	; 488c
	const.pri 20f
	retn
l.177		; 489c
	; line 21e
	break	; 489c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1c08
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 179
	;$exp
	; line 21e
	break	; 48e4
	const.pri 210
	retn
l.179		; 48f4
	; line 21f
	break	; 48f4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1c30
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 17b
	;$exp
	; line 21f
	break	; 493c
	const.pri 211
	retn
l.17b		; 494c
	; line 220
	break	; 494c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1c50
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 17d
	;$exp
	; line 220
	break	; 4994
	const.pri 212
	retn
l.17d		; 49a4
	; line 221
	break	; 49a4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1c74
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 17f
	;$exp
	; line 221
	break	; 49ec
	const.pri 213
	retn
l.17f		; 49fc
	; line 222
	break	; 49fc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1c94
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 181
	;$exp
	; line 222
	break	; 4a44
	const.pri 214
	retn
l.181		; 4a54
	; line 223
	break	; 4a54
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1cdc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 183
	;$exp
	; line 223
	break	; 4a9c
	const.pri 215
	retn
l.183		; 4aac
	; line 224
	break	; 4aac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1cfc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 185
	;$exp
	; line 224
	break	; 4af4
	const.pri 216
	retn
l.185		; 4b04
	; line 225
	break	; 4b04
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1d24
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 187
	;$exp
	; line 225
	break	; 4b4c
	const.pri 217
	retn
l.187		; 4b5c
	; line 226
	break	; 4b5c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1d44
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 189
	;$exp
	; line 226
	break	; 4ba4
	const.pri 218
	retn
l.189		; 4bb4
	; line 227
	break	; 4bb4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1d5c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 18b
	;$exp
	; line 227
	break	; 4bfc
	const.pri 219
	retn
l.18b		; 4c0c
	; line 228
	break	; 4c0c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1d9c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 18d
	;$exp
	; line 228
	break	; 4c54
	const.pri 21a
	retn
l.18d		; 4c64
	; line 229
	break	; 4c64
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1dec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 18f
	;$exp
	; line 229
	break	; 4cac
	const.pri 21b
	retn
l.18f		; 4cbc
	; line 22a
	break	; 4cbc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1e08
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 191
	;$exp
	; line 22a
	break	; 4d04
	const.pri 21c
	retn
l.191		; 4d14
	; line 22b
	break	; 4d14
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1e28
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 193
	;$exp
	; line 22b
	break	; 4d5c
	const.pri 21d
	retn
l.193		; 4d6c
	; line 22c
	break	; 4d6c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1e44
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 195
	;$exp
	; line 22c
	break	; 4db4
	const.pri 21e
	retn
l.195		; 4dc4
	; line 22d
	break	; 4dc4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1e60
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 197
	;$exp
	; line 22d
	break	; 4e0c
	const.pri 21f
	retn
l.197		; 4e1c
	; line 22e
	break	; 4e1c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1e7c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 199
	;$exp
	; line 22e
	break	; 4e64
	const.pri 220
	retn
l.199		; 4e74
	; line 22f
	break	; 4e74
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1eb0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 19b
	;$exp
	; line 22f
	break	; 4ebc
	const.pri 221
	retn
l.19b		; 4ecc
	; line 230
	break	; 4ecc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1ed0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 19d
	;$exp
	; line 230
	break	; 4f14
	const.pri 222
	retn
l.19d		; 4f24
	; line 231
	break	; 4f24
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1ef4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 19f
	;$exp
	; line 231
	break	; 4f6c
	const.pri 223
	retn
l.19f		; 4f7c
	; line 232
	break	; 4f7c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1f0c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1a1
	;$exp
	; line 232
	break	; 4fc4
	const.pri 224
	retn
l.1a1		; 4fd4
	; line 233
	break	; 4fd4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1f30
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1a3
	;$exp
	; line 233
	break	; 501c
	const.pri 225
	retn
l.1a3		; 502c
	; line 234
	break	; 502c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1f48
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1a5
	;$exp
	; line 234
	break	; 5074
	const.pri 226
	retn
l.1a5		; 5084
	; line 235
	break	; 5084
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1f68
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1a7
	;$exp
	; line 235
	break	; 50cc
	const.pri 227
	retn
l.1a7		; 50dc
	; line 236
	break	; 50dc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1f80
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1a9
	;$exp
	; line 236
	break	; 5124
	const.pri 228
	retn
l.1a9		; 5134
	; line 237
	break	; 5134
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1fb0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1ab
	;$exp
	; line 237
	break	; 517c
	const.pri 229
	retn
l.1ab		; 518c
	; line 238
	break	; 518c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1fcc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1ad
	;$exp
	; line 238
	break	; 51d4
	const.pri 22a
	retn
l.1ad		; 51e4
	; line 239
	break	; 51e4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 1ff0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1af
	;$exp
	; line 239
	break	; 522c
	const.pri 22b
	retn
l.1af		; 523c
	; line 23a
	break	; 523c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2010
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1b1
	;$exp
	; line 23a
	break	; 5284
	const.pri 22c
	retn
l.1b1		; 5294
	; line 23b
	break	; 5294
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2040
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1b3
	;$exp
	; line 23b
	break	; 52dc
	const.pri 22d
	retn
l.1b3		; 52ec
	; line 23c
	break	; 52ec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2070
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1b5
	;$exp
	; line 23c
	break	; 5334
	const.pri 22e
	retn
l.1b5		; 5344
	; line 23d
	break	; 5344
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 208c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1b7
	;$exp
	; line 23d
	break	; 538c
	const.pri 22f
	retn
l.1b7		; 539c
	; line 23e
	break	; 539c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 20a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1b9
	;$exp
	; line 23e
	break	; 53e4
	const.pri 230
	retn
l.1b9		; 53f4
	; line 23f
	break	; 53f4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 20c4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1bb
	;$exp
	; line 23f
	break	; 543c
	const.pri 231
	retn
l.1bb		; 544c
	; line 240
	break	; 544c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 20e4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1bd
	;$exp
	; line 240
	break	; 5494
	const.pri 232
	retn
l.1bd		; 54a4
	; line 241
	break	; 54a4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 20fc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1bf
	;$exp
	; line 241
	break	; 54ec
	const.pri 233
	retn
l.1bf		; 54fc
	; line 242
	break	; 54fc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2124
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1c1
	;$exp
	; line 242
	break	; 5544
	const.pri 234
	retn
l.1c1		; 5554
	; line 243
	break	; 5554
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2148
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1c3
	;$exp
	; line 243
	break	; 559c
	const.pri 235
	retn
l.1c3		; 55ac
	; line 244
	break	; 55ac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2160
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1c5
	;$exp
	; line 244
	break	; 55f4
	const.pri 236
	retn
l.1c5		; 5604
	; line 245
	break	; 5604
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 217c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1c7
	;$exp
	; line 245
	break	; 564c
	const.pri 237
	retn
l.1c7		; 565c
	; line 246
	break	; 565c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 219c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1c9
	;$exp
	; line 246
	break	; 56a4
	const.pri 238
	retn
l.1c9		; 56b4
	; line 247
	break	; 56b4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 21bc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1cb
	;$exp
	; line 247
	break	; 56fc
	const.pri 239
	retn
l.1cb		; 570c
	; line 248
	break	; 570c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2230
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1cd
	;$exp
	; line 248
	break	; 5754
	const.pri 23a
	retn
l.1cd		; 5764
	; line 249
	break	; 5764
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 228c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1cf
	;$exp
	; line 249
	break	; 57ac
	const.pri 23b
	retn
l.1cf		; 57bc
	; line 24a
	break	; 57bc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 22a0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1d1
	;$exp
	; line 24a
	break	; 5804
	const.pri 23c
	retn
l.1d1		; 5814
	; line 24b
	break	; 5814
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 22b8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1d3
	;$exp
	; line 24b
	break	; 585c
	const.pri 23d
	retn
l.1d3		; 586c
	; line 24c
	break	; 586c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 22cc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1d5
	;$exp
	; line 24c
	break	; 58b4
	const.pri 23e
	retn
l.1d5		; 58c4
	; line 24d
	break	; 58c4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 22ec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1d7
	;$exp
	; line 24d
	break	; 590c
	const.pri 23f
	retn
l.1d7		; 591c
	; line 24e
	break	; 591c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2310
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1d9
	;$exp
	; line 24e
	break	; 5964
	const.pri 240
	retn
l.1d9		; 5974
	; line 24f
	break	; 5974
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2330
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1db
	;$exp
	; line 24f
	break	; 59bc
	const.pri 241
	retn
l.1db		; 59cc
	; line 250
	break	; 59cc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2348
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1dd
	;$exp
	; line 250
	break	; 5a14
	const.pri 242
	retn
l.1dd		; 5a24
	; line 251
	break	; 5a24
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2364
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1df
	;$exp
	; line 251
	break	; 5a6c
	const.pri 243
	retn
l.1df		; 5a7c
	; line 252
	break	; 5a7c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2384
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1e1
	;$exp
	; line 252
	break	; 5ac4
	const.pri 244
	retn
l.1e1		; 5ad4
	; line 253
	break	; 5ad4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 23a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1e3
	;$exp
	; line 253
	break	; 5b1c
	const.pri 245
	retn
l.1e3		; 5b2c
	; line 254
	break	; 5b2c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 23c4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1e5
	;$exp
	; line 254
	break	; 5b74
	const.pri 246
	retn
l.1e5		; 5b84
	; line 255
	break	; 5b84
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 23e4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1e7
	;$exp
	; line 255
	break	; 5bcc
	const.pri 247
	retn
l.1e7		; 5bdc
	; line 256
	break	; 5bdc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 23f4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1e9
	;$exp
	; line 256
	break	; 5c24
	const.pri 248
	retn
l.1e9		; 5c34
	; line 257
	break	; 5c34
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2430
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1eb
	;$exp
	; line 257
	break	; 5c7c
	const.pri 249
	retn
l.1eb		; 5c8c
	; line 258
	break	; 5c8c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2450
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1ed
	;$exp
	; line 258
	break	; 5cd4
	const.pri 24a
	retn
l.1ed		; 5ce4
	; line 259
	break	; 5ce4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2474
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1ef
	;$exp
	; line 259
	break	; 5d2c
	const.pri 24b
	retn
l.1ef		; 5d3c
	; line 25a
	break	; 5d3c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 248c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1f1
	;$exp
	; line 25a
	break	; 5d84
	const.pri 24c
	retn
l.1f1		; 5d94
	; line 25b
	break	; 5d94
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 24a8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1f3
	;$exp
	; line 25b
	break	; 5ddc
	const.pri 24d
	retn
l.1f3		; 5dec
	; line 25c
	break	; 5dec
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 24bc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1f5
	;$exp
	; line 25c
	break	; 5e34
	const.pri 24e
	retn
l.1f5		; 5e44
	; line 25d
	break	; 5e44
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 252c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1f7
	;$exp
	; line 25d
	break	; 5e8c
	const.pri 24f
	retn
l.1f7		; 5e9c
	; line 25e
	break	; 5e9c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2574
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1f9
	;$exp
	; line 25e
	break	; 5ee4
	const.pri 250
	retn
l.1f9		; 5ef4
	; line 25f
	break	; 5ef4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 259c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1fb
	;$exp
	; line 25f
	break	; 5f3c
	const.pri 251
	retn
l.1fb		; 5f4c
	; line 260
	break	; 5f4c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 25b0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1fd
	;$exp
	; line 260
	break	; 5f94
	const.pri 252
	retn
l.1fd		; 5fa4
	; line 261
	break	; 5fa4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 25cc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 1ff
	;$exp
	; line 261
	break	; 5fec
	const.pri 253
	retn
l.1ff		; 5ffc
	; line 262
	break	; 5ffc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 25e8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 201
	;$exp
	; line 262
	break	; 6044
	const.pri 254
	retn
l.201		; 6054
	; line 263
	break	; 6054
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2630
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 203
	;$exp
	; line 263
	break	; 609c
	const.pri 255
	retn
l.203		; 60ac
	; line 264
	break	; 60ac
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2678
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 205
	;$exp
	; line 264
	break	; 60f4
	const.pri 256
	retn
l.205		; 6104
	; line 265
	break	; 6104
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 26c0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 207
	;$exp
	; line 265
	break	; 614c
	const.pri 257
	retn
l.207		; 615c
	; line 266
	break	; 615c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 26f8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 209
	;$exp
	; line 266
	break	; 61a4
	const.pri 258
	retn
l.209		; 61b4
	; line 267
	break	; 61b4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2718
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 20b
	;$exp
	; line 267
	break	; 61fc
	const.pri 259
	retn
l.20b		; 620c
	; line 268
	break	; 620c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 273c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 20d
	;$exp
	; line 268
	break	; 6254
	const.pri 25a
	retn
l.20d		; 6264
	; line 269
	break	; 6264
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2754
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 20f
	;$exp
	; line 269
	break	; 62ac
	const.pri 25b
	retn
l.20f		; 62bc
	; line 26a
	break	; 62bc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2774
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 211
	;$exp
	; line 26a
	break	; 6304
	const.pri 25c
	retn
l.211		; 6314
	; line 26b
	break	; 6314
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 27ac
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 213
	;$exp
	; line 26b
	break	; 635c
	const.pri 25d
	retn
l.213		; 636c
	; line 26c
	break	; 636c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 27dc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 215
	;$exp
	; line 26c
	break	; 63b4
	const.pri 25e
	retn
l.215		; 63c4
	; line 26d
	break	; 63c4
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 282c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 217
	;$exp
	; line 26d
	break	; 640c
	const.pri 25f
	retn
l.217		; 641c
	; line 26e
	break	; 641c
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 287c
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 219
	;$exp
	; line 26e
	break	; 6464
	const.pri 260
	retn
l.219		; 6474
	; line 26f
	break	; 6474
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 28c8
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 21b
	;$exp
	; line 26f
	break	; 64bc
	const.pri 261
	retn
l.21b		; 64cc
	; line 270
	break	; 64cc
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 28ec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 21d
	;$exp
	; line 270
	break	; 6514
	const.pri 262
	retn
l.21d		; 6524
	; line 271
	break	; 6524
	push.c 7fffffff
	;$par
	push.c 1
	;$par
	push.c 2920
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	not
	jzer 21f
	;$exp
	; line 271
	break	; 656c
	const.pri 263
	retn
l.21f		; 657c
l.21e		; 657c
l.21c		; 657c
l.21a		; 657c
l.218		; 657c
l.216		; 657c
l.214		; 657c
l.212		; 657c
l.210		; 657c
l.20e		; 657c
l.20c		; 657c
l.20a		; 657c
l.208		; 657c
l.206		; 657c
l.204		; 657c
l.202		; 657c
l.200		; 657c
l.1fe		; 657c
l.1fc		; 657c
l.1fa		; 657c
l.1f8		; 657c
l.1f6		; 657c
l.1f4		; 657c
l.1f2		; 657c
l.1f0		; 657c
l.1ee		; 657c
l.1ec		; 657c
l.1ea		; 657c
l.1e8		; 657c
l.1e6		; 657c
l.1e4		; 657c
l.1e2		; 657c
l.1e0		; 657c
l.1de		; 657c
l.1dc		; 657c
l.1da		; 657c
l.1d8		; 657c
l.1d6		; 657c
l.1d4		; 657c
l.1d2		; 657c
l.1d0		; 657c
l.1ce		; 657c
l.1cc		; 657c
l.1ca		; 657c
l.1c8		; 657c
l.1c6		; 657c
l.1c4		; 657c
l.1c2		; 657c
l.1c0		; 657c
l.1be		; 657c
l.1bc		; 657c
l.1ba		; 657c
l.1b8		; 657c
l.1b6		; 657c
l.1b4		; 657c
l.1b2		; 657c
l.1b0		; 657c
l.1ae		; 657c
l.1ac		; 657c
l.1aa		; 657c
l.1a8		; 657c
l.1a6		; 657c
l.1a4		; 657c
l.1a2		; 657c
l.1a0		; 657c
l.19e		; 657c
l.19c		; 657c
l.19a		; 657c
l.198		; 657c
l.196		; 657c
l.194		; 657c
l.192		; 657c
l.190		; 657c
l.18e		; 657c
l.18c		; 657c
l.18a		; 657c
l.188		; 657c
l.186		; 657c
l.184		; 657c
l.182		; 657c
l.180		; 657c
l.17e		; 657c
l.17c		; 657c
l.17a		; 657c
l.178		; 657c
l.176		; 657c
l.174		; 657c
l.172		; 657c
l.170		; 657c
l.16e		; 657c
l.16c		; 657c
l.16a		; 657c
l.168		; 657c
l.166		; 657c
l.164		; 657c
l.162		; 657c
l.160		; 657c
l.15e		; 657c
l.15c		; 657c
l.15a		; 657c
l.158		; 657c
l.156		; 657c
l.154		; 657c
l.152		; 657c
l.150		; 657c
l.14e		; 657c
l.14c		; 657c
l.14a		; 657c
l.148		; 657c
l.146		; 657c
l.144		; 657c
l.142		; 657c
l.140		; 657c
l.13e		; 657c
l.13c		; 657c
l.13a		; 657c
l.138		; 657c
l.136		; 657c
l.134		; 657c
l.132		; 657c
l.130		; 657c
l.12e		; 657c
l.12c		; 657c
l.12a		; 657c
l.128		; 657c
l.126		; 657c
l.124		; 657c
l.122		; 657c
l.120		; 657c
l.11e		; 657c
l.11c		; 657c
l.11a		; 657c
l.118		; 657c
l.116		; 657c
l.114		; 657c
l.112		; 657c
l.110		; 657c
l.10e		; 657c
l.10c		; 657c
l.10a		; 657c
l.108		; 657c
l.106		; 657c
l.104		; 657c
l.102		; 657c
l.100		; 657c
l.fe		; 657c
l.fc		; 657c
l.fa		; 657c
l.f8		; 657c
l.f6		; 657c
l.f4		; 657c
l.f2		; 657c
l.f0		; 657c
l.ee		; 657c
l.ec		; 657c
l.ea		; 657c
l.e8		; 657c
l.e6		; 657c
l.e4		; 657c
l.e2		; 657c
l.e0		; 657c
l.de		; 657c
l.dc		; 657c
l.da		; 657c
l.d8		; 657c
l.d6		; 657c
l.d4		; 657c
l.d2		; 657c
l.d0		; 657c
l.ce		; 657c
l.cc		; 657c
l.ca		; 657c
l.c8		; 657c
l.c6		; 657c
l.c4		; 657c
l.c2		; 657c
l.c0		; 657c
l.be		; 657c
l.bc		; 657c
l.ba		; 657c
l.b8		; 657c
l.b6		; 657c
l.b4		; 657c
l.b2		; 657c
l.b0		; 657c
l.ae		; 657c
l.ac		; 657c
l.aa		; 657c
l.a8		; 657c
l.a6		; 657c
l.a4		; 657c
l.a2		; 657c
l.a0		; 657c
l.9e		; 657c
l.9c		; 657c
l.9a		; 657c
l.98		; 657c
l.96		; 657c
l.94		; 657c
l.92		; 657c
l.90		; 657c
l.8e		; 657c
l.8c		; 657c
l.8a		; 657c
l.88		; 657c
l.86		; 657c
l.84		; 657c
l.82		; 657c
l.80		; 657c
l.7e		; 657c
l.7c		; 657c
l.7a		; 657c
l.78		; 657c
	; line 272
	break	; 657c
	const.pri ffffffff
	retn


DATA 10	; a84
dump 4c 61 6e 64 73 74 61 6c 6b 65 72 0 42 72 61 76 
dump 75 72 61 0 42 75 66 66 61 6c 6f 0 4c 69 6e 65 
dump 72 75 6e 6e 65 72 0 50 65 72 65 6e 6e 69 65 6c 
dump 0 53 65 6e 74 69 6e 65 6c 0 44 75 6d 70 65 72 
dump 0 46 69 72 65 74 72 75 63 6b 0 54 72 61 73 68 
dump 6d 61 73 74 65 72 0 53 74 72 65 74 63 68 0 4d 
dump 61 6e 61 6e 61 0 49 6e 66 65 72 6e 75 73 0 56 
dump 6f 6f 64 6f 6f 0 50 6f 6e 79 0 4d 75 6c 65 0 
dump 43 68 65 65 74 61 68 0 41 6d 62 75 6c 61 6e 63 
dump 65 0 4c 65 76 69 61 74 68 61 6e 0 4d 6f 6f 6e 
dump 62 65 61 6d 0 45 73 70 65 72 61 6e 74 6f 0 54 
dump 61 78 69 0 57 61 73 68 69 6e 67 74 6f 6e 0 42 
dump 6f 62 63 61 74 0 4d 72 20 57 68 6f 6f 70 65 65 
dump 0 42 46 20 49 6e 6a 65 63 74 69 6f 6e 0 48 75 
dump 6e 74 65 72 0 50 72 65 6d 69 65 72 0 45 6e 66 
dump 6f 72 63 65 72 0 53 65 63 75 72 69 63 61 72 0 
dump 42 61 6e 73 68 65 65 0 50 72 65 64 61 74 6f 72 
dump 0 42 75 73 0 52 68 69 6e 6f 0 42 61 72 72 61 
dump 63 6b 73 0 48 6f 74 6b 6e 69 66 65 0 41 72 74 
dump 69 63 6c 65 20 54 72 61 69 6c 65 72 0 50 72 65 
dump 76 69 6f 6e 0 43 6f 61 63 68 0 43 61 62 62 69 
dump 65 0 53 74 61 6c 6c 69 6f 6e 0 52 75 6d 70 6f 
dump 0 52 43 20 42 61 6e 64 69 74 0 52 6f 6d 65 72 
dump 6f 0 50 61 63 6b 65 72 0 4d 6f 6e 73 74 65 72 
dump 0 41 64 6d 69 72 61 6c 0 53 71 75 61 6c 6c 6f 
dump 0 53 65 61 73 70 61 72 72 6f 77 0 50 69 7a 7a 
dump 61 62 6f 79 0 54 72 61 6d 0 41 72 74 69 63 6c 
dump 65 20 54 72 61 69 6c 65 72 20 32 0 54 75 72 69 
dump 73 6d 6f 0 53 70 65 65 64 65 72 0 52 65 65 66 
dump 65 72 0 54 72 6f 70 69 63 0 46 6c 61 74 62 65 
dump 64 0 59 61 6e 6b 65 65 0 43 61 64 64 79 0 53 
dump 6f 6c 61 69 72 0 42 65 72 6b 6c 65 79 27 73 20 
dump 52 43 20 56 61 6e 0 53 6b 69 6d 6d 65 72 0 50 
dump 43 4a 2d 36 30 30 0 46 61 67 67 69 6f 0 46 72 
dump 65 65 77 61 79 0 52 43 20 42 61 72 6f 6e 0 52 
dump 43 20 52 61 69 64 65 72 0 47 6c 65 6e 64 61 6c 
dump 65 0 4f 63 65 61 6e 69 63 0 53 61 6e 63 68 65 
dump 7a 0 53 70 61 72 72 6f 77 0 50 61 74 72 69 6f 
dump 74 0 51 75 61 64 0 43 6f 61 73 74 67 75 61 72 
dump 64 0 44 69 6e 67 68 79 0 48 65 72 6d 65 73 0 
dump 53 61 62 72 65 0 52 75 73 74 6c 65 72 0 5a 52 
dump 2d 33 35 30 0 57 61 6c 74 6f 6e 0 52 65 67 69 
dump 6e 61 0 43 6f 6d 65 74 0 42 4d 58 0 42 75 72 
dump 72 69 74 6f 0 43 61 6d 70 65 72 0 4d 61 72 71 
dump 75 69 73 0 42 61 67 67 61 67 65 0 44 6f 7a 65 
dump 72 0 4d 61 76 65 72 69 63 6b 0 53 41 4e 20 4e 
dump 65 77 73 20 4d 61 76 65 72 69 63 6b 0 52 61 6e 
dump 63 68 65 72 0 46 42 49 20 52 61 6e 63 68 65 72 
dump 0 56 69 72 67 6f 0 47 72 65 65 6e 77 6f 6f 64 
dump 0 4a 65 74 6d 61 78 0 48 6f 74 72 69 6e 67 20 
dump 52 61 63 65 72 0 53 61 6e 64 6b 69 6e 67 0 42 
dump 6c 69 73 74 61 20 43 6f 6d 70 61 63 74 0 50 6f 
dump 6c 69 63 65 20 4d 61 76 65 72 69 63 6b 0 42 6f 
dump 78 76 69 6c 6c 65 0 42 65 6e 73 6f 6e 0 4d 65 
dump 73 61 0 52 43 20 47 6f 62 6c 69 6e 0 48 6f 74 
dump 72 69 6e 67 20 52 61 63 65 72 0 48 6f 74 72 69 
dump 6e 67 20 52 61 63 65 72 0 42 6c 6f 6f 64 72 69 
dump 6e 67 20 42 61 6e 67 65 72 0 52 61 6e 63 68 65 
dump 72 0 53 75 70 65 72 20 47 54 0 45 6c 65 67 61 
dump 6e 74 0 4a 6f 75 72 6e 65 79 0 42 69 6b 65 0 
dump 4d 6f 75 6e 74 61 69 6e 20 42 69 6b 65 0 42 65 
dump 61 67 6c 65 0 43 72 6f 70 64 75 73 74 65 72 0 
dump 53 74 75 6e 74 70 6c 61 6e 65 0 54 61 6e 6b 65 
dump 72 0 52 6f 61 64 74 72 61 69 6e 0 4e 65 62 75 
dump 6c 61 0 4d 61 6a 65 73 74 69 63 0 42 75 63 63 
dump 61 6e 65 65 72 0 53 68 61 6d 61 6c 0 48 79 64 
dump 72 61 0 46 43 52 2d 39 30 30 0 4e 52 47 2d 35 
dump 30 30 0 48 50 56 31 30 30 30 0 43 65 6d 65 6e 
dump 74 20 54 72 75 63 6b 0 54 6f 77 74 72 75 63 6b 
dump 0 46 6f 72 74 75 6e 65 0 43 61 64 72 6f 6e 61 
dump 0 46 42 49 20 54 72 75 63 6b 0 57 69 6c 6c 61 
dump 72 64 0 46 6f 72 6b 6c 69 66 74 0 54 72 61 63 
dump 74 6f 72 0 43 6f 6d 62 69 6e 65 20 48 61 72 76 
dump 65 73 74 65 72 0 46 65 6c 74 7a 65 72 0 52 65 
dump 6d 69 6e 67 74 6f 6e 0 53 6c 61 6d 76 61 6e 0 
dump 42 6c 61 64 65 0 46 72 65 69 67 68 74 20 28 54 
dump 72 61 69 6e 29 0 42 72 6f 77 6e 73 74 72 65 61 
dump 6b 20 28 54 72 61 69 6e 29 0 56 6f 72 74 65 78 
dump 0 56 69 6e 63 65 6e 74 0 42 75 6c 6c 65 74 0 
dump 43 6c 6f 76 65 72 0 53 61 64 6c 65 72 0 46 69 
dump 72 65 74 72 75 63 6b 20 4c 41 0 48 75 73 74 6c 
dump 65 72 0 49 6e 74 72 75 64 65 72 0 50 72 69 6d 
dump 6f 0 43 61 72 67 6f 62 6f 62 0 54 61 6d 70 61 
dump 0 53 75 6e 72 69 73 65 0 4d 65 72 69 74 0 55 
dump 74 69 6c 69 74 79 20 56 61 6e 0 4e 65 76 61 64 
dump 61 0 59 6f 73 65 6d 69 74 65 0 57 69 6e 64 73 
dump 6f 72 0 4d 6f 6e 73 74 65 72 20 22 41 22 0 4d 
dump 6f 6e 73 74 65 72 20 22 42 22 0 55 72 61 6e 75 
dump 73 0 4a 65 73 74 65 72 0 53 75 6c 74 61 6e 0 
dump 53 74 72 61 74 75 6d 0 45 6c 65 67 79 0 52 61 
dump 69 6e 64 61 6e 63 65 0 52 43 20 54 69 67 65 72 
dump 0 46 6c 61 73 68 0 54 61 68 6f 6d 61 0 53 61 
dump 76 61 6e 6e 61 0 42 61 6e 64 69 74 6f 0 46 72 
dump 65 69 67 68 74 20 46 6c 61 74 20 54 72 61 69 6c 
dump 65 72 20 28 54 72 61 69 6e 29 0 53 74 72 65 61 
dump 6b 20 54 72 61 69 6c 65 72 20 28 54 72 61 69 6e 
dump 29 0 4b 61 72 74 0 4d 6f 77 65 72 0 44 75 6e 
dump 65 0 53 77 65 65 70 65 72 0 42 72 6f 61 64 77 
dump 61 79 0 54 6f 72 6e 61 64 6f 0 41 54 34 30 30 
dump 0 44 46 54 2d 33 30 0 48 75 6e 74 6c 65 79 0 
dump 53 74 61 66 66 6f 72 64 0 42 46 2d 34 30 30 0 
dump 4e 65 77 73 76 61 6e 0 54 75 67 0 50 65 74 72 
dump 6f 6c 20 54 72 61 69 6c 65 72 0 45 6d 70 65 72 
dump 6f 72 0 57 61 79 66 61 72 65 72 0 45 75 72 6f 
dump 73 0 48 6f 74 64 6f 67 0 43 6c 75 62 0 46 72 
dump 65 69 67 68 74 20 42 6f 78 20 54 72 61 69 6c 65 
dump 72 20 28 54 72 61 69 6e 29 0 41 72 74 69 63 6c 
dump 65 20 54 72 61 69 6c 65 72 20 33 0 41 6e 64 72 
dump 6f 6d 61 64 61 0 44 6f 64 6f 0 52 43 20 43 61 
dump 6d 0 4c 61 75 6e 63 68 0 50 6f 6c 69 63 65 20 
dump 43 61 72 20 28 4c 53 50 44 29 0 50 6f 6c 69 63 
dump 65 20 43 61 72 20 28 53 46 50 44 29 0 50 6f 6c 
dump 69 63 65 20 43 61 72 20 28 4c 56 50 44 29 0 50 
dump 6f 6c 69 63 65 20 52 61 6e 67 65 72 0 50 69 63 
dump 61 64 6f 72 0 53 2e 57 2e 41 2e 54 2e 0 41 6c 
dump 70 68 61 0 50 68 6f 65 6e 69 78 0 47 6c 65 6e 
dump 64 61 6c 65 20 53 68 69 74 0 53 61 64 6c 65 72 
dump 20 53 68 69 74 0 42 61 67 67 61 67 65 20 54 72 
dump 61 69 6c 65 72 20 22 41 22 0 42 61 67 67 61 67 
dump 65 20 54 72 61 69 6c 65 72 20 22 42 22 0 54 75 
dump 67 20 53 74 61 69 72 73 20 54 72 61 69 6c 65 72 
dump 0 42 6f 78 76 69 6c 6c 65 0 46 61 72 6d 20 54 
dump 72 61 69 6c 65 72 0 55 74 69 6c 69 74 79 20 54 
dump 72 61 69 6c 65 72 0 

DATA 0	; 2960
dump 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff ffff 
dump ffff ffff ffff ffff ffff ffff ffff ffff 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
dump 0 0 0 0 0 0 0 0 
dump ffffffff 
dump fa0 10ec 1238 1384 14d0 161c 1768 18b4 1a00 1b4c 1c98 1de4 1f30 207c 21c8 2314 
dump 2460 25ac 26f8 2844 2990 2adc 2c28 2d74 2ec0 300c 3158 32a4 33f0 353c 3688 37d4 
dump 3920 3a6c 3bb8 3d04 3e50 3f9c 40e8 4234 4380 44cc 4618 4764 48b0 49fc 4b48 4c94 
dump 4de0 4f2c 5078 51c4 5310 545c 55a8 56f4 5840 598c 5ad8 5c24 5d70 5ebc 6008 6154 
dump 62a0 63ec 6538 6684 67d0 691c 6a68 6bb4 6d00 6e4c 6f98 70e4 7230 737c 74c8 7614 
dump 7760 78ac 79f8 7b44 7c90 7ddc 7f28 8074 81c0 830c 8458 85a4 86f0 883c 8988 8ad4 
dump 8c20 8d6c 8eb8 9004 9150 929c 93e8 9534 9680 97cc 9918 9a64 9bb0 9cfc 9e48 9f94 
dump a0e0 a22c a378 a4c4 a610 a75c a8a8 a9f4 ab40 ac8c add8 af24 b070 b1bc b308 b454 
dump b5a0 b6ec b838 b984 bad0 bc1c bd68 beb4 c000 c14c c298 c3e4 c530 c67c c7c8 c914 
dump ca60 cbac ccf8 ce44 cf90 d0dc d228 d374 d4c0 d60c d758 d8a4 d9f0 db3c dc88 ddd4 
dump df20 e06c e1b8 e304 e450 e59c e6e8 e834 e980 eacc ec18 ed64 eeb0 effc f148 f294 
dump f3e0 f52c f678 f7c4 f910 fa5c fba8 fcf4 fe40 ff8c 100d8 10224 10370 104bc 10608 10754 
dump 108a0 109ec 10b38 10c84 10dd0 10f1c 11068 111b4 11300 1144c 11598 116e4 11830 1197c 11ac8 11c14 
dump 11d60 11eac 11ff8 12144 12290 123dc 12528 12674 127c0 1290c 12a58 12ba4 12cf0 12e3c 12f88 130d4 
dump 13220 1336c 134b8 13604 13750 1389c 139e8 13b34 13c80 13dcc 13f18 14064 141b0 142fc 14448 14594 
dump 146e0 1482c 14978 14ac4 14c10 14d5c 14ea8 14ff4 15140 1528c 153d8 15524 15670 157bc 15908 15a54 
dump 15ba0 15cec 15e38 15f84 160d0 1621c 16368 164b4 16600 1674c 16898 169e4 16b30 16c7c 16dc8 16f14 
dump 17060 171ac 172f8 17444 17590 176dc 17828 17974 17ac0 17c0c 17d58 17ea4 17ff0 1813c 18288 183d4 
dump 18520 1866c 187b8 18904 18a50 18b9c 18ce8 18e34 18f80 190cc 19218 19364 194b0 195fc 19748 19894 
dump 199e0 19b2c 19c78 19dc4 19f10 1a05c 1a1a8 1a2f4 1a440 1a58c 1a6d8 1a824 1a970 1aabc 1ac08 1ad54 
dump 1aea0 1afec 1b138 1b284 1b3d0 1b51c 1b668 1b7b4 1b900 1ba4c 1bb98 1bce4 1be30 1bf7c 1c0c8 1c214 
dump 1c360 1c4ac 1c5f8 1c744 1c890 1c9dc 1cb28 1cc74 1cdc0 1cf0c 1d058 1d1a4 1d2f0 1d43c 1d588 1d6d4 
dump 1d820 1d96c 1dab8 1dc04 1dd50 1de9c 1dfe8 1e134 1e280 1e3cc 1e518 1e664 1e7b0 1e8fc 1ea48 1eb94 
dump 1ece0 1ee2c 1ef78 1f0c4 1f210 1f35c 1f4a8 1f5f4 1f740 1f88c 1f9d8 1fb24 1fc70 1fdbc 1ff08 20054 
dump 201a0 202ec 20438 20584 206d0 2081c 20968 20ab4 20c00 20d4c 20e98 20fe4 21130 2127c 213c8 21514 
dump 21660 217ac 218f8 21a44 21b90 21cdc 21e28 21f74 220c0 2220c 22358 224a4 225f0 2273c 22888 229d4 
dump 22b20 22c6c 22db8 22f04 23050 2319c 232e8 23434 23580 236cc 23818 23964 23ab0 23bfc 23d48 23e94 
dump 23fe0 2412c 24278 243c4 24510 2465c 247a8 248f4 24a40 24b8c 24cd8 24e24 24f70 250bc 25208 25354 
dump 254a0 255ec 25738 25884 259d0 25b1c 25c68 25db4 25f00 2604c 26198 262e4 26430 2657c 266c8 26814 
dump 26960 26aac 26bf8 26d44 26e90 26fdc 27128 27274 273c0 2750c 27658 277a4 278f0 27a3c 27b88 27cd4 
dump 27e20 27f6c 280b8 28204 28350 2849c 285e8 28734 28880 289cc 28b18 28c64 28db0 28efc 29048 29194 
dump 292e0 2942c 29578 296c4 29810 2995c 29aa8 29bf4 29d40 29e8c 29fd8 2a124 2a270 2a3bc 2a508 2a654 
dump 2a7a0 2a8ec 2aa38 2ab84 2acd0 2ae1c 2af68 2b0b4 2b200 2b34c 2b498 2b5e4 2b730 2b87c 2b9c8 2bb14 
dump 2bc60 2bdac 2bef8 2c044 2c190 2c2dc 2c428 2c574 2c6c0 2c80c 2c958 2caa4 2cbf0 2cd3c 2ce88 2cfd4 
dump 2d120 2d26c 2d3b8 2d504 2d650 2d79c 2d8e8 2da34 2db80 2dccc 2de18 2df64 2e0b0 2e1fc 2e348 2e494 
dump 2e5e0 2e72c 2e878 2e9c4 2eb10 2ec5c 2eda8 2eef4 2f040 2f18c 2f2d8 2f424 2f570 2f6bc 2f808 2f954 
dump 2faa0 2fbec 2fd38 2fe84 2ffd0 3011c 30268 303b4 30500 3064c 30798 308e4 30a30 30b7c 30cc8 30e14 
dump 30f60 310ac 311f8 31344 31490 315dc 31728 31874 319c0 31b0c 31c58 31da4 31ef0 3203c 32188 322d4 
dump 32420 3256c 326b8 32804 32950 32a9c 32be8 32d34 32e80 32fcc 33118 33264 333b0 334fc 33648 33794 
dump 338e0 33a2c 33b78 33cc4 33e10 33f5c 340a8 341f4 34340 3448c 345d8 34724 34870 349bc 34b08 34c54 
dump 34da0 34eec 35038 35184 352d0 3541c 35568 356b4 35800 3594c 35a98 35be4 35d30 35e7c 35fc8 36114 
dump 36260 363ac 364f8 36644 36790 368dc 36a28 36b74 36cc0 36e0c 36f58 370a4 371f0 3733c 37488 375d4 
dump 37720 3786c 379b8 37b04 37c50 37d9c 37ee8 38034 38180 382cc 38418 38564 386b0 387fc 38948 38a94 
dump 38be0 38d2c 38e78 38fc4 39110 3925c 393a8 394f4 39640 3978c 398d8 39a24 39b70 39cbc 39e08 39f54 
dump 3a0a0 3a1ec 3a338 3a484 3a5d0 3a71c 3a868 3a9b4 3ab00 3ac4c 3ad98 3aee4 3b030 3b17c 3b2c8 3b414 
dump 3b560 3b6ac 3b7f8 3b944 3ba90 3bbdc 3bd28 3be74 3bfc0 3c10c 3c258 3c3a4 3c4f0 3c63c 3c788 3c8d4 
dump 3ca20 3cb6c 3ccb8 3ce04 3cf50 3d09c 3d1e8 3d334 3d480 3d5cc 3d718 3d864 3d9b0 3dafc 3dc48 3dd94 
dump 3dee0 3e02c 3e178 3e2c4 3e410 3e55c 3e6a8 3e7f4 3e940 3ea8c 3ebd8 3ed24 3ee70 3efbc 3f108 3f254 
dump 3f3a0 3f4ec 3f638 3f784 3f8d0 3fa1c 3fb68 3fcb4 3fe00 3ff4c 40098 401e4 40330 4047c 405c8 40714 
dump 40860 409ac 40af8 40c44 40d90 40edc 41028 41174 412c0 4140c 41558 416a4 417f0 4193c 41a88 41bd4 
dump 41d20 41e6c 41fb8 42104 42250 4239c 424e8 42634 42780 428cc 42a18 42b64 42cb0 42dfc 42f48 43094 
dump 431e0 4332c 43478 435c4 43710 4385c 439a8 43af4 43c40 43d8c 43ed8 44024 44170 442bc 44408 44554 
dump 446a0 447ec 44938 44a84 44bd0 44d1c 44e68 44fb4 45100 4524c 45398 454e4 45630 4577c 458c8 45a14 
dump 45b60 45cac 45df8 45f44 46090 461dc 46328 46474 465c0 4670c 46858 469a4 46af0 46c3c 46d88 46ed4 
dump 47020 4716c 472b8 47404 47550 4769c 477e8 47934 47a80 47bcc 47d18 47e64 47fb0 480fc 48248 48394 
dump 484e0 4862c 48778 488c4 48a10 48b5c 48ca8 48df4 48f40 4908c 491d8 49324 49470 495bc 49708 49854 
dump 499a0 49aec 49c38 49d84 49ed0 4a01c 4a168 4a2b4 4a400 4a54c 4a698 4a7e4 4a930 4aa7c 4abc8 4ad14 
dump 4ae60 4afac 4b0f8 4b244 4b390 4b4dc 4b628 4b774 4b8c0 4ba0c 4bb58 4bca4 4bdf0 4bf3c 4c088 4c1d4 
dump 4c320 4c46c 4c5b8 4c704 4c850 4c99c 4cae8 4cc34 4cd80 4cecc 4d018 4d164 4d2b0 4d3fc 4d548 4d694 
dump 4d7e0 4d92c 4da78 4dbc4 4dd10 4de5c 4dfa8 4e0f4 4e240 4e38c 4e4d8 4e624 4e770 4e8bc 4ea08 4eb54 
dump 4eca0 4edec 4ef38 4f084 4f1d0 4f31c 4f468 4f5b4 4f700 4f84c 4f998 4fae4 4fc30 4fd7c 4fec8 50014 
dump 50160 502ac 503f8 50544 50690 507dc 50928 50a74 50bc0 50d0c 50e58 50fa4 510f0 5123c 51388 514d4 
dump 51620 5176c 518b8 51a04 51b50 51c9c 51de8 51f34 
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
dump 350 37c 398 3b4 3dc 3fc 41c 434 458 484 4a0 4b8 4d8 4f0 500 510 
dump 52c 550 574 594 5b8 5c8 5f0 608 630 660 678 694 6b4 6d8 6f4 714 
dump 720 734 754 774 790 7ac 7c0 7d8 7f8 80c 830 848 860 87c 898 8b0 
dump 8d8 8f8 908 924 940 95c 974 98c 9a8 9c0 9d4 9ec a2c a48 a64 a7c 
dump a98 ab8 adc afc b18 b34 b50 b6c b7c ba4 bbc bd4 be8 c04 c1c c34 
dump c4c c60 c6c c88 ca0 cbc cd8 cec d0c d3c d58 d84 d98 dbc dd4 df0 
dump e10 e48 e84 ea4 ebc ecc ef0 f2c f68 fa8 fc4 fe4 1000 101c 102c 1060 
dump 1078 1098 10ac 10c4 10e8 1100 1120 1144 115c 1170 118c 11a8 11c4 11f4 1218 1234 
dump 1250 1274 1290 12b0 12cc 12e8 1304 1328 1344 1358 1374 138c 13a4 13c0 13d8 13f0 
dump 1408 142c 1448 1468 147c 149c 14b0 14cc 14e0 14fc 1514 1534 1550 1574 1598 15b0 
dump 15c8 15e0 15fc 1610 1634 1654 1668 1680 169c 16b8 16d4 16f0 1700 1714 1734 1750 
dump 1770 178c 17a4 17bc 17d8 17f8 1810 182c 1838 185c 1878 1898 18ac 18c4 18d4 18f8 
dump 191c 1940 1950 1968 1980 19c4 1a08 1a4c 1a80 1a9c 1acc 1ae0 1afc 1b1c 1b34 1b78 
dump 1bbc 1bf0 1c10 1c34 4c 61 6e 64 73 74 61 6c 6b 65 72 0 
dump 42 72 61 76 75 72 61 0 42 75 66 66 61 6c 6f 0 
dump 4c 69 6e 65 72 75 6e 6e 65 72 0 50 65 72 65 6e 
dump 69 65 6c 0 53 65 6e 74 69 6e 65 6c 0 44 75 6d 
dump 70 65 72 0 46 69 72 65 74 72 75 63 6b 0 54 72 
dump 61 73 68 6d 61 73 74 65 72 0 53 74 72 65 74 63 
dump 68 0 4d 61 6e 61 6e 61 0 49 6e 66 65 72 6e 75 
dump 73 0 56 6f 6f 64 6f 6f 0 50 6f 6e 79 0 4d 75 
dump 6c 65 0 43 68 65 65 74 61 68 0 41 6d 62 75 6c 
dump 61 6e 63 65 0 4c 65 76 69 61 74 68 61 6e 0 4d 
dump 6f 6f 6e 62 65 61 6d 0 45 73 70 65 72 61 6e 74 
dump 6f 0 54 61 78 69 0 57 61 73 68 69 6e 67 74 6f 
dump 6e 0 42 6f 62 63 61 74 0 4d 72 20 57 68 6f 6f 
dump 70 65 65 0 42 46 20 49 6e 6a 65 63 74 69 6f 6e 
dump 0 48 75 6e 74 65 72 0 50 72 65 6d 69 65 72 0 
dump 45 6e 66 6f 72 63 65 72 0 53 65 63 75 72 69 63 
dump 61 72 0 42 61 6e 73 68 65 65 0 50 72 65 64 61 
dump 74 6f 72 0 42 75 73 0 52 68 69 6e 6f 0 42 61 
dump 72 72 61 63 6b 73 0 48 6f 74 6b 6e 69 66 65 0 
dump 54 72 61 69 6c 65 72 0 50 72 65 76 69 6f 6e 0 
dump 43 6f 61 63 68 0 43 61 62 62 69 65 0 53 74 61 
dump 6c 6c 69 6f 6e 0 52 75 6d 70 6f 0 52 43 20 42 
dump 61 6e 64 69 74 0 52 6f 6d 65 72 6f 0 50 61 63 
dump 6b 65 72 0 4d 6f 6e 73 74 65 72 0 41 64 6d 69 
dump 72 61 6c 0 53 71 75 61 6c 6f 0 53 65 61 73 70 
dump 61 72 72 6f 77 0 50 69 7a 7a 61 62 6f 79 0 54 
dump 72 61 6d 0 54 72 61 69 6c 65 72 0 54 75 72 69 
dump 73 6d 6f 0 53 70 65 65 64 65 72 0 52 65 65 66 
dump 65 72 0 54 72 6f 70 69 63 0 46 6c 61 74 62 65 
dump 64 0 59 61 6e 6b 65 65 0 43 61 64 64 79 0 53 
dump 6f 6c 61 69 72 0 42 65 72 6b 6c 65 79 27 73 20 
dump 52 43 20 56 61 6e 0 53 6b 69 6d 6d 65 72 0 50 
dump 43 4a 2d 36 30 30 0 46 61 67 67 69 6f 0 46 72 
dump 65 65 77 61 79 0 52 43 20 42 61 72 6f 6e 0 52 
dump 43 20 52 61 69 64 65 72 0 47 6c 65 6e 64 61 6c 
dump 65 0 4f 63 65 61 6e 69 63 0 53 61 6e 63 68 65 
dump 7a 0 53 70 61 72 72 6f 77 0 50 61 74 72 69 6f 
dump 74 0 51 75 61 64 0 43 6f 61 73 74 67 75 61 72 
dump 64 0 44 69 6e 67 68 79 0 48 65 72 6d 65 73 0 
dump 53 61 62 72 65 0 52 75 73 74 6c 65 72 0 5a 52 
dump 20 33 35 30 0 57 61 6c 74 6f 6e 0 52 65 67 69 
dump 6e 61 0 43 6f 6d 65 74 0 42 4d 58 0 42 75 72 
dump 72 69 74 6f 0 43 61 6d 70 65 72 0 4d 61 72 71 
dump 75 69 73 0 42 61 67 67 61 67 65 0 44 6f 7a 65 
dump 72 0 4d 61 76 65 72 69 63 6b 0 4e 65 77 73 20 
dump 43 68 6f 70 70 65 72 0 52 61 6e 63 68 65 72 0 
dump 46 42 49 20 52 61 6e 63 68 65 72 0 56 69 72 67 
dump 6f 0 47 72 65 65 6e 77 6f 6f 64 0 4a 65 74 6d 
dump 61 78 0 48 6f 74 72 69 6e 67 0 53 61 6e 64 6b 
dump 69 6e 67 0 42 6c 69 73 74 61 20 43 6f 6d 70 61 
dump 63 74 0 50 6f 6c 69 63 65 20 4d 61 76 65 72 69 
dump 63 6b 0 42 6f 78 76 69 6c 6c 65 0 42 65 6e 73 
dump 6f 6e 0 4d 65 73 61 0 52 43 20 47 6f 62 6c 69 
dump 6e 0 48 6f 74 72 69 6e 67 20 52 61 63 65 72 20 
dump 41 0 48 6f 74 72 69 6e 67 20 52 61 63 65 72 20 
dump 42 0 42 6c 6f 6f 64 72 69 6e 67 20 42 61 6e 67 
dump 65 72 0 52 61 6e 63 68 65 72 0 53 75 70 65 72 
dump 20 47 54 0 45 6c 65 67 61 6e 74 0 4a 6f 75 72 
dump 6e 65 79 0 42 69 6b 65 0 4d 6f 75 6e 74 61 69 
dump 6e 20 42 69 6b 65 0 42 65 61 67 6c 65 0 43 72 
dump 6f 70 64 75 73 74 0 53 74 75 6e 74 0 54 61 6e 
dump 6b 65 72 0 52 6f 61 64 54 72 61 69 6e 0 4e 65 
dump 62 75 6c 61 0 4d 61 6a 65 73 74 69 63 0 42 75 
dump 63 63 61 6e 65 65 72 0 53 68 61 6d 61 6c 0 48 
dump 79 64 72 61 0 46 43 52 2d 39 30 30 0 4e 52 47 
dump 2d 35 30 30 0 48 50 56 31 30 30 30 0 43 65 6d 
dump 65 6e 74 20 54 72 75 63 6b 0 54 6f 77 20 54 72 
dump 75 63 6b 0 46 6f 72 74 75 6e 65 0 43 61 64 72 
dump 6f 6e 61 0 46 42 49 20 54 72 75 63 6b 0 57 69 
dump 6c 6c 61 72 64 0 46 6f 72 6b 6c 69 66 74 0 54 
dump 72 61 63 74 6f 72 0 43 6f 6d 62 69 6e 65 0 46 
dump 65 6c 74 7a 65 72 0 52 65 6d 69 6e 67 74 6f 6e 
dump 0 53 6c 61 6d 76 61 6e 0 42 6c 61 64 65 0 46 
dump 72 65 69 67 68 74 0 53 74 72 65 61 6b 0 56 6f 
dump 72 74 65 78 0 56 69 6e 63 65 6e 74 0 42 75 6c 
dump 6c 65 74 0 43 6c 6f 76 65 72 0 53 61 64 6c 65 
dump 72 0 46 69 72 65 74 72 75 63 6b 0 48 75 73 74 
dump 6c 65 72 0 49 6e 74 72 75 64 65 72 0 50 72 69 
dump 6d 6f 0 43 61 72 67 6f 62 6f 62 0 54 61 6d 70 
dump 61 0 53 75 6e 72 69 73 65 0 4d 65 72 69 74 0 
dump 55 74 69 6c 69 74 79 0 4e 65 76 61 64 61 0 59 
dump 6f 73 65 6d 69 74 65 0 57 69 6e 64 73 6f 72 0 
dump 4d 6f 6e 73 74 65 72 20 41 0 4d 6f 6e 73 74 65 
dump 72 20 42 0 55 72 61 6e 75 73 0 4a 65 73 74 65 
dump 72 0 53 75 6c 74 61 6e 0 53 74 72 61 74 75 6d 
dump 0 45 6c 65 67 79 0 52 61 69 6e 64 61 6e 63 65 
dump 0 52 43 20 54 69 67 65 72 0 46 6c 61 73 68 0 
dump 54 61 68 6f 6d 61 0 53 61 76 61 6e 6e 61 0 42 
dump 61 6e 64 69 74 6f 0 46 72 65 69 67 68 74 0 54 
dump 72 61 69 6c 65 72 0 4b 61 72 74 0 4d 6f 77 65 
dump 72 0 44 75 6e 65 72 69 64 65 0 53 77 65 65 70 
dump 65 72 0 42 72 6f 61 64 77 61 79 0 54 6f 72 6e 
dump 61 64 6f 0 41 54 2d 34 30 30 0 44 46 54 2d 33 
dump 30 0 48 75 6e 74 6c 65 79 0 53 74 61 66 66 6f 
dump 72 64 0 42 46 2d 34 30 30 0 4e 65 77 73 76 61 
dump 6e 0 54 75 67 0 54 72 61 69 6c 65 72 20 41 0 
dump 45 6d 70 65 72 6f 72 0 57 61 79 66 61 72 65 72 
dump 0 45 75 72 6f 73 0 48 6f 74 64 6f 67 0 43 6c 
dump 75 62 0 54 72 61 69 6c 65 72 20 42 0 54 72 61 
dump 69 6c 65 72 20 43 0 41 6e 64 72 6f 6d 61 64 61 
dump 0 44 6f 64 6f 0 52 43 20 43 61 6d 0 4c 61 75 
dump 6e 63 68 0 50 6f 6c 69 63 65 20 43 61 72 20 28 
dump 4c 53 50 44 29 0 50 6f 6c 69 63 65 20 43 61 72 
dump 20 28 53 46 50 44 29 0 50 6f 6c 69 63 65 20 43 
dump 61 72 20 28 4c 56 50 44 29 0 50 6f 6c 69 63 65 
dump 20 52 61 6e 67 65 72 0 50 69 63 61 64 6f 72 0 
dump 53 2e 57 2e 41 2e 54 2e 20 56 61 6e 0 41 6c 70 
dump 68 61 0 50 68 6f 65 6e 69 78 0 47 6c 65 6e 64 
dump 61 6c 65 0 53 61 64 6c 65 72 0 4c 75 67 67 61 
dump 67 65 20 54 72 61 69 6c 65 72 20 41 0 4c 75 67 
dump 67 61 67 65 20 54 72 61 69 6c 65 72 20 42 0 53 
dump 74 61 69 72 20 54 72 61 69 6c 65 72 0 42 6f 78 
dump 76 69 6c 6c 65 0 46 61 72 6d 20 50 6c 6f 77 0 
dump 55 74 69 6c 69 74 79 20 54 72 61 69 6c 65 72 0 

CODE 0	; 658c
	proc	; MySQL_register
	; line 35
	;$lcl pwdString 10
	;$lcl playerid c
	; line 36
	break	; 6590
	;$lcl query fffffc04
	stack fffffc04
	zero.pri
	addr.alt fffffc04
	fill 3fc
	; line 37
	break	; 65b0
	push.s 10
	;$par
	heap 60
	push.alt
	push.s c
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5a828
	;$par
	push.c ff
	;$par
	push.adr fffffc04
	;$par
	push.c 14
	sysreq.c 7	; format
	stack 18
	heap ffffffa0
	;$exp
	; line 38
	break	; 6620
	push.c 1
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c c
	sysreq.c 12	; mysql_query
	stack 10
	;$exp
	; line 39
	break	; 6654
	push.c 5a9e0
	;$par
	push.c ffffffff
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 13	; SendClientMessage
	stack 10
	;$exp
	; line 3a
	break	; 6688
	push.c 5ac70
	;$par
	push.c 5ac58
	;$par
	push.c 5aad8
	;$par
	push.c 5aa9c
	;$par
	push.c 3
	;$par
	push.c 5dd
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
	; line 3b
	break	; 66dc
	const.pri 1
	stack 3fc
	retn


DATA 0	; 5a828
dump 49 4e 53 45 52 54 20 49 4e 54 4f 20 75 73 65 72 
dump 73 28 6e 69 63 6b 2c 20 73 63 6f 72 65 2c 20 6b 
dump 69 6c 6c 73 2c 20 64 65 61 74 68 73 2c 20 6d 6f 
dump 6e 65 79 2c 20 61 64 6d 69 6e 6c 65 76 65 6c 2c 
dump 20 70 77 64 29 20 56 41 4c 55 45 53 28 27 25 73 
dump 27 2c 20 31 30 30 2c 20 30 2c 20 30 2c 20 31 30 
dump 30 30 30 2c 20 30 2c 20 27 25 73 27 29 0 7c 20 
dump 49 4e 46 4f 20 7c 20 7b 30 30 66 66 30 30 7d 43 
dump 6f 6e 74 61 20 72 65 67 69 73 74 72 61 64 61 20 
dump 63 6f 6d 20 73 75 63 65 73 73 6f 21 0 7b 66 66 
dump 30 30 30 30 7d 20 43 6f 6e 74 61 0 20 42 65 6d 
dump 2d 76 69 6e 64 6f 21 a a 20 7b 66 66 66 66 66 
dump 66 7d 53 74 61 74 75 73 20 64 61 20 43 6f 6e 74 
dump 61 3a 20 7b 31 32 64 38 30 30 7d 52 65 67 69 73 
dump 74 72 61 64 61 a a 20 7b 66 66 66 66 66 66 7d 
dump 45 6e 74 72 65 20 63 6f 6d 20 73 75 61 20 73 65 
dump 6e 68 61 20 61 62 61 69 78 6f 3a 0 4c 6f 67 69 
dump 6e 0 53 61 69 72 0 

CODE 0	; 66f4
	proc	; createVehicleForPlayer
	; line 3e
	;$lcl modelID 10
	;$lcl playerid c
	; line 3f
	break	; 66f8
	load.s.pri 10
	eq.c.pri ffff
	jzer 220
	;$exp
	; line 3f
	break	; 6714
	const.pri ffff
	retn
l.220		; 6724
	; line 40
	break	; 6724
	const.alt 2964
	load.s.pri c
	bounds 3e7
	lidx
	jzer 221
	;$exp
	; line 41
	break	; 674c
	const.alt 2964
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.c 4
	sysreq.c 15	; DestroyVehicle
	stack 8
	;$exp
	; line 42
	break	; 6788
	const.alt 2964
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	zero.pri
	stor.i
	;$exp
l.221		; 67b4
	; line 44
	break	; 67b4
	;$lcl X fffffffc
	push.c 0
	;$exp
	;$lcl Y fffffff8
	push.c 0
	;$exp
	;$lcl Z fffffff4
	push.c 0
	;$exp
	;$lcl A fffffff0
	push.c 0
	;$exp
	; line 45
	break	; 67d8
	push.adr fffffff4
	;$par
	push.adr fffffff8
	;$par
	push.adr fffffffc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 16	; GetPlayerPos
	stack 14
	;$exp
	; line 46
	break	; 6814
	push.adr fffffff0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 17	; GetPlayerFacingAngle
	stack c
	;$exp
	; line 47
	break	; 6840
	const.alt 2964
	load.s.pri c
	bounds 3e7
	idxaddr
	push.pri
	push.c 0
	;$par
	push.c ffffffff
	;$par
	push.c ffffffff
	;$par
	push.c ffffffff
	;$par
	push.s fffffff0
	;$par
	load.s.pri fffffff4
	const.alt 1
	push.alt
	push.pri
	;$par
	push.c 8
	call 40000004+0	; operator+(Float:,_:)
	push.pri
	;$par
	push.s fffffff8
	;$par
	push.s fffffffc
	;$par
	push.s 10
	;$par
	push.c 24
	sysreq.c 18	; CreateVehicle
	stack 28
	pop.alt
	stor.i
	;$exp
	; line 48
	break	; 68f0
	push.s c
	;$par
	push.c 4
	sysreq.c 19	; GetPlayerInterior
	stack 8
	push.pri
	;$par
	const.alt 2964
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.c 8
	sysreq.c 1a	; LinkVehicleToInterior
	stack c
	;$exp
	; line 49
	break	; 6950
	push.s c
	;$par
	push.c 4
	sysreq.c 1b	; GetPlayerVirtualWorld
	stack 8
	push.pri
	;$par
	const.alt 2964
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.c 8
	sysreq.c 1c	; SetVehicleVirtualWorld
	stack c
	;$exp
	; line 4a
	break	; 69b0
	push.c 0
	;$par
	const.alt 2964
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 1d	; PutPlayerInVehicle
	stack 10
	;$exp
	; line 4b
	break	; 69fc
	const.pri 1
	stack 10
	retn

	proc	; getVehicleIDByName
	; line 4e
	;$lcl vName c
	; line 4f
	break	; 6a18
	;$lcl i fffffffc
	push.c 0
	;$exp
	jump 224
l.222		; 6a2c
	; line 4f
	break	; 6a2c
	inc.s fffffffc
	;$exp
l.224
	load.s.pri fffffffc
	const.alt d3
	jsgeq 223
	;$exp
	; line 4f
	break	; 6a50
	push.c 0
	;$par
	push.c 1
	;$par
	push.s c
	;$par
	const.alt 58868
	load.s.pri fffffffc
	bounds d3
	idxaddr
	move.alt
	load.i
	add
	push.pri
	;$par
	push.c 10
	sysreq.c 1e	; strfind
	stack 14
	const.alt ffffffff
	jeq 225
	;$exp
	; line 4f
	break	; 6ac0
	load.s.pri fffffffc
	add.c 190
	stack 4
	retn
l.225		; 6ae0
	jump 222
l.223		; 6ae8
	stack 4
	; line 50
	break	; 6af0
	const.pri ffff
	retn

	proc	; getVehicleSpeed
	; line 53
	;$lcl vehicleid c
	; line 54
	break	; 6b04
	;$lcl vX fffffffc
	push.c 0
	;$exp
	;$lcl vY fffffff8
	push.c 0
	;$exp
	;$lcl vZ fffffff4
	push.c 0
	;$exp
	;$lcl vel fffffff0
	push.c 0
	;$exp
	; line 55
	break	; 6b28
	push.adr fffffff4
	;$par
	push.adr fffffff8
	;$par
	push.adr fffffffc
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 1f	; GetVehicleVelocity
	stack 14
	;$exp
	; line 56
	break	; 6b64
	push.c 0
	;$par
	load.s.pri fffffffc
	load.s.alt fffffffc
	push.pri
	push.alt
	;$par
	push.c 8
	sysreq.c 20	; operator*(Float:,Float:)
	stack c
	push.pri
	load.s.pri fffffff8
	load.s.alt fffffff8
	push.pri
	push.alt
	;$par
	push.c 8
	sysreq.c 20	; operator*(Float:,Float:)
	stack c
	pop.alt
	push.pri
	push.alt
	;$par
	push.c 8
	sysreq.c 21	; operator+(Float:,Float:)
	stack c
	push.pri
	load.s.pri fffffff4
	load.s.alt fffffff4
	push.pri
	push.alt
	;$par
	push.c 8
	sysreq.c 20	; operator*(Float:,Float:)
	stack c
	pop.alt
	push.pri
	push.alt
	;$par
	push.c 8
	sysreq.c 21	; operator+(Float:,Float:)
	stack c
	push.pri
	;$par
	push.c 4
	sysreq.c 22	; floatsqroot
	stack 8
	const.alt b4
	push.alt
	push.pri
	;$par
	push.c 8
	call 40000004*0	; operator*(Float:,_:)
	push.pri
	;$par
	push.c 8
	sysreq.c 23	; floatround
	stack c
	stor.s.pri fffffff0
	;$exp
	; line 57
	break	; 6cb0
	load.s.pri fffffff0
	stack 10
	retn

	proc	; SpeedoStatus
	; line 5b
	; line 5c
	break	; 6ccc
	;$lcl i fffffffc
	push.c 0
	;$exp
	jump 228
l.226		; 6ce0
	; line 5c
	break	; 6ce0
	inc.s fffffffc
	;$exp
l.228
	load.s.pri fffffffc
	const.alt 3e8
	jsgeq 227
	;$exp
	; line 5d
	break	; 6d04
	push.s fffffffc
	;$par
	push.c 4
	sysreq.c a	; IsPlayerConnected
	stack 8
	jzer 229
	;$exp
	; line 5e
	break	; 6d30
	push.s fffffffc
	;$par
	push.c 4
	sysreq.c 24	; GetPlayerState
	stack 8
	eq.c.pri 2
	jzer 22a
	;$exp
	; line 5f
	break	; 6d64
	const.alt 48a4
	load.s.pri fffffffc
	bounds 3e7
	lidx
	not
	jzer 22b
	;$exp
	; line 60
	break	; 6d90
	const.alt 3904
	load.s.pri fffffffc
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s fffffffc
	;$par
	push.c 8
	sysreq.c 25	; PlayerTextDrawShow
	stack c
	;$exp
	; line 61
	break	; 6dd4
	const.alt 48a4
	load.s.pri fffffffc
	bounds 3e7
	idxaddr
	move.alt
	const.pri 1
	stor.i
	;$exp
l.22b		; 6e04
	; line 63
	break	; 6e04
	;$lcl string ffffffd4
	stack ffffffd8
	zero.pri
	addr.alt ffffffd4
	fill 28
	; line 64
	break	; 6e24
	push.s fffffffc
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c 4
	call getVehicleSpeed
	heap 4
	stor.i
	push.alt
	;$par
	push.c 5ac84
	;$par
	push.c a
	;$par
	push.adr ffffffd4
	;$par
	push.c 10
	sysreq.c 7	; format
	stack 14
	heap fffffffc
	;$exp
	; line 65
	break	; 6ea4
	push.adr ffffffd4
	;$par
	const.alt 3904
	load.s.pri fffffffc
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s fffffffc
	;$par
	push.c c
	sysreq.c 27	; PlayerTextDrawSetString
	stack 10
	;$exp
	stack 28
	jump 22c
l.22a		; 6f00
	; line 68
	break	; 6f00
	const.alt 48a4
	load.s.pri fffffffc
	bounds 3e7
	lidx
	jzer 22d
	;$exp
	; line 69
	break	; 6f28
	const.alt 3904
	load.s.pri fffffffc
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s fffffffc
	;$par
	push.c 8
	sysreq.c 28	; PlayerTextDrawHide
	stack c
	;$exp
	; line 6a
	break	; 6f6c
	const.alt 48a4
	load.s.pri fffffffc
	bounds 3e7
	idxaddr
	move.alt
	zero.pri
	stor.i
	;$exp
l.22d		; 6f98
l.22c		; 6f98
l.229		; 6f98
	jump 226
l.227		; 6fa0
	stack 4
	zero.pri
	retn


DATA 0	; 5ac84
dump 25 69 20 4b 4d 2f 48 0 

CODE 0	; 6fb0
	proc	; teleportPlayer
	; line 71
	;$lcl fA 24
	;$lcl fZ 20
	;$lcl fY 1c
	;$lcl fX 18
	;$lcl virtualworldid 14
	;$lcl interiorid 10
	;$lcl playerid c
	; line 72
	break	; 6fb4
	push.s c
	;$par
	push.c 4
	sysreq.c 24	; GetPlayerState
	stack 8
	eq.c.pri 2
	jzer 22e
	;$exp
	; line 73
	break	; 6fe8
	push.s 10
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c 8
	sysreq.c 1a	; LinkVehicleToInterior
	stack c
	;$exp
	; line 74
	break	; 7030
	push.s 14
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c 8
	sysreq.c 1c	; SetVehicleVirtualWorld
	stack c
	;$exp
	; line 75
	break	; 7078
	load.s.pri 20
	const.alt 5
	push.alt
	push.pri
	;$par
	push.c 8
	call 40000004+0	; operator+(Float:,_:)
	push.pri
	;$par
	push.s 1c
	;$par
	push.s 18
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c 10
	sysreq.c 29	; SetVehiclePos
	stack 14
	;$exp
	; line 76
	break	; 70f4
	push.s 24
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c 8
	sysreq.c 2a	; SetVehicleZAngle
	stack c
	;$exp
	; line 77
	break	; 713c
	push.s c
	;$par
	push.c 4
	sysreq.c 2b	; SetCameraBehindPlayer
	stack 8
	;$exp
	jump 22f
l.22e		; 7168
	; line 7a
	break	; 7168
	push.s 10
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2c	; SetPlayerInterior
	stack c
	;$exp
	; line 7b
	break	; 7194
	push.s 14
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2d	; SetPlayerVirtualWorld
	stack c
	;$exp
	; line 7c
	break	; 71c0
	push.s 20
	;$par
	push.s 1c
	;$par
	push.s 18
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 2e	; SetPlayerPos
	stack 14
	;$exp
	; line 7d
	break	; 71fc
	push.s 24
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2f	; SetPlayerFacingAngle
	stack c
	;$exp
	; line 7e
	break	; 7228
	push.s c
	;$par
	push.c 4
	sysreq.c 2b	; SetCameraBehindPlayer
	stack 8
	;$exp
l.22f		; 724c
	; line 80
	break	; 724c
	const.pri 1
	retn

	proc	; getName
	; line 83
	;$lcl playerid c
	; line 84
	break	; 7260
	;$lcl pname ffffffa0
	stack ffffffa0
	zero.pri
	addr.alt ffffffa0
	fill 60
	; line 85
	break	; 7280
	push.c 18
	;$par
	push.adr ffffffa0
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c c	; GetPlayerName
	stack 10
	;$exp
	; line 86
	break	; 72b4
	addr.pri ffffffa0
	load.s.alt 10
	movs 60
	stack 60
	retn

	proc	; getPlayerAdminLevel
	; line 89
	;$lcl playerid c
	; line 8a
	break	; 72e0
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 54
	load.i
	retn

	proc	; main
	; line 8e
	; line 8f
	break	; 7320
	push.c 5aca4
	;$par
	push.c 4
	sysreq.c 30	; print
	stack 8
	;$exp
	; line 90
	break	; 7344
	push.c 5ad34
	;$par
	push.c 4
	sysreq.c 30	; print
	stack 8
	;$exp
	; line 91
	break	; 7368
	push.c 5adbc
	;$par
	push.c 4
	sysreq.c 30	; print
	stack 8
	;$exp
	zero.pri
	retn


DATA 0	; 5aca4
dump a 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 0 41 76 69 61 6f 20 42 72 75 74 61 6c 
dump 20 63 72 65 61 74 65 64 20 62 79 20 4d 72 5f 52 
dump 6f 62 6f 74 74 0 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 2d 2d 2d 2d 2d a 0 

CODE 0	; 7394
	proc	; SSCANF_OnGameModeInit
	; line 95
	; line 96
	break	; 7398
	push.c 0
	;$par
	push.c 5ae8c
	;$par
	push.c 5ae88
	;$par
	push.c 5ae74
	;$par
	push.c 5ae4c
	;$par
	push.c 14
	sysreq.c 31	; mysql_connect
	stack 18
	stor.pri 2960
	;$exp
	; line 97
	break	; 73e4
	push 2960
	;$par
	push.c 4
	sysreq.c 32	; mysql_errno
	stack 8
	jzer 230
	;$exp
	; line 98
	break	; 7410
	;$lcl errorStr fffffc04
	stack fffffc04
	zero.pri
	addr.alt fffffc04
	fill 3fc
	; line 99
	break	; 7430
	push 2960
	;$par
	push.c ff
	;$par
	push.adr fffffc04
	;$par
	push.c c
	sysreq.c 33	; mysql_error
	stack 10
	;$exp
	; line 9a
	break	; 7464
	push.adr fffffc04
	;$par
	push.c 5aeb8
	;$par
	push.c 8
	sysreq.c 34	; printf
	stack c
	;$exp
	stack 3fc
	jump 231
l.230		; 74a0
	; line 9d
	break	; 74a0
	push.c 5af5c
	;$par
	push.c 4
	sysreq.c 30	; print
	stack 8
	;$exp
l.231		; 74c4
	; line a0
	break	; 74c4
	;$lcl i fffffffc
	push.c 1
	;$exp
	jump 234
l.232		; 74d8
	; line a0
	break	; 74d8
	inc.s fffffffc
	;$exp
l.234
	load.s.pri fffffffc
	const.alt 137
	jsgeq 233
	;$exp
	; line a0
	break	; 74fc
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 12c
	;$par
	push.c 0
	;$par
	push.c 18
	;$par
	push.c 4387123d
	;$par
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.s fffffffc
	;$par
	push.c 2c
	sysreq.c 35	; AddPlayerClass
	stack 30
	;$exp
	jump 232
l.233		; 7578
	stack 4
	; line a1
	break	; 7580
	push.c 0
	sysreq.c 36	; UsePlayerPedAnims
	stack 4
	;$exp
	; line a2
	break	; 759c
	push.c 5b000
	;$par
	push.c 4
	sysreq.c 37	; SetGameModeText
	stack 8
	;$exp
	; line a4
	break	; 75c0
	push.c 1
	;$par
	push.c 32
	;$par
	push.c 5b014
	;$par
	push.c c
	sysreq.c 38	; SetTimer
	stack 10
	stor.pri 5844
	;$exp
	; line a6
	break	; 75fc
	const.pri 1
	retn


DATA 0	; 5ae4c
dump 31 32 37 2e 30 2e 30 2e 31 0 72 6f 6f 74 0 0 
dump 73 61 6d 70 73 65 72 76 65 72 0 5b 53 45 52 56 
dump 45 52 5d 20 44 61 74 61 62 61 73 65 20 63 6f 6e 
dump 6e 65 63 74 69 6f 6e 20 66 61 69 6c 75 72 65 3a 
dump 20 25 73 0 5b 53 45 52 56 45 52 5d 20 53 75 63 
dump 63 65 73 73 66 75 6c 20 64 61 74 61 62 61 73 65 
dump 20 63 6f 6e 6e 65 63 74 69 6f 6e 21 0 34 46 55 
dump 4e 0 53 70 65 65 64 6f 53 74 61 74 75 73 0 

CODE 0	; 760c
	proc	; OnGameModeExit
	; line aa
	; line ab
	break	; 7610
	push 2960
	;$par
	push.c 4
	sysreq.c 39	; mysql_close
	stack 8
	;$exp
	; line ad
	break	; 7634
	push 5844
	;$par
	push.c 4
	sysreq.c 3a	; KillTimer
	stack 8
	;$exp
	; line ae
	break	; 7658
	const.pri ffffffff
	stor.pri 5844
	;$exp
	; line af
	break	; 766c
	const.pri 1
	retn

	proc	; OnPlayerRequestClass
	; line b3
	;$lcl classid 10
	;$lcl playerid c
	; line b4
	break	; 7680
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 14c
	load.i
	const.alt 1
	jeq 235
	;$exp
	; line b5
	break	; 76c8
	push.c 1
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 3b	; TogglePlayerSpectating
	stack c
	;$exp
	; line b6
	break	; 76f4
	push.c 0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 3b	; TogglePlayerSpectating
	stack c
	;$exp
	; line b7
	break	; 7720
	zero.pri
	retn
l.235		; 772c
	; line b9
	break	; 772c
	push.c 1
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2d	; SetPlayerVirtualWorld
	stack c
	;$exp
	; line ba
	break	; 7758
	push.c e
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2c	; SetPlayerInterior
	stack c
	;$exp
	; line bb
	break	; 7784
	push.c 447a817f
	;$par
	push.c c2259a6b
	;$par
	push.c 43813ea1
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 2e	; SetPlayerPos
	stack 14
	;$exp
	; line bc
	break	; 77c0
	push.c c3870000
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2f	; SetPlayerFacingAngle
	stack c
	;$exp
	; line bd
	break	; 77ec
	push.c 447b017f
	;$par
	push.c c22c30a4
	;$par
	push.c 43800a6f
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 3c	; SetPlayerCameraPos
	stack 14
	;$exp
	; line be
	break	; 7828
	push.c 2
	;$par
	push.c 447a817f
	;$par
	push.c c2259a6b
	;$par
	push.c 43813ea1
	;$par
	push.s c
	;$par
	push.c 14
	sysreq.c 3d	; SetPlayerCameraLookAt
	stack 18
	;$exp
	; line bf
	break	; 786c
	const.pri 1
	retn

	proc	; SSCANF_OnPlayerConnect
	; line c3
	;$lcl playerid c
	; line c4
	break	; 7880
	;$lcl query fffffc04
	stack fffffc04
	zero.pri
	addr.alt fffffc04
	fill 3fc
	;$lcl string fffffb04
	stack ffffff00
	zero.pri
	addr.alt fffffb04
	fill 100
	; line c5
	break	; 78bc
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 14c
	move.alt
	zero.pri
	stor.i
	;$exp
	; line c6
	break	; 78fc
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 58
	move.alt
	zero.pri
	stor.i
	;$exp
	; line c7
	break	; 793c
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 48
	move.alt
	zero.pri
	stor.i
	;$exp
	; line c8
	break	; 797c
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 4c
	move.alt
	zero.pri
	stor.i
	;$exp
	; line c9
	break	; 79bc
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 50
	move.alt
	zero.pri
	stor.i
	;$exp
	; line ca
	break	; 79fc
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 54
	move.alt
	zero.pri
	stor.i
	;$exp
	; line cc
	break	; 7a3c
	heap 60
	push.alt
	push.s c
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5b048
	;$par
	push.c ff
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c 14
	sysreq.c 3e	; mysql_format
	stack 18
	heap ffffffa0
	;$exp
	; line cd
	break	; 7aac
	push.adr c
	;$par
	push.c 5b124
	;$par
	push.c 5b0f0
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c 14
	sysreq.c 3f	; mysql_tquery
	stack 18
	;$exp
	; line cf
	break	; 7af0
	heap 60
	push.alt
	push.s c
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5b12c
	;$par
	push.c 40
	;$par
	push.adr fffffb04
	;$par
	push.c 10
	sysreq.c 7	; format
	stack 14
	heap ffffffa0
	;$exp
	; line d0
	break	; 7b58
	push.adr fffffb04
	;$par
	push.c c1c1c1aa
	;$par
	push.c 8
	sysreq.c 40	; SendClientMessageToAll
	stack c
	;$exp
	; line d2
	break	; 7b84
	const.alt 3904
	load.s.pri c
	bounds 3e7
	idxaddr
	push.pri
	push.c 5b18c
	;$par
	push.c 439b0000
	;$par
	push.c 42ae0000
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 41	; CreatePlayerTextDraw
	stack 14
	pop.alt
	stor.i
	;$exp
	; line d3
	break	; 7be8
	push.c ff
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 42	; PlayerTextDrawBackgroundColor
	stack 10
	;$exp
	; line d4
	break	; 7c34
	push.c 2
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 43	; PlayerTextDrawAlignment
	stack 10
	;$exp
	; line d5
	break	; 7c80
	push.c 1
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 44	; PlayerTextDrawFont
	stack 10
	;$exp
	; line d6
	break	; 7ccc
	push.c 40000000
	;$par
	push.c 3f000000
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 45	; PlayerTextDrawLetterSize
	stack 14
	;$exp
	; line d7
	break	; 7d20
	push.c ffffffff
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 46	; PlayerTextDrawColor
	stack 10
	;$exp
	; line d8
	break	; 7d6c
	push.c 1
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 47	; PlayerTextDrawSetOutline
	stack 10
	;$exp
	; line d9
	break	; 7db8
	push.c 1
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 48	; PlayerTextDrawSetProportional
	stack 10
	;$exp
	; line da
	break	; 7e04
	push.c 1
	;$par
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 49	; PlayerTextDrawSetShadow
	stack 10
	;$exp
	; line db
	break	; 7e50
	const.alt 48a4
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	zero.pri
	stor.i
	;$exp
	; line dd
	break	; 7e7c
	const.pri 1
	stack 4fc
	retn


DATA 0	; 5b048
dump 53 45 4c 45 43 54 20 2a 20 46 52 4f 4d 20 60 75 
dump 73 65 72 73 60 20 57 48 45 52 45 20 60 6e 69 63 
dump 6b 60 20 3d 20 27 25 73 27 0 43 68 65 63 6b 41 
dump 63 63 6f 75 6e 74 0 64 0 2a 2a 20 25 73 20 4a 
dump 6f 69 6e 65 64 20 74 68 65 20 73 65 72 76 65 72 
dump 0 5f 0 

CODE 0	; 7e94
	proc	; SSCANF_OnPlayerDisconnect
	; line e1
	;$lcl reason 10
	;$lcl playerid c
	; line e2
	break	; 7e98
	;$lcl query fffffc04
	stack fffffc04
	zero.pri
	addr.alt fffffc04
	fill 3fc
	;$lcl string fffffb04
	stack ffffff00
	zero.pri
	addr.alt fffffb04
	fill 100
	; line e3
	break	; 7ed4
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 40
	push.pri
	;$par
	push.s c
	;$par
	push.c 4
	call getPlayerAdminLevel
	heap 4
	stor.i
	push.alt
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 4b	; GetPlayerMoney
	stack 8
	heap 4
	stor.i
	push.alt
	;$par
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 4c
	push.pri
	;$par
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 48
	push.pri
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 4a	; GetPlayerScore
	stack 8
	heap 4
	stor.i
	push.alt
	;$par
	push.c 5b194
	;$par
	push.c ff
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c 28
	sysreq.c 3e	; mysql_format
	stack 2c
	heap fffffff4
	;$exp
	; line e4
	break	; 803c
	push.c 1
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c c
	sysreq.c 12	; mysql_query
	stack 10
	;$exp
	; line e6
	break	; 8070
	heap 60
	push.alt
	push.s c
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5b37c
	;$par
	push.c 40
	;$par
	push.adr fffffb04
	;$par
	push.c 10
	sysreq.c 7	; format
	stack 14
	heap ffffffa0
	;$exp
	; line e7
	break	; 80d8
	push.adr fffffb04
	;$par
	push.c c1c1c1aa
	;$par
	push.c 8
	sysreq.c 40	; SendClientMessageToAll
	stack c
	;$exp
	; line e9
	break	; 8104
	const.alt 3904
	load.s.pri c
	bounds 3e7
	lidx
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 4c	; PlayerTextDrawDestroy
	stack c
	;$exp
	; line ea
	break	; 8148
	const.alt 3904
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	const.pri ffff
	stor.i
	;$exp
	; line eb
	break	; 8178
	const.alt 48a4
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	zero.pri
	stor.i
	;$exp
	; line ed
	break	; 81a4
	const.pri 1
	stack 4fc
	retn


DATA 0	; 5b194
dump 55 50 44 41 54 45 20 60 75 73 65 72 73 60 20 53 
dump 45 54 20 60 73 63 6f 72 65 60 20 3d 20 27 25 69 
dump 27 2c 20 60 6b 69 6c 6c 73 60 20 3d 20 27 25 69 
dump 27 2c 20 60 64 65 61 74 68 73 60 20 3d 20 27 25 
dump 69 27 2c 20 60 6d 6f 6e 65 79 60 20 3d 20 27 25 
dump 69 27 2c 20 60 61 64 6d 69 6e 6c 65 76 65 6c 60 
dump 20 3d 20 27 25 69 27 20 57 48 45 52 45 20 60 69 
dump 64 60 20 3d 20 27 25 69 27 0 2a 2a 20 25 73 20 
dump 4c 65 66 74 20 74 68 65 20 73 65 72 76 65 72 0 

CODE 0	; 81bc
	proc	; OnPlayerSpawn
	; line f1
	;$lcl playerid c
	; line f2
	break	; 81c0
	push.c 0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2c	; SetPlayerInterior
	stack c
	;$exp
	; line f3
	break	; 81ec
	push.c 0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2d	; SetPlayerVirtualWorld
	stack c
	;$exp
	; line f5
	break	; 8218
	const.pri 1
	retn

	proc	; OnPlayerDeath
	; line f9
	;$lcl reason 14
	;$lcl killerid 10
	;$lcl playerid c
	; line fa
	break	; 822c
	load.s.pri 10
	const.alt ffff
	jeq 236
	;$exp
	; line fb
	break	; 8248
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 48
	push.pri
	load.i
	swap.pri
	inc.i
	pop.pri
	;$exp
	; line fc
	break	; 8290
	push.s 10
	;$par
	push.c 4
	sysreq.c 4a	; GetPlayerScore
	stack 8
	add.c 5
	push.pri
	;$par
	push.s 10
	;$par
	push.c 8
	sysreq.c 4d	; SetPlayerScore
	stack c
	;$exp
l.236		; 82e0
	; line fe
	break	; 82e0
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 4c
	push.pri
	load.i
	swap.pri
	inc.i
	pop.pri
	;$exp
	; line ff
	break	; 8328
	push.s c
	;$par
	push.c 4
	sysreq.c 4a	; GetPlayerScore
	stack 8
	add.c -a
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 4d	; SetPlayerScore
	stack c
	;$exp
	; line 101
	break	; 8378
	push.s 14
	;$par
	push.s c
	;$par
	push.s 10
	;$par
	push.c c
	sysreq.c 4e	; SendDeathMessage
	stack 10
	;$exp
	; line 102
	break	; 83ac
	push.c 2
	;$par
	push.c 1388
	;$par
	push.c 5b3d4
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 4f	; GameTextForPlayer
	stack 14
	;$exp
	; line 103
	break	; 83e8
	const.pri 1
	retn


DATA 0	; 5b3d4
dump 57 61 73 74 65 64 0 

CODE 0	; 83f8
	proc	; OnPlayerTakeDamage
	; line 107
	;$lcl bodypart 1c
	;$lcl weaponid 18
	;$lcl amount 14
	;$lcl issuerid 10
	;$lcl playerid c
	; line 108
	break	; 83fc
	load.s.pri 10
	const.alt ffff
	jeq 238
	load.s.pri 18
	jzer 238
	load.s.pri 1c
	eq.c.pri 9
	jzer 238
	const.pri 1
	jump 239
l.238
	zero.pri
l.239
	jzer 237
	;$exp
	; line 109
	break	; 845c
	push.c 0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 50	; SetPlayerHealth
	stack c
	;$exp
l.237		; 8488
	; line 10b
	break	; 8488
	const.pri 1
	retn

	proc	; OnVehicleSpawn
	; line 10f
	;$lcl vehicleid c
	; line 110
	break	; 849c
	const.pri 1
	retn

	proc	; OnVehicleDeath
	; line 114
	;$lcl killerid 10
	;$lcl vehicleid c
	; line 115
	break	; 84b0
	const.pri 1
	retn

	proc	; OnPlayerText
	; line 119
	;$lcl text 10
	;$lcl playerid c
	; line 11a
	break	; 84c4
	const.pri 1
	retn

	proc	; OnPlayerEnterVehicle
	; line 11e
	;$lcl ispassenger 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 11f
	break	; 84d8
	const.pri 1
	retn

	proc	; OnPlayerExitVehicle
	; line 123
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 124
	break	; 84ec
	const.pri 1
	retn

	proc	; OnPlayerStateChange
	; line 128
	;$lcl oldstate 14
	;$lcl newstate 10
	;$lcl playerid c
	; line 129
	break	; 8500
	load.s.pri 10
	eq.c.pri 2
	jzer 23b
	load.s.pri 14
	const.alt 2
	jeq 23b
	const.pri 1
	jump 23c
l.23b
	zero.pri
l.23c
	jzer 23a
	;$exp
	; line 12a
	break	; 8550
	;$lcl str ffffffa0
	stack ffffffa0
	zero.pri
	addr.alt ffffffa0
	fill 60
	; line 12b
	break	; 8570
	const.pri 58868
	push.pri
	push.s c
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c 4
	sysreq.c 51	; GetVehicleModel
	stack 8
	add.c -190
	bounds d3
	pop.alt
	idxaddr
	move.alt
	load.i
	add
	push.pri
	;$par
	push.c 5b3f0
	;$par
	push.c 18
	;$par
	push.adr ffffffa0
	;$par
	push.c 10
	sysreq.c 7	; format
	stack 14
	;$exp
	; line 12c
	break	; 8614
	push.c 1
	;$par
	push.c 1770
	;$par
	push.adr ffffffa0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 4f	; GameTextForPlayer
	stack 14
	;$exp
	stack 60
l.23a		; 8658
	; line 12f
	break	; 8658
	const.pri 1
	retn


DATA 0	; 5b3f0
dump 7e 67 7e 25 73 0 

CODE 0	; 8668
	proc	; OnPlayerEnterCheckpoint
	; line 133
	;$lcl playerid c
	; line 134
	break	; 866c
	const.pri 1
	retn

	proc	; OnPlayerLeaveCheckpoint
	; line 138
	;$lcl playerid c
	; line 139
	break	; 8680
	const.pri 1
	retn

	proc	; OnPlayerEnterRaceCheckpoint
	; line 13d
	;$lcl playerid c
	; line 13e
	break	; 8694
	const.pri 1
	retn

	proc	; OnPlayerLeaveRaceCheckpoint
	; line 142
	;$lcl playerid c
	; line 143
	break	; 86a8
	const.pri 1
	retn

	proc	; OnRconCommand
	; line 147
	;$lcl cmd c
	; line 148
	break	; 86bc
	const.pri 1
	retn

	proc	; OnPlayerRequestSpawn
	; line 14c
	;$lcl playerid c
	; line 14d
	break	; 86d0
	const.pri 1
	retn

	proc	; OnObjectMoved
	; line 151
	;$lcl objectid c
	; line 152
	break	; 86e4
	const.pri 1
	retn

	proc	; OnPlayerObjectMoved
	; line 156
	;$lcl objectid 10
	;$lcl playerid c
	; line 157
	break	; 86f8
	const.pri 1
	retn

	proc	; OnPlayerPickUpPickup
	; line 15b
	;$lcl pickupid 10
	;$lcl playerid c
	; line 15c
	break	; 870c
	const.pri 1
	retn

	proc	; OnVehicleMod
	; line 160
	;$lcl componentid 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 161
	break	; 8720
	const.pri 1
	retn

	proc	; OnVehiclePaintjob
	; line 165
	;$lcl paintjobid 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 166
	break	; 8734
	const.pri 1
	retn

	proc	; OnVehicleRespray
	; line 16a
	;$lcl color2 18
	;$lcl color1 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 16b
	break	; 8748
	push.c ffffffff
	;$par
	push.c ffffffff
	;$par
	push.s c
	;$par
	push.c 4
	sysreq.c 26	; GetPlayerVehicleID
	stack 8
	push.pri
	;$par
	push.c c
	sysreq.c 52	; ChangeVehicleColor
	stack 10
	;$exp
	; line 16c
	break	; 8798
	const.pri 1
	retn

	proc	; OnPlayerSelectedMenuRow
	; line 170
	;$lcl row 10
	;$lcl playerid c
	; line 171
	break	; 87ac
	const.pri 1
	retn

	proc	; OnPlayerExitedMenu
	; line 175
	;$lcl playerid c
	; line 176
	break	; 87c0
	const.pri 1
	retn

	proc	; OnPlayerInteriorChange
	; line 17a
	;$lcl oldinteriorid 14
	;$lcl newinteriorid 10
	;$lcl playerid c
	; line 17b
	break	; 87d4
	const.pri 1
	retn

	proc	; OnPlayerKeyStateChange
	; line 17f
	;$lcl oldkeys 14
	;$lcl newkeys 10
	;$lcl playerid c
	; line 180
	break	; 87e8
	const.pri 1
	retn

	proc	; OnRconLoginAttempt
	; line 184
	;$lcl success 14
	;$lcl password 10
	;$lcl ip c
	; line 185
	break	; 87fc
	const.pri 1
	retn

	proc	; OnPlayerUpdate
	; line 189
	;$lcl playerid c
	; line 18a
	break	; 8810
	const.pri 1
	retn

	proc	; OnPlayerStreamIn
	; line 18e
	;$lcl forplayerid 10
	;$lcl playerid c
	; line 18f
	break	; 8824
	const.pri 1
	retn

	proc	; OnPlayerStreamOut
	; line 193
	;$lcl forplayerid 10
	;$lcl playerid c
	; line 194
	break	; 8838
	const.pri 1
	retn

	proc	; OnVehicleStreamIn
	; line 198
	;$lcl forplayerid 10
	;$lcl vehicleid c
	; line 199
	break	; 884c
	const.pri 1
	retn

	proc	; OnVehicleStreamOut
	; line 19d
	;$lcl forplayerid 10
	;$lcl vehicleid c
	; line 19e
	break	; 8860
	const.pri 1
	retn

	proc	; OnPlayerClickPlayer
	; line 1a2
	;$lcl source 14
	;$lcl clickedplayerid 10
	;$lcl playerid c
	; line 1a3
	break	; 8874
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 14c
	load.i
	eq.c.pri 1
	jzer 23d
	;$exp
	; line 1a4
	break	; 88bc
	;$lcl string fffffc04
	stack fffffc04
	zero.pri
	addr.alt fffffc04
	fill 3fc
	;$lcl KD fffffc00
	push.c 0
	;$exp
	; line 1a5
	break	; 88e4
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 4c
	load.i
	push.pri
	;$par
	push.c 4
	sysreq.c 53	; Float:operator=(_:)
	stack 8
	push.pri
	;$par
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 48
	load.i
	push.pri
	;$par
	push.c 4
	sysreq.c 53	; Float:operator=(_:)
	stack 8
	push.pri
	;$par
	push.c 8
	sysreq.c 54	; floatdiv
	stack c
	stor.s.pri fffffc00
	;$exp
	; line 1a6
	break	; 89b0
	push.c 10
	;$par
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	push.pri
	;$par
	push.s 10
	;$par
	push.c c
	sysreq.c 55	; GetPlayerIp
	stack 10
	;$exp
	; line 1a7
	break	; 8a08
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	push.pri
	;$par
	push.s 10
	;$par
	push.c 4
	sysreq.c 56	; GetPlayerPing
	stack 8
	heap 4
	stor.i
	push.alt
	;$par
	push.s 10
	;$par
	push.c 4
	sysreq.c 4b	; GetPlayerMoney
	stack 8
	heap 4
	stor.i
	push.alt
	;$par
	push.s 10
	;$par
	push.c 4
	sysreq.c 4a	; GetPlayerScore
	stack 8
	heap 4
	stor.i
	push.alt
	;$par
	push.adr fffffc00
	;$par
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 4c
	push.pri
	;$par
	const.alt 5848
	load.s.pri 10
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 48
	push.pri
	;$par
	heap 60
	push.alt
	push.s 10
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5b408
	;$par
	push.c ff
	;$par
	push.adr fffffc04
	;$par
	push.c 2c
	sysreq.c 7	; format
	stack 30
	heap fffffff4
	heap ffffffa0
	;$exp
	; line 1aa
	break	; 8ba4
	push.c 5b5dc
	;$par
	push.c 5b5c0
	;$par
	push.adr fffffc04
	;$par
	push.c 5b58c
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
	stack 400
l.23d		; 8c00
	; line 1ac
	break	; 8c00
	const.pri 1
	retn


DATA 0	; 5b408
dump 7b 66 66 66 66 66 66 7d 50 6c 61 79 65 72 3a 9 
dump 9 25 73 a 4b 69 6c 6c 73 3a 9 9 25 69 a 44 
dump 65 61 74 68 73 3a 9 9 25 69 a 4b 2f 44 3a 9 
dump 9 25 2e 31 66 a 53 63 6f 72 65 3a 9 9 25 69 
dump a 4d 6f 6e 65 79 3a 9 9 24 25 69 a 50 69 6e 
dump 67 3a 9 9 25 69 6d 73 a 49 50 3a 9 9 25 73 
dump 0 45 73 74 61 74 69 73 74 69 63 61 73 0 46 65 
dump 63 68 61 72 0 0 

CODE 0	; 8c10
	proc	; OnDialogResponse
	; line 1b0
	;$lcl inputtext 1c
	;$lcl listitem 18
	;$lcl response 14
	;$lcl dialogid 10
	;$lcl playerid c
	; line 1b1
	break	; 8c14
	load.s.pri 10
	switch 23e
l.240		; 8c28
	; line 1b4
	break	; 8c28
	load.s.pri 14
	jzer 241
	;$exp
	; line 1b5
	break	; 8c3c
	;$lcl query fffffc04
	stack fffffc04
	zero.pri
	addr.alt fffffc04
	fill 3fc
	;$lcl pwd fffffb10
	stack ffffff0c
	zero.pri
	addr.alt fffffb10
	fill f4
	; line 1b6
	break	; 8c78
	heap 60
	push.alt
	push.s c
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5b5e0
	;$par
	push.c ff
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c 14
	sysreq.c 3e	; mysql_format
	stack 18
	heap ffffffa0
	;$exp
	; line 1b7
	break	; 8ce8
	push.c 1
	;$par
	push.adr fffffc04
	;$par
	push 2960
	;$par
	push.c c
	sysreq.c 12	; mysql_query
	stack 10
	;$exp
	; line 1b8
	break	; 8d1c
	push.c 3d
	;$par
	push.adr fffffb10
	;$par
	push.c 5b698
	;$par
	push.c 0
	;$par
	push.c 10
	sysreq.c 57	; cache_get_value_name
	stack 14
	;$exp
	; line 1b9
	break	; 8d58
	push.adr c
	;$par
	push.c 5b6f0
	;$par
	push.c 5b6a8
	;$par
	push.adr fffffb10
	;$par
	push.s 1c
	;$par
	push.c 14
	sysreq.c 58	; bcrypt_check
	stack 18
	;$exp
	stack 4f0
	jump 242
l.241		; 8dac
	; line 1bc
	break	; 8dac
	push.s c
	;$par
	push.c 4
	sysreq.c 59	; Kick
	stack 8
	;$exp
l.242		; 8dd0
	jump 23f
l.243		; 8dd8
	; line 1c2
	break	; 8dd8
	load.s.pri 14
	jzer 244
	;$exp
	; line 1c3
	break	; 8dec
	push.s 1c
	;$par
	push.c 4
	sysreq.c 5a	; strlen
	stack 8
	jzer 245
	;$exp
	; line 1c4
	break	; 8e18
	push.s 1c
	;$par
	push.c 5b6f8
	;$par
	push.c 3d
	;$par
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 58
	push.pri
	;$par
	push.c 10
	sysreq.c 7	; format
	stack 14
	;$exp
	; line 1c5
	break	; 8e80
	push.c 5b7f8
	;$par
	push.c 5b7d0
	;$par
	push.c 5b768
	;$par
	push.c 5b704
	;$par
	push.c 3
	;$par
	push.c 5de
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
	jump 246
l.245		; 8edc
	; line 1c8
	break	; 8edc
	push.c 5ba80
	;$par
	push.c 5ba58
	;$par
	push.c 5b878
	;$par
	push.c 5b814
	;$par
	push.c 3
	;$par
	push.c 5dc
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
l.246		; 8f30
	jump 247
l.244		; 8f38
	; line 1cc
	break	; 8f38
	push.s c
	;$par
	push.c 4
	sysreq.c 59	; Kick
	stack 8
	;$exp
l.247		; 8f5c
	jump 23f
l.248		; 8f64
	; line 1d2
	break	; 8f64
	load.s.pri 14
	jzer 249
	;$exp
	; line 1d3
	break	; 8f78
	push.s 1c
	;$par
	push.c 4
	sysreq.c 5a	; strlen
	stack 8
	jzer 24a
	;$exp
	; line 1d4
	break	; 8fa4
	push.c 7fffffff
	;$par
	push.c 0
	;$par
	push.s 1c
	;$par
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 58
	push.pri
	;$par
	push.c 10
	sysreq.c 11	; strcmp
	stack 14
	jnz 24b
	;$exp
	; line 1d5
	break	; 9014
	push.adr c
	;$par
	push.c 5bad8
	;$par
	push.c 5ba94
	;$par
	push.c c
	;$par
	push.s 1c
	;$par
	push.c 14
	sysreq.c 5b	; bcrypt_hash
	stack 18
	;$exp
	jump 24c
l.24b		; 9060
	; line 1d8
	break	; 9060
	push.c 5bce4
	;$par
	push.c 5bcbc
	;$par
	push.c 5bb44
	;$par
	push.c 5bae0
	;$par
	push.c 3
	;$par
	push.c 5dc
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
l.24c		; 90b4
	jump 24d
l.24a		; 90bc
	; line 1dc
	break	; 90bc
	push.c 5befc
	;$par
	push.c 5bed4
	;$par
	push.c 5bd5c
	;$par
	push.c 5bcf8
	;$par
	push.c 3
	;$par
	push.c 5dc
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
l.24d		; 9110
	jump 24e
l.249		; 9118
	; line 1e0
	break	; 9118
	push.c 5c10c
	;$par
	push.c 5c0e4
	;$par
	push.c 5bf74
	;$par
	push.c 5bf10
	;$par
	push.c 3
	;$par
	push.c 5dc
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
l.24e		; 916c
	jump 23f
l.23e		; 9174
	casetbl
	case 3 23f
	case 5dc 243
	case 5dd 240
	case 5de 248
l.23f		; 9198
	; line 1e5
	break	; 9198
	const.pri 1
	retn


DATA 0	; 5b5e0
dump 53 45 4c 45 43 54 20 60 70 77 64 60 20 46 52 4f 
dump 4d 20 60 75 73 65 72 73 60 20 57 48 45 52 45 20 
dump 60 6e 69 63 6b 60 20 3d 20 27 25 65 27 0 70 77 
dump 64 0 4f 6e 50 61 73 73 77 6f 72 64 43 68 65 63 
dump 6b 65 64 0 64 0 25 73 0 7b 66 66 30 30 30 30 
dump 7d 20 52 65 67 69 73 74 72 61 72 20 43 6f 6e 74 
dump 61 0 7b 66 66 66 66 66 66 7d 52 65 70 69 74 61 
dump 20 73 75 61 20 73 65 6e 68 61 3a 0 43 6f 6e 66 
dump 69 72 6d 61 72 0 56 6f 6c 74 61 72 0 7b 66 66 
dump 30 30 30 30 7d 20 52 65 67 69 73 74 72 61 72 20 
dump 43 6f 6e 74 61 0 20 42 65 6d 2d 76 69 6e 64 6f 
dump 21 a a 20 7b 66 66 66 66 66 66 7d 53 74 61 74 
dump 75 73 20 64 61 20 43 6f 6e 74 61 3a 20 7b 66 66 
dump 30 30 30 30 7d 4e 61 6f 20 72 65 67 69 73 74 72 
dump 61 64 6f a a 20 7b 66 66 30 30 30 30 7d 56 6f 
dump 63 65 20 64 65 76 65 20 69 6e 66 6f 72 6d 61 72 
dump 20 75 6d 61 20 73 65 6e 68 61 20 70 61 72 61 20 
dump 73 65 20 72 65 67 69 73 74 72 61 72 21 0 52 65 
dump 67 69 73 74 72 61 72 0 53 61 69 72 0 4f 6e 50 
dump 61 73 73 77 6f 72 64 48 61 73 68 65 64 0 64 0 
dump 7b 66 66 30 30 30 30 7d 20 52 65 67 69 73 74 72 
dump 61 72 20 43 6f 6e 74 61 0 20 42 65 6d 2d 76 69 
dump 6e 64 6f 21 a a 20 7b 66 66 66 66 66 66 7d 53 
dump 74 61 74 75 73 20 64 61 20 43 6f 6e 74 61 3a 20 
dump 7b 66 66 30 30 30 30 7d 4e 61 6f 20 72 65 67 69 
dump 73 74 72 61 64 6f a a 20 7b 66 66 30 30 30 30 
dump 7d 53 65 6e 68 61 73 20 6e 61 6f 20 63 6f 69 6e 
dump 63 69 64 65 6d 21 0 52 65 67 69 73 74 72 61 72 
dump 0 53 61 69 72 0 7b 66 66 30 30 30 30 7d 20 52 
dump 65 67 69 73 74 72 61 72 20 43 6f 6e 74 61 0 20 
dump 42 65 6d 2d 76 69 6e 64 6f 21 a a 20 7b 66 66 
dump 66 66 66 66 7d 53 74 61 74 75 73 20 64 61 20 43 
dump 6f 6e 74 61 3a 20 7b 66 66 30 30 30 30 7d 4e 61 
dump 6f 20 72 65 67 69 73 74 72 61 64 6f a a 20 7b 
dump 66 66 30 30 30 30 7d 53 65 6e 68 61 73 20 6e 61 
dump 6f 20 63 6f 69 6e 63 69 64 65 6d 21 0 52 65 67 
dump 69 73 74 72 61 72 0 53 61 69 72 0 7b 66 66 30 
dump 30 30 30 7d 20 52 65 67 69 73 74 72 61 72 20 43 
dump 6f 6e 74 61 0 20 42 65 6d 2d 76 69 6e 64 6f 21 
dump a a 20 7b 66 66 66 66 66 66 7d 53 74 61 74 75 
dump 73 20 64 61 20 43 6f 6e 74 61 3a 20 7b 66 66 30 
dump 30 30 30 7d 4e 61 6f 20 72 65 67 69 73 74 72 61 
dump 64 6f a a 20 7b 66 66 66 66 66 66 7d 52 65 67 
dump 69 73 74 72 65 20 75 6d 61 20 73 65 6e 68 61 3a 
dump 0 52 65 67 69 73 74 72 61 72 0 53 61 69 72 0 

CODE 0	; 91a8
	proc	; CheckAccount
	; line 1ea
	;$lcl playerid c
	; line 1eb
	break	; 91ac
	push.c 0
	call cache_num_rows
	jzer 24f
	;$exp
	; line 1ec
	break	; 91c8
	push.c 5c2f4
	;$par
	push.c 5c2dc
	;$par
	push.c 5c15c
	;$par
	push.c 5c120
	;$par
	push.c 3
	;$par
	push.c 5dd
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
	jump 250
l.24f		; 9224
	; line 1ef
	break	; 9224
	push.c 5c538
	;$par
	push.c 5c520
	;$par
	push.c 5c36c
	;$par
	push.c 5c308
	;$par
	push.c 3
	;$par
	push.c 5dc
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
l.250		; 9278
	; line 1f1
	break	; 9278
	const.pri 1
	retn


DATA 0	; 5c120
dump 7b 66 66 30 30 30 30 7d 20 43 6f 6e 74 61 0 20 
dump 42 65 6d 2d 76 69 6e 64 6f 21 a a 20 7b 66 66 
dump 66 66 66 66 7d 53 74 61 74 75 73 20 64 61 20 43 
dump 6f 6e 74 61 3a 20 7b 31 32 64 38 30 30 7d 52 65 
dump 67 69 73 74 72 61 64 61 a a 20 7b 66 66 66 66 
dump 66 66 7d 45 6e 74 72 65 20 63 6f 6d 20 73 75 61 
dump 20 73 65 6e 68 61 20 61 62 61 69 78 6f 3a 0 4c 
dump 6f 67 69 6e 0 53 61 69 72 0 7b 66 66 30 30 30 
dump 30 7d 20 52 65 67 69 73 74 72 61 72 20 43 6f 6e 
dump 74 61 0 20 42 65 6d 2d 76 69 6e 64 6f 21 a a 
dump 20 7b 66 66 66 66 66 66 7d 53 74 61 74 75 73 20 
dump 64 61 20 43 6f 6e 74 61 3a 20 7b 66 66 30 30 30 
dump 30 7d 4e 61 6f 20 52 65 67 69 73 74 72 61 64 61 
dump a a 20 7b 66 66 66 66 66 66 7d 49 6e 66 6f 72 
dump 6d 65 20 75 6d 61 20 73 65 6e 68 61 20 70 61 72 
dump 61 20 73 65 20 72 65 67 69 73 74 72 61 72 3a 0 
dump 4c 6f 67 69 6e 0 53 61 69 72 0 

CODE 0	; 9288
	proc	; OnPasswordHashed
	; line 1f6
	;$lcl playerid c
	; line 1f7
	break	; 928c
	;$lcl hash ffffff0c
	stack ffffff0c
	zero.pri
	addr.alt ffffff0c
	fill f4
	; line 1f8
	break	; 92ac
	push.adr ffffff0c
	;$par
	push.c 4
	sysreq.c 5c	; bcrypt_get_hash
	stack 8
	;$exp
	; line 1f9
	break	; 92d0
	push.adr ffffff0c
	;$par
	push.s c
	;$par
	push.c 8
	call MySQL_register
	;$exp
	; line 1fa
	break	; 92f4
	const.pri 1
	stack f4
	retn

	proc	; OnPasswordChecked
	; line 1ff
	;$lcl playerid c
	; line 200
	break	; 9310
	;$lcl match fffffffc
	stack fffffffc
	push.c 0
	sysreq.c 5d	; bcrypt_is_equal
	stack 4
	stor.s.pri fffffffc
	;$exp
	; line 201
	break	; 933c
	load.s.pri fffffffc
	eq.c.pri 1
	jzer 251
	;$exp
	; line 202
	break	; 9358
	;$lcl query fffffb4c
	stack fffffb50
	zero.pri
	addr.alt fffffb4c
	fill 4b0
	; line 203
	break	; 9378
	heap 60
	push.alt
	push.s c
	;$par
	push.c 4
	call getName
	pop.pri
	push.pri
	;$par
	push.c 5c54c
	;$par
	push.c 12c
	;$par
	push.adr fffffb4c
	;$par
	push 2960
	;$par
	push.c 14
	sysreq.c 3e	; mysql_format
	stack 18
	heap ffffffa0
	;$exp
	; line 204
	break	; 93e8
	push.adr c
	;$par
	push.c 5c628
	;$par
	push.c 5c5f4
	;$par
	push.adr fffffb4c
	;$par
	push 2960
	;$par
	push.c 14
	sysreq.c 3f	; mysql_tquery
	stack 18
	;$exp
	stack 4b0
	jump 252
l.251		; 943c
	; line 207
	break	; 943c
	push.c 5c6c4
	;$par
	push.c 5c6ac
	;$par
	push.c 5c648
	;$par
	push.c 5c630
	;$par
	push.c 3
	;$par
	push.c 5dd
	;$par
	push.s c
	;$par
	push.c 1c
	sysreq.c 14	; ShowPlayerDialog
	stack 20
	;$exp
l.252		; 9490
	; line 209
	break	; 9490
	const.pri 1
	stack 4
	retn


DATA 0	; 5c54c
dump 53 45 4c 45 43 54 20 2a 20 46 52 4f 4d 20 60 75 
dump 73 65 72 73 60 20 57 48 45 52 45 20 60 6e 69 63 
dump 6b 60 20 3d 20 27 25 65 27 0 4f 6e 50 6c 61 79 
dump 65 72 4c 6f 61 64 0 64 0 43 6f 6e 74 61 0 7b 
dump 66 66 30 30 30 30 7d 53 65 6e 68 61 20 69 6e 63 
dump 6f 72 72 65 74 61 21 0 4c 6f 67 69 6e 0 53 61 
dump 69 72 0 

CODE 0	; 94a8
	proc	; OnPlayerLoad
	; line 20e
	;$lcl playerid c
	; line 20f
	break	; 94ac
	push.c 5c6d8
	;$par
	push.c ffffffff
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 13	; SendClientMessage
	stack 10
	;$exp
	; line 210
	break	; 94e0
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 14c
	move.alt
	const.pri 1
	stor.i
	;$exp
	; line 211
	break	; 9524
	push.c 1
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2d	; SetPlayerVirtualWorld
	stack c
	;$exp
	; line 212
	break	; 9550
	push.c e
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2c	; SetPlayerInterior
	stack c
	;$exp
	; line 213
	break	; 957c
	push.c 447a817f
	;$par
	push.c c2259a6b
	;$par
	push.c 43813ea1
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 2e	; SetPlayerPos
	stack 14
	;$exp
	; line 214
	break	; 95b8
	push.c c3870000
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 2f	; SetPlayerFacingAngle
	stack c
	;$exp
	; line 215
	break	; 95e4
	push.c 447b017f
	;$par
	push.c c22c30a4
	;$par
	push.c 43800a6f
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 3c	; SetPlayerCameraPos
	stack 14
	;$exp
	; line 216
	break	; 9620
	push.c 2
	;$par
	push.c 447a817f
	;$par
	push.c c2259a6b
	;$par
	push.c 43813ea1
	;$par
	push.s c
	;$par
	push.c 14
	sysreq.c 3d	; SetPlayerCameraLookAt
	stack 18
	;$exp
	; line 218
	break	; 9664
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 40
	push.pri
	;$par
	push.c 5c780
	;$par
	push.c 0
	;$par
	push.c c
	sysreq.c 5e	; cache_get_value_name_int
	stack 10
	;$exp
	; line 219
	break	; 96c4
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 44
	push.pri
	;$par
	push.c 5c78c
	;$par
	push.c 0
	;$par
	push.c c
	sysreq.c 5e	; cache_get_value_name_int
	stack 10
	;$exp
	; line 21a
	break	; 9724
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 50
	push.pri
	;$par
	push.c 5c7a4
	;$par
	push.c 0
	;$par
	push.c c
	sysreq.c 5e	; cache_get_value_name_int
	stack 10
	;$exp
	; line 21b
	break	; 9784
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 48
	push.pri
	;$par
	push.c 5c7bc
	;$par
	push.c 0
	;$par
	push.c c
	sysreq.c 5e	; cache_get_value_name_int
	stack 10
	;$exp
	; line 21c
	break	; 97e4
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 4c
	push.pri
	;$par
	push.c 5c7d4
	;$par
	push.c 0
	;$par
	push.c c
	sysreq.c 5e	; cache_get_value_name_int
	stack 10
	;$exp
	; line 21d
	break	; 9844
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 54
	push.pri
	;$par
	push.c 5c7f0
	;$par
	push.c 0
	;$par
	push.c c
	sysreq.c 5e	; cache_get_value_name_int
	stack 10
	;$exp
	; line 21f
	break	; 98a4
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 50
	load.i
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 5f	; GivePlayerMoney
	stack c
	;$exp
	; line 220
	break	; 9900
	const.alt 5848
	load.s.pri c
	bounds 3e7
	idxaddr
	move.alt
	load.i
	add
	add.c 44
	load.i
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 4d	; SetPlayerScore
	stack c
	;$exp
	; line 222
	break	; 995c
	const.pri 1
	retn


DATA 0	; 5c6d8
dump 7c 20 49 4e 46 4f 20 7c 20 7b 30 30 66 66 30 30 
dump 7d 43 6f 6e 74 61 20 6c 6f 67 61 64 61 20 63 6f 
dump 6d 20 73 75 63 65 73 73 6f 0 69 64 0 73 63 6f 
dump 72 65 0 6d 6f 6e 65 79 0 6b 69 6c 6c 73 0 64 
dump 65 61 74 68 73 0 61 64 6d 69 6e 6c 65 76 65 6c 
dump 0 

CODE 0	; 996c
	proc	; OnPlayerCommandReceived
	; line 228
	;$lcl cmdtext 10
	;$lcl playerid c
	; line 229
	break	; 9970
	const.pri 1
	retn

	proc	; OnPlayerCommandPerformed
	; line 22d
	;$lcl success 14
	;$lcl cmdtext 10
	;$lcl playerid c
	; line 22e
	break	; 9984
	load.s.pri 14
	not
	jzer 253
	;$exp
	; line 22f
	break	; 999c
	push.c 5c81c
	;$par
	push.c ff0000aa
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 13	; SendClientMessage
	stack 10
	;$exp
l.253		; 99d0
	; line 231
	break	; 99d0
	const.pri 1
	retn


DATA 0	; 5c81c
dump 7c 20 45 52 52 4f 20 7c 20 43 6f 6d 61 6e 64 6f 
dump 20 64 65 73 63 6f 6e 68 65 63 69 64 6f 0 

CODE 0	; 99e0
	proc	; cmd_ls
	; line 234
	;$lcl playerid c
	; line 235
	break	; 99e4
	push.c 6
	;$par
	push.c bb8
	;$par
	push.c 5c894
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 4f	; GameTextForPlayer
	stack 14
	;$exp
	; line 236
	break	; 9a20
	push.c 42a20ab2
	;$par
	push.c 4155afb8
	;$par
	push.c c4d09ec7
	;$par
	push.c 451c4f3b
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.s c
	;$par
	push.c 1c
	call teleportPlayer
	;$exp
	; line 237
	break	; 9a6c
	const.pri 1
	retn


DATA 0	; 5c894
dump 4c 4f 53 20 53 41 4e 54 4f 53 0 

CODE 0	; 9a7c
	proc	; cmd_sf
	; line 23a
	;$lcl playerid c
	; line 23b
	break	; 9a80
	push.c 6
	;$par
	push.c bb8
	;$par
	push.c 5c8c0
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 4f	; GameTextForPlayer
	stack 14
	;$exp
	; line 23c
	break	; 9abc
	push.c 42afed1b
	;$par
	push.c 41dc5014
	;$par
	push.c 42d9e787
	;$par
	push.c c4f943df
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.s c
	;$par
	push.c 1c
	call teleportPlayer
	;$exp
	; line 23d
	break	; 9b08
	const.pri 1
	retn


DATA 0	; 5c8c0
dump 53 41 4e 20 46 49 45 52 52 4f 0 

CODE 0	; 9b18
	proc	; cmd_lv
	; line 240
	;$lcl playerid c
	; line 241
	break	; 9b1c
	push.c 6
	;$par
	push.c bb8
	;$par
	push.c 5c8ec
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 4f	; GameTextForPlayer
	stack 14
	;$exp
	; line 242
	break	; 9b58
	push.c 438729db
	;$par
	push.c 412d1ff3
	;$par
	push.c 44a7e6da
	;$par
	push.c 44fcd71f
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.s c
	;$par
	push.c 1c
	call teleportPlayer
	;$exp
	; line 243
	break	; 9ba4
	const.pri 1
	retn


DATA 0	; 5c8ec
dump 4c 41 53 20 56 45 4e 54 55 52 41 53 0 

CODE 0	; 9bb4
	proc	; cmd_v
	; line 246
	;$lcl params 10
	;$lcl playerid c
	; line 247
	break	; 9bb8
	;$lcl VehID fffffffc
	push.c 0
	;$exp
	; line 248
	break	; 9bc4
	push.adr fffffffc
	;$par
	push.c 5c920
	;$par
	push.s 10
	;$par
	push.c c
	sysreq.c 60	; sscanf
	stack 10
	jzer 254
	;$exp
	; line 248
	break	; 9c00
	push.c 5c928
	;$par
	push.c ff0000aa
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 13	; SendClientMessage
	stack 10
	stack 4
	retn
l.254		; 9c40
	; line 249
	break	; 9c40
	push.s fffffffc
	;$par
	push.s c
	;$par
	push.c 8
	call createVehicleForPlayer
	;$exp
	; line 24a
	break	; 9c64
	const.pri 1
	stack 4
	retn


DATA 0	; 5c920
dump 69 0 7c 20 45 52 52 4f 20 7c 20 55 73 6f 3a 20 
dump 2f 76 20 5b 69 64 20 64 6f 20 76 65 69 63 75 6c 
dump 6f 5d 0 

CODE 0	; 9c7c
	proc	; cmd_vm
	; line 24d
	;$lcl params 10
	;$lcl playerid c
	; line 24e
	break	; 9c80
	;$lcl vehicleName ffffffa0
	stack ffffffa0
	zero.pri
	addr.alt ffffffa0
	fill 60
	; line 24f
	break	; 9ca0
	push.adr ffffffa0
	;$par
	push.c 5c9ac
	;$par
	push.s 10
	;$par
	push.c c
	sysreq.c 60	; sscanf
	stack 10
	jzer 255
	;$exp
	; line 24f
	break	; 9cdc
	push.c 5c9c4
	;$par
	push.c ff0000ff
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 13	; SendClientMessage
	stack 10
	stack 60
	retn
l.255		; 9d1c
	; line 250
	break	; 9d1c
	push.adr ffffffa0
	;$par
	push.c 4
	call getVehicleIDByName
	eq.c.pri ffff
	jzer 256
	;$exp
	; line 250
	break	; 9d48
	push.c 5ca54
	;$par
	push.c ff0000aa
	;$par
	push.s c
	;$par
	push.c c
	sysreq.c 13	; SendClientMessage
	stack 10
	stack 60
	retn
l.256		; 9d88
	; line 251
	break	; 9d88
	push.adr ffffffa0
	;$par
	push.c 4
	call getVehicleIDByName
	push.pri
	;$par
	push.s c
	;$par
	push.c 8
	call createVehicleForPlayer
	;$exp
	; line 252
	break	; 9dc0
	const.pri 1
	stack 60
	retn


DATA 0	; 5c9ac
dump 73 5b 32 34 5d 0 7c 20 45 52 52 4f 20 7c 20 55 
dump 73 6f 3a 20 2f 76 6d 20 5b 6e 6f 6d 65 20 64 6f 
dump 20 76 65 69 63 75 6c 6f 5d 0 7c 20 45 52 52 4f 
dump 20 7c 20 4e 6f 6d 65 20 69 6e 76 61 6c 69 64 6f 
dump 0 

CODE 0	; 9dd8
	proc	; cmd_clearvehicles
	; line 255
	;$lcl playerid c
	; line 256
	break	; 9ddc
	;$lcl i fffffffc
	push.c 0
	;$exp
	jump 259
l.257		; 9df0
	; line 256
	break	; 9df0
	inc.s fffffffc
	;$exp
l.259
	load.s.pri fffffffc
	const.alt 3e8
	jsgeq 258
	;$exp
	; line 257
	break	; 9e14
	const.alt 2964
	load.s.pri fffffffc
	bounds 3e7
	lidx
	push.pri
	;$par
	push.c 4
	sysreq.c 15	; DestroyVehicle
	stack 8
	;$exp
	jump 257
l.258		; 9e58
	stack 4
	; line 259
	break	; 9e60
	const.pri 1
	retn

	proc	; cmd_kill
	; line 25c
	;$lcl playerid c
	; line 25d
	break	; 9e74
	push.c 0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 50	; SetPlayerHealth
	stack c
	;$exp
	; line 25e
	break	; 9ea0
	push.c 0
	;$par
	push.s c
	;$par
	push.c 8
	sysreq.c 61	; SetPlayerArmour
	stack c
	;$exp
	; line 25f
	break	; 9ecc
	const.pri 1
	retn


STKSIZE 1000
