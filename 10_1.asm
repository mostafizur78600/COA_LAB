.model small
.stack 64
.data
        arr     db 100 dup(?)
        ar      db 5 dup(?)
        a       dw 0
        max     db 0
        arr_num db ?
        arr_n   db ?
        str1    db 10,13, "Enter number of element in array : ",'$'
        str2    db 10,13, "Enter the number : ",'$'
        str3    db 10,13, '$'
        str5    db 10,13, "The larger number is : ",'$'
.code
        start:           
                         mov ax, @data
                         mov ds, ax

                         lea dx,str1
                         mov ah,09h
                         int 21h

                         mov dl, 10
                         mov bl, 0
        scan_arr_num:    

                         mov ah, 01h
                         int 21h

                         cmp al, 13                  ; Check if user pressed ENTER KEY
                         je  scan_arr_num_out

                         mov ah, 0
                         sub al, 48                  ; ASCII to DECIMAL

                         mov cl, al
                         mov al, bl                  ; Store the previous value in AL

                         mul dl                      ; multiply the previous value with 10

                         add al, cl                  ; previous value + new value ( after previous value is multiplyed with 10 )
                         mov bl, al

                         jmp scan_arr_num

        scan_arr_num_out:

                         mov arr_num,bl
                         mov arr_n,bl

                         lea dx,str2
                         mov ah,09h
                         int 21h

                         lea dx,str3
                         mov ah,09h
                         int 21h

                         mov dl, 10
                         mov bl, 0
                         mov si,0

        scanNum:         
                         mov ah, 01h
                         int 21h

                         cmp al, 13                  ; Check if user pressed ENTER KEY
                         je  arr_input

                         mov ah, 0
                         sub al, 48                  ; ASCII to DECIMAL

                         mov cl, al
                         mov al, bl                  ; Store the previous value in AL

                         mul dl                      ; multiply the previous value with 10

                         add al, cl                  ; previous value + new value ( after previous value is multiplyed with 10 )
                         mov bl, al

                         jmp scanNum

        arr_input:       
                         mov arr[si],bl
                         mov bl, 0

                         dec arr_num
                         jz  find
                         inc si
                         jmp scanNum

                
        find:            
                         mov si,a
                         mov bl,max
                         mov cl,arr[si]
                         cmp cl,bl
                         jg  greater
                         jmp find_larger

        find_larger:     
                         dec arr_n
                         jz  exit
                         inc a
                         jmp find

        greater:         
                         MOV max, cl
                         jmp find_larger
        exit:            

                         MOV BL, 10d                 ; Divisor
                         mov al,max
                         mov ah,0
                         mov si,0
        L1:              
                         DIV Bl                      ; Divide AX by BX

                         ADD ah, '0'                 ; Convert remainder to ASCII code
                         mov ar[si],ah

                         add si,1

                         mov ah,0

                         CMP al,0
                         jne l1
                         mov cx,si
                         add cx,1

                         sub si,1

                         lea dx,str5
                         mov ah,09h
                         int 21h

        OUTPUT:          
                         mov ah,02h
                         MOV dl,ar[si]
                         INT 21h

                         sub SI,1

                         dec cx
                         cmp cx,0
                         jnz OUTPUT

                         MOV AX, 4C00H               ; Function to terminate program execution
                         INT 21H
 end start