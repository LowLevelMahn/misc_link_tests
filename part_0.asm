.286
.model tiny

seg000 segment byte public 'CODE'

assume cs:seg000
org 100h
assume es:nothing, ss:nothing, ds:seg000

extern asm2_proc:near
extern C asm2_hello:byte

start proc near
  jmp asm2_proc
start endp

public C asm0_hello
asm0_hello db 'hello asm0',13,10,'$',0

seg000 ends

end start
  