bits 32 

global start        
extern exit               
import exit msvcrt.dll    
; x+(2-a*b)/(a*3)-a+c; a-byte; b-word; c-doubleword; x-qword (signed and unsigned)
segment data use32 class=data
    ; declare variables
    a db 1
    b dw 2
    c dd 3
    x dq -2

segment code use32 class=code
    start:
        mov AL, [a] ; AL = a
        cbw ; AX = a
        imul word [b] ;  DX:AX= a*b

        push DX
        push AX
        pop EAX

        mov EBX, 2 ; EBX=2
        sub EBX,EAX ; EBX = 2-a*b

        mov AL, [a] ; AL=a
        mov CL, 3 ; CL=3
        mul CL ; AX=a*3

        mov CX,AX

        push EBX
        pop AX
        pop DX

        idiv CX ; AX = (2-a*b)/(a*3)
        cwde
        push EAX

        mov AL, [a]
        cbw
        cwde
        mov EBX,EAX

        pop EAX
        sub EAX,EBX
        add EAX, dword [c]

        cdq

        mov EBX, [x]
        mov ECX, [x+4]

        add EAX,EBX
        adc EDX,ECX


        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program