.model small
.data
    str1 db "Hello World", '$'
    str2 db 25 dup('$')
    
.code
    start:
        MOV BL, 00H
        MOV AX, @data
        MOV DS, AX
        LEA SI, str1
        LEA DI, str2
        
        back:
        CMP [SI], '$'
        JE main
        INC SI
        INC BL
        JMP back
        
        main:
        DEC SI
        MOV CL,BL
        
        reverse:
        MOV AL, [SI]
        MOV [DI], AL
        DEC SI
        INC DI
        loop reverse
        
        MOV AH, 09H
        LEA DX, str2
        INT 21H
        
        end start    