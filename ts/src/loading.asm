%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"
%include "vars.inc"

extern str_UseGraphicsPatch
extern var.UseGraphicsPatch
extern str_NoCD
extern var.IsNoCD
extern str_Video_Windowed

extern str_DWMOffForPrimaryLock
extern str_DWMOffForPrimaryBlt
extern str_ForceFullscreenSprite
extern str_ForceBltToPrimary
extern str_DWMOffForFullscreen
extern str_EnableOverlays
extern str_DisableSurfaceLock
extern str_RedirectPrimarySurfBlts
extern str_StripMaxWindowBorder
extern str_DisableMaxWindowedMode
extern str_SingleProcAffinity

extern _DWMOffForPrimaryLock
extern _DWMOffForPrimaryBlt
extern _ForceFullscreenSprite
extern _ForceBltToPrimary
extern _DWMOffForFullscreen
extern _EnableOverlays
extern _DisableSurfaceLock
extern _RedirectPrimarySurfBlts
extern _StripMaxWindowBorder
extern _DisableMaxWindowedMode

extern SetSingleProcAffinity

%macro INIClass_Get_Int 4
    push %4 
    push %3
    push %2
    mov ecx, %1
    call INIClass__GetInt
%endmacro

; args: <INIClass this>, <INI section string>, <INI key string>, <default value if missing>
%macro INIClass_Get_Bool 4
    push %4 
    push %3
    push %2
    mov ecx, %1
    call INIClass__GetBool
%endmacro


@LJMP 0x006010C9, _WinMain_Read_SUN_INI_Read_Extra_Options
@LJMP 0x006010BA, _WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference

[section .text]
_WinMain_Read_SUN_INI_Read_Extra_Options:
    call INIClass__GetBool
    
    pushad
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Options, str_SingleProcAffinity, 1
    cmp al, 1
    jnz .DoNotSetSingleProcAffinity
    call SetSingleProcAffinity
    
.DoNotSetSingleProcAffinity:
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_DWMOffForPrimaryLock, 0
    mov byte [_DWMOffForPrimaryLock], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_DWMOffForPrimaryBlt, 0
    mov byte [_DWMOffForPrimaryBlt], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_ForceFullscreenSprite, 0
    mov byte [_ForceFullscreenSprite], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_ForceBltToPrimary, 0
    mov byte [_ForceBltToPrimary], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_DWMOffForFullscreen, 0
    mov byte [_DWMOffForFullscreen], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_EnableOverlays, 0
    mov byte [_EnableOverlays], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_DisableSurfaceLock, 0
    mov byte [_DisableSurfaceLock], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_RedirectPrimarySurfBlts, 0
    mov byte [_RedirectPrimarySurfBlts], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_StripMaxWindowBorder, 0
    mov byte [_StripMaxWindowBorder], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_DisableMaxWindowedMode, 0
    mov byte [_DisableMaxWindowedMode], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Video, str_UseGraphicsPatch, 1
    mov byte [var.UseGraphicsPatch], al
    
    INIClass_Get_Bool INIClass_SUN_INI, str_Options, str_NoCD, 1
    cmp al, 0
    jz .Dont_Set_NoCD
    mov byte [var.IsNoCD], al
.Dont_Set_NoCD: 
    
    popad
    jmp 0x006010CE
    
_WinMain_Read_SUN_INI_Update_Video_Windowed_String_Reference:
    push str_Video_Windowed
    jmp 0x006010BF
    