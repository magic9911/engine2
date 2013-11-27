; Info taken from Ares source code
; https://github.com/Ares-Developers/Ares/blob/master/src/Misc/CopyProtection.cpp

@HOOK 0x004A80D0 _CD_AlwaysFindYR
@HOOK 0x004790E0 _CD_AlwaysAvailable
@HOOK 0x00479110 _CD_NeverAsk

_CD_NeverAsk:
    cmp byte [var.IsNoCD], 0
    jz .Normal_Code


.NoCD:
    mov al, 1
    jmp 0x004791EA ; jump to retn instruction

.Normal_Code:
    push ebx
    push esi
    push edi
    mov edi, ecx
    jmp 0x00479115

_CD_AlwaysAvailable:
    cmp byte [var.IsNoCD], 0
    jz .Normal_Code

.NoCD:
    mov al, 1
    jmp 0x00479109 ; jump to retn instruction

.Normal_Code:
    mov eax, [esp+4] ; arg_0
    cmp eax, 0FFFFFFFEh
    jmp 0x004790E7

_CD_AlwaysFindYR:
    cmp byte [var.IsNoCD], 0
    jz .Normal_Code

.NoCD: 
    mov  eax, 2
    jmp 0x004A8265 ; jump to retn instruction

.Normal_Code:
    sub esp, 120h
    jmp 0x004A80D6
 