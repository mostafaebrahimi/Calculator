calculate:
check_add:
cmp byte[operator],12
jne check_sub
mov ebx,dword[op1]
mov edx,dword[op2]
call add_
call itoa
call res_to_resb
jmp  finish_

check_sub:
cmp byte[operator],11
jne check_mul
mov ebx,dword[op1]
mov edx,dword[op2]

call  sub_
call  itoa
call  res_to_resb
jmp   finish_


check_mul:
cmp byte[operator],23
jne check_div
mov ebx,dword[op1]
mov edx,dword[op2]
call mul_
call  itoa
call  res_to_resb
jmp   finish_

check_div:
cmp byte[operator],22
jne check_pow

mov   ebx,dword[op1]
mov   edx,dword[op2]

call  div_
call  itoa
call  res_to_resb
jmp   finish_

check_pow:
cmp byte[operator],18
jne check_log
mov ebx,dword[op1]
mov edx,dword[op2]
call pow_
call  itoa
call  res_to_resb
jmp   finish_

check_log:
cmp byte[operator],17
jne check_fact
mov ebx,dword[op1]
mov edx,dword[op2]
call log_
call  itoa
call  res_to_resb
jmp   finish_

;
check_fact:
cmp byte[operator],15
jne check_convert
mov ebx,dword[op2]
;mov edx,dword[op2]
call factorial
mov   eax, dword [temp]
mov   dword [answer], eax
call  itoa
call  res_to_resb
jmp   finish_

check_convert:
cmp byte[operator],24
jne check_rand
mov ebx,dword[op1]
mov edx,dword[op2]
call convert_base
call  itoa
call  res_to_resb
call  finish_

check_rand:
cmp byte[operator],16
jne check_fibo
call random_
call  itoa
call  res_to_resb
jmp   finish_

check_fibo:
cmp   byte[operator],14
jne   finish_
mov   ebx,dword[op2]
call  fibo
call  itoa
call  res_to_resb
jmp   finish_

finish_:
ret
