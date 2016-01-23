to_int:
mov esi,arr_num_1
mov dword[natije],0
loop30:
mov ebx,dword [natije]
mov eax,10
;xor edx,edx
mul ebx
xor edx,edx
mov dl,byte[esi]
add eax,edx
mov dword[natije],eax
dec byte [counter_arr]
inc esi
cmp byte [counter_arr],0
jne loop30
mov byte[counter_arr],0
call clean
mov eax,dword[natije]
ret

clean:
cld
mov al,0
mov ecx,30
mov edi,arr_num_1
rep stosb
ret

res_to_resb:

;mov byte[ans],5
mov byte[counter_arr],0
call clean
mov edi,arr_num_1
mov esi ,ans_
loop38:
mov al,[esi]
mov ah,al
sub al,48
mov [edi],al
inc esi
inc edi
inc byte [counter_arr]
cmp ah,0
jne loop38

;call  clean
;mov esi,ans_
;cmp byte [esi],'-'
;jne next6

;inc esi

;next6:
;mov dl,byte[esi]
;sub dl,48
;mov [esi],dl
;inc esi
;cmp dl,-48
;jne next6
;mov esi,ans_
;mov edi,arr_num_1
;mov cx,20
;rep movsb
;mov  al, [esi]
;mov  [edi], al
ret
