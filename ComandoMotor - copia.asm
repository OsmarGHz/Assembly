ORG 100h

;va desde 9-8-7-6-5-4-3-2-1-0
.DATA          
               ;H G F E D C B A 
display db 67h ;0 1 1 0 0 1 1 1
        db 7Fh ;0 1 1 1 1 1 1 1
        db 47h ;0 1 0 0 0 1 1 1
        db 7Dh ;0 1 1 1 1 1 0 1
        db 6Dh ;0 1 1 0 1 1 0 1
        db 66h ;0 1 1 0 0 1 1 0
        db 4Fh ;0 1 0 0 1 1 1 1
        db 5Bh ;0 1 0 1 1 1 0 1
        db 06h ;0 0 0 0 0 1 1 0
        db 3Fh ;0 0 1 1 1 1 1 1 
                                                       
        
        ;comienza desde 1-0-9-8-7-6-5-4-3-2-1-0
                  
                       ;H G F E D C B A
display_decenas db 06h ;0 0 0 0 0 1 1 0
                db 3Fh ;0 0 1 1 1 1 1 1
                db 67h ;0 1 1 0 0 1 1 1
                db 7Fh ;0 1 1 1 1 1 1 1
                db 47h ;0 1 0 0 0 1 1 1
                db 7Dh ;0 1 1 1 1 1 0 1
                db 6Dh ;0 1 1 0 1 1 0 1
                db 66h ;0 1 1 0 0 1 1 0
                db 4Fh ;0 1 0 0 1 1 1 1
                db 5Bh ;0 1 0 1 1 1 0 1
                db 06h ;0 0 0 0 0 1 1 0
                db 3Fh ;0 0 1 1 1 1 1 1  
                     
                ;solo tiene el 1-0
                     
                       ;H G F E D C B A
display_centena db 67h ;0 1 1 0 0 1 1 1
                db 7Fh ;0 1 1 1 1 1 1 1
                db 47h ;0 1 0 0 0 1 1 1
                db 7Dh ;0 1 1 1 1 1 0 1
                db 6Dh ;0 1 1 0 1 1 0 1
                db 66h ;0 1 1 0 0 1 1 0
                db 4Fh ;0 1 0 0 1 1 1 1
                db 5Bh ;0 1 0 1 1 1 0 1
                db 06h ;0 0 0 0 0 1 1 0
                db 3Fh ;0 0 1 1 1 1 1 1
        
cont dw 0h 
cont2 dw 0h 
temp_SI dw 0h   ; Variable para guardar SI 
cont3 dw 0h
temp_SI2 dw 0h

  
mBienvenida1 db "Bienvenidos a nuestro proyecto Final!$"
mBienvenida2 db "Ahora eres el usuario Dinamita!$"
mBienvenida3 db "Comandos disponibles:$"
mBienvenida4 db "MOTOR$"
mBienvenida5 db "KABOOM$"
mBienvenida6 db "TEMPO$"
mBienvenida7 db "ASCII$"
mBIenvenida8 db "CLEAR$" 
mBIenvenida9 db "EXIT$"
mBienvenida10 db "Cuando aparezca la ruta de tu usuario, ingresa un comando valido (MAYUS o minus)$" 
EVITAUSAR db "EVITA USAR BACK, SPACE, TAB...$" 

guardarPalabra dw 00h

contador db 00h

mensaje1 db "Disco Local C:\Users\Dinamita> $"
mensaje2 db "PARA DETENER ENCIENDA CUALQUIER SWITCH$"
mensaje3 db "comando no encontrado$"
mensaje4 db "motor terminado$" 
MENSAJE_CONTRASENA_KABOOM db "ENCIENDE LOS 4 SWITCHES CORRECTOS PARA DESCATIVAR LA BOMBA$"
TEMPOO_DETENER db "ENCIENDA CUALQUIER INTERRUPTOR PARA DETENER$"
giro1 db 3h
      db 1h
      db 6h
      db 2h
      
peticion db "Ingrese 10 caracteres, los reimprimiremos!: $"
palabra_ASCII db 10 dup ('$')  
COPIA_PALABRA db "Los caracteres ingresados son: $"
avisoPeticion db "Los caracteres han sido impresos en la pantalla ASCII$"

.CODE

MAIN PROC
     
     CALL BIENVENIDA
  
MAIN ENDP

