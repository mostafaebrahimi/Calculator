ESC_KEY      EQU   1BH   ; ASCII code for ESC key
KB_DATA      EQU   60H   ; 8255 port PA
Move_up      EQU   11H   ; key
Move_down    EQU   13H   ; key
Move_right   EQU   12H   ; key
Move_left    EQU   14H   ; key
Enter_btn    EQU   0DH   ; key

section .data
	temp_in_sm db    0
	_CurY_tmp  db    0
	__x		     db    0
	__y	 	     db    0
	_CX        db    0
	_CY        db    0
	temp       dw    0
	x          db    'a'
	table	     db    01BH,'1234567890-=',08H,09H
			       db    'qwertyuiop[]',0DH,0
			       db    'asdfghjkl;',27H,60H,0,'\'
			       db    'zxcvbnm,./',0,0,0,' ',0
		         db    0,0,0,0,0,0,0,0,0,0
			       db    0,0,0,11h,0,0,14h,0,12h,0
			       db    0,13h,0,0,0,0,0,0,0,0
section .bss
	arr_num_1  resb  30
section .text
	getc:
		in      AL,KB_DATA ; read keyboard status & scan code
		test    AL,80H ; PA7 = 0?
		jnz     getc ; if not, loop back

		and     AL,7FH ; isolate the scan code
		mov     si,table
		dec     AL ; index is one less than scan code
		cbw
		add	  	si, ax
		mov	  	al, byte [si]


		;C 	130.81 	9121
		cmp     al,byte 'q'
		je      qq
		jne     t1
qq:
		mov     bx,9121
		call    piano
t1:
		
		;C# 	138.59 	8609
		cmp     al,byte 'w'
		je      ww
		jne     t2	
ww:
		mov     bx,8609
		call    piano
t2:
		;D 	146.83 	8126
		cmp     al,byte 'e'
		je      t9
		jne     t3
t9:
		mov     bx,8126
		call    piano
t3:
		;D# 	155.56 	7670
		cmp     al,byte 'r'
		je      rr
		jne     t4
rr:
		mov     bx,7670
		call    piano

t4:
		;E 	164.81 	7239
		cmp     al,byte 't'
		je      tt
		jne     t5
tt:
		mov     bx,7239
		call    piano
t5:
		;F 	174.61 	6833
		cmp     al,byte 'y'
		je      yy
		jne     t6		
yy:
		mov     bx,6833
		call    piano
t6:
		;F# 	185.00 	6449
		cmp     al,byte 'u'
		je      uu
		jne     t7
uu:
		mov     bx,6449
		call    piano
t7:
		;G 	196.00 	6087
		cmp     al,byte 'i'
		je      ii
		jne     t8
ii:
		mov     bx,6087
		call    piano
t8:
		;G# 	207.65 	5746
		cmp     al,byte 'o'
		je      oo
		jne     t96
oo:
		mov     bx,5746
		call    piano
t96:
		;A 	220.00 	5423
		cmp     al,byte 'p'
		je      pp
		jne     t10
pp:
		mov     bx,5423
		call    piano
t10:
		;A# 	233.08 	5119
		cmp     al,byte '['
		je      uio
		jne     t11
uio:
		mov     bx,5119
		call    piano
t11:
		;B 	246.94 	4831
		cmp     al,byte ']'
		je      u9
		jne     t12
u9:
		mov     bx,4831
		call    piano
t12:
		;Middle C 	261.63 	4560
		cmp     al,byte 'a'
		je      p0
		jne     t13
p0:
		mov     bx,4560
		call    piano
t13:
		;C# 	277.18 	4304
		cmp     al,byte 's'
		je      s9
		jne     t14
s9:
		mov     bx,4304
		call    piano
t14:
		;D 	293.66 	4063
		cmp     al,byte 'd'
		je      y1
		jne     t15
y1:
		mov     bx,4063
		call    piano
t15:
		;D# 	311.13 	3834
		cmp     al,byte 'f'
		je      p09
		jne     t16
p09:
		mov     bx,3834
		call    piano
t16:
		;E 	329.63 	3619
		cmp     al,byte 'g'
		je      l09
		jne     t17
l09:
		mov     bx,3619
		call    piano
t17:
		;F 	349.23 	3416
		cmp     al,byte 'h'
		je      h1
		jne     t18
h1:
		mov     bx,3416
		call    piano
t18:
		;F# 	369.99 	3224
		cmp     al,byte 'j'
		je      j9
		jne     t19
j9:
		mov     bx,3224
		call    piano
t19:
		;G 	391.00 	3043
		cmp     al,byte 'k'
		je       k999
		jne     t20
		
k999:
		mov     bx,3043
		call    piano
t20:
		;G# 	415.30 	2873
		cmp     al,byte 'l'
		je      l8
		jne     t21
l8:
		mov     bx,2873
		call    piano
t21:
		;A 	440.00 	2711
		cmp     al,byte ';'
		je      o3
		jne     t22
o3:
		mov     bx,2711
		call    piano
t22:
		;A# 	466.16 	2559
		cmp     al,byte 'z'
		je      z7
		jne     t23
z7:
		mov     bx,2559
		call    piano
t23:
		;B 	493.88 	2415
		cmp     al,byte 'x'
		je      x7
		jne     t24
x7:
		mov     bx,2415
		call    piano
