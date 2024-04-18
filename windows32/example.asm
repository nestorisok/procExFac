; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
n DWORD 6
r DWORD 2
result DWORD ?

.CODE
_MainProc PROC

mov EBX, n
call myFac

myFac PROC
push EBP
mov EBP, ESP
push EBX
mov EAX, DWORD PTR[EBP + 8]


FAC:
dec DWORD PTR[EBP + 8]
cmp EBX, 1
jle LEND
dec EBX
imul EAX, DWORD PTR[EBP + 8]
cmp EBX, 0
jnz FAC

LEND:
pop EBX
mov EBP, ESP
pop EBP
ret
myFac ENDP


_MainProc ENDP

END                             ; end of source code



mov EBX, n
call myFac

myFac PROC
push EBP
mov EBP, ESP
push EBX
mov EAX, EBX

FAC:
cmp EBX, 1
jle LEND
dec EBX
imul EAX, EBX
cmp EBX, 0
jnz FAC

LEND:
pop EBX
mov EBP, ESP
pop EBP
ret
myFac ENDP
