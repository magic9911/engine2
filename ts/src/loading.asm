;%include "macros/patch.inc"
;%include "macros/hack.inc"
;%include "macros/extern.inc"

@LJMP 0x006010C9, _WinMain_Read_SUN_INI_Read_Extra_Options
@LJMP 0x006010BA, _WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference

cextern Graphics__Enable_Patch
cextern NoCD__Disable_CD

_WinMain_Read_SUN_INI_Read_Extra_Options:
    call INIClass__GetBool

    pushad
    call_INIClass__GetBool INIClass_SUN_INI, str_Video, str_UseGraphicsPatch, 1
    mov byte [Graphics__Enable_Patch], al

    call_INIClass__GetBool INIClass_SUN_INI, str_Options, str_NoCD, 1
    cmp al, 0
    jz .Dont_Set_NoCD
    mov byte [NoCD__Disable_CD], al
.Dont_Set_NoCD:

    popad
    jmp 0x006010CE

_WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference:
    push str_Video_Windowed
    jmp 0x006010BF