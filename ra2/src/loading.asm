%include "INIClass.inc"

%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

StringZ Windowed,         "Windowed"
StringZ NoCD,             "NoCD"
StringZ UseGraphicsPatch, "UseGraphicsPatch"

cextern INIClass_RA2md_INI

cextern str_Options
cextern str_Video


cextern Graphics__Enable_Patch
cextern WindowedMode
cextern NoCD__Disable_CD

@HACK 0x006BC0DC, Loading__in_WinMain_read_RA2md_INI_custom_options

; instructions which jump clobbered:
    call INIClass__GetBool
    mov byte [0x840A6C], al

; Start loading our own settings:
    call_INIClass__GetBool INIClass_RA2md_INI, str_Options, str_NoCD, 1
    mov byte [NoCD__Disable_CD], al

    call_INIClass__GetBool INIClass_RA2md_INI, str_Video, str_UseGraphicsPatch, 1
    mov byte [Graphics__Enable_Patch], al

    call_INIClass__GetBool INIClass_RA2md_INI, str_Video, str_Windowed, 0
    mov byte [WindowedMode], al

    jmp 0x006BC0E6

@ENDHACK
