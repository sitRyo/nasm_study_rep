; ユーザーから入力を受け付け、それをディスプレイに出力するasm プログラム

section .data
  userMsg db 'input number '
  lenUserMsg equ $-userMsg
  displayMsg db 'your input number is '
  displayLen equ $-displayMsg

section .bss ; 初期化なし
  num: resb 5; bssにnumという変数を5byte確保

section .text
  global _start

_start:
  ; userMsg表示
  mov eax, 4; sys_write
  mov ebx, 1; file discriptor
  mov ecx, userMsg; display msg
  mov edx, lenUserMsg; msg size
  int 0x80; メモリにアクセスするから遅いらしい？

  ; stdin
  mov eax, 3; sys_read
  mov ebx, 0; file discriptor stdin
  mov ecx, num ; stdin
  mov edx, 5
  int 0x80

  ; display dispMsg
  mov eax, 4
  mov ebx, 1
  mov ecx, displayMsg
  mov edx, displayLen
  int 0x80

  ; output
  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 5
  int 0x80

  ; exit
  mov eax, 1
  mov ebx, 0 ; 正常終了
  int 80h
