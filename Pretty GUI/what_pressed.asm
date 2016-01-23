what_pressed:
  cmp    [sm_flag], byte 1
  je      continue_print_num

  cmp    [select_btn],byte 0
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
  jmp    return

;;until proc work correctly
print_btn:
  mov    esi, arr_num_1

setnum:
    call   sound
    mov    esi,arr_num_1
    add    esi,[counter_arr]
    mov    al,[select_btn]
    mov    [esi],al
    inc    byte [counter_arr]
    continue_print_num:
      jmp    print_arr_set_si
    ret
