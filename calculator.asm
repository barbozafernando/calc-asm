%define LF             0xA
%define CR             0xD
%define NULL           0x0
%define SYS_CALL       0x80
; EAX
%define SYS_EXIT       60
%define SYS_READ       0
%define SYS_WRITE      1
; EBX
%define STD_IN         0
%define STD_OUT        1
%define STD_ERR        2

section .data
  menu_msg             db "1) MULT 2) SUB 3) DIV 4) SUM 5) EXIT -> ", NULL
  menu_msg_len         equ $ - menu_msg
  ask_first_value      db "Enter the first value: ", LF, CR
  ask_first_value_len  equ $ - ask_first_value
  ask_second_value     db "Enter the second value: ", LF, CR
  ask_second_value_len equ $ - ask_second_value
  debug                db "DEBUG", NULL
  debug_len            equ $ - debug

section .bss
  first_value          resb 8
  second_value         resb 8
  selected_option      resb 1


section .text
  global _start

_start:
  mov rax, SYS_WRITE
  mov rdi, STD_OUT
  mov rsi, menu_msg
  mov rdx, menu_msg_len
  syscall

  mov rax, SYS_READ
  mov rdi, STD_IN
  mov rsi, selected_option
  mov rdx, 1
  syscall

  cmp byte [rsi], "5"
  je exit_program
  cmp byte [rsi], "4"
  je sum
  cmp byte [rsi], "3"
  je divs
  cmp byte [rsi], "2"
  je subt
  cmp byte [rsi], "1"
  je mult

  ; jmp _start

exit_program:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall


%include "print_string.asm"
%include "arithmetic.asm"