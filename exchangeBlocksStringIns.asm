; exchange blocks of data

.model small
.data
    block1 db 01, 02, 03, 04, 05
    block2 db 06, 07, 08, 09, 0AH
    block3 db 0 dup(5)
    
.code
    start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        LEA si, block1
        LEA di, block3
        mov cl, 05H
        cld
        rep movsb
        
        LEA si, block2
        LEA di, block1
        mov cl, 05H
        cld
        rep movsb
        
        LEA si, block3
        LEA di, block2
        mov cl, 05H
        cld
        rep movsb
        
        end start