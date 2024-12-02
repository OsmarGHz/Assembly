Repetir:
    MOV Dx, 2084h
    IN AL,Dx  
    
    MOV AH,AL
    
    AND AL,0Fh
    MOV BL,AL
    
    SHR AH,4
    MOV Dx,2030h
    
    CMP AH,AL
    JNBE    Mayor
    JZ      Igual
    JNAE    Menor  
    
    
    Mayor:  MOV AL,77h
            OUT Dx,AL
            MOV Dx,2031h
            MOV AL,01h
            JMP CasiFin
    Igual:  MOV AL,79h
            OUT Dx,AL
            MOV Dx,2031h
            MOV AL,40h
            JMP CasiFin
    Menor:  MOV AL,7Fh
            OUT Dx,AL
            MOV Dx,2031h
            MOV AL,08h
            JMP CasiFin
            
    CasiFin:OUT Dx,AL   
    
    SUB AH,AL
     
    
JMP Repetir
        