.model small
.stack 64
.data
    a    dw 10 dup(?)
    u_i  dw ?

.code
    start: 
           mov ax, @data
           mov ds, ax
    input: 
           mov bx, 10
           mov dx, 00
    l1:    
           mov ah, 01h
           int 21h
           cmp al, 13       ; Check if user pressed ENTER KEY
           je  exit
           mov ah, 0
           sub al, 48       ; ASCII to DECIMAL
           mov cx, ax
           mov ax, dx       ; Store the previous value in AL
           mul bx           ; multiply the previous value with 10
           add ax, cx       ; previous value + new value ( after previous value is multiplyed with 10 )
           mov dx, ax
           jmp l1
    exit:  
           mov u_i,dx
           mov ax,u_i
    print: 
           mov dx,0
           mov bx,10
           mov si,0
    
    i_take:
           DIV BX           ; Divide AX by BX
           ADD dx, '0'      ; Convert remainder to ASCII code
           mov a[si],dx
           add si,1
           mov dx,0
           CMP AX,0
           jnz i_take
           MOV cx,si
           sub si,1
    OUTPUT:
           mov ah,02h
           MOV dx,a[si]
           INT 21h
           sub SI,1
           dec cx
           cmp cx,0
           jnz OUTPUT


           MOV AX, 4C00H    ; Function to terminate program execution
           INT 21H

 end start