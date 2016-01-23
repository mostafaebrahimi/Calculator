;------------------------------;
;  mov  string address to esi  ;
;  call printstr               ;
;------------------------------;

printstr:
	cmp  byte[esi],0
	je   endOfPro
	mov  bl,byte [esi]
	inc  esi
	cmp  bl,' '
	je   chcolor1
	cmp  bl,'-'
	je   chcolor2
	jmp  chcolor3

	chcolor1:
		mov  bh,00000000b
		jmp  continue

	chcolor2:
		mov bh,15
		jmp continue

	chcolor3:
		mov bh,byte [charcolor]

	continue:
		call putc
		jmp  printstr


endOfPro:
	ret
