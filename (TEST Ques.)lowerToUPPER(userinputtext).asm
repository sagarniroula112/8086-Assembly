
; Write asm code to read a text from user, convert the text into uppercase and display on cleared screen.

.model small
.data
   userstr db 25H dup('$')
   str1 db "Enter a text:: ",'$'
   newline db 0Ah, 0Dh, '$'
   countval db 00H

.code
    start:
        mov ax, @data
        mov ds, ax
        lea si, userstr
        
        mov al, 00h
        
        back:
            mov ah, 01h            ; for taking user input as text(character)
            INT 21H
            cmp al, '/'
            JE count
            mov [si], al
            inc si
            inc al
            JMP back 
        
        count:
            MOV countval, al
            
            MOV [si], " "      ; removing forward slash at the end of inputted text
            
            mov ah, 09h
            lea dx, newline    ; for line break
            int 21h
            
            mov ah, 09H
            lea dx, userstr
            int 21h
            
            MOV CL, countval
            
            lea si, userstr
            
        back1:    
            cmp [si], 60H
            JNC sort
            JMP incre 
            
        sort:
            sub [si], 20H
            
        incre:    
            INC SI
            loop back1
              
        
        MOV AX, 0003H  ; can write 03H as well   ; for CLEARING THE SCREEN, VERY VERY IMPORTANT!
        INT 10h        
        
            
        MOV AH, 09H          ; everything in UPPERCASE
        LEA DX, userstr
        INT 21H        
              
        end start