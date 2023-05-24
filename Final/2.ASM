.model small
.stack 64h
.data
        str1 db 10,13,"Enter number: ",'$'
        str2 db 10,13,"The sum is: ",'$'
        str3 db 10,13,'$'
.code
start:
        mov ax,@data
        mov ds,ax

        lea dx,str1
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,48
        mov bh,al

        lea dx,str3
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,48

        add bh,al
        add bh,48

        lea dx,str2
        mov ah,09h
        int 21h

        mov dl,bh
        mov ah,02h
        int 21h

        mov ax,4c00h
        int 21h
end start