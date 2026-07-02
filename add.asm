bits 32

; add(x,y)
; ebp is stack base pointer
; [ebp + 4] = return address
; [ebp + 8] = x
; [ebp + 12] = y
; [_] is dereference operator, dereference the address of the variable
%define arg1 [ebp + 8]
%define arg2 [ebp + 12]

push ebp
mov ebp, esp
; e__ in x86 , r__ in x86_64

mov eax, arg1
mov ebx, arg2

mov edx,_overflow
xor ecx,ecx ; clear ecx
mov word cx,[edx] ; cx is 2 bytes(word size) , we must cast [edx] which is 4 bytes
shl cx,1

%ifdef bits32
    add eax, ebx
%endif

%ifdef bits16
    add ax, bx
%endif

%ifdef bits8
    add al, bl
%endif

%ifdef signed
    jo .overflowed
    ; jo not jc, because we're dealing with signed overflow
%else
    jc .overflowed
    ; jc not jo, because we're dealing with unsigned overflow
%endif
jmp .end

; . means its a local label , not global
.overflowed:
    or cx,1

.end:
    mov word [edx], cx
    mov esp, ebp
    pop ebp
    ret
