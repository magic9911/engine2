@JMP 0x00408EAA _Anticheat_Test1

; Prevent 'cm-tsatr.exe' Command & Conquer: Tiberian Sun/Firestorm + 2 Trainer from working
_Anticheat_Test1:
    mov     ecx, 0x00748348
    jmp     0x00408EAF