sum:
  mov rax, SYS_WRITE
  mov rdi, STD_OUT
  mov rsi, ask_first_value
  mov rdx, ask_first_value_len
  syscall

  mov rax, SYS_READ
  mov rdi, STD_IN
  mov rsi, first_value
  mov rdx, 8
  syscall

  cmp byte [first_value + 1], 0xa  ; is 2nd char '\n' (if yes done, jump start)
  je sum
  ret

subt:
  ret

mult:
  ret

divs:
  ret
