%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

extern var.UseGraphicsPatch

; AlexB's graphics patch
; Source: http://www.stuffhost.de/files/cnc/

@LJMP 0x0048AC2F, _Graphics_Patch

[section .text]
_Graphics_Patch:
    cmp byte [var.UseGraphicsPatch], 1
    jz  .Ret

    cmp al, 1
    jnz 0x0048AC3F
    
.Ret:
    mov eax, [esi+20h]
    jmp 0x0048AC36

