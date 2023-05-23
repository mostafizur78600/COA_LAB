.model small
.stack 64
.data
        arr     dw 100 dup(0)
        a       dw 10 dup(?)
        num     dw 0
        digit   dw 0
        arr_num dw ?
        arr_n   dw ?
        str1    db 10,13, "Enter number of element in array : ",'$'
        str2    db 10,13, "Enter the number : ",'$'
        str3    db 10,13, '$'
        str4    db 10,13, "The reverse array : ",'$'
    
.code
        start:           
                         mov ax, @data
                         mov ds, ax

                         lea dx,str1
                         mov ah,09h
                         int 21h

                         mov bx, 10
                         mov dx, 00
        scan_arr_num:    

                         mov ah, 01h
                         int 21h

                         cmp al, 13                  ; Check if user pressed ENTER KEY
                         je  scan_arr_num_out

                         mov ah, 0
                         sub al, 48                  ; ASCII to DECIMAL

                         mov cx, ax
                         mov ax, dx                  ; Store the previous value in AL

                         mul bx                      ; multiply the previous value with 10

                         add ax, cx                  ; previous value + new value ( after previous value is multiplyed with 10 )
                         mov dx, ax

                         jmp scan_arr_num

        scan_arr_num_out:

                         mov arr_num,dx
                         mov arr_n,dx
                         mov dx,00

                         lea dx,str2
                         mov ah,09h
                         int 21h

                         lea dx,str3
                         mov ah,09h
                         int 21h

                         mov dx, 00
                         mov bx, 10d
        scanNum:         
                         mov ah, 01h
                         int 21h

                         cmp al, 13                  ; Check if user pressed ENTER KEY
                         je  arr_input

                         mov ah, 0
                         sub al, '0'                 ; ASCII to DECIMAL

                         mov cx, ax
                         mov ax, dx                  ; Store the previous value in AL

                         mul bx                      ; multiply the previous value with 10
                         add ax, cx                  ; previous value + new value ( after previous value is multiplyed with 10 )
                         mov dx, ax

                         jmp scanNum

        arr_input:       
                         mov arr[si],dx
                         mov dx, 00

                         dec arr_num
                         jz  exit

                         inc si
                         inc si
                         mov num,si
                         jmp scanNum

        exit:            

                         lea dx,str4
                         mov ah,09h
                         int 21h
                         
                         mov si,num
        rev:             
                         lea dx,str3
                         mov ah,09h
                         int 21h


                         mov ax,arr[si]

                         sub num,2

                         mov dx,0
                         mov bx,10
                         mov si,0
        L1:              
                         DIV BX                      ; Divide AX by BX

                         ADD dx, '0'                 ; Convert remainder to ASCII code
                         mov a[si],dx

                         add si,1

                         mov dx,0

                         CMP AX,0
                         jnz L1

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

                         mov si,num
                         sub arr_n,1
                         cmp arr_n,0
                         jnz rev

                         MOV AX, 4C00H               ; Function to terminate program execution
                         INT 21H

 end start