.model small
.stack 64
.data
    num dw 0AAAAh
    num1 db ?
    num2 db ?
    count db 0
    str1 db 10,13,"greater",'$'
    str2 db 10,13,"not greater",'$'
.code
start:
    mov ax,@data
    mov ds,ax
    MOV ax,num
l1:
    rcr ax,1
    inc count
    cmp count,5
    je fifth
    cmp count,6
    je sixth
    cmp count,7
    je en
    jmp l1

fifth:
    jc one
    mov num1,0
    jmp l1
one:
    mov num1,1
    jmp l1
sixth:
    jc onenext
    mov num2,0
    jmp l1
onenext:
    mov num2,1
    jmp l1
en: 
    mov bh,num1
    mov bl,num2
    cmp bh,bl
    add bh,48
    add bl,48
    mov dl,bh
    mov ah,02h
    int 21h
    
    mov dl,bl
    mov ah,02h
    int 21h

    jg greater
    lea dx,str1
    mov ah,09h
    int 21h
    jmp en1
greater:
    lea dx,str2
    mov ah,09h
    int 21h
en1:
mov ax,4c00h
int 21h
end start