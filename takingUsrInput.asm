.model small
.data
    num db 00H
    msg1 db "Please Enter a Number(0-9):: ",'$'
    msg2 db "You entered:: ",'$'
    mew_line db 0AH, 0DH, '$'
    
.code
    start:
        MOV AX, @data
        MOV DS, AX
        
        MOV AH, 09H
        LEA DX, msg1
        INT 21H
        
        MOV AH, 01H
        INT 21H
        
        LEA DX, msg2
        MOV AH, 09H
        INT 21H
        
        LEA DL, AL
        MOV AH, 02H
        INT 21H
        
    end start    