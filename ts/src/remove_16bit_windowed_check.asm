%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/extern.inc"
%include "macros/string.inc"

@LJMP 0x0060142F, _WinMain_Remove_16bit_Windowed_Mode_Check

[section .text]
_WinMain_Remove_16bit_Windowed_Mode_Check:
    mov eax, 1
    jmp 0x00601435