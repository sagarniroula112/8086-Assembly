.model small
.data
    series db 10h, 00h, 80h, 99h, 00h
    positive db ?
    negative db ?
    zeros db ?
    
.code
    start:
        mov ax, @data
        mov ds, ax
        lea si, series
        mov cx, 0005H
        mov bx, 0000H
        mov dl, 00H
        
        back:
            mov al, [si]
            ADD al, 00H
            JNZ pos
            INC dl
            JMP skip
        pos:
            ROL al, 01
            JC nega
            INC BL
            JMP skip
            
        nega:
            INC BH
        
        skip:
            INC SI
            LOOP back
            
        mov positive, BL
        mov negative, BH
        mov zeros, DL
        
        end start    
            
            
        
            