bits 32

%define		VIDMEM	0xB8000			; video memory
%define		COLS	80			; width and height of screen
%define		LINES	25
%define		CHAR_ATTRIB 14			; character attribute (White text on black background)

_CurX db 0					; current x/y location
_CurY db 0

;**************************************************;
;	Putch32 ()
;		- Prints a character to screen
;	BL => Character to print
;**************************************************;

putc:
	pusha				; save registers
	mov	edi, VIDMEM		; get pointer to video memory

  ;-------------------------------;
	;   Get current position       	;
	;-------------------------------;

	xor	eax, eax		; clear eax

		;--------------------------------
		; Remember: currentPos = x + y * COLS! x and y are in _CurX and _CurY.
		; Because there are two bytes per character, COLS=number of characters in a line.
		; We have to multiply this by 2 to get number of bytes per line. This is the screen width,
		; so multiply screen with * _CurY to get current line
		;--------------------------------

		mov	ecx, COLS*2		; Mode 7 has 2 bytes per char, so its COLS*2 bytes per line
		mov	al, byte [_CurY]	; get y pos
		mul	ecx			; multiply y*COLS
		push	eax			; save eax--the multiplication

    ;--------------------------------
		; Now y * screen width is in eax. Now, just add _CurX. But, again remember that _CurX is relative
		; to the current character count, not byte count. Because there are two bytes per character, we
		; have to multiply _CurX by 2 first, then add it to our screen width * y.
		;--------------------------------

		mov	al, byte [_CurX]	; multiply _CurX by 2 because it is 2 bytes per char
		mov	cl, 2
		mul	cl
		pop	ecx			; pop y*COLS result
		add	eax, ecx


    ;-------------------------------
		; Now eax contains the offset address to draw the character at, so just add it to the base address
		; of video memory (Stored in edi)
		;-------------------------------

		xor	ecx, ecx
		add	edi, eax		; add it to the base address

  ;-------------------------------;
	;   Watch for new line          ;
	;-------------------------------;

	cmp	bl, 0x0A		; is it a newline character?
	je	.Row			; yep--go to next row

	;-------------------------------;
	;   Print a character           ;
	;-------------------------------;
; if its Enter
	cmp bl, 0dh
	jne .notEnter
	jmp .Row
.notEnter:
; if its backspce
	cmp bl, 08h
	jne .notBackspace
	cmp byte [_CurX], 0
	jne .notBL
; if its backspace and at the first position of line
	cmp byte [_CurY],0
	jne .cont
	jmp .done
	
.cont:
	dec byte [_CurY]
	mov	byte [_CurX], COLS
	jmp	.done
.notBL:
; if its backsapce but its not in the first position
	dec byte [_CurX]
	jmp .done
.notBackspace:
	;cmp
	mov	dl, bl			; Get character
	mov	dh, bh		; the character attribute
	mov	word [edi], dx		; write to video display

	;-------------------------------;
	;   Update next position        ;
	;-------------------------------;

	inc	byte [_CurX]		; go to next character
	cmp	byte [_CurX], COLS		; are we at the end of the line?
	je	.Row			; yep-go to next row
	jmp	.done			; nope, bail out

    ;-------------------------------;
	;   Go to next row              ;
	;-------------------------------;

.Row:
	mov	byte [_CurX], 0		; go back to col 0
	inc	byte [_CurY]		; go to next row

	;-------------------------------;
	;   Restore registers & return  ;
	;-------------------------------;

.done:
	popa				; restore registers and return
	ret
