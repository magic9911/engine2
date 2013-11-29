@JMP 0x00408EAA _Anticheat_Test1
@JMP 0x006157E0 _Anticheat_Test2
@JMP 0x00596D9F _Anticheat_Test3

; Prevent 'cm-tsatr.exe' Command & Conquer: Tiberian Sun/Firestorm + 2 Trainer from working
_Anticheat_Test1:
    mov     ecx, 0x00748348
    jmp     0x00408EAF
    
; Prevent 'MultiTrainer.exe' fog reveal hack from working, not tested
_Anticheat_Test2:
    jz      0x615807
    mov     edx, [esi]
    lea     eax, [esp+164]
    jmp     0x006157EB

; Prevent 'MultiTrainer.exe' fog reveal hack from working, not tested
_Anticheat_Test3:
    mov esi, [0x006CA408]
    jmp 0x00596DA5



