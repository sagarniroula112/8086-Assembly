.model small
.data
    str1 db "Tribhuvan University",'$'
    str2 db "The username is valid",'$'
    str3 db "Invalid username",'$'
    newline db 0AH, 0DH,'$'
    userstr db 25H dup('$')
    
.code
    start:
        MOV AX, @data
        MOV DS, AX
        
        LEA SI, str1
        MOV BH, 00H
        
        back:
            MOV BL, [SI]
            CMP BL, '$'
            JE next
            INC SI
            INC BH
            JMP back
            
        next:
            DEC SI
            MOV CL, BH
            LEA DI, userstr
            
        back1:    
            MOV AH, 01H
            INT 21H
            MOV [DI], AL
            INC DI
            LOOP back1
            
            ;COMPARISON
            
            LEA SI, str1
            LEA DI, userstr
            MOV CL, BH
            
        final2:
            MOV BH, [SI]
            ;MOV BL, [DI]    
            CMP BH, [DI]
            JNZ final
            INC SI
            INC DI
            DEC CL
            JNZ final2
            
            MOV AH, 09H
            LEA DX, newline
            INT 21H
            
            MOV AH, 09H
            LEA DX, str2
            INT 21H
            JMP last
            
        final:
            MOV AH, 09H
            LEA DX, newline
            INT 21H
            
            MOV AH, 09H
            LEA DX, str3
            INT 21H         
           
        last:
                
        end start            