t24:
		;C 	523.25 	2280
		cmp     al,byte 'c'
		je      cy8
		jne     t25
cy8:
		mov     bx,2280
		call    piano
t25:
		;C# 	554.37 	2152
		cmp     al,byte 'v'
		je      v6
		jne     t26
v6:
		mov     bx,2152
		call    piano
t26:
		;D 	587.33 	2031
		cmp     al,byte 'b'
		je      bu7
		jne     t27
bu7:
		mov     bx,2031
		call    piano
t27:
		;D# 	622.25 	1917
		cmp     al,byte 'n'
		je      yt6
		jne     t28
yt6:
		mov     bx,1917
		call    piano
t28:
		;E 	659.26 	1809
		cmp     al,byte 'm'
		je      mi8
		jne     t29
mi8:
		mov     bx,1809
		call    piano
t29:
		;F 	698.46 	1715
		cmp     al,byte ','
		je      er9
		jne     t30
er9:
		mov     bx,1715
		call    piano
t30:
		;F# 	739.99 	1612
		cmp     al,byte '.'
		je      gt9
		jne     t31
gt9:
		mov     bx,1612
		call    piano
t31:
		;G 	783.99 	1521
		cmp     al,byte '/'
		je      wer1
		jne     t32
wer1:
		mov     bx,1521
		call    piano
t32:
		;G# 	830.61 	1436
		;A 	880.00 	1355
		;A# 	923.33 	1292
		;B 	987.77 	1207
		;C 	1046.50 	1140


		cmp     al,Move_up
		je     .upc

		cmp     al,Move_down
		je     .downc

		cmp    al,Move_left
		je     .leftc

		cmp    al,Move_right
		je     .rightc

		cmp    al,Enter_btn
		je     putc_this_btn

		jmp    .cont1     ; if not cursor jump for display char else jump for change cursor

.upc:
	mov		 cl, byte [__y]
	cmp    cl, byte 0
	jne		 .contupc
	mov		 [__y], byte 4
.contupc:
	dec		 byte [__y]
	call   sm
	call   in_put_this_btn
	cmp    byte[_CY],0
	je     .inup
	dec    byte [_CY]
	mov    bl,byte [_CY]
	mov    bh,byte [_CX]
	call   mc
.inup:
	jmp    key_down_loop
.downc:
	mov		 cl, byte [__y]
	cmp		 cl, byte 3
	jne    .contdownc
	mov		 [__y], byte -1
.contdownc:
	inc		 byte [__y]
	; call sm to rebuild the screen
	call   sm
	call   in_put_this_btn
	cmp    byte[_CY],80
	je     .inup
	inc    byte [_CY]
	mov    bl,byte [_CY]
	mov    bh,byte [_CX]
	call   mc
.indown:
	jmp    key_down_loop
.leftc:
	mov    cl, byte [__x]
	cmp		 cl, byte 0
	jne		 .contleftc
	mov		 [__x], byte 6
.contleftc:
	dec		 byte [__x]
	call   sm
	call   in_put_this_btn
	cmp    byte[_CX],0
	je     .inup
	dec    byte [_CX]
	mov    bh,[_CX]
	mov    bl,byte [_CY]
	call   mc
.inleft:
	jmp    key_down_loop
.rightc:
	mov		 cl, byte [__x]
	cmp		 cl, byte 5
	jne    .contrightc
	mov    [__x], byte -1

.contrightc:
	inc 	 byte [__x]
	call   sm
	call   in_put_this_btn
	cmp    byte[_CX],25
	je     .inup
	inc    byte [_CX]
	mov    bh,[_CX]
	mov    bl,byte [_CY]
	call   mc
.inright:
	jmp    key_down_loop
.cont1:
	cmp		 al, 08H
	jne 	 .cont
	;one   backspace
	;call   what_pressed
	mov    bl, al
	mov    bh,15
	call   putc
	; one  space
	mov    bl, byte ' '
	mov    bh,15
	call   putc

.cont:
	cmp    AL,0 ; ASCII code of 0 => uninterested key
	je     key_down_loop
	cmp    AL,ESC_KEY ; ESC key---terminate program

	cmp    al,'0'
	je     putc_this_btn
	cmp    al,'1'
	je     putc_this_btn
	cmp    al,'2'
	je     putc_this_btn
	cmp    al,'3'
	je     putc_this_btn
	cmp    al,'4'
	je     putc_this_btn
	cmp    al,'5'
	je     putc_this_btn
	cmp    al,'6'
	je     putc_this_btn
	cmp    al,'7'
	je     putc_this_btn
	cmp    al,'8'
	je     putc_this_btn
	cmp    al,'9'
	je     putc_this_btn
	jmp    key_down_loop

putc_this_btn:
	mov		 [sm_flag], byte 0
	jmp    in_dirty_in

in_put_this_btn:
	mov    [sm_flag],byte 1

in_dirty_in:
	call   what_pressed
	jmp    key_down_loop


display_ch:
	mov    bl, al
	mov    bh,15
	call   putc

key_down_loop:
	mov    [_CurY],byte 0
	mov    [_CurX],byte 0
	mov    [sm_flag],byte 1
	in     AL,KB_DATA ; read keyboard status & scan code Chapter 15 Real-Mode Interrupts
	test   AL,80H ; PA7 = 1?
	jz     key_down_loop ; if not, loop back
	jmp    getc
