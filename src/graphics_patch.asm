; AlexB's graphics patch
; Source: http://www.stuffhost.de/files/cnc/

@JMP 0x004BA61F _Graphics_Patch

_Graphics_Patch:

; This check fails as UseGraphicsPatch get loaded later so it's always 0 at this point
;    cmp byte [var.UseGraphicsPatch], 1
;    jz  .Ret
    jmp .Ret ; HACK: Always force graphics patch

    cmp al, 1
    jnz 0x004BA62D
    
.Ret:
    mov edx, [esi+20h]
    jmp 0x004BA626

