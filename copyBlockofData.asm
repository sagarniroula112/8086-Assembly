.model small
.data
    block1 db 01, 02, 03, 04, 05, 06, 07
    block2 db 0 dup(7)
    
.code
    start:
        mov ax, @data
        mov ds, ax
        
        mov es, ax
        
        lea si, block1
        lea di, block2
        
        mov cx, 07H
        cld
        rep movsb
        
        end start