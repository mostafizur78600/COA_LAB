.model small
.stack 64
.data
    str1 db 10,13, "Enter number : ",'$'
    str2 db 10,13, "Number is Even.",'$'
    str3 db 10,13, "Number is Odd.",'$'
.code
    start:    
              mov ax,@data
              mov ds,ax

    ; user 1st input
              lea dx, str1
              mov ah, 09h
              int 21h

    ; read 1st number
              mov ah, 01h
              int 21h

            ;   sub al,48

              mov bl,2

              div bl

              cmp ah,0

              je  equal
              lea dx, str3
              mov ah, 09h
              int 21h

              jmp not_equal

    equal:    
              lea dx, str2
              mov ah, 09h
              int 21h

    not_equal:
              mov ax,4c00h
              int 21h

end start

