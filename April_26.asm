.model small
.stack 64
.data
        arr     db 100 dup(?)
        a       dw 0
        max     db 0
        max_in  dw 0
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

                    mov ah, 01h
                    int 21h

                    sub al,48

                    mov arr_num,al
                    mov arr_n,al

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

                    cmp al, 13             ; Check if user pressed ENTER KEY
                    je  arr_input

                    mov ah, 0
                    sub al, 48             ; ASCII to DECIMAL

                    mov cl, al
                    mov al, bl             ; Store the previous value in AL

                    mul dl                 ; multiply the previous value with 10

                    add al, cl             ; previous value + new value ( after previous value is multiplyed with 10 )
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
                    mov max_in,si
                    jmp find_larger
        exit:       
                    lea dx,str4
                    mov ah,09h
                    int 21h
                      
                    mov bx,max_in
                    add bx,1
                    add bx,48

                    mov ah,02h
                    MOV dx,bx
                    INT 21h
                
                    MOV AX, 4C00H          ; Function to terminate program execution
                    INT 21H
        
 end start