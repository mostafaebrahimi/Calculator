sound:
        mov     al,byte 182         ; Prepare the speaker for the
        out     43h, byte al         ;  note.
        mov     ax, word 8609        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, byte al         ; Output low byte.
        mov     al, byte ah          ; Output high byte.
        out     42h, byte al
        in      al, 60h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 10000011b   ; Set bits 1 and 0.
        out     61h,byte  al         ; Send new value.
        mov     bx, word 25          ; Pause for duration of note.
.pause1:
        mov     cx, word 65535
.pause2:
        dec     word cx
        jne     .pause2
        dec     word bx
        jne     .pause1
        in      al, byte 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, byte al         ; Send new value.
ret
