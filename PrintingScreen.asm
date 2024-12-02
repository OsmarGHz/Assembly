 ;Imprimir bien las palabras
org 100h

.data
    peticion db "Ingrese 10 caracteres, los reimprimiremos!: "
    palabra db 10 dup ('$')
    
.code 
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,peticion
    int 21h
    
    mov cx,0Ah    
    leerChar:
        mov ah,01h
        int 21h
        push ax
    loop leerChar
    
    lea bx,palabra
    mov cx,0x0A
    mov si,0x09
    
    pasarChar:      
        pop ax
        mov [bx][si],al ;RECUERDA GUARDAR TUS LETRAS DESDE AL
        dec si
    loop pasarChar
    
    mov si,0x0A
    mov [bx][si],'$'
    
    ;imprimir salto de linea
    mov ah,02h
    mov dl,0Ah
    int 21h
    
    mov dl,0Dh
    int 21h
    
    mov ah,0x86
    mov cx,0x0f
    mov dx,4240h
    int 15h
    
    mov ah,09h
    lea dx,palabra
    int 21h
    
    ;Imprimir en ASCII Display
    mov dx,2040h
    
    lea bx,palabra
    mov si,00h
    mov cx,0Ah
    printWord:
        mov al,[bx][si]
        out dx,al
        add dx,2
        inc si
    loop printWord   