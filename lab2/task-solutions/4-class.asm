bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    d db 10
    e dw 10
    f dw 10

; our code starts here
segment code use32 class=code
    start:
        ; f*(e-2)/[3*(d-5)]
     mov AL, [d]
     sub AL, 5
     mov BL, 3
     mul BL ; BL * AL = AX
     mov CX, [f]
     mov BX, [e]
     sub BX, 2
     mov DI, AX
     mov AX, CX
     mul BX ; BX * AX = DX:AX
     div DI

        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
 