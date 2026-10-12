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
    b   db 3
    c   db 5
    d   db 6
    e   dw 10
    f   dw 12
    g   dw 25
    h   dw 2
    ; a, b, c, d - byte
    ; e, f, g, h - word


; our code starts here
segment code use32 class=code
    start:
        ; (e+g-h)/3+b*c
        ;in bx i will have e+g-h
        mov     BX, word[e]
        ADD     BX, word[g]
        SUB     BX, word[h]
        mov     AX, BX ; in AX, the lower bit we have e+g-h and we put 0 in DX because it s divison on word DX:AX
        mov     DX, 0
        mov     BX, 3 ;we put 3 in BX
        div     BX ;we performed (e+g-h)/3 and in AX we should have the quotient and in DX the reminder
        mov     BX,AX ; we put the quotient in BX because we need the AX for multiplication
        mov     AL, byte[b]
        mul     byte[c]
        ADD     AX,BX ; now, in AX we should have the final result
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
