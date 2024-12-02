org 100h

.data
    peticion db "Ingresa una palabra (8 letras): $"
    palabra db 8 dup ('$') ;NO OLVIDAR LOS PARENTESIS
    
.code
    mov ax, @data
    mov ds,ax
    
    mov ah,09h
    lea dx, peticion
    int 21h
      
mov cx,8
readChar:
    mov ah,01h    
    int 21h
    push ax 
loop readChar

mov cx,8
mov si,7
lea bx, palabra

putChar:
    pop ax
    mov [bx][si], al
    dec si
loop putChar

mov si,8
mov [bx][si], '$'

mov ah, 09h
lea dx, palabra
int 21h