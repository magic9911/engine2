@LJMP 0x006010C9, _WinMain_Read_SUN_INI_Read_Extra_Options
@LJMP 0x006010BA, _WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference

_WinMain_Read_SUN_INI_Read_Extra_Options:
    call INIClass__GetBool
    
    pushad
    call_INIClass__GetBool _INIClass_SUN_INI, _str_Video, _str_UseGraphicsPatch, 1
    mov byte [var.UseGraphicsPatch], al
    
    call_INIClass__GetBool _INIClass_SUN_INI, _str_Options, _str_NoCD, 1
    cmp al, 0
    jz .Dont_Set_NoCD
    mov byte [var.IsNoCD], al
.Dont_Set_NoCD: 
    
    popad
    jmp 0x006010CE
    
_WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference:
    push _str_Video_Windowed
    jmp 0x006010BF
