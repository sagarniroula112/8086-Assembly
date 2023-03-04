.model small
.data
    block1 db 01, 02, 03, 04, 05
    block2 db 06, 07, 08, 09, 0Ah
    
.code
    start:
        mov ax, @data
        mov ds, ax
        
        lea si, block1
        lea di, block2
        mov cl, 05H
        
        back:
        
        mov al, ds:[si]
        mov ah, ds:[di]
        
        mov ds:[si], ah
        mov ds:[di], al
        
        inc si
        inc di
        
        LOOP back
        
        end start    