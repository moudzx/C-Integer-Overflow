bits 32
global overflow
global add8, add16, add32
global sub8, sub16, sub32
global mul8, mul16, mul32
global add8s, add16s, add32s
global sub8s, sub16s, sub32s
global mul8s, mul16s, mul32s

section .note.GNU-stack

; .bss for uninitialized globals
; .data for initialized globals
; .text for code

section .bss
; resw = reserve word (2 bytes)
; once (0x01)
; resb = byte
; resd = double word (4 bytes)
; resq = quad word (8 bytes)
    _overflow: resw 0x01
    ; word to store the last 16 operations not just last one

section .data
; db , dw , dd , dq = define
    overflow: dd _overflow
    ; address of overflow variable

section .text
; bits 32/64, res_, d_, %_ are nasm

; add (unsigned)
%define bits8 
    add8:
        %include "add.asm"
%undef bits8

%define bits16 
    add16:
        %include "add.asm"
%undef bits16

%define bits32 
    add32:
        %include "add.asm"
%undef bits32

; add (signed)
%define bits8
%define signed
    add8s:
        %include "add.asm"
%undef signed
%undef bits8

%define bits16
%define signed
    add16s:
        %include "add.asm"
%undef signed
%undef bits16

%define bits32
%define signed
    add32s:
        %include "add.asm"
%undef signed
%undef bits32

; sub (unsigned)
%define bits8 
    sub8:
        %include "sub.asm"
%undef bits8

%define bits16 
    sub16:
        %include "sub.asm"
%undef bits16

%define bits32 
    sub32:
        %include "sub.asm"
%undef bits32

; sub (signed)
%define bits8
%define signed
    sub8s:
        %include "sub.asm"
%undef signed
%undef bits8

%define bits16
%define signed
    sub16s:
        %include "sub.asm"
%undef signed
%undef bits16

%define bits32
%define signed
    sub32s:
        %include "sub.asm"
%undef signed
%undef bits32

; mul (unsigned)
%define bits8 
    mul8:
        %include "mul.asm"
%undef bits8

%define bits16 
    mul16:
        %include "mul.asm"
%undef bits16

%define bits32 
    mul32:
        %include "mul.asm"
%undef bits32

; mul (signed)
%define bits8
%define signed
    mul8s:
        %include "mul.asm"
%undef signed
%undef bits8

%define bits16
%define signed
    mul16s:
        %include "mul.asm"
%undef signed
%undef bits16

%define bits32
%define signed
    mul32s:
        %include "mul.asm"
%undef signed
%undef bits32
