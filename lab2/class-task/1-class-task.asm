bits 32 

global start        
extern exit               
import exit msvcrt.dll    

segment data use32 class=data
    ; declare variables

segment code use32 class=code
    start:
        ; a,b,c,d-byte, e,f,g,h-word
        ; unsigned representation
        
        ; 15. f*(e-2)/[3*(d-5)]
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
