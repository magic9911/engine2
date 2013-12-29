; AlexB's graphics patch
; Source: http://www.stuffhost.de/files/cnc/

section .patch
@JMP 0x004BA61F, _Graphics_Patch

section .rdata
str_UseGraphicsPatch db"UseGraphicsPatch",0

section .bss
UseGraphicsPatch resb 1

section .text
_Graphics_Patch:
    cmp byte [UseGraphicsPatch], 1
    jz  .Ret

    cmp al, 1
    jnz 0x004BA62D
    
.Ret:
    mov edx, [esi+20h]
    jmp 0x004BA626
