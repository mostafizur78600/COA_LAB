.model small
.stack 64
.data
    arr     db 10 dup(?)
    arr_num db ?
    arr_n   db ?
    str1    db 10,13, "Enter number of element in array : ",'$'
    str2    db 10,13, "Enter the number : ",'$'
    str3    db 10,13, '$'
    str4    db 10,13, "The reverse array is : ",'$'
.code
    start:
          mov ax, @data
          mov ds, ax

          lea dx,str1
          mov ah,09h
          int 21h

          mov ah,01h
          int 21h
          sub al,48

          mov arr_num, al
          mov arr_n,al

          lea dx,str2
          mov ah,09h
          int 21h

          mov si,0

    inp:  
          lea dx,str3
          mov ah,09h
          int 21h

          mov ah,01h
          int 21h
    
          sub al,48

          mov arr[si],al
          inc si

          dec arr_num
          jnz inp

          lea dx,str4
          mov ah,09h
          int 21h

          dec si

    outp: 
          lea dx,str3
          mov ah,09h
          int 21h

          mov bl,arr[si]
          add bl,48

          mov ah,02h
          MOV dl,bl
          INT 21h

          dec si

          dec arr_n
          jnz outp
                
          MOV AX, 4C00H
          INT 21H
 end start