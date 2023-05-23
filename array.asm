.model small
.stack 64
.data
    str1 db 10,13, "  "
    a     db 6,2,9,4,5 ;or dw and add si,2 
    count db 5
    str2 db 10,13, "Array Element : ",'$'
.code
    start:
          mov ax,@data
          mov ds,ax

          lea si,a        ;load effective address
          mov ch,count
          lea dx, str2
          mov ah, 09h
          int 21h

    next: 

          mov bl,[si]
          add bl,48

          mov ah,02h
          mov dl,bl
          int 21h

          lea dx, str1
          mov ah, 02h
          int 21h

          add si,1 ;or (inc si)

          dec ch
          cmp ch,0
          jnz next ;or jne next

          mov ax,4c00h
          int 21h
end start