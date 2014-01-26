@LJMP 0x006BC0DC, _WinMain_Read_RA2md_INI_Read_Windowed_Option

section .rdata
StringZ Windowed, "Windowed"

cextern INIClass_RA2md_INI
cextern str_Options
cextern str_Video
cextern WindowedMode

section .text

_WinMain_Read_RA2md_INI_Read_Windowed_Option:
; instructions which jump clobbered
    call INIClass__GetBool
    mov byte [0x840A6C], al

; Start loading our own settings:

    call_INIClass__GetBool INIClass_RA2md_INI, str_Options, str_NoCD, 1
    mov byte [IsNoCD], al

    call_INIClass__GetBool INIClass_RA2md_INI, str_Video, str_UseGraphicsPatch, 1
    mov byte [UseGraphicsPatch], al

    call_INIClass__GetBool INIClass_RA2md_INI, str_Video, str_Windowed, 0
    mov byte [WindowedMode], al

    jmp 0x006BC0E6
