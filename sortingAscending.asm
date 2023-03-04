.model small
.data
    arr db 8,2,9,4,7
    
.code
    start:
        MOV AX, @data
        MOV DS, AX
        LEA SI, arr
        MOV CH, 04H
        
        back2:
            MOV CL, 04H
            LEA SI, arr
        
        back1:
            MOV AL, [SI]
            MOV AH, [SI+1]
        
            CMP AL, AH
            JNC fix
            JMP next
        
        fix:
            MOV [SI], AH
            MOV [SI+1], AL
            
        next:    
            INC SI
            DEC CL
            JNZ back1
            
            DEC CH
            JNZ back2
            
            end start
                