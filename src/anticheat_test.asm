@JMP 0x00408EAA _Anticheat_Test1
@JMP 0x006157E0 _Anticheat_Test2
@JMP 0x00596D9F _Anticheat_Test3

; Minimap/radar hacks
@JMP 0x005BBF68 _Anticheat_Test4
@JMP 0x005BC040 _Anticheat_Test5
@JMP 0x005BBFE8 _Anticheat_Test6
@JMP 0x005B899E _Anticheat_Test7
@JMP 0x005B8C70 _Anticheat_Test8
@JMP 0x005B8E9E _Anticheat_Test9
@JMP 0x005B914D _Anticheat_Test10
@JMP 0x005B916B _Anticheat_Test11
@JMP 0x005BB153 _Anticheat_Test12
@JMP 0x005BBEE8 _Anticheat_Test13
@JMP 0x005BBF89 _Anticheat_Test14
@JMP 0x005BC040 _Anticheat_Test15
@JMP 0x005BC050 _Anticheat_Test16
@JMP 0x005BC0B3 _Anticheat_Test17
@JMP 0x005BC150 _Anticheat_Test18
@JMP 0x005BC170 _Anticheat_Test19
@JMP 0x005BC1E7 _Anticheat_Test20

_Anticheat_Test20:
    mov     ecx, [var.Anticheat1]
    jmp 0x005BC1ED

_Anticheat_Test19:
    cmp dword [var.Anticheat1], 3
    jmp 0x005BC177

_Anticheat_Test18:
    cmp dword [var.Anticheat1], 2
    jmp 0x005BC157

_Anticheat_Test17:
    mov eax, [var.Anticheat1]
    jmp 0x005BC0B9

_Anticheat_Test16:
    mov edx, [var.Anticheat1]
    jmp 0x005BC056

_Anticheat_Test15:
    mov [var.Anticheat1], edi
    jmp 0x005BC046

_Anticheat_Test14:
    mov [var.Anticheat1], edi
    jmp 0x005BBF8F

_Anticheat_Test13:
    mov eax, [var.Anticheat1]
    jmp 0x005BBEEE

_Anticheat_Test12:
    cmp dword [var.Anticheat1], 3
    jmp 0x005BB15A

_Anticheat_Test11:
    mov edx, [var.Anticheat1]
    jmp 0x005B9171

_Anticheat_Test10:
    cmp dword [var.Anticheat1], 3
    jmp 0x005B9154

_Anticheat_Test9:
    mov eax, [var.Anticheat1]
    jmp 0x005B8EA4

_Anticheat_Test8:
    mov [var.Anticheat1], eax
    jmp 0x005B8C76

_Anticheat_Test7:
    mov [var.Anticheat1], ebx
    jmp 0x005B89A4

_Anticheat_Test6:
    mov [var.Anticheat1], edi
    jmp 0x005BBFEE

_Anticheat_Test5:
    mov [var.Anticheat1], edi
    jmp 0x005BC046

_Anticheat_Test4:
    mov [var.Anticheat1], edi
    jmp 0x005BBF6E

; Prevent 'cm-tsatr.exe' Command & Conquer: Tiberian Sun/Firestorm + 2 Trainer from working
_Anticheat_Test1:
    mov ecx, 0x00748348
    jmp 0x00408EAF
    
; Prevent 'MultiTrainer.exe' fog reveal hack from working, not tested
_Anticheat_Test2:
    jz  0x00615807
    mov edx, [esi]
    lea eax, [esp+164]
    jmp 0x006157EB

; Prevent 'MultiTrainer.exe' fog reveal hack from working, not tested
_Anticheat_Test3:
    mov esi, [0x006CA408]
    jmp 0x00596DA5

