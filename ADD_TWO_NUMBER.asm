.model small
.stack 64
.data
	str1 db 10,13, "Enter two number: ",'$'
	str2 db 10,13, "The Sum is : ",'$'
	str3 db 10,13, '$' 
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

sub al,48

mov cl,al

lea dx, str3
mov ah, 09h
int 21h

; read 2nd number
mov ah, 01h
int 21h

sub al,48

; add two number

add cl,al

lea dx,str2
mov ah, 09h
int 21h

add cl,48

;print the sum
mov dl,cl
mov ah,02h
int 21h

mov ax,4c00h
int 21h
end start