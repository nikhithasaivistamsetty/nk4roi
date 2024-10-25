ORG 100h         

; Display the message "Enter the first digit: "
MOV DX, OFFSET msg_input1 
MOV AH, 09h       
INT 21h            

; Read the first digit from the user
MOV AH, 01h       
INT 21h            
MOV BL, AL         ; Store the first digit in BL

; Check if the first input is a digit
CMP BL, '0'        ; Compare with '0'
JL invalid_input   ; Jump if less than '0'
CMP BL, '9'        ; Compare with '9'
JG invalid_input   ; Jump if greater than '9'

; Display the message "Enter the second digit: "
MOV DX, OFFSET msg_input2 
MOV AH, 09h        
INT 21h           

; Read the second digit from the user
MOV AH, 01h        
INT 21h           
MOV CL, AL         ; Store the second digit in CL

; Check if the second input is a digit
CMP CL, '0'        ; Compare with '0'
JL invalid_input   ; Jump if less than '0'
CMP CL, '9'        ; Compare with '9'
JG invalid_input   ; Jump if greater than '9'

; Compare the two digits
CMP BL, CL         ; Compare the two digits
JE digits_equal     ; Jump if equal

; Display message for not equal
MOV DX, OFFSET msg_not_equal  
MOV AH, 09h       
INT 21h            
JMP end_program

digits_equal:
; Display message for equal
MOV DX, OFFSET msg_equal  
MOV AH, 09h       
INT 21h            

end_program:            
; Terminate the program
MOV AH, 4Ch        
INT 21h          

invalid_input:
; Display message for invalid input
MOV DX, OFFSET msg_invalid  
MOV AH, 09h       
INT 21h            
JMP end_program

; Data section with messages
msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_equal   DB 0Dh, 0Ah, 'The digits are equal.$'
msg_not_equal DB 0Dh, 0Ah, 'The digits are not equal.$'
msg_invalid DB 0Dh, 0Ah, 'Invalid input! Please enter digits only.$'

END