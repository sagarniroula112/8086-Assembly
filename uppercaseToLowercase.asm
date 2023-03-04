.model small
.data
    str db "Hello World",'$'

.code
    start:
        MOV AX, @data
        MOV DS, AX
        LEA SI, str
        
        main:
        MOV CL, [SI]
        CMP CL, '$'
        JE equal
        
        CMP CL, 20H
        JE blank
        
        CMP CL, 60H
        JL less
        INC SI
        JMP main
        
        less:
        MOV CL, [SI]
        ADD CL, 20H
        MOV [SI], CL
        INC SI
        JMP main
        
        blank:
        INC SI
        JMP main
        
        equal:        
        MOV AH, 09H
        LEA DX, str
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
        end start    