.model small
.data
    series db 02h, 23h, 05h, 69h
    oddcount db ?
    evencount db ?
    
.code
    start:
        mov ax, @data
        mov ds, ax
        
        lea si, series
        mov cx, 0004h
        
        mov bx, 0000h
       back: 
        mov al, [si]
        ror al, 1
        JC odd
        INC BL
        JMP last
        
        odd:
            INC BH
        last:
            INC SI
            LOOP back
            
            mov oddcount, BH
            mov evencount, BL
            
    end start          
            