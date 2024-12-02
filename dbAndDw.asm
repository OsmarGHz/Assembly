org 100h
.DATA
    mensaje db "Hola mundo$"
    contador db 0h
    
.CODE
    LEA Dx, mensaje
    ;LEA = offset
    mov ah,09h
    int 21h
    
    lea bx,contador
    mov [bx], 4h
    mov al,[bx]