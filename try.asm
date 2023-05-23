.model small
.stack 64
.data
    a    db 2
    b    db 3
    str1 db 10,13, "Enter 1st number : ",'$'
    str2 db 10,13, "Enter 2nd number : ",'$'
    str3 db 10,13, "Sum is : ",'$'

.code
    start:
          mov ax,@data
          mov ds,ax

          mov ah,09h
          lea dx,str1
          int 21h

          mov ah,01h
          int 21h

        ;   add al,48

          mov bl,al

          mov ah,09h
          lea dx,str2
          int 21h

          mov ah,01h
          int 21h

        ;   add al,48

          mov cl,al

          add bl,cl
          
          sub bl,48

          mov ah,09h
          lea dx,str3
          int 21h

          mov dl,bl
          mov ah,02h
          int 21h

          mov ax,4c00h
          int 21h

end start