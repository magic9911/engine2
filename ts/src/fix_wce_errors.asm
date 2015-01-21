%include "INIClass.inc"
%include "misc_instances.inc"

%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/extern.inc"
%include "macros/string.inc"

StringZ ForceLowestDetailLevel, "ForceLowestDetailLevel"

@HACK 0x00589D31, Read_SUN_INI_Detail_Level_Setting
    push eax

    call_INIClass__GetBool INIClass_SUN_INI, str_Options, str_ForceLowestDetailLevel, 0
    cmp al, 1
    pop eax
    jz .Force

    cmp eax, 2
    mov [esi+14h], eax
    jl .Out
    mov eax, 2
.Out:
    jmp 0x00589D3E

.Force:
    mov dword [esi+14h], 0
    mov eax, 0
    jmp 0x00589D3E
@ENDHACK

;; Fixes for WaveClass errors related to laser and Ion Cannon ripple effect:

; sub 6715F0 RETN Patch
; jump to RETN instruction
@LJMP 0x006715F0, 0x0067191F

; sub 4EEAC0 WCE Fix Patch
; jump to epilogue
@SJMP 0x004EEB26, 0x004EEB43
