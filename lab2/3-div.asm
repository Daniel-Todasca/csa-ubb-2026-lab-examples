bits 32

global start

extern exit
import exit msvcrt.dll

; our data is declared here (the variables needed by our program)
segment data use32 class=data

; our code starts here
segment code use32 class=code
    start:
        ; !!!!! always clean your registers!
        mov EAX, 0
        mov ECX, 0
        
        ; word / byte = byte
        ; AX / <op> = AL, rest AH
        mov AX, 101
        mov CL, 10
        div CL
        
        ; dword / word = word
        ; DX:AX / <op> = AX, rest DX
        mov DX, 0
        mov AX, 10001
        mov CX, 10
        div CX
        
        ; qword / dword = dword
        ; EDX:EAX / <op> = EAX, rest EDX
        mov EDX, 0b1
        mov EAX, 0xFFFFFFFF
        mov ECX, 0b100
        div ECX
 
        ; error cases
        ; 1. division by 0
        mov ECX, 0
        div ECX
        
        ; 2. divide too large numbers
        mov EDX, -1
        mov EAX, -1
        mov ECX, 1
        div ECX
    
        ; exit(0)
        push    dword 0
        call    [exit]