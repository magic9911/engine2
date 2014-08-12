@LJMP 0x004E23A7, _Select_Game_WOL_Disable_For_CnCNet

_Select_Game_WOL_Disable_For_CnCNet:
    mov dword [_SessionType], 0

    push 0
    push 0
    xor edx, edx
    mov ecx, _str_InternetDisabled
    call 0x0057C590

    jmp 0x004E2A15
