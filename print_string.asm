; RSI -> should contain the string.
; RDX -> string length
print_string:
  mov rax, 1          ; System call for write
  mov rdi, 1          ; File descriptor 1 (stdout)
  syscall
  ret

