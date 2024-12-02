org 100h ;por si acaso
.data
.code
    mov dx,2084h
    in al,dx
    mov dx,2030h
    cmp al,0fh
    ja showHi
    jna showLow
    
    showHi:
        mov al, 76h
        out dx,al
        jmp end
    showLow: 
        mov al, 38h
        out dx,al
        jmp end
    end:
        HLT
    
