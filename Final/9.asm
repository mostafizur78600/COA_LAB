.MODEL SMALL
.STACK 64
.DATA
       NUMBER DW 0
       digit  db 0
       a      dw 10 dup(0)
       str1   db 10,13, "Enter Number of digits(in the range 1 to 5): ", '$'
       str2   db 10,13, "Enter the Number : ", '$'
       str3   db 10,13, "The Number is : ", '$'

.CODE
       start: 
              MOV AX, @DATA
              MOV DS, AX
    
              lea dx,str1
              mov ah,09h
              int 21h

              mov ah,01h
              int 21h
              mov digit,al
              sub digit,'0'

              lea dx,str2
              mov ah,09h
              int 21h
              mov bx,0
            

       l1:    
              mov ah,01h
              int 21h
              sub al,'0'

              mov cl,al
              mov ch,0
              add bx,cx
              dec digit
              jz  next
              mov ax,10d
              mul bx
              mov bx,ax
              cmp digit,0
              jnz l1

       next:  
              lea dx,str3
              mov ah,09h
              int 21h
              mov number,bx
              MOV bx, 10d         ; Divisor
              mov ax,number
              mov si,0
              mov dx,0
              mov digit,0
       L2:    
              DIV BX              ; Divide AX by BX

              ADD dx, '0'         ; Convert remainder to ASCII code
              mov a[si],dx

              add si,1

              mov dx,0
 
              inc digit
              cmp ax,0
              jnz L2

              sub si,1
              MOV cl,digit


       OUTPUT:
              mov ah,02h
              MOV dx,a[si]
              INT 21h

              sub SI,1

              dec cx
              cmp cx,0
              jnz OUTPUT

              MOV AX, 4C00H       ; Function to terminate program execution
              INT 21H

End start