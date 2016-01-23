;**************************************************;
;	ClrScr32 ()
;		- Clears screen
;**************************************************;

bits 32

ClrScr32:

	pusha
	cld
	mov	edi, VIDMEM
	mov	cx, 2000
  mov	ah, CHAR_ATTRIB
	mov	al, ' '
	rep	stosw

	mov	byte [_CurX], 0
	mov	byte [_CurY], 0
	popa
	ret
