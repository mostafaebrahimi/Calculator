ESC_KEY      EQU   1BH   ; ASCII code for ESC key
KB_DATA      EQU   60H   ; 8255 port PA
Move_up      EQU   11H   ; key
Move_down    EQU   13H   ; key
Move_right   EQU   12H   ; key
Move_left    EQU   14H   ; key
Enter_btn    EQU   0DH   ; key

section .data

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
		; Loops until a key is pressed i.e., until PA7 = 0.
		; PA7 = 1 if a key is up.
		in      AL,KB_DATA ; read keyboard status & scan code
		test    AL,80H ; PA7 = 0?
		jnz     getc ; if not, loop back

		and     AL,7FH ; isolate the scan code
		mov     si,table
		dec     AL ; index is one less than scan code
		cbw
		add	  	si, ax
		mov	  	al, byte [si]


		cmp     al,Move_up
		je     .upc

		cmp     al,Move_down
		je     .downc

		cmp    al,Move_left
		je     .leftc

		cmp    al,Move_right
		je     .rightc
		;when enter pressed check the current button
		cmp    al,Enter_btn
		je     putc_this_btn

		jmp    .cont1     ; if not cursor jump for display char else jump for change cursor
		;change the cursor to the top
	.upc:

		mov		 cl, byte [__y]
		cmp    cl, byte 0
		jne		 .contupc
		mov		 [__y], byte 4
	.contupc:
		dec		 byte [__y]

		; call sm to rebuild the screen
		call   sm
		mov	byte [_CurY], 0
		mov	byte [_CurX], 0
		call   in_put_this_btn

		;call   print_arr_set_si

		cmp    byte[_CY],0
		je     .inup
		dec    byte [_CY]
		mov    bl,byte [_CY]
		mov    bh,byte [_CX]
		call   mc

	.inup:
		jmp    key_down_loop

	;change the cursor to the down
	.downc:

		mov		 cl, byte [__y]
		cmp		 cl, byte 3
		jne    .contdownc
		mov		 [__y], byte -1
	.contdownc:
		inc		 byte [__y]

		; call sm to rebuild the screen
		call   sm
		mov	byte [_CurY], 0
		mov	byte [_CurX], 0
		call   in_put_this_btn


		;call   print_arr_set_si

		cmp    byte[_CY],80
		je     .inup
		inc    byte [_CY]
		mov    bl,byte [_CY]
		mov    bh,byte [_CX]
		call   mc
	.indown:
		jmp    key_down_loop

	;change the cursor to the left
	.leftc:
		mov    cl, byte [__x]
		cmp		 cl, byte 0
		jne		 .contleftc
		mov		 [__x], byte 6
	.contleftc:
		dec		 byte [__x]
	; call sm to rebuild the screen
		call   sm
		mov	byte [_CurY], 0
		mov	byte [_CurX], 0

		call   in_put_this_btn

		;call   print_arr_set_si

		cmp    byte[_CX],0
		je     .inup
		dec    byte [_CX]
		mov    bh,[_CX]
		mov    bl,byte [_CY]
		call   mc
	.inleft:
		jmp    key_down_loop
	;change the cursor to the right
	.rightc:
		mov		 cl, byte [__x]
		cmp		 cl, byte 5
		jne    .contrightc
		mov    [__x], byte -1
	.contrightc:
		inc 	 byte [__x]
	; call sm to rebuild the screen
		call   sm
		mov	byte [_CurY], 0
		mov	byte [_CurX], 0

		call   in_put_this_btn

		;call   print_arr_set_si

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

	putc_this_btn:
		mov		 [sm_flag], byte 0
	in_put_this_btn:
		call   what_pressed
		;call   print_arr_set_si
		;mov    [_CurY],byte 0
		;mov    [_CurY],byte 0
		;call   print_arr_set_si
		jmp    key_down_loop


  display_ch:
		mov    bl, al
		mov    bh,15
		call   putc

	key_down_loop:
		mov    [_CurY],byte 0
		mov    [_CurX],byte 0
		;mov    bl,byte [_CurY]
		;mov    bh,byte [_CurX]
		;call   mc
;		call   print_arr_set_si
		mov    [sm_flag],byte 1
		;call   what_pressed
		in     AL,KB_DATA ; read keyboard status & scan code Chapter 15 Real-Mode Interrupts
		test   AL,80H ; PA7 = 1?
		jz     key_down_loop ; if not, loop back
		; clear keyboard buffer
		jmp    getc
