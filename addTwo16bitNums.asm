.Data
    A DW 9999H
    B DW 9999H
    SUM DW ?
    CARRY DB 00H

.Code
    start:
        MOV AX, @Data  ;for initializing data segment
        MOV DS, AX
        
        MOV AX, A
        ADD AX, B
        MOV SUM, AX
        JNC skip
        INC CARRY
     skip:
        INT 03H
    
    end start    
        
            