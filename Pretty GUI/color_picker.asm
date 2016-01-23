color_picker:
    mov [charcolor], byte 00111111b

; compare if selected btn is in first row
.cmp_row:
    mov   cl, byte [c_y]
    cmp   cl, [__y]
    jne   .done
.cmp_col:
    mov   cl, byte [c_x]
    cmp   cl, [__x]
    jne   .done
.thats_it:
    mov [charcolor], byte 01010000b
    mov cl,byte [cur_btn]
    mov [select_btn],byte cl

.done:
ret
