.data
    str1 db "FUck off",'$'
    userstr db 25h dup('$')
    newline db 0AH, 0DH,'$'
    
.code
    start:
        mov ax, @data
        mov ds,ax
        mov bl, 00H
        
        lea dx, str1
        mov ah, 09h
        int 21h
        
        mov AH, 09H
        lea DX, newline
        int 21H
        
        lea si, userstr
        mov bl, 00h
        
        back:
        mov ah, 01h
        int 21h
        cmp al, '/'
        jz next
        mov [si], al
        inc bl
        inc si
        loop back
        
        
        next:
            mov cl, bl
            MOV bx, 0000H
            lea si, userstr
            
        back1:
         
            mov ah, [si]
            cmp ah, '/'
            jz final 
            cmp ah, 60H
            jc capital
            inc bh
            jmp next1
            
        capital:
            inc bl
            
        next1:
            inc si
            loop back1        
           
        
        final:
        
            end start  
        
        
            
        
        
        
        
                    
            
        
        
            