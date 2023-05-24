.model small
.stack 64
.data
    arr     db 10 dup(?)
    max     db 0
    arr_num db ?
    arr_n   db ?
    str1    db 10,13, "Enter number of element in array : ",'$'
    str2    db 10,13, "Enter the number : ",'$'
    str3    db 10,13, '$'
    str4    db 10,13, "The larger number is : ",'$'
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
                mov si,0
    find:       
                mov bl,max
                mov cl,arr[si]
                cmp cl,bl
                jg  greater
                jmp find_larger

    find_larger:
                dec arr_n
                jz  exit
                inc si
                jmp find

    greater:    
                MOV max, cl
                jmp find_larger
    exit:       
                lea dx,str4
                mov ah,09h
                int 21h

                mov bl,max
                add bl,48

                mov ah,02h
                MOV dl,bl
                INT 21h

                MOV AX, 4C00H 
                INT 21H
 end start