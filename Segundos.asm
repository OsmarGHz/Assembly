.DATA

.CODE
ciclo:  mov dx, 2048h
        in ax,dx
        and ax,01h
        cmp ax,01h
        je mediosegundo
        jne segundo

mediosegundo: mov cx,07h
              mov dx,0xa120
              mov ah,86h
              int 15h
              jmp ciclo
              
segundo:      mov cx,0fh
              mov dx,4240h
              mov ah,86h
              int 15h
              jmp ciclo