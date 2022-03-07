.286
.model tiny

seg000 segment byte public 'CODE'

extern C asm0_hello:byte
extern C asm1_proc:near

public asm2_proc
asm2_proc   proc near
    mov dx,offset asm0_hello
    mov ah,09h
    int 21h
    
    mov dx,offset asm2_hello
    mov ah,09h
    int 21h
    
    call asm1_proc
    
    mov ax, 4C00h
    int 21h
asm2_proc endp

public C asm2_hello
asm2_hello db 'hello asm2',13,10,'$',0

; should be the last data in the main.com
db 'nothing behind this string$',0

seg000    ends

end
