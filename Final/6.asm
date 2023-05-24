.model small
.stack 64
.data
    a dw 526FH
.code
Start:
    mov ax,@data
    mov ds, ax

    mov bl,0
    mov ax,a
    mov cx,16
back: 
    rcr ax,1
    jnc l1
    inc bl

l1:
    dec cx
    jnz back

    add bl,48
    mov dl,bl
    mov ah,02
    int 21h

    mov ax,4c00h
    int 21h
end start