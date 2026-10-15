bits 32 

global start        
extern exit               
import exit msvcrt.dll    

segment data use32 class=data
    ; declare variables
    a db 10
    b db 10

    e dw 100
    f dw 100

    q dq 0x123456789A

segment code use32 class=code
    start:
        ; a,b,c,d-byte, e,f,g,h-word
        ; unsigned representation

        mov AX, word [a]

        mov EAX, 0
        mov EBX, 0

        mov AL, 2
        mul byte [a]
        add BX, AX

        mov AL, 3
        mul byte [b]
        add BX, AX

        mov AX, word [e]
        add AX, word [f]

        mul BX        

        ; 11. (e+f)*(2*a+3*b)

        ; (100 + 100)*(20 + 30)
        ; 200 * 50
        ; 10000

        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program