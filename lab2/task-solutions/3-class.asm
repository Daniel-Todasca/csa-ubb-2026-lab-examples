bits 32 

global start        
extern exit               
import exit msvcrt.dll    

segment data use32 class=data
    a db 1
    b db 2
    e dw 0x123
    f dw 4
    ; declare variables

segment code use32 class=code
    start:
        MOV EAX, dword[a] 
        ; a,b,c,d-byte, e,f,g,h-word
        ; unsigned representation
        mov AX, word [f] ;AX takes value of f
        ADD AX, word[e] ;AX takes e+f
        mov BL, byte[a] ;BX takes value a
        ADD BL, byte[a] ;BX takes value 2*a
        ADD BL, byte[b]
        ADD BL, byte[b]
        ADD BL, byte[b] ;BX takes 3*b
        MOV BH, 0
        MUL BX  ;DX:AX <- AX*BX



        ; 11. (e+f)*(2*a+3*b)

        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program