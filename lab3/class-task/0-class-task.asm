bits 32 

global start        
extern exit               
import exit msvcrt.dll    

segment data use32 class=data
    ; declare variables

segment code use32 class=code
    start:
        ; c+(a*a-b+7)/(2+a), a-byte; b-doubleword; c-qword
        ; signed representation and unsigned representation
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
