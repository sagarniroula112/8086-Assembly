.model small
.data
    series db 5H, 7H, 23H, 6H, 49H, 8H
    highest db 00H
    
.code
    start:
        mov ax, @data
        mov ds, ax
        lea si, series
        
        mov cx, 0006H
        
        mov al, 00H
      back:  
        CMP al, [si]
        JNC skip
        mov al, [si]
        skip:
            INC SI
            LOOP back
            
        mov highest, al    
            
    end start           