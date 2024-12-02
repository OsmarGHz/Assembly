mov ah,00h
ciclo:  mov dx,2084h
        in al,dx
        and al,01h
        cmp al,01h
        je incremento
        jne decremento 
;Entradas y salidas SIEMPRE en AL

incremento: inc ah
            jmp leds
            
decremento: dec ah
            jmp leds
            
leds:       mov dx,2070h
            mov al,ah
            out dx,al
            jmp ciclo
