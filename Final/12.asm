.model small
.stack 64
.data
      arr     db 10 dup(?)
      arr_num db ?
      arr_n   db ?
      ind     db 0
      find    db ?
      str1    db 10,13, "Enter number of element in array : ",'$'
      str2    db 10,13, "Enter the number : ",'$'
      str3    db 10,13, "Enter the number to find : ",'$'
      str4    db 10,13, '$'
      str5    db 10,13, "The number is present at index : ",'$'
      str6    db 10,13, "The number is not present.",'$'
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
            lea dx,str4
            mov ah,09h
            int 21h

            mov ah,01h
            int 21h
    
            sub al,48

            mov arr[si],al
            inc si

            dec arr_num
            jnz inp

            lea dx,str3
            mov ah,09h
            int 21h

            mov ah,01h
            int 21h

            sub al,48
            mov find,al
            mov si,0

      check:
            mov bl,find
            mov cl,arr[si]
            cmp bl,cl
            je  pre
            inc si
            inc ind
            dec arr_n
            jnz check
            jmp n_pre

      pre:  
            lea dx,str5
            mov ah,09h
            int 21h

            mov bl,ind
            add bl,48

            ; add bl,1

            mov ah,02h
            MOV dl,bl
            INT 21h
            jmp exit
      n_pre:
            lea dx,str6
            mov ah,09h
            int 21h
      exit: 
            MOV AX, 4C00H
            INT 21H
 end start