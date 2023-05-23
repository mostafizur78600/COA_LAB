.model small
.stack 100h
.data
    a        dw 10 dup(?)
    u_i      dw ?

    i_con    dw ?

    arr      dw 100 dup(0)
    arr_num  dw ?
    z        dw 0
    i        dw 0
    find_num dw ?
    str1     db 10,13, "Enter number of element in array : ",'$'
    str2     db 10,13, "Enter the number : ",'$'
    str3     db 10,13, "Enter the find number : ",'$'
    str4     db 10,13, '$'
    str5     db 10,13, "Number presert at index : ",'$'
    str6     db 10,13, "Number not present : ",'$'

.code
    start: 
           mov ax, @data
           mov ds, ax

           lea dx,str1
           mov ah,09h
           int 21h
           
           mov i_con,0
           jmp input

    input: 
           mov bx, 10
           mov dx, 00
    l1:    
           mov ah, 01h
           int 21h
           cmp al, 13        ; Check if user pressed ENTER KEY
           je  exit
           mov ah, 0
           sub al, 48        ; ASCII to DECIMAL
           mov cx, ax
           mov ax, dx        ; Store the previous value in AL
           mul bx            ; multiply the previous value with 10
           add ax, cx        ; previous value + new value ( after previous value is multiplyed with 10 )
           mov dx, ax
           jmp l1
    exit:  
           mov u_i,dx
           mov dx,0

           mov di,i_con
           
           cmp di,0
           je  arr_e

           cmp di,1
           je  arr_i

           cmp di,2
           je  l2


    arr_e: 
           mov ax,u_i
           mov arr_num,ax

           lea dx,str2
           mov ah,09h
           int 21h
           lea dx,str4
           mov ah,09h
           int 21h

           mov i_con,1
           jmp input
           mov si,0

    arr_i: 
           mov ax,u_i
           mov arr[si],ax
           add z,1
           dec arr_num
           jz  f_num
           add si,2
           jmp input
    f_num: 
           lea dx,str3
           mov ah,09h
           int 21h

           mov i_con,2
           jmp input
    l2:    
           mov cx,u_i
           mov si,0
    find:  
           mov dx,arr[si]
           cmp cx,dx
           je  p
           add i,1
           add si,2
           dec z
           cmp z,0
           jnz find
           jmp no
    p:     
           lea dx,str5
           mov ah,09h
           int 21h
           mov ax,i
           jmp print

    no:    
           lea dx,str6
           mov ah,09h
           int 21h

           jmp l_exit

    print: 
           mov dx,0
           mov bx,10
           mov si,0
    
    i_take:
           DIV BX            ; Divide AX by BX
           ADD dx, '0'       ; Convert remainder to ASCII code
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

    l_exit:
           MOV AX, 4C00H     ; Function to terminate program execution
           INT 21H

 end start