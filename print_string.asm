; RSI -> should contain the string.
; RDX -> string length
print_string:
  push rax
  push rdi

  mov rax, 1          ; System call for write
  mov rdi, 1          ; File descriptor 1 (stdout)
  syscall

  pop rax
  pop rdi
  ret

