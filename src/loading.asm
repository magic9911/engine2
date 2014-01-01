@LJMP 0x006BC0DC, _WinMain_Read_RA2md_INI_Read_Windowed_Option

section .rdata
str_Windowed                db"Windowed",0

extern INIClass_RA2md_INI
extern str_Options
extern str_Video
extern WindowedMode

section .text

_WinMain_Read_RA2md_INI_Read_Windowed_Option:
    call INIClass__GetBool
    mov byte [0x840A6C], al
    
; Start loading our own settings:

     call_INIClass__GetBool INIClass_RA2md_INI, str_Options, str_NoCD, 0
    cmp al, 0
    jz .Dont_Set_NoCD
    mov byte [IsNoCD], al
.Dont_Set_NoCD: 
 
     call_INIClass__GetBool INIClass_RA2md_INI, str_Video, str_UseGraphicsPatch, 1
    mov byte [UseGraphicsPatch], al
    
     call_INIClass__GetBool INIClass_RA2md_INI, str_Video, str_Windowed, 0
    cmp al, 0
    jz  .Dont_Set_Windowed_Mode
    mov byte [WindowedMode], 1
    
.Dont_Set_Windowed_Mode:  
    
    jmp 0x006BC0E6