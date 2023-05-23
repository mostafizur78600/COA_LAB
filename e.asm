.model small
.stack 64
.data
  str1 db 10, 13, "Enter A : ", '$'
  str2 db 10, 13, "Enter B : ", '$'
  str3 db 10, 13, "Enter C : ", '$'
  str4 db 10, 13, "Less", '$'
  str5 db 10, 13, '$'
.code
  start:
        mov ax,@data
        mov ds,ax
        lea dx,str1
        mov ah, 09h
        int 21h
        mov ah, 01h
        int 21h
        sub al,48
        mov bl,al
        lea dx, str2
        mov ah, 09h
        int 21h
        mov ah, 01h
        int 21h
        sub al,48
        mov bh,al
        lea dx,str3
        mov ah, 09h
        int 21h
        mov ah, 01h
        int 21h
        sub al,48
        mov cl,al
        cmp bl,bh
        jg  rem
        lea dx,str4
        mov ah, 09h
        int 21h
        jmp en
  rem:  
        lea dx,str5
        mov ah, 09h
        int 21h
        add bh,cl
        mov al,bh
        mov ah,0
        div bl
        add ah,48
        mov dl,ah
        mov ah,02h
        int 21h
  en:   
        mov ax,4c00h
        int 21h
  end start