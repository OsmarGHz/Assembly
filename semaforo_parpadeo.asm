org 100h

.DATA

        led db 00h
            db 02h 
            
        variable db 05h   
        contador db 02h   

.CODE

ciclo2: MOV bx, offset led   
        mov si, 0         
        mov cx, 2

ciclo:  mov dx, 4h      
        mov al, [bx][si]    
        out dx, al
        inc si
        MOV al,cx
        jmp ev_tiempo     
cont:   mov cx, al
        loop ciclo 
        
         MOV Bx, offset variable
         MOV Ax,[Bx]    
         dec Ax
         MOV [Bx],Ax 
         cmp Ax,00h
         je fin
         jne ciclo2   
         
ev_tiempo:    MOV AH, AL
              MOV Dx,2084h  
              IN AL,Dx
              AND AL,01h 
              CMP AL,01h
              JE mediosegundo
              JNE segundo
              
mediosegundo:  MOV AL, AH 
               MOV Cx,07h
               Mov Dx,0xA120
               MOV AH,86h
               INT 15h    
               jmp cont          

segundo:       MOV AL, AH 
               MOV Cx,0Fh
               MOV Dx,4240h
               MOV AH,86h
               INT 15h   
               jmp cont
                  
            
              
                       
fin: HLT
        
;1000000 us = 0F4240