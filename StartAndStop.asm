JMP Start

palabraSt db 53h
          db 54h
          db 41h
          db 82h
          db 84h
          
palabraEn db 69h
          db 78h
          db 68h
        
giro1   db 3h
        db 1h
        db 6h
        db 2h
      
giro2   db 6h
        db 4h
        ;completar giro2 
        
Start:
    MOV Dx,2040h
    MOV Bx,offset palabraSt
    MOV SI,0
    
    MOV Cx,5h
    
CicloStart:
    MOV AL,[Bx][SI]
    OUT Dx,AL
    ADD Dx,2h
    INC SI
    Loop CicloStart
    
     
inicio:      
MOV Dx,7h
MOV SI,0
MOV Cx,4h
MOV Bx, offset giro1 

ciclo: MOV AL,[Bx][SI]
       OUT Dx,AL
       INC SI
esperar: IN AL,Dx
       AND AL, 80h
       CMP AL,00h 
       JE esperar
       loop ciclo
       
MOV SI,0h
MOV Cx,4h
MOV Bx, offset giro2
  
ciclo2: MOV AL,[Bx][SI]
       OUT Dx,AL
       INC SI
esperar2: IN AL,Dx
       AND AL, 80h
       CMP AL,00h 
       JE esperar2
       loop ciclo2
       
End:
    MOV Dx,2040h
    MOV Bx,offset palabraEn
    MOV SI,0
    
    MOV Cx,3h
    
CicloEnd:
    MOV AL,[Bx][SI]
    OUT Dx,AL
    ADD Dx,2h
    INC SI
    Loop CicloEnd
