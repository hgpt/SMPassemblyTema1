
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

jmp print_menu

 ;Variables
    ;0dh = carridge return; 0ah = line feed
    head db "Universitatea Politehnica Bucuresti",0ah,0dh,"Facultatea de Automatica si Calculatoare",0ah,0dh,"Sisteme cu microprocesoare",0ah,0dh,"Paun Alin-Constantin",0ah,0dh,"Grupa: 332AA",0ah,0dh,0ah,0dh,"$"
    
    menu db "Selectati o optiune:",0ah,0dh,"1. Desenati un cub 3D",0ah,0dh,"2. Desenati cu ajutorul mouse-ului",0ah,0dh,"3. Exit",0ah,0dh,0ah,0dh,"Optiune:$"        
    
    msg db " press any key.... $"
            
    w equ 50 ; dimensiune dreptunghi
    h equ 50 
    color equ 50
    coord_y equ 270 
    coord_x equ 250
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

option1:
    mov ah, 0
    mov al, 12h ; trecere in mod grafic 320x200
    int 10h
           
    ; afisare muchie fata superioara
    mov cx, coord_x ; coloana
    mov dx, coord_y ; rand
    mov al, color ; alb 
    u1: mov ah, 0ch ; afisare pixel
        int 10h
        inc cx
        cmp cx, coord_x+w
        jnz u1 
        
    ; afisare muchie fata inferioara
    mov cx, coord_x
    mov dx, coord_y+h
    mov al, color     
    u2: mov ah, 0ch
        int 10h
        inc cx
        cmp cx, coord_x+w
        jnz u2  
        
    ; latura muchie fata stanga
    mov cx, coord_x
    mov dx, coord_y
    mov al, color    
    u3: mov ah, 0ch
        int 10h
        inc dx
        cmp dx, coord_y+h
        jnz u3  
        
    ; latura muchie fata dreapta
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
        
        
option2:
    jmp start    
    start:
        mov ah, 0
        mov al, 12h ; trecere in mod grafic 320x200
        int 10h

        mov ax, 0 ; ini?ializare mouse
        int 33h
        cmp ax, 0
        ;mov ax, 1 ; afi?are cursor mouse ? op?ional
        ;int 33h
    check_mouse_button:
        mov ax, 3
        int 33h ; preluare pozi?ie ?i status butoane
        shr cx, 1 ; x/2 ? în modul grafic este dublat? coordonata x
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