/**
 * asmで使えるsystem callが /usr/include/asm/unistd.h に定義されているので
 * 中身を覗いてみたら
 * 

  #define __X32_SYSCALL_BIT       0x40000000

  # ifdef __i386__
  #  include <asm/unistd_32.h>
  # elif defined(__ILP32__)
  #  include <asm/unistd_x32.h>
  # else
  #  include <asm/unistd_64.h>
  # endif

 * と書いてあったので, cpuが64bitだとは知りつつ, どのマクロが有効で何がincludeされているかを調べた。
 * 結果はやっぱり、asm/unistd_64.hがincludeされる模様。
 * 
 * _ILP32_はめちゃくちゃレアらしいのでまあないだろうと無視。
 */

#include <stdio.h>
#include <asm/unistd.h>

int main() {
#ifdef __i386__
  printf("ok\n");
#else
  printf("ng\n");
#endif

#ifdef _ASM_X86_UNISTD_64_H
  printf("ok\n");
#else
  printf("ng\n");
#endif
}