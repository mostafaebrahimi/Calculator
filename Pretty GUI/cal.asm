bits 32

section .text


add_:
	pusha
	add  eax,ebx

	ret

sub_:
	pop eax
	pop ebx
	sub eax,ebx
	ret

mul_:
	pop eax
	pop ebx
	mul ebx
	ret

div_:
	pop eax
	pop ebx
	div ebx
	ret

pow_:
	pop eax
	pop ebx

loop1:
	mul eax
	dec ebx
	cmp ebx,0
	ret
	popa
log_:
	mov dword[counter],0h
	mov dword [ans],0h
	pop eax
	pop ebx
	mov edx,eax
loop2:
	push ebx
	push dword[counter]
	add dword[ans],eax
	inc dword[counter]

	cmp dword[ans],edx
	jna loop2
	mov eax,counter
	ret

mod_:
	pop eax
	pop ebx
	mul ebx
	mov eax,edx
	ret


random_:
	pusha
	mov eax,rand1
	mul dword[alfa]
	add eax,beta
	push eax
	push mod__
	call mod_

	inc dword[alfa]
	inc dword[beta]
	inc dword[mod__]
	popa
	ret


conver_base:
	pusha
	mov dword[ans],0
	mov dword[temp1],0
	mov dword[temp2],0
	mov dword[counter],0

loop4:
	mov edx,10
	div edx
	mov dword[temp1],eax
	mov eax,edx
	mov ebx,counter
	call pow_
	add dword[ans],eax
	inc dword[counter]
	cmp dword[temp1],0
	jne loop4
	mov eax,ans
	popa
	ret



fibo:
	pusha

	mov dword[counter],0
	mov ebx,eax
	loop5:
	mov eax, num2
	mov dword[temp1],eax
	mov ebx,num2
	add ebx,num1
	mov dword[num1],eax
	mov eax,ebx
	inc dword[counter]
	cmp dword[counter],ebx
	;print eax
	jne loop5
	popa
	ret

section .data
	counter dd 0
	ans dd 0
	rand1 dd 0
	rand2 dd 0
	beta dd 8
	alfa dd 5
	mod__ dd 7
	temp1 dd 0
	temp2 dd 0
	num1 dd 0h
	num2 dd 0
