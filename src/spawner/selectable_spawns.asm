@HOOK   0x005DEBCD      _Create_Units_Selectable_Spawning_Locations
@HOOK   0x005DEAF7      _Create_Units_First_Spawn_EDI_Patch

_Create_Units_First_Spawn_EDI_Patch:
    mov     edi, eax ; EAX has spawn that is being used
    jmp     0x005DEBCD

_Create_Units_Selectable_Spawning_Locations:
    ; edi contains the currently used spawn  
    mov     eax, [esp+0x24] ; House number to generate for
    cmp     DWORD [hp_data.SpawnLocationsArray+eax*4], -1
    jz      .Normal_Code

    mov     eax, DWORD [hp_data.SpawnLocationsArray+eax*4]
    mov     byte [esp+eax+0x90], 1 ; Set the spawn we want to use as used
    mov     byte [esp+edi+0x90], 0 ; Set the spawn the gamed wanted to use as unused
    
    mov     DWORD edx, [esp+0x7C]  ; SpawnLocationsArray
    mov     DWORD edx, [edx+eax*4] ; Get our spawn location
    
    mov     DWORD [esp+0x20], edx ; Set spawn location to use
    
.Normal_Code:
    mov     edi, [esp+0x10] ; HouseClass to generate for
    xor     edx, edx
    jmp     0x005DEBD3