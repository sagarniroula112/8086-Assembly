.model small
.data
    str1 db "Enter a first number:: ",'$'
    str2 db "Enter a second number:: ",'$'
    str3 db "Sum:: ",'$'
    
.code
    start:
        MOV AX, @data
        MOV DS, AX
        
        LEA DX, str1
        MOV AH, 09H
        INT 21H
        
        MOV AH, 01H
        INT 21H
        MOV BL, AL
        
        LEA DX, str2
        MOV AH, 09H
        INT 21H
        
        MOV AH, 01H
        INT 21H
        MOV BH, AL
        
        SUB BH, 48
        SUB BL, 48
        
        LEA DX, str3
        MOV AH, 09H
        INT 21H
        
        ADD BH, BL
        ADD BH, 48
        
        MOV DL, BH
        MOV AH, 02H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    end start    
        
        
            