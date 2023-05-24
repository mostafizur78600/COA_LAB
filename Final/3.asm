.model small
.stack 64
.data
	str1 db 10,13, "Enter 1st number : ",'$'
	str2 db 10,13, "Enter second number : ",'$'
	str3 db 10,13, "1st number is largest.",'$'
	str4 db 10,13, "2nd number is largest.",'$'
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

	        mov cl,al

	; user 2nd input
	        lea dx, str2
	        mov ah, 09h
	        int 21h

	; read 2nd number
	        mov ah, 01h
	        int 21h

	        cmp cl,al

	        jg  greater
	        lea dx, str4
	        mov ah, 09h
	        int 21h

	        jmp done

	greater:
	        lea dx, str3
	        mov ah, 09h
	        int 21h

	done:   
	        mov ax,4c00h
	        int 21h
end start


