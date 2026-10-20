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
     mov EAX, 0
        ; DX:AX  /  AX
        ; f*(e-2)/(d-5)
     mov AL, [d] ; AL = d
     sub AL, 5   ; AL = d-5
     cbw
     push EAX ; stack contains: abcdefAL
     
     mov CX, [f] ; CX =f
     mov BX, [e] ; BX = e
     sub BX, 2   ; BX = e-2
     mov AX, CX ; AX = CX = f
     imul BX ; BX * AX = DX:AX = f*(e-2)
     
     pop EBX
        
     push EAX
     
     idiv BX

        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program