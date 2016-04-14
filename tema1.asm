
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
  
  
  
jmp code

w equ 100 ; dimensiune dreptunghi
h equ 100 
color equ 50
coord_y equ 270 
coord_x equ 250     

code: mov ah, 0
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
                    
; asteptare apasare tasta
mov ah,00
int 16h

ret