BIENVENIDA PROC
    CALL saltoLinea
    
    MOV Ah, 09h
    MOV Dx, offset mBienvenida1
    INT 21h
    CALL saltoLinea
    
    MOV Ah, 09h
    MOV Dx, offset mBienvenida2
    INT 21h
    CALL saltoLinea
    CALL saltoLinea
    
    MOV Ah, 09h
    MOV Dx, offset mBienvenida3
    INT 21h
    CALL saltoLinea
    
    CALL tabulacion
    MOV Ah, 09h
    MOV Dx, offset mBienvenida4
    INT 21h
    CALL saltoLinea
    
    CALL tabulacion
    MOV Ah, 09h
    MOV Dx, offset mBienvenida5
    INT 21h
    CALL saltoLinea
    
    CALL tabulacion
    MOV Ah, 09h
    MOV Dx, offset mBienvenida6
    INT 21h
    CALL saltoLinea
    
    CALL tabulacion
    MOV Ah, 09h
    MOV Dx, offset mBienvenida7
    INT 21h
    CALL saltoLinea
    
    CALL tabulacion
    MOV Ah, 09h
    MOV Dx, offset mBienvenida8
    INT 21h
    CALL saltoLinea
    
    CALL tabulacion
    MOV Ah, 09h
    MOV Dx, offset mBienvenida9
    INT 21h
    CALL saltoLinea

    MOV Ah, 09h
    MOV Dx, offset mBienvenida10
    INT 21h
    CALL saltoLinea
     
    MOV Ah, 9h
    LEA Dx, EVITAUSAR
    INT 21h  
    CALL saltoLinea
    
    CALL COMPARAR_PALABRAS
         
    RET
    
    
BIENVENIDA ENDP
    

COMPARAR_PALABRAS PROC
    inicio:
        CALL saltoLinea
        MOV Dx, offset mensaje1
        MOV Ah, 09h
        INT 21h
    
        CALL leerPalabra 
        CALL saltoLinea
        MOV [contador], 00h
        MOV Bx, [guardarPalabra]
        CMP Bx, 0x0231
        JE  girarMotor
        CMP Bx, 0x0191
        JE  girarMotor
        JNE noMotor 
        continuar1:
        CMP Bx, 0x0167
        JE  REINICIO
        
            CMP [contador], 00h
            JNE inicio
            
            CALL saltoLinea
            MOV Dx, offset mensaje4
            MOV Ah, 09h
            INT 21h
            
            CALL FIN 
    girarMotor:
    CALL GIRAR_MOTOR_FUNCION
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1
            
    noMotor:
    CMP Bx, 0x01B9
    JE KABOOM
    CMP Bx, 0x0279
    JE KABOOM
    JNE NO_KABOOM
    
    
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1
    
    KABOOM:
    CALL KABOOM_FUNCION
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1
    
    NO_KABOOM: 
    CMP Bx, 0X0185
    JE TEMPO
    CMP Bx, 0X0225
    JE TEMPO
    JNE NO_TEMPO
    
    TEMPO:
    CALL TEMPO_FUNCION
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1
    
    NO_TEMPO:
    CMP Bx, 0X0169
    JE ASCII
    CMP Bx, 0X0209
    JE ASCII
    JNE NO_ASCII
    
    ASCII:
    CALL ASCII_FUNCION
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1
    
    NO_ASCII:
    CMP Bx, 0x013A
    JE EXITPROGRAM
    CMP Bx, 0x01BA
    JE EXITPROGRAM
    JNE NOEXITPROGRAM
    
    EXITPROGRAM:
    CALL FIN
    
    NOEXITPROGRAM:
    CMP Bx, 0x0167
    JE CLEAR
    CMP Bx, 0x0207
    JE CLEAR
    JNE NO_CLEAR
    
    CLEAR: 
    CALL CLEAR_FUNCION
    MOV Bx, 0x0167
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1
    
    NO_CLEAR:
    MOV Dx, offset mensaje3
    MOV Ah, 09h
    INT 21h
         
    MOV [guardarPalabra], 00h
    MOV [contador], 01h
    JMP continuar1   
    
    REINICIO: 
    CALL BIENVENIDA

COMPARAR_PALABRAS ENDP

leerPalabra PROC
    MOV [contador], 00h
    
    Ciclo1:
        ADD [contador], 01h
        MOV Ah, 01h
        INT 21h
        CMP Al, 0Dh
        JE  regresar
        CMP Al, 08h
        JE regresar
        CMP Al, 20h
        JE regresar
        CMP Al, 09h
        JE regresar
        CMP [contador], 0Bh
        JE  regresar
        MOV AH, 00h
        ADD [guardarPalabra], ax
        MOV Al, 00h
        JMP Ciclo1 
        
        regresar: 
        RET
    
leerPalabra ENDP
    
saltoLinea PROC
        
    mov ah, 02h       
    mov dl, 13        
    int 21h           

    mov ah, 02h       
    mov dl, 10        
    int 21h           
    ret
    
saltoLinea ENDP

tabulacion PROC
    
    mov ah, 02h
    mov dl, 9
    int 21h
    ret
tabulacion ENDP

FIN PROC
    
    hlt
    
FIN ENDP 
 

  GIRAR_MOTOR_FUNCION PROC      
    MOV Dx, offset mensaje2
    MOV Ah, 09h
    INT 21h 
    
    MOV Dx, 2084h
    MOV AL, 00h
    OUT Dx, AL
    
    vuelta: 
        MOV Dx, 07h
        MOV SI, 0
        MOV Cx, 4h
        MOV BX, offset giro1
                                 
        ciclo:
            MOV AL, [Bx][SI]
            OUT Dx, AL
            INC SI
            esperar1: 
                IN AL, Dx
                AND AL, 80h
                CMP AL, 00h
                JE esperar1
                
                CMP SI, 03h
                JBE ciclo
                MOV Dx, 2084h
                IN  AL, Dx
                CMP AL, 00h
                JNE RETORNA
                JMP vuelta 
        RETORNA: 
        RET

  GIRAR_MOTOR_FUNCION ENDP   
  
  REINICIAR_SWITCHES PROC
       MOV Dx, 2084h
        MOV Ax, 00h
        OUT Dx, Ax   
        RET
  REINICIAR_SWITCHES ENDP 
  
  KABOOM_FUNCION PROC 
    CALL REINICIAR_SWITCHES
        CALL saltoLinea   
         MOV Ah, 9h
         LEA Dx, MENSAJE_CONTRASENA_KABOOM
         INT 21h 
         
       
       MOV SI, 0
       MOV Cx, 12h 
       
       MOV Bx, offset display_centena ; se imprime el 1
       MOV Dx, 2030h
       MOV Al, [Bx][8]
       OUT Dx, Al 
       
       MOV Dx,127 ;se enciende el termometro (boiler)
       MOV AL, 0x01
       OUT Dx,AL
        
       CUENTA_DECENAS:
       MOV Bx, offset display_decenas;se comienza el ciclo de las decenas 
       MOV Dx, 2031h
       MOV Al, [Bx][Si]
       OUT Dx, Al
       INC SI
       MOV [cont2], Cx
       MOV [temp_SI], Si ;se guardan los controladores de las decenas en variables
                                
       MOV Bx, offset display 
       MOV SI, 0               
       MOV Cx, 10
       cuen: 
            MOV Bx, offset display ;se reasigna el display
            MOV Dx, 2032h;ciclo de las unidades
            MOV Al, [Bx][Si]
            OUT Dx, AL
            INC SI      
            MOV [cont],Cx
            CALL TIEMPO
            MOV Cx, [cont]
            
            MOV Dx, 2084h ;compara la entrada de los switches con la correcta
            IN  Ax, Dx
            MOV Bx, 0x00A6
            CMP Ax, Bx
            JE APAGAR_BOMBA ;salta a terminar la ejecucion
  
            LOOP cuen  
             
       MOV Cx,[cont2]
       MOV Si,[temp_SI] ;si el ciclo de las decenas hizo las primeras dos iteraciones
       CMP SI, 2
       JE 0_CENTENA
       JNE SEGUNDO_COMP
       
       0_CENTENA:
       MOV Bx, offset display_centena ;se imprime el 0 de las centenas
       MOV Dx, 2030h
       MOV Al, [Bx][9]
       OUT Dx, Al   
                                                                
       SEGUNDO_COMP:
       CMP SI,12 ;si ya fueron los 12 ciclados de las decenas
       JE  TERMINAR
       JNE SEGUIR
       TERMINAR:
       MOV Cx, 5
       EXPLOTA:
       MOV Ah, 02h
       MOV Dx, 07h
       INT 21h
       LOOP EXPLOTA 
       HLT
       RET        
       
       SEGUIR:   
         
       LOOP CUENTA_DECENAS
       
       APAGAR_BOMBA:
       MOV Dx,127 ;se apaga el (boiler)
       MOV AL, 0x00
       OUT Dx,AL
    RET
       
  KABOOM_FUNCION ENDP 
  
  TIEMPO PROC 
        
        MOV Cx, 1h
        MOV Dx, 0x638D
        MOV Ah, 86h
        INT 15h
        
    RET
    TIEMPO ENDP
  
  TEMPO_FUNCION PROC
       CALL REINICIAR_SWITCHES
       CALL saltoLinea
       MOV Dx, offset mensaje2
    MOV Ah, 09h
    INT 21h 
    
    
    MOV SI, 9
       MOV Cx, 10 
       
       CUENTA_CENTENAS_TEMPOO:
       MOV Bx, offset display_centena;se comienza el ciclo de las decenas 
       MOV Dx, 2030h
       MOV Al, [Bx][Si]
       OUT Dx, Al
       DEC SI
       MOV [cont3], Cx
       MOV [temp_SI2], Si ;se guardan los controladores de las decenas en variables
                                
       MOV Bx, offset display 
       MOV SI, 11               
       MOV Cx, 10
       
       CUENTA_DECENAS_TEMPOO:
       MOV Bx, offset display_decenas;se comienza el ciclo de las decenas 
       MOV Dx, 2031h
       MOV Al, [Bx][Si]
       OUT Dx, Al
       DEC SI
       MOV [cont2], Cx
       MOV [temp_SI], Si ;se guardan los controladores de las decenas en variables
                                
       MOV Bx, offset display 
       MOV SI, 9               
       MOV Cx, 10
       CUENTA_UNIDADES_TEMPOO: 
            MOV Bx, offset display ;se reasigna el display
            MOV Dx, 2032h;ciclo de las unidades
            MOV Al, [Bx][Si]
            OUT Dx, AL
            DEC SI      
            MOV [cont],Cx
            CALL TIEMPO_TEMP
            MOV Cx, [cont]
            
            MOV Dx, 2084h ;compara la entrada de los switches con la correcta
            IN  Ax, Dx
            MOV Bx, 00h
            CMP Ax, Bx
            JNE APAGAR_TEMPOO ;salta a terminar la ejecucion
  
            LOOP CUENTA_UNIDADES_TEMPOO  
             
       MOV Cx,[cont2]
       MOV Si,[temp_SI]
  
       LOOP CUENTA_DECENAS_TEMPOO
        MOV Cx,[cont3]
        MOV Si,[temp_SI2]
       
       LOOP CUENTA_CENTENAS_TEMPOO
        
       APAGAR_TEMPOO:
       RET  
    
  TEMPO_FUNCION ENDP 
  
  TIEMPO_TEMP PROC
        
        MOV Cx, 0Fh
        MOV Dx, 4240h
        MOV Ah, 86h 
        INT 15h
        RET
    
    TIEMPO_TEMP ENDP
  
    ASCII_FUNCION PROC
        
        CALL saltoLinea
        mov ah,09h
    lea dx,peticion
    int 21h
    
    mov cx,0Ah    
    leerChar:
        mov ah,01h
        int 21h
        push ax
    loop leerChar
    
    lea bx,palabra_ASCII
    mov cx,0x0A
    mov si,0x09
        
    pasarChar:      
        pop ax
        mov [bx][si],al ;RECUERDA GUARDAR TUS LETRAS DESDE AL
        dec si
    loop pasarChar

    
    CALL saltoLinea 
    
    mov ah,0x86
    mov cx,0x0f
    mov dx,4240h
    int 15h
    
    
    mov ah,09h
    lea dx,COPIA_PALABRA
    int 21h 
    mov si,0x0A
    mov [bx][si],'$'
    
    mov ah,09h
    lea dx,palabra_ASCII
    int 21h
    
    ;Imprimir en ASCII Display
    mov dx,2040h
    
    lea bx,palabra_ASCII
    mov si,00h
    mov cx,0Ah
    printWord:
        mov al,[bx][si]
        out dx,al
        add dx,2
        inc si
    loop printWord
    
    CALL saltoLinea
    
    ;Avisar que ya se imprimio
    mov ah,09h
    lea dx,avisoPeticion
    int 21h
    
    RET
        
    ASCII_FUNCION ENDP
    
    CLEAR_FUNCION PROC
        MOV Ah, 06h         
        MOV Al, 0           
        MOV Bh, 07h         
        MOV Cx, 0000h      
        MOV Dx, 184Fh       
        INT 10h
        
        MOV Ah, 02h         
        MOV Bh, 0          
        MOV Dh, 0          
        MOV Dl, 0          
        INT 10h            

        RET

    CLEAR_FUNCION ENDP
    
END MAIN