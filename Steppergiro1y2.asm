jmp inicio

giro1 db 3h
      db 1h
      db 6h
      db 2h
      
giro2 db 6h
      db 4h
      db 3h
      db 2h
      ;completar giro2
      
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
     
;Para ciclo 2  
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
