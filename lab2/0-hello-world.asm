bits 32
global start        
extern exit 
import exit msvcrt.dll

; EXAMPLE TASK:
; compute x + y + 5
; use variables for declaring the values of x and y
; 0 <= x <= 255 and 0 <= y <= 255

; i.e. x=10 and y=20 => x+y+5 = 10+20+5 = 35

; FIRST PART OF ANY ASSEMBLY PROGRAM - data segment for data declaration
segment data use32 class=data
    x dw 10  ;  (10)10 = (A)16
    y dw 20  ;  (20)10 = 16 + 4 = (14)16
    
    
; Most assembly instructions have the following syntax:
; INSTR_NAME DEST, OPERAND
; mov EBX, 0         EBX = 0

; mov DEST, VALUE 
; DEST and VALUE must have the same representation range (datatype)


; mov EAX, ECX
; CANNOT: mov EAX, BL
    
; SECOND PART OF ANY ASSEMBLY PROGRAM - code segment for the actual code
segment code use32 class=code
    start:
        ; !!!!! always clean your registers!
        mov EAX, 0 ; EAX = 0
        mov EBX, 0 ; EBX = 0
        
        mov AX, word [x]  ; AL = x = 10
        mov BX, word [y]  ; BL = y = 20

        add AX, BX        ; AL = AL + BL = x + y = 30
        add AX, 5         ; AL = AL + 5 = x + y + 5 = 35
    
        ; exit(0)
        push    dword 0
        call    [exit]