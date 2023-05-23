.model small
.stack 64
.data
    a    dw 2ADFH
    b    db 17 dup(?)
    str1 db 10,13,"greater",'$'
    str2 db 10,13,"not greater",'$'
.code
    Start:
          mov ax,@data
          mov ds, ax

          mov bl,0
          mov ax,a
          mov cx,16
          mov si,0
    back: 

          mov b[si],0
          rcr ax,1
          jnc l1
          mov b[si],1


    l1:   
          add si,1
          dec cx
          jnz back

          mov bl,b[4]
          mov bh,b[5]
          cmp bh,bl
          jg  gr

          lea dx,str1
          mov ah,09h
          int 21h
          jmp en

    gr:

        lea dx,str2
        mov ah,09h
        int 21h
    en:
        mov ax,4c00h
        int 21h
end start