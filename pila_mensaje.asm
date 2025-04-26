   org 100h
   
   .data
   
   mensaje db "Ingresa la palabra: $"
   palabra db 5 dup('$') 
   
   .code
   
   mov ax, @data
   mov ds, ax
   
   mov ah, 9h        ; interrupcion para mostrar mensaje
   lea dx, mensaje
   int 21h
   
   mov cx, 5
   leer_caracteres:
       mov ah, 01h   ; interrupcion para leer un caracter
       int 21h
       push ax
   loop leer_caracteres     
    
   lea bx, palabra 
   mov si, 0
   mov cx, 5
   
   dpila:  pop ax
           mov [bx][si], al 
           ;mov palabra[si], al  
           inc si
           loop dpila 
           
           
   mov [bx][si], '$'  
   ;mov palabra[si], '$'      
           
   mov ah, 9h
   ;lea dx, palabra
   lea dx, palabra
   int 21h          