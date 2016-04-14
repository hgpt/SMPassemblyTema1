
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
  
  
  
jmp code

w equ 20 ; dimensiune dreptunghi
h equ 20 
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

;-----------------------desen cub incheiat--------------

jmp start
oldX dw -1
oldY dw 0 

start:
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
;mov ax, 2 ; ascunde cursor mouse ? op?ional
;int 33h
mov ax, 3 ; înapoi în mod text 80x25
int 10h
mov ah, 1
mov ch, 0
mov cl, 8
int 10h
mov dx, offset msg
mov ah, 9
int 21h
mov ah, 0
int 16h
hlt
msg db " press any key.... $"

                 
ret





   
; asteptare apasare tasta
mov ah,00
int 16h

ret




