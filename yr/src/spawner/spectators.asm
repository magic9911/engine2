%include "macros/patch.inc"
%include "macros/string.inc"
%include "INIClass.inc"

StringZ Multi1,           "Multi1"
StringZ Multi2,           "Multi2"
StringZ Multi3,           "Multi3"
StringZ Multi4,           "Multi4"
StringZ Multi5,           "Multi5"
StringZ Multi6,           "Multi6"
StringZ Multi7,           "Multi7"
StringZ Multi8,           "Multi8"

StringZ IsSpectator,      "IsSpectator"

cextern NameNode
cextern INIClass_SPAWN

%macro SpawnINI__GetBool 3
     call_INIClass__GetBool   INIClass_SPAWN, %1, %2, %3
%endmacro

; args: <player index>, <set or not>, <identifier>
%macro Set_Spectator 3

    cmp byte %2, 0
    jz .Ret_Set_Spectator_%3
    
    mov eax, [NameNode]
    mov ecx, [%1*4+eax]
    mov dword [ecx+6Bh], -1 ; is observer flag

.Ret_Set_Spectator_%3:
%endmacro

cextern ObserverMode

cglobal Load_Spectators

Load_Spectators:
    SpawnINI__GetBool str_IsSpectator, str_Multi1, 0
	cmp al, 0
	jz .Skip_SetObserverMode
	
	mov dword [ObserverMode], 1
	
.Skip_SetObserverMode:
	
    Set_Spectator 0, al, a
    
    SpawnINI__GetBool str_IsSpectator, str_Multi2, 0
    Set_Spectator 1, al, b
    
    SpawnINI__GetBool str_IsSpectator, str_Multi3, 0
    Set_Spectator 2, al, c
    
    SpawnINI__GetBool str_IsSpectator, str_Multi4, 0
    Set_Spectator 3, al, d
    
    SpawnINI__GetBool str_IsSpectator, str_Multi5, 0
    Set_Spectator 4, al, e
    
    SpawnINI__GetBool str_IsSpectator, str_Multi6, 0
    Set_Spectator 5, al, f
    
    SpawnINI__GetBool str_IsSpectator, str_Multi7, 0
    Set_Spectator 6, al, g
    
    SpawnINI__GetBool str_IsSpectator, str_Multi8, 0
    Set_Spectator 7, al, h
    
    retn