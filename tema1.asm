; Acesta este un program scris in assembly care face urmatoarele:
    ;1. Deseneaza un cub 3D
    ;2. Citeste input-ul primit de la mouse pentru a desena orice
    ;3. Reda sunete de tip beep
    
;Generarea laturilor cubului s-a facut dupa urmatoarea legenda:

;      ;---7---;
;     /|      /|
;    5 |     6 |
;   ;--|1---;  |
;   | 10    |  9
;   |  |    |  |
;   4  |    3  |
;   |  ;-11-|--;
;   |12     | 8
;   ;---2---;/    

org 100h

jmp print_menu

 ;Variables  
 
 ;variabile necesare meniului
 
    ;0dh = carridge return; 0ah = line feed
    head db "Universitatea Politehnica Bucuresti",0ah,0dh,"Facultatea de Automatica si Calculatoare",0ah,0dh,"Sisteme cu microprocesoare",0ah,0dh,"Paun Alin-Constantin",0ah,0dh,"Grupa: 332AA",0ah,0dh,0ah,0dh,"$"
    
    menu db "Selectati o optiune:",0ah,0dh,"1. Desenati un cub 3D",0ah,0dh,"2. Desenati cu ajutorul mouse-ului",0ah,0dh,"3. Play beep",0ah,0dh,"4. Exit",0ah,0dh,0ah,0dh,"Optiune:$"        
    
    dimensiuneCub db "Dimenisunea cubului: $"
   
 ;variabile necesare desenarii cubului 3D
    
    w equ 120 ; dimensiune dreptunghi
    h equ 120 
    color equ 50
    coord_y equ 190 
    coord_x equ 220
  
 ;variabile necesare pentru a desena cu ajutorul mouse-ului  
    oldX dw -1
    oldY dw 0
    


; printare menu
print_menu:
    mov ah, 0   ; trecere in modul video
    mov al,3h   ; mod text 80x25
    int 10h     ; intrerupere
    
    ;clrscr    
    mov ah, 6h  ; function 6h = scroll up; 7h = scroll down
    mov al, 0h  ; linia la 0 = stergerea intregului ecran
    mov bh, 0010_1111b ;setare background
    mov ch, 0   ; linia 0
    mov cl, 0   ; coloana 0
    mov dh, 24
    mov dl, 79
    int 10h
    
    ;descriere
    mov dx, offset head
    mov ah, 09h
    int 21h
    mov dx, offset menu
    int 21h
    jmp read_op 
                                            
                                            
;citirea optiunii selectate pe baza meniului    
read_op:
    mov ah,8h
    int 21h
    cmp al,31h
    je option1
    cmp al,32h
    je option2
    cmp al,33h
    je option3
    ;cmp al,34h
    ;je option4
    ;cmp al,35h
    je read_op
    
     ;clrscr    
    mov ah, 6h  ; function 6h = scroll up; 7h = scroll down
    mov al, 0h  ; linia la 0 = stergerea intregului ecran
    mov bh, 0000_0110b ;setare background
    mov ch, 0   ; linia 0
    mov cl, 0   ; coloana 0
    mov dh, 24
    mov dl, 79
    int 10h
    ret
    
;citeste daca s-a apasat escape
read_esc:
    mov ah,8h
    int 21h
    cmp al,1bh ; codul hex pentru escape
    je print_menu
    jmp read_esc

