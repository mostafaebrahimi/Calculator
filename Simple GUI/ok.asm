what_pressed:
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
  jmp    return

;;until proc work correctly
print_btn:
  mov    esi, arr_num_1
  ;add    esi, arr_num1_counter
  ;jmp    add_to_num


;;come in the this proc
;/*add_to_num:
;  ;cmp    [esi],byte 0
;  ;jmp    setnum1
;  mov    bl,'a'
;  mov    bh,13
;  call   putc
;  add    counter_arr,byte 1
;  jmp    add_to_num*/

setnum:
    add    esi,[counter_arr]
    mov    bl,'U'
    mov    bh,13
    call   putc
    mov    al,[select_btn]
    mov    [esi],al
    ;add    [esi],byte 48
    inc    byte [counter_arr]
    jmp    continue_print_num


;;work correctly
continue_print_num:
  ;mov    bl,byte [select_btn]
  ;add    bl,48
  ;mov    bh,13
  ;call   putc
  jmp    print_arr_set_si

;;worked
print_arr_set_si:
  mov    esi,arr_num_1
  mov    [temp_counter],byte 0
  jmp    print_arr

print_arr:
  mov    al,[temp_counter]
  cmp    al,[counter_arr]
  je     return
  mov    bl,byte [esi]
  add    bl,byte 48
  call   putc
  inc    byte [temp_counter]
  inc    esi
  jmp    print_arr

return:
  ret
