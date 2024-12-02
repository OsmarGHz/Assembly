;CONDICIONALES Y COMO PODEMOS LEER SWITCHES

;TABLA DE CONDICIONALES

;CONDICION       SALTO CONDICIONAL SIN SIGNO
    =                   JE  JZ
    >                   JA  JNBE
    <                   JB  JNAE
    >=                  JAE JNB
    <=                  JBE JNA
    !=                  JNE JNZ
    
;   BIT          SALTO CONDICIONAL
                    activa  no se activa
    ZF              JZ      JNZ
    CF              JC      JNC
    OF              JO      JNO
    SF              JS      JNS
    SP              JP      JNP    