; prima optiune a meniului
option1:
    mov ah, 0
    mov al, 12h ; trecere in mod grafic 320x200
    int 10h
           
    ; afisare muchie fata superioara (muchia 1)
    mov cx, coord_x ; coloana
    mov dx, coord_y ; rand
    mov al, color ; alb 
    u1: mov ah, 0ch ; afisare pixel
        int 10h
        inc cx
        cmp cx, coord_x+w
        jnz u1 
        
    ; afisare muchie fata inferioara (muchia 2)
    mov cx, coord_x
    mov dx, coord_y+h
    mov al, color     
    u2: mov ah, 0ch
        int 10h
        inc cx
        cmp cx, coord_x+w
        jnz u2  
        
    ; latura muchie fata stanga (muchia 3)
    mov cx, coord_x
    mov dx, coord_y
    mov al, color    
    u3: mov ah, 0ch
        int 10h
        inc dx
        cmp dx, coord_y+h
        jnz u3  
        
    ; latura muchie fata dreapta (muchia 4)
    mov cx, coord_x+w
    mov dx, coord_y
    mov al, color   
    u4: mov ah, 0ch
        int 10h
        inc dx
        cmp dx, coord_y+h
        jnz u4 
    
    ; afisare muchie 5 
    mov cx, coord_x
    mov dx, coord_y
    mov al, color   
    u5: mov ah, 0ch
        int 10h
        inc cx 
        dec dx
        cmp cx, coord_x+w/2
        cmp dx, coord_y-h/2
        jnz u5      
    
    ; afisare muchie 6
    mov cx, coord_x+w
    mov dx, coord_y
    mov al, color   
    u6: mov ah, 0ch
        int 10h
        inc cx 
        dec dx
        cmp cx, coord_x+w+w/2
        cmp dx, coord_y-h/2
        jnz u6      
    
    ; afisare muchie 7
    mov cx, coord_x+w/2
    mov dx, coord_y-h/2
    mov al, color   
    u7: mov ah, 0ch
        int 10h
        inc cx 
        cmp cx, coord_x+w/2+w
        jnz u7      
    
    
    ; afisare muchie 8
    mov cx, coord_x+w
    mov dx, coord_y+h
    mov al, color   
    u8: mov ah, 0ch
        int 10h
        inc cx 
        dec dx
        cmp cx, coord_x+w/2
        cmp dx, coord_y+h/2
        jnz u8   
    
    ; afisare muchie 9
    mov cx, coord_x+w+w/2
    mov dx, coord_y-h/2
    mov al, color   
    u9: mov ah, 0ch
        int 10h
        inc dx
        cmp dx, coord_y+h-h/2
        jnz u9 
                    
    ; afisare muchie 10
    mov cx, coord_x+w/2
    mov dx, coord_y-h/2
    mov al, color   
    u10: mov ah, 0ch
        int 10h
        add dx,02h
        cmp dx, coord_y+h-h/2
        jnz u10
    
    ; afisare muchie 11
    mov cx, coord_x+w/2
    mov dx, coord_y+h/2
    mov al, color     
    u11: mov ah, 0ch
        int 10h
        inc cx
        cmp cx, coord_x+w+w/2
        jnz u11
    
    
    ; afisare muchie 12
    mov cx, coord_x
    mov dx, coord_y+h
    mov al, color   
    u12: mov ah, 0ch
        int 10h
        inc cx 
        dec dx
        cmp cx, coord_x+w/2
        cmp dx, coord_y+h/2
        jnz u12                
        jmp read_esc
        

; cea de a doua optiune a meniului        
option2:
    jmp start    
    start:
        mov ah, 0
        mov al, 12h ; trecere in mod grafic 320x200
        int 10h

        mov ax, 0 ; initializare mouse
        int 33h
        cmp ax, 0
        mov ax, 1 ; afisare cursor mouse - optional
        int 33h
    check_mouse_button:
        mov ax, 3
        int 33h ; preluare pozitie si status butoane
        shr cx, 1 ; x/2 - in modul grafic este dublata coordonata x
        cmp bx, 1
        jne xor_cursor:
        mov al, 1010b ; culoare punct
        jmp draw_pixel
    xor_cursor:
        cmp oldX, -1
        je not_required
        push cx
        push dx
        mov cx, oldX
        mov dx, oldY
        mov ah, 0dh
        int 10h
        xor al, 1111b
        mov ah, 0ch
        int 10h
        pop dx
        pop cx
    not_required:
        mov ah, 0dh
        int 10h
        xor al, 1111b
        mov oldX, cx
        mov oldY, dx
    draw_pixel:
        mov ah, 0ch
        int 10h
    check_esc_key:
        mov dl, 255
        mov ah, 6
        int 21h
        cmp al, 27 ; esc?
        jne check_mouse_button 
        
    stop:
       jmp read_esc 

; cea de a 3 optiune a meniului          
option3:
    beep:
       ;generarebeep
       mov ah, 02
       mov dl, 07h
       int 21h
       jmp read_op 

                          