print_arr_set_si:
  call   double_line
  call   double_line
  mov    esi,spacer
  call   printstr
  mov    esi,display
  call   printstr
  mov    esi,arr_num_1
  mov    [temp_counter],byte 0
  jmp    print_arr

print_arr:
  mov    al,[temp_counter]
  cmp    al,[counter_arr]
  je     return
  mov    bh,00111111b
  mov    bl,byte [esi]
  add    bl,byte 48
  call   putc
  inc    byte [temp_counter]
  inc    esi
  jmp    print_arr

return:
  ret
