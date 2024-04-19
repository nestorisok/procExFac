; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

.STACK 4096

.DATA
n DWORD 6
r DWORD 2
result DWORD ?

.CODE
_MainProc PROC

mov EAX, n
mov EBX, r

MyPerm PROC
push EBP		; begin stack
mov EBP, ESP	; getting stack itself
push EBX		; pushes r [EBP + 8]
push EAX		; pushes n [EBP + 12]

inFac:
cmp EAX, 1
jle LEND
dec EAX
imul EAX, DWORD PTR[EBP + 8]
loop inFac


sub EAX, EBX	; EAX now contains n - r
cmp EAX, 0		; if EAX is 0, we leave the stack
jz LEND




LEND:
pop EAX
pop EBX
mov EBP, ESP
pop EBP
ret

MyPerm PROC


_MainProc ENDP

END                             ; end of source code



