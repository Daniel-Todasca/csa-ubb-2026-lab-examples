bits 32 

global start        
extern exit               
import exit msvcrt.dll    
; f*(e-2)/[3*(d-5)]
segment data use32 class=data
    ; declare variables
    d db -2
    e dw 5
    f dw 67

segment code use32 class=code
    start:
        ; a,b,c,d-byte, e,f,g,h-word
        ; unsigned representation
        mov EAX, 0
        mov EBX, 3
        mov ECX, 0
        mov EDX, 0

        ; 3*(d-5)
        mov AL, byte [d]
        sub AL, 5
        mov BL, AL

        ; f*(e-2)
        mov AX, word [f]

        mov CX, word [e]
        sub CX, 2
        imul CX
        mov ECX,EAX
        mov AL,BL
        CBW
        mov BX,AX
        mov EAX,ECX
        idiv BX

        ; 15. 

        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program