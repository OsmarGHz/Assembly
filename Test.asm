org 100h

.data

.code

ciclo:
mov dx,2084h
in al,dx

cmp al,0x0f
je yes
jne no

yes:
    mov al,0xff
    jmp next 
    
no:
    mov al,0x00   
               
next:
mov dx,7h 
out dx,al

loop ciclo