org 100h

.data
    a db 01h
      db 03h
      db 07h
      db 0fh
      
.code
    ciclo:
        mov cx,4
        mov si,0
        mov bx,offset a
        mov dx,2070h
        printLed:
            mov al,[bx][si]
            out dx,al
            inc si
        loop printLed
    HLT