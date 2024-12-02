;Hernandez Prado Osmar Javier
;Equipo 9 (El resto de integrantes hicieron otras versiones, por eso hice esta)
org 100h

.DATA
    paso db 0h
    
.CODE
    mov ax,@data
    mov ds,ax
    
    mov bx,offset paso
    mov dx,2084h
    in al,dx
    
    mov cl,al
    and cl,07h
    
    shr al,3
    mov ch,al
    and ch,07h
    
    shr al,3
    mov ah,al
    and ah,03h
    
    cmp ah,00h
    je suma
    cmp ah,01h
    je resta
    cmp ah,02h
    je multi
    cmp ah,03h
    je division
    
    suma:
        add ch,cl
        mov al,ch
        jmp imprimir
        
    resta:
        sub ch,cl
        mov al,ch
        jmp imprimir
    
    multi:
        mov ah,0
        mov al,ch
        mul cl
        jmp imprimir
    
    division:
        mov ah,0
        mov al,ch
        div cl
        jmp imprimir
        
    
    imprimir:
        mov ah,0
        mov ch,0Ah
        div ch
        mov dx,2030h
        jmp checkNumber
        
    imprimir2:
        inc [bx],1
        mov dx,2031h
        mov al,ah
    
    checkNumber:
        cmp al,00h
        je mostrar0
        cmp al,01h
        je mostrar1
        cmp al,02h
        je mostrar2
        cmp al,03h
        je mostrar3
        cmp al,04h
        je mostrar4
        cmp al,05h
        je mostrar5
        cmp al,06h
        je mostrar6
        cmp al,07h
        je mostrar7
        cmp al,08h
        je mostrar8
        ja mostrar9 
    
    
    mostrar0:
        mov al,3fh
        out dx,al
        jmp end
        
    mostrar1:
        mov al,06h
        out dx,al
        jmp end
        
    mostrar2:
        mov al,5bh
        out dx,al
        jmp end
    
    mostrar3:
        mov al,4fh
        out dx,al
        jmp end
    
    mostrar4:
        mov al,66h
        out dx,al
        jmp end
    
    mostrar5:
        mov al,6dh
        out dx,al
        jmp end
    
    mostrar6:
        mov al,7dh
        out dx,al
        jmp end
    
    mostrar7:
        mov al,47h
        out dx,al
        jmp end
    
    mostrar8:
        mov al,7fh
        out dx,al
        jmp end
    
    mostrar9:
        mov al,6fh
        out dx,al
        jmp end
        
    end:
        cmp [bx],0h
        je imprimir2
        hlt
    