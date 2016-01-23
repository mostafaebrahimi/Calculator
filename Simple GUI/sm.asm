double_line:
	mov  bl, 0Dh
	call putc
	mov	 bl, 0Dh
	call putc
ret

double_space:
	mov 		esi, dspace
	call		printstr
ret

sm:
		call ClrScr32
		;mov [_CurY], byte 1
		mov 	bh, 00111111b
		call   double_line
		call   double_line

;btn00 = 1
		mov		esi, btn00
		mov		[c_y], byte 0
		mov		[c_x], byte 0
		mov   [cur_btn],byte 1
		call  color_picker
		call	printstr
		call  double_space

;btn01 = 2
		mov		esi, btn01
		mov		[c_y], byte 0
		mov		[c_x], byte 1
		mov   [cur_btn],byte 2
		call  color_picker
		call	printstr
		call  double_space

;btn02 = 3
		mov		esi, btn02
		mov		[c_y], byte 0
		mov		[c_x], byte 2
		mov   [cur_btn],byte 3
		call  color_picker
		call	printstr
		call  double_space

;btn03 =  res
		mov		esi, btn03
		mov		[c_y], byte 0
		mov		[c_x], byte 3
		mov   [cur_btn],byte 10
		call  color_picker
		call	printstr
		call  double_space

;btn04 = mns
		mov		esi, btn04
		mov		[c_y], byte 0
		mov		[c_x], byte 4
		mov   [cur_btn],byte 11
		call  color_picker
		call	printstr
		call  double_space

;btn05 = add
		mov		esi, btn05
		mov		[c_y], byte 0
		mov		[c_x], byte 5
		mov   [cur_btn],byte 12
		call  color_picker
		call	printstr
		call  double_space

;newline
		call 	double_line

;btn10 = 4
		mov		esi, btn10
		mov		[c_y], byte 1
		mov		[c_x], byte 0
		mov   [cur_btn],byte 4
		call  color_picker
		call	printstr
		call  double_space

;btn11 = 5
		mov		esi, btn11
		mov		[c_y], byte 1
		mov		[c_x], byte 1
		mov   [cur_btn],byte 5
		call  color_picker
		call	printstr
		call  double_space

;btn12 = 6
		mov		esi, btn12
		mov		[c_y], byte 1
		mov		[c_x], byte 2
		mov   [cur_btn],byte 6
		call  color_picker
		call	printstr
		call  double_space

;btn13 = ans
		mov		esi, btn13
		mov		[c_y], byte 1
		mov		[c_x], byte 3
		mov   [cur_btn],byte 13
		call  color_picker
		call	printstr
		call  double_space

;btn14 = fib
		mov		esi, btn14
		mov		[c_y], byte 1
		mov		[c_x], byte 4
		mov   [cur_btn], byte 14
		call  color_picker
		call	printstr
		call  double_space

;btn15 = fac
		mov		esi, btn15
		mov		[c_y], byte 1
		mov		[c_x], byte 5
		mov   [cur_btn],byte 15
		call  color_picker
		call	printstr
		call  double_space

;call newline
		call double_line

;btn20 = 7
		mov		esi, btn20
		mov		[c_y], byte 2
		mov		[c_x], byte 0
		mov   [cur_btn],byte 7
		call  color_picker
		call	printstr
		call  double_space

;btn21 = 8
		mov		esi, btn21
		mov		[c_y], byte 2
		mov		[c_x], byte 1
		mov   [cur_btn],byte 8
		call  color_picker
		call	printstr
		call  double_space

;btn22 = 9
		mov		esi, btn22
		mov		[c_y], byte 2
		mov		[c_x], byte 2
		mov   [cur_btn],byte 9
		call  color_picker
		call	printstr
		call  double_space

;btn23 = ran
		mov		esi, btn23
		mov		[c_y], byte 2
		mov		[c_x], byte 3
		mov   [cur_btn],byte 16
		call  color_picker
		call	printstr
		call  double_space

;btn24 = log
		mov		esi, btn24
		mov		[c_y], byte 2
		mov		[c_x], byte 4
		mov   [cur_btn],byte 17
		call  color_picker
		call	printstr
		call  double_space

;btn25 = pow
		mov		esi, btn25
		mov		[c_y], byte 2
		mov		[c_x], byte 5
		mov   [cur_btn],byte 18
		call  color_picker
		call	printstr
		call  double_space

;call new_line
		call 	double_line

;btn30 = !
		mov		esi, btn30
		mov		[c_y], byte 3
		mov		[c_x], byte 0
		mov   [cur_btn],byte 19
		call  color_picker
		call	printstr
		call  double_space

;btn31 = 0
		mov		esi, btn31
		mov		[c_y], byte 3
		mov		[c_x], byte 1
		mov   [cur_btn],byte 0
		call  color_picker
		call	printstr
		call  double_space

;btn32 = C
		mov		esi, btn32
		mov		[c_y], byte 3
		mov		[c_x], byte 2
		mov   [cur_btn],byte 21
		call  color_picker
		call	printstr
		call  double_space

;btn33 = div
		mov		esi, btn33
		mov		[c_y], byte 3
		mov		[c_x], byte 3
		mov   [cur_btn],byte 22
		call  color_picker
		call	printstr
		call  double_space

;btn34 = mul
		mov		esi, btn34
		mov		[c_y], byte 3
		mov		[c_x], byte 4
		mov   [cur_btn],byte 23
		call  color_picker
		call	printstr
		call  double_space

;btn35 = cvb
		mov		esi, btn35
		mov		[c_y], byte 3
		mov		[c_x], byte 5
		mov   [cur_btn],byte 24
		call  color_picker
		call	printstr
		call  double_space

		;warn : a temp for last curc must be made
		;reset [_CurY] and [_CurX]
		mov   byte [_CurY],0
		mov   byte [_CurX],0
		;mov   [_CY], byte 0
		;mov   [_CX], byte 0
		mov    [sm_flag], byte 1
		;call   what_pressed
ret
