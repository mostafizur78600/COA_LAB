.model small
.stack 100
.data
    a    dw 2
    b    dw 3
.code
    start:

          mov ax,@data
          mov ds,ax

          mov ax,a
          mov bx,b

          add ax,bx

          mov ax,4c00h
          int 21h
end start