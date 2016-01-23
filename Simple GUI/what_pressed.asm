what_pressed:
  cmp    [sm_flag], byte 1
  je      continue_print_num
  cmp    [select_btn], byte 0
  je     print_btn
  cmp    [select_btn],byte 1
  je     print_btn
  cmp    [select_btn],byte 2
  je     print_btn
  cmp    [select_btn],byte 3
  je     print_btn
  cmp    [select_btn],byte 4
  je     print_btn
  cmp    [select_btn],byte 5
  je     print_btn
  cmp    [select_btn],byte 6
  je     print_btn
  cmp    [select_btn],byte 7
  je     print_btn
  cmp    [select_btn],byte 8
  je     print_btn
  cmp    [select_btn],byte 9
  je     print_btn
;;; if CE
  cmp     [select_btn], byte 21
  jne injja
  ;
  call clean
  mov byte[counter_arr],0
  ;call  sm
  mov   [op1], dword 0
  mov   [op2], dword 0
  mov   [ans_flag], byte 0
  call  sm
  jmp  return_pressed
;;;
injja:
  cmp    [select_btn], byte 13
  jne    .its_operator
  mov     [ans_flag], byte 1
  jmp     return_pressed
;;;
.its_operator:

  call to_int

  cmp byte [flag_oprand],0
  jne op2_
  mov byte[flag_oprand],1
  mov dword[op1],eax
  mov al, [select_btn]
  mov [operator], al

  cmp  [ans_flag], byte 1
  jne   return_pressed
  mov   bl, 'h'
  mov   bh, 13
  call  putc

  ;
  mov   eax, dword [answer]
  mov   dword [op1], eax
  ;
  jmp return_pressed
  ;mov bl, al
  ;sub bl, byte 10
  ;add bl, byte 48
  ;mov bh, 13
  ;call putc

  op2_:
  mov   dword[op2],eax
  mov   byte[flag_oprand], byte 0
  cmp   byte [select_btn], 10
  jne   return_pressed

  ;xor   eax, eax
  ;mov   al, byte [operator]
  ;mov   dword [temp], eax
  ;call  itoa
  ;mov   esi, ans_
  ;call  printstr

  call  calculate
  mov   eax, dword [temp]
  mov   dword [answer], eax
  jmp   continue_print_num;

;cmp byte [select_btn],13

  jmp    return_pressed

;;until proc work correctly
print_btn:
  mov    esi, arr_num_1

setnum:
    ;
    mov   [ans_flag], byte 0
    ;
    mov    esi,arr_num_1
    add    esi,[counter_arr]
    mov    al,[select_btn]
    mov    [esi],al
    inc    byte [counter_arr]
    ;mov    bl,byte [select_btn]
    ;mov    bh,13
    ;add    bl,48
    ;call   putc
    ;mov    bl,' '
    ;mov    bh,13
    ;call   putc

    continue_print_num:
      jmp    print_arr_set_si

    return_pressed:

    ret
