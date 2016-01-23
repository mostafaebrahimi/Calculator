;**************************************************;
;	MoveCur ()
;		- Update hardware cursor
;	parm/ bh = Y pos
;	parm/ bl = x pos
;**************************************************;

bits 32

mc:

	pusha				; save registers (aren't you getting tired of this comment?)

	;-------------------------------;
	;   Get current position        ;
	;-------------------------------;

	; Here, _CurX and _CurY are relitave to the current position on screen, not in memory.
	; That is, we don't need to worry about the byte alignment we do when displaying characters,
	; so just follow the forumla: location = _CurX + _CurY * COLS

	xor	eax, eax
	mov	ecx, COLS
	mov	al, bl			; get y pos
	mul	ecx			; multiply y*COLS
	add	al, bh			; Now add x
	mov	ebx, eax

	;--------------------------------------;
	;   Set low byte index to VGA register ;
	;--------------------------------------;

	mov	al, 0x0f		; Cursor location low byte index
	mov	dx, 0x03D4		; Write it to the CRT index register
	out	dx, al

	mov	al, bl			; The current location is in EBX. BL contains the low byte, BH high byte
	mov	dx, 0x03D5		; Write it to the data register
	out	dx, al			; low byte

	;---------------------------------------;
	;   Set high byte index to VGA register ;
	;---------------------------------------;

	xor	eax, eax

	mov	al, 0x0e		; Cursor location high byte index
	mov	dx, 0x03D4		; Write to the CRT index register
	out	dx, al

	mov	al, bh			; the current location is in EBX. BL contains low byte, BH high byte
	mov	dx, 0x03D5		; Write it to the data register
	out	dx, al			; high byte

	popa
	ret
