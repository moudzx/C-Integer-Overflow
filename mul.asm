bits 32

%define arg1 [ebp + 8]
%define arg2 [ebp + 12]

push ebp
mov ebp, esp

mov eax, arg1
mov ebx, arg2

mov esi,_overflow
xor ecx,ecx 
mov word cx,[esi]
shl cx,1

%ifdef bits32
    %ifdef signed
        imul ebx
    %else
        mul ebx
    %endif
%endif

%ifdef bits16
    %ifdef signed
        imul bx
    %else
        mul bx
    %endif
%endif

%ifdef bits8
    %ifdef signed
        imul bl
    %else
        mul bl
    %endif
%endif

%ifdef signed
    jo .overflowed
    ; jo not jc, because we're dealing with signed overflow
    ; (one-operand imul sets CF = OF anyway, but jo is clearer here)
%else
    jc .overflowed
    ; jc not jo, because we're dealing with unsigned overflow
%endif
jmp .end

.overflowed:
    or cx,0x01

.end:
    mov word [esi], cx
    mov esp, ebp
    pop ebp
    ret
