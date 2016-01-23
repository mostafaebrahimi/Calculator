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
  mov    bh, 13
  call   putc
  inc    byte [temp_counter]
  inc    esi
  jmp    print_arr

return:

  ;call clean
  ;mov byte[counter_arr],0

  ret
