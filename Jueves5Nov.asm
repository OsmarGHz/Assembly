.DATA
led db 00h   ;completar
    db 02h
    
.CODE
mov bx, offset led
mov si, 0
mov cx, 2 ;;completar

ciclo: mov ax, [bx][si]
       out dx,ax
       inc si
       mov cx, 0Fh
       mov dx, 04
       mov ax, 924h
       out dx,ax 

mov cx,098h
mov dx,9680h
mov Ah,86h
INT 15h

mov dx, 4
mov ax, 492h
out dx,ax

mov cx,04ch
mov dx,4b40h
mov Ah,86h
INT 15h

mov dx, 4
mov ax, 249h
out dx,ax

mov cx,0E4h
mov dx,0xE1C0
mov Ah,86h
INT 15h

mov dx, 4
mov ax, 0h
out dx,ax