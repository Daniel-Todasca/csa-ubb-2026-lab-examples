bits 32 

global start        
extern exit               
import exit msvcrt.dll    

segment data use32 class=data
    ; declare variables

segment code use32 class=code
    start:
        ; a,b,c,d-byte, e,f,g,h-word
        ; SIGNED representation
        
        ; 11. (e+f)*(2*a+3*b)
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
