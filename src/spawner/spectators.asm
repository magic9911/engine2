@HOOK 0x005DE8F9 _Create_Units_Dont_Create_For_Dead_Houses
@HOOK 0x005B9CFE _sub_5B9B90_Set_Up_Spectator_Player_Stuff
@HOOK 0x004BC608 HouseClass__AI_Spectator_Stuff
@HOOK 0x00633E76 _TechnoClass__Visual_Character_Spectator_Stuff
@HOOK 0x00438520 _BuildingClass__Visual_Character_Spectator_Stuff
@HOOK 0x004C968E _sub_4C9560_Spectator_Stuff

_sub_4C9560_Spectator_Stuff:
    cmp dword [PlayerPtr], esi
    jnz .Ret
    
    cmp dword [var.IsSpectatorArray+0], 1
    jz .Ret
    
    call 0x005BC080
    jmp 0x004C9693
    
.Ret:
    add esp, 4
    jmp 0x004C9693

_BuildingClass__Visual_Character_Spectator_Stuff:
    cmp dword [var.IsSpectatorArray+0], 1
    jz 0x004384DF
    
    mov ecx, [PlayerPtr]
    test ecx, ecx
    jz 0x00438549
    
    jmp 0x0043852A

_TechnoClass__Visual_Character_Spectator_Stuff:
    cmp dword [var.IsSpectatorArray+0], 1
    jz 0x00633EAC

    mov ecx, [PlayerPtr]
    test ecx, ecx
    jz 0x00633CFE
    jmp 0x00633E84

HouseClass__AI_Spectator_Stuff:
    call 0x004C9560
    
    cmp dword [PlayerPtr], esi
    jnz .Ret
    
    cmp byte [var.SpectatorStuffInit], 0
    jnz .Ret
    cmp dword [var.IsSpectatorArray+0], 0
    jz .Ret
    
    mov byte [0x00749808], 1
    
    push 1
    mov ecx, MouseClass_Map
    call 0x005BBEE0
    
    mov byte [var.SpectatorStuffInit], 1
 
.Ret: 
    jmp 0x004BC60D

_Create_Units_Dont_Create_For_Dead_Houses:
    mov     edx, [HouseClassArray]
    mov     esi, [edx+ecx*4]
    
    cmp byte [esi+0x0CB], 1
    jz 0x005DEF1D ; if dead jump to next unit
    
    jmp 0x005DE902
    
_sub_5B9B90_Set_Up_Spectator_Player_Stuff:
    mov byte [var.SpectatorStuffInit], 0
    
    mov ecx, dword [PlayerPtr]
    cmp byte [ecx+0x0CB], 1
    jnz .Ret
    
    mov dword [Message_Input_Player_Dead], 1
    
    mov ecx, MouseClass_Map
    call 0x0051E0A0

.Ret:
    pop edi
    pop esi
    pop ebp
    add esp, 14h
    jmp 0x005B9D04

Load_Spectators_Spawner:
    SpawnINI_Get_Bool str_IsSpectator, str_Multi1, 0
    mov dword [var.IsSpectatorArray+0], eax
    
    SpawnINI_Get_Bool str_IsSpectator, str_Multi2, 0
    mov dword [var.IsSpectatorArray+4], eax
    
    SpawnINI_Get_Bool str_IsSpectator, str_Multi3, 0
    mov dword [var.IsSpectatorArray+8], eax
      
    SpawnINI_Get_Bool str_IsSpectator, str_Multi4, 0
    mov dword [var.IsSpectatorArray+12], eax
    
    SpawnINI_Get_Bool str_IsSpectator, str_Multi5, 0
    mov dword [var.IsSpectatorArray+16], eax
    
    SpawnINI_Get_Bool str_IsSpectator, str_Multi6, 0
    mov dword [var.IsSpectatorArray+20], eax
    
    SpawnINI_Get_Bool str_IsSpectator, str_Multi7, 0
    mov dword [var.IsSpectatorArray+24], eax
    
    SpawnINI_Get_Bool str_IsSpectator, str_Multi8, 0
    mov dword [var.IsSpectatorArray+28], eax

    retn