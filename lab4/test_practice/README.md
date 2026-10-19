## Multiplications, divisions - Unsigned representation and signed representation
1. `x+(2-a*b)/(a*3)-a+c`; a-byte; b-word; c-doubleword; x-qword
(signed and unsigned)
2. `x/2+100*(a+b)-3/(c+d)+e*e`; a-byte; b-word; c-doubleword; x-qword
(signed and unsigned)
3. `(a*a+b/c-1)/(b+c)+d-x`; a-byte; b-word; c-doubleword; x-qword
(signed and unsigned)

## Bitwise operations
1. Given the word A, compute the doubleword B as follows:
the bits 28-31 of B have the value 1;
the bits 24- 25 and 26-27 of B are the same as the bits 8-9 of A
the bits 20-23 of B are the invert of the bits 0-3 of A ;
the bits 16-19 of B have the value 0
the bits 0-15 of B are the same as the bits 16-31 of B
2. Given the byte A and the word B, compute the doubleword C as follows:
the bits 0-7 of C have the value 1
the bits 8-11 of C are the same as the bits 4-7 of A
the bits 12-19 are the same as the bits 2-9 of B
the bits 20-23 are the same as the bits 0-3 of A
the bits 24-31 are the same as the high byte of B

## Also important
* understand what little endian is and reading hex dumps from the debugger (while presenting the solution)
