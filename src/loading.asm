@JMP 0x006010C9 _WinMain_Read_SUN_INI_Read_Extra_Options
@JMP 0x006010BA _WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference
           
_WinMain_Read_SUN_INI_Read_Extra_Options:
    call INIClass__GetBool
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Options, str_UseGraphicsPatch, 1
    mov byte [var.UseGraphicsPatch], al
    
    jmp 0x006010CE
    
_WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference:
    push str_Video_Windowed
    jmp 0x006010BF