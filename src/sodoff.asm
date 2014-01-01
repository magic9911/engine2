;
; This very simple asm file replaces the entry point of TS with a nice message
;  - from hifi, with love <3
;

%include "macros/patch.inc"
%include "macros/proc.inc"

__imp_MessageBoxA equ 0x006CA458

section .rdata
    title db "Oi!", 0
    message db "Sod off you bloody drunk!", 0

section .bss
    TestValue: resb 0x40

@LJMP 0x006B7E21, sodoff

PROC sodoff
    push 0x30
    push title
    push message
    push 0
    call [__imp_MessageBoxA]
    mov  eax, 1
    retn
ENDPROC
