JMP inicio

palabra db 48h
        db 4Fh
        db 4Ch
        db 41h 
        
inicio:
    MOV Dx,2040h
    MOV Bx,offset palabra
    MOV SI,0
    
    MOV Cx,4h
    
Ciclo:
    MOV AL,[Bx][SI]
    OUT Dx,AL
    ADD Dx,2h
    INC SI
    Loop Ciclo
    
