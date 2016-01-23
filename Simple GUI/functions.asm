add_:;ok
add edx,ebx
mov [temp],edx
ret

sub_:;ok
sub ebx, edx
mov [temp],ebx
ret

mul_:;ok
pusha
mov eax,edx
mul ebx
mov [temp],eax
popa
ret

div_:;ok
	mov eax,ebx
	mov bx,dx
	xor dx,dx
	div bx
	;mov word[temp],ax
	cwde
	mov	[temp], eax
ret

pow_:;ok
pusha
mov eax,1
mov ecx,edx
pow__:
mul ebx
dec ecx
cmp ecx,0
jne pow__
mov [temp],eax
popa
ret

;log_:;ok
;mov dword[func_counter],0
;pusha
;mov [num2],ebx;num2 = 8
;mov [num1],edx;num1 =2
;loop1:
;mov		bl, 'l'
;mov		bh, 13
;call	putc

;mov ebx,dword [num1]
;mov edx,dword[func_counter]
;call pow_
;inc dword[func_counter]
;mov eax,[num2]
;cmp dword [temp],eax
;jna loop1
;dec dword [func_counter]
;dec dword [func_counter]
;mov eax,dword [func_counter]
;mov [temp],eax
;popa
;ret


log_:
    pusha
		mov		[counter], dword 0

    mov eax,0

    mov ecx,edx;cx<--2
    mov eax,edx ;ax <---2
    mov edx,0
    logLoop:
      mul ecx ; result is in ax


      cmp eax,ebx
      ja  finishlog
      inc dword [counter]
      jmp logLoop

    finishlog:
    mov eax,dword[counter]
    inc eax
    mov [temp],eax
    popa
  ret




mode_:;ok
	mov eax,ebx
	mov bx,dx
	xor edx,edx
	div bx
	;mov	word[temp], dx
	mov	ax, dx
	cwde
	mov [temp],eax
ret

random_:;ok
;mov ebx,dword[mod__]
mov eax,dword[rand2]
mov ecx,5
mul ecx
mov ecx,8
add eax,ecx
mov ebx,eax
mov eax,dword[rand1]
div ebx
mov dword[temp],edx
mov dword[rand2],edx
add [rand1],dword 5

;pusha
;mov bl,'a'
;mov bh,13
;call putc
;mov eax,dword [temp]
;mul dword[alfa]
;add eax,dword[beta]
;mov edx,eax
;mov eax,dword [mod__]
;call mode_
;popa
ret

factorial:;ok
mov eax,1
loop8:
mul ebx
dec ebx
cmp ebx,0
jne loop8
mov dword[temp],eax
ret


fibo:;ok
pusha
mov eax,0
mov ecx,1
fibo__:
mov dword[temp1],ecx
add ecx,eax
mov eax,dword[temp1]
dec ebx
cmp ebx,0
jne fibo__
mov eax,dword[temp1]
mov dword[temp],eax
popa
ret


convert_base:
	pusha
	mov	[counter], dword 0
	mov esi,mytempStr
	mov ecx,edx ;ecx <--2
	mov eax,ebx ;ebx <--11
	convertLoop1:
		mov edx,dWord 0

		div ecx;eax <--Q and edx <--R
		cmp eax,ecx
		mov [esi],edx ;store the R in mytempStr in sequence
		inc dword [counter]
		jb finishaa

		add esi,4
		jmp convertLoop1
	finishaa:
	add esi,4
	inc dword [counter]
	mov [esi],eax

	mov ebx,10
	;mov eax,[esi]
	mov eax,0
	mov edx,0
	convToInta:

		add eax,[esi]
		mov edx,0
		sub esi,4
		dec dword [counter]
		cmp dword [counter],0
		je finish22
		mul ebx
		jmp convToInta
		finish22:
		mov [temp],eax
		popa
ret
