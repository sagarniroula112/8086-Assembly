.model small

.data
    msg db "Hello World", '$'
    newline db 0ah, 0dh, '$'
    
.code
    start:
        MOV AX, @data
        MOV DS, AX
        
        
        MOV AH, 09H
        LEA DX, msg
        INT 21H
        
        LEA DX, newline
        MOV AH, 09H
        INT 21H
        
        MOV DL, 'A'
        MOV AH, 02H
        INT 21H
        
       end start    