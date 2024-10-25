ORG 100h

; Prompt for the single-digit number
mov dx, offset msg_input
mov ah, 09h
int 21h

; Get the single digit
mov ah, 01h
int 21h
mov bl, al               ; Store the input in BL
cmp al, '0'              ; Check if it's a valid digit (ASCII '0' = 48)
jl NotDigit              ; If less than '0', it's not a digit
cmp al, '9'              ; Check if it's greater than '9' (ASCII '9' = 57)
jg NotDigit              ; If greater than '9', it's not a digit

; Display the input digit
mov dx, offset msg_output
mov ah, 09h
int 21h
mov dl, bl
mov ah, 02h
int 21h

; Convert the digit from ASCII to numeric value
sub bl, '0'

; Check if the number is odd or even using bitwise AND
mov al, bl               ; Move the number to AL for bitwise operation
and al, 1                ; AND with 1 to check the least significant bit
jz Even                  ; If zero, the number is even
jmp Odd                  ; If not zero, the number is odd

Even:
; Display "The number is even"
mov dx, offset msg_even
mov ah, 09h
int 21h
jmp EndProgram

Odd:
; Display "The number is odd"
mov dx, offset msg_odd
mov ah, 09h
int 21h
jmp EndProgram

NotDigit:
; Handle invalid input
mov dx, offset msg_error
mov ah, 09h
int 21h

EndProgram:
; End the program
mov ah, 4Ch
int 21h

; Data section
msg_input DB "Enter a single-digit number: $"
msg_output DB 0Dh, 0Ah, "The number you entered is: $"
msg_even DB 0Dh, 0Ah, "The number is even.$"
msg_odd DB 0Dh, 0Ah, "The number is odd.$"
msg_error DB 0Dh, 0Ah, "Error: Not a digit!$"