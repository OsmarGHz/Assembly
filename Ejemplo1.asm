MOV Ax,0x0FFF
CMP Ax,0x1000
JNAE Verdadero
JMP Falso

Verdadero:  MOV Bx, 0x0001
            JMP Fin
            
Falso: MOV Bx,0x0000

Fin: NOP