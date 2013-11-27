@JMP 0x005FA640 _OptionsClass__Load_Settings_Ext

%define INIClass_RA2md_INI  0x008870C0
%define str_Options         0x008254DC

_OptionsClass__Load_Settings_Ext:
    INIClass_Get_Bool INIClass_RA2md_INI, str_Options, str_NoCD, 0
    mov byte [var.IsNoCD], al
 
; This gets loaded after the patch needs to be applied... 
;    INIClass_Get_Bool INIClass_RA2md_INI, str_Options, str_UseGraphicsPatch, 0
;    mov byte [var.UseGraphicsPatch], al

.Ret:
    mov ecx, 0x8870C0 ; offset
    jmp 0x005FA645