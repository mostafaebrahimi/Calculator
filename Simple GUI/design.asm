
;charcolor  DB     00111111b
;line1      DB    "----------------------------------",0
;line2      DB 	  "----------------------------------",0
;line3      DB 	  "[res]  [mns]  [add]  [1]  [2]  [3]",0
;line4      DB     "[add]  [fib]  [fac]  [4]  [5]  [6]",0
;line5      DB 	  "[ran]  [l og]  [pow]  [7]  [8]  [9]",0
;line6      DB     "[div]  [mul]  [cvb]       [0]     ",0

;charcolor  DB     00111111b
;line1      DB     "----------------------------------",0
;line2      DB 	  "----------------------------------",0
;line3      DB 	  "[1]  [2]  [3]  [res]  [mns]  [add]",0
;line4      DB     "[4]  [5]  [6]  [add]  [fib]  [fac]",0
;line5      DB 	  "[7]  [8]  [9]  [ran]  [log]  [pow]",0
;line6      DB     "     [0]       [div]  [mul]  [cvb]",0

charcolor  DB     00111111b
natije dd 0
op1 dd 0
op2 dd 0
operator db 0
flag_oprand db 0
temp_counter  DB    0
counter_arr  DB     0
; ans flag
ans_flag    db    0
;arr_num1_counter     db 0
arr_num_2  TIMES  30 DB 0

;current button
cur_btn    DB      0
select_btn DB      0
c_x        DB      0
c_y        DB      0
sm_flag    db      0

dspace     DB      "  ", 0

btn00      DB      "[1]", 0
btn01      DB      "[2]", 0
btn02      DB      "[3]", 0
btn03      DB      "[res]", 0
btn04      DB      "[mns]", 0
btn05      DB      "[add]", 0
btn10      DB      "[4]", 0
btn11      DB      "[5]", 0
btn12      DB      "[6]", 0
btn13      DB      "[ans]", 0
btn14      DB      "[fib]", 0
btn15      DB      "[fac]", 0
btn20      DB      "[7]", 0
btn21      DB      "[8]", 0
btn22      DB      "[9]", 0
btn23      DB      "[ran]", 0
btn24      DB      "[log]", 0
btn25      DB      "[pow]", 0
btn30      DB      "[E]", 0
btn31      DB      "[0]", 0
btn32      DB       "[C]", 0
btn33      DB      "[div]", 0
btn34      DB      "[mul]", 0
btn35      DB      "[cvb]", 0
