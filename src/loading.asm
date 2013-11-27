@JMP 0x005FA640 _OptionsClass__Load_Settings_Ext
@JMP 0x006BC0DC _WinMain_Read_RA2md_INI_Read_Windowed_Option

%define INIClass_RA2md_INI  0x008870C0
%define str_Options         0x008254DC
%define str_Video           0x00833160
%define WindowedMode        0x0089F978

_OptionsClass__Load_Settings_Ext:
    INIClass_Get_Bool INIClass_RA2md_INI, str_Options, str_NoCD, 0
    mov byte [var.IsNoCD], al
 
; This gets loaded after the patch needs to be applied... 
;    INIClass_Get_Bool INIClass_RA2md_INI, str_Options, str_UseGraphicsPatch, 1
;    mov byte [var.UseGraphicsPatch], al


.Ret:
    mov ecx, 0x8870C0 ; offset
    jmp 0x005FA645
    
_WinMain_Read_RA2md_INI_Read_Windowed_Option:
    call INIClass__GetBool
    mov byte [0x840A6C], al
    
    INIClass_Get_Bool INIClass_RA2md_INI, str_Video, str_Windowed, 0
    cmp al, 0
    jz  .Dont_Set_Windowed_Mode
    mov byte [WindowedMode], 1
    
.Dont_Set_Windowed_Mode:  
    
    jmp 0x006BC0E6