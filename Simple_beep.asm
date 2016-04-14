
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

beep PROC        ;genereaza un beep
    mov ah, 02
    mov dl, 07h
    int 21h
    ret
beep ENDP

ret




