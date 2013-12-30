;
; This very simple asm file replaces the entry point of TS with a nice message
;  - from hifi, with love <3
;

%include "include/macros/patch.inc"

@JMP 0x006B7E21, sodoff

__imp_MessageBoxA equ 0x006CA458

section .rdata
    title db "Oi!", 0
    message db "Sod off you bloody drunk!", 0

section .text
    sodoff:
        PUSH 0x30
        PUSH title
        PUSH message
        PUSH 0
        CALL [__imp_MessageBoxA]
        MOV EAX,1
        RETN

section .bss
	TestValue: resb 0x40