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

myFac:
cmp EAX, 1
jle LEND	; goes to end if smaller than 1
dec EAX		; n - 1
push EAX	; pushes new value of n - 1
loop myFac
pop EBX
imul EAX, EBX


sub EBX, EAX	; EAX now contains n - r
cmp EBX, 0		; if EAX is 0, we leave the stack
jle LEND




LEND:
pop EAX
pop EBX
mov EBP, ESP
pop EBP
ret








MyPerm ENDP


_MainProc ENDP
END



