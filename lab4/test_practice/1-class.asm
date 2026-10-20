bits 32 

global start        
extern exit               
import exit msvcrt.dll    
;x+(2-a*b)/(a*3)-a+c
;a-byte; b-word; c-doubleword; x-qword (signed)
segment data use32 class=data
    a db 3
    b dw 4
    c dd 2
    x dq 1
segment code use32 class=code
    start:
        MOV EBX, [c] ; EBX = c
        MOV AL, [a] ; AL = a
        cbw ; AX = AL
        cwde ;EAX = AX
        SUB EBX, EAX ; EBX = EBX -EAX = c - a
        push EBX ; pushed in stack 
        MOV BL, 3 ; BL = 3
        IMUL BL ; AX = AL*BL = a*3
        MOV CX, AX ; CX = AX
        MOV AL, [a] ; AL = a 
        cbw  ; AX = AL
        IMUL word[b] ; DX:AX = AX*b = a*b
        push DX ;push on stack
        push AX ; push on stack
        mov EAX, 2 ; EAX = 2
        pop EDX ; load from the stack
        SUB EAX, EDX ; EAX = 2-a*b
        push EAX ; push on stack
        pop AX
        pop DX ; DX:AX = EAX
        IDIV CX ; AX = DX:AX / CX
        pop EBX
        cwde ; EAX =AX
        ADD EAX, EBX ; EAX = EAX + EBX
        mov EBX, [x] ; least significant part of x 
        mov ECX, [x+4] ; most significant part of x 
        cdq ; EDX:EAX = EAX
        ADD EBX, EAX ; 
        ADC ECX, EDX ; ECX:EBX = EXC:EBX + EDX:EAX


        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program