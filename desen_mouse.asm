
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

jmp start
oldX dw -1
oldY dw 0
start:
mov ah, 00 
mov al, 13h 
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




