.MODEL SMALL
.STACK 64
.DATA
       NUMBER DW 65535d          ; Change this to any other number
       a      dw 10 dup(0)

.CODE
       start: 
              MOV AX, @DATA
              MOV DS, AX

              MOV BL, 10d         ; Divisor
              mov ax,NUMBER
              mov si,0
              mov dx,0
              mov bh,0

       L1:    
              DIV BX              ; Divide AX by BX

              ADD dx, '0'         ; Convert remainder to ASCII code
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

              MOV AX, 4C00H       ; Function to terminate program execution
              INT 21H

End start