bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a   db 2
    b   db 5
    c   db 3
    d   db 10
    f   dw 101
    g   dw 27
    h   dw 6
    ; a, b, c, d - byte
    ; e, f, g, h - word

; our code starts here
segment code use32 class=code
    start:
        ; h/a + (2 + b) + f/d – g/c 
        mov     EAX, 0
        mov     EBX, 0
        
        mov     AX, [h]
        div     byte[a]
        mov     AH, 0
        
        mov     BL, [b]
        add     BL, 2
        add     AL, BL
        
        mov     BL, AL
        mov     AX, [f]
        div     byte[d]
        mov     AH, 0
        add     BL, AL
        
        mov     AX, [g]
        div     byte[c]
        mov     AH, 0
        sub     BL, AL
        
        mov     AL, BL
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
