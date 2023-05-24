.model small
.stack 64
.data
    arr     dw 10 dup(?)
    max     dw 0
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
                mov ah,0

                mov arr[si],ax
                add si,2

                dec arr_num
                jnz inp
                mov si,0
    find:       
                mov bx,max
                mov cx,arr[si]
                cmp cx,bx
                jg  greater
                jmp find_larger

    find_larger:
                dec arr_n
                jz  exit
                add si,2
                jmp find
                
    greater:    
                MOV max, cx
                jmp find_larger
    exit:       
                lea dx,str4
                mov ah,09h
                int 21h

                mov bx,max
                add bx,48

                mov ah,02h
                MOV dx,bx
                INT 21h

                MOV AX, 4C00H 
                INT 21H
 end start