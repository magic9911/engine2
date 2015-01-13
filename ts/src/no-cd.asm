%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

@LJMP 0x004754A0, _CD_AlwaysFindTS
@LJMP 0x0044E7A0, _CD_AlwaysAvailable
@LJMP 0x0044E7C0, _CD_NeverAsk
@LJMP 0x004E0469, _Init_Game_NoCD_Check

section .bss
cglobal NoCD__Disable_CD
NoCD__Disable_CD resb 1

section .text

_Init_Game_NoCD_Check:
    cmp byte [NoCD__Disable_CD], 1
    jz 0x004E06F5
    cmp eax, ebp
    jnz 0x004E06F5
    jmp 0x004E0471

_CD_NeverAsk:
    cmp byte [NoCD__Disable_CD], 0
    jz .Normal_Code

.NoCD:
    mov al, 1
    jmp 0x0044E96B; jump to retn instruction

.Normal_Code:
    sub esp, 184h
    jmp 0x0044E7C6

_CD_AlwaysAvailable:
    cmp byte [NoCD__Disable_CD], 0
    jz .Normal_Code

.NoCD:
    mov al, 1
    jmp 0x0044E7BB ; jump to retn instruction

.Normal_Code:
    mov eax, [esp+4] ; arg_0
    cmp eax, 0FFFFFFFEh
    jmp 0x0044E7A7

_CD_AlwaysFindTS:
    cmp byte [NoCD__Disable_CD], 0
    jz .Normal_Code

.NoCD:
    mov eax, 0
    jmp 0x004756AB ; jump to retn instruction

.Normal_Code:
    sub esp, 148h
    jmp 0x004754A6