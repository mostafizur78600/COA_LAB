.model small       ; Declare the memory model as small
.stack 64          ; Set the size of the stack to 64 bytes

.data              ; Declare the data segment

    str1 db 10,13, "Enter number : ",'$' ; Declare a string to prompt the user for input
    str2 db 10,13, "The number is even.", '$' ; Declare a string to print if the number is even
    str3 db 10,13, "The number is odd.", '$'  ; Declare a string to print if the number is odd

.code             ; Declare the code segment

    mov ax, @data  ; Load the address of the data segment into the AX register
    mov ds, ax     ; Move the value of AX into the DS register to set the data segment

    lea dx, str1   ; Load the effective address of str1 into the DX register
    mov ah, 09h    ; Set the AH register to 9 to indicate a print string function
    int 21h        ; Call the DOS interrupt 21h to print the string

    mov ah, 01h    ; Set the AH register to 1 to indicate a read character function
    int 21h        ; Call the DOS interrupt 21h to read a character from the keyboard and store it in the AL register

    shr ax, 1      ; Shift the value in the AL register right by 1 bit to divide it by 2

    jnc evn        ; Jump to the label "evn" if the least significant bit of the AL register is 0 (i.e., the number is even)

    lea dx, str3   ; Load the effective address of str3 into the DX register
    mov ah, 09h    ; Set the AH register to 9 to indicate a print string function
    int 21h        ; Call the DOS interrupt 21h to print the string

    jmp done       ; Jump to the label "done" to exit the program

evn:               ; Declare the label "evn"

    lea dx, str2   ; Load the effective address of str2 into the DX register
    mov ah, 09h    ; Set the AH register to 9 to indicate a print string function
    int 21h        ; Call the DOS interrupt 21h to print the string

done:              ; Declare the label "done"

    mov ax, 4c00h  ; Load the value 4c00h into the AX register to indicate the exit function
    int 21h        ; Call the DOS interrupt 21h to exit the program

end               ; End of the program
