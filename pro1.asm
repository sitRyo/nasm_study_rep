section .data
msg db 'test', 0xa
len equ $-msg

section .text
  global _start

_start:
  mov eax, 4 ; sys_write system_call は eax に入れる
  mov ebx, 1 ; file discriptor
  mov ecx, msg 
  mov edx, len
  int 0x80 ; system call を実行する。

  mov eax, 1 ; sys_exit
  int 0x80 ; プログラム終了。終了しないとセグフォ