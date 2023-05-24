.model small
.stack 64
.data
    str1 db 10,13, "Enter number : ",'$'
    str2 db 10,13, "The number is even.", '$'
    str3 db 10,13, "The number is odd.", '$'
.code
    start:
          mov ax, @data
          mov ds, ax

          lea dx, str1
          mov ah, 09h
          int 21h
	
          mov ah, 01h
          int 21h
 
          shr ax, 1
          jnc evn
   
          lea dx, str3
          mov ah, 09h
          int 21h

          jmp done

    evn:  
          lea dx, str2
          mov ah, 09h
          int 21h
    done: 

          mov ax, 4c00h
          int 21h
end start
