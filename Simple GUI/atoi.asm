sign db 0
nums times 20 db 0
ans_ db '558',0

num3 dd 0
;temp dd 0
counter dd 1

atoi:;adad to temp va string to nums
pusha
mov dword[temp],0
mov esi,nums
loop21:
mov eax,10
xor edx,edx
mov ebx,dword[temp]
mul bx
mov dl,byte[esi]
sub dl,48
add eax,edx
;mov eax,temp
;mul ebx
mov dword[temp],eax
inc  esi
cmp byte[esi],0
jne loop21
mov dword[temp] ,eax
popa
ret
