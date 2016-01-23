
itoa:
pusha
mov dword[counter],0
;mov eax,temp
mov esi,nums
mov eax,dword[temp]
mov dword[num3],eax
inc esi
cmp dword[temp],0

jna manfi
jmp next
manfi:
mov dword[sign],1
next:
mov eax,dword[num3]
mov bx,10
xor edx,edx
div bx
mov dword[num3],eax
add dl,48
mov [esi],dl
inc esi
inc dword[counter]
cmp dword[num3],0
jne next
mov esi,nums
add esi,dword[counter]
finish:
mov edi,ans_
cmp byte[sign],1
jne loop18
mov byte[edi],'-'
inc edi
loop18:
;jmp beyz
mov dl,byte[esi]
;mov dl,55
mov [edi],dl
inc edi
dec esi
dec dword[counter]
cmp dword[counter],0
jne loop18
beyz:
mov byte [edi], 0
popa
ret
