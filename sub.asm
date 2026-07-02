bits 32

%define arg1 [ebp + 8]
%define arg2 [ebp + 12]

push ebp
mov ebp, esp

mov eax, arg1
mov ebx, arg2

mov edx,_overflow
xor ecx,ecx
mov word cx,[edx]
shl cx,1

%ifdef bits32
    sub eax, ebx
%endif

%ifdef bits16
    sub ax, bx
%endif

%ifdef bits8
    sub al, bl
%endif

%ifdef signed
    jo .overflowed
    ; jo not jc, because we're dealing with signed overflow
%else
    jc .overflowed
    ; jc not jo, because we're dealing with unsigned overflow
%endif
jmp .end

.overflowed:
    or cx,0x01

.end:
    mov word [edx], cx
    mov esp, ebp
    pop ebp
    ret
