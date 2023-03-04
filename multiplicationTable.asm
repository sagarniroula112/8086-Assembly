.model small
.data
    num1 db 5
    num2 db 1
    tab db 10 dup(0)
    
.code
    start:          
        MOV AX, @data
        MOV DS, AX
       
        MOV CX, 0010H

        LEA DI, tab
         
        back:
        MOV AL, num1
        MUL num2
        
        
        MOV [DI], AL
        INC DI 
        INC num2
        loop back
        
        end start     