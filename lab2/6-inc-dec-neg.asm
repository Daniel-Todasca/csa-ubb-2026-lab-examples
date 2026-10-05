bits 32

global start

extern exit
import exit msvcrt.dll

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    varb db 0

; our code starts here
segment code use32 class=code
    start:
        mov byte [varb], -1
        inc byte [varb]
        
        mov EAX, 1
        inc EAX
        dec EAX
        dec EAX
    
        ; exit(0)
        push    dword 0
        call    [exit]