org 100h

.DATA
    numero1 db 07h
    numero2 db 07h
    opera db 03h
    
.CODE

    mov dx,2084h
    in al,dx
    
    mov bx,offset numero2
    and [bx],al
    
    mov bx,offset numero1
    shr al,3
    and [bx],al
    
    mov bx,offset opera
    shr al,3
    and [bx],al
    mov si,[bx]
    and si,03h
    
    mov bx,offset numero1
    mov al,[bx]
    mov bx,offset numero2
    
    cmp si,00h
    je suma
    cmp si,01h
    je resta
    cmp si,02h
    je multi
    cmp si,03h
    je division
    
    suma:
        add al,[bx]
        mov [bx],al
        jmp imprimir
        
    resta:
        sub al,[bx]
        mov [bx],al
        jmp imprimir
    
    multi:
        mul [bx]
        mov [bx],al
        jmp imprimir
    
    division:
        div [bx]
        mov [bx],al
        jmp imprimir
        
    
    imprimir:
        mov dx,2030h
        mov bx,offset numero1
        jmp checkNumber
    
    checkNumber:
        cmp [bx],00h
        je mostrar0
        cmp [bx],01h
        je mostrar1
        cmp [bx],02h
        je mostrar2
        cmp [bx],03h
        je mostrar3
        cmp [bx],04h
        je mostrar4
        cmp [bx],05h
        je mostrar5
        cmp [bx],06h
        je mostrar6
        cmp [bx],07h
        je mostrar7
        cmp [bx],08h
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
        hlt
    
    ;mov al,[bx]
    ;out dx,al 