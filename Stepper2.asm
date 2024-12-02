MOV Dx, 7h
MOV AL, 3h
OUT DX, AL

espera1:    IN AL, Dx
            AND AL, 80h
            CMP AL, 00h
            JE espera1 
            
MOV AL, 1h
OUT Dx,AL

espera2:    IN AL, Dx
            AND AL, 80h
            CMP AL, 00h
            JE espera2
            
MOV AL,6h
OUT Dx,AL

espera3:    IN AL,Dx
            AND AL, 80h
            CMP AL, 00h
            JE espera3
            
MOV AL, 2h
OUT Dx,AL

espera4:    IN AL,Dx
            AND AL, 80h
            CMP AL, 00h
            JE espera4
            
            
            