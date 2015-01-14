%include "INIClass.inc"
%include "Message.inc"
%include "session.inc"
%include "House.inc"
%include "Mouse.inc"

%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/extern.inc"
%include "macros/string.inc"

section .bss
cglobal SpectatorStuffInit
SpectatorStuffInit resb 1

section .text

StringZ IsSpectator,                "IsSpectator"

cextern Spawner__IsSpectatorArray
cextern Spawner__INIClass

cextern str_Multi1
cextern str_Multi2
cextern str_Multi3
cextern str_Multi4
cextern str_Multi5
cextern str_Multi6
cextern str_Multi7
cextern str_Multi8

@LJMP 0x005DE8F9, _Create_Units_Dont_Create_For_Dead_Houses
@LJMP 0x005B9CFE, _sub_5B9B90_Set_Up_Spectator_Player_Stuff
@LJMP 0x004BC608, _HouseClass__AI_Spectator_Stuff
@LJMP 0x00633E76, _TechnoClass__Visual_Character_Spectator_Stuff
@LJMP 0x00438520, _BuildingClass__Visual_Character_Spectator_Stuff
@LJMP 0x004C968E, _sub_4C9560_Spectator_Stuff
@LJMP 0x005DE717, _Create_Units_Dont_Count_Spectators_When_Counting_Players
@LJMP 0x004BF71B, _HouseClass__MPlayer_Defeated_Ignore_Spectator_In_Skirmish
@LJMP 0x00479974, _DisplayClass__Encroach_Shadow_Spectator

_DisplayClass__Encroach_Shadow_Spectator:

    mov eax, [PlayerPtr]
    mov eax, [eax+0x20]
    cmp dword [Spawner__IsSpectatorArray+eax*4], 1
    jz 0x004799F7

    call 0x0051E270
    jmp 0x00479979

_HouseClass__MPlayer_Defeated_Ignore_Spectator_In_Skirmish:

    cmp [PlayerPtr], eax
    jnz .Normal_Code

    cmp dword [SessionType], 5
    jnz .Normal_Code

    push eax
    mov eax, [eax+0x20]

    cmp dword [Spawner__IsSpectatorArray+eax*4], 1
    pop eax

    jz .Dont_Count

.Normal_Code:
    cmp byte [eax+0CBh], 0
    jmp 0x004BF722

.Dont_Count:
    jmp 0x004BF74A

_Create_Units_Dont_Count_Spectators_When_Counting_Players:
    lea  eax, [edx+ecx]

    push ebx
    push esi

    mov esi, 0
    mov ebx, 0

.Loop:
    cmp dword [Spawner__IsSpectatorArray+esi*4], 0
    jz .Next_Iter

    inc ebx

.Next_Iter:
    inc esi
    cmp esi, 8
    jl .Loop


.Out_Loop:
    sub eax, ebx

    pop esi
    pop ebx

    cmp edi, eax
    jmp 0x005DE71C

_sub_4C9560_Spectator_Stuff:
    cmp dword [PlayerPtr], esi
    jnz .Ret

    mov esi, [PlayerPtr]
    mov esi, [esi+0x20]
    cmp dword [Spawner__IsSpectatorArray+esi*4], 1
    jz .Ret

    call 0x005BC080
    jmp 0x004C9693

.Ret:
    add esp, 4
    jmp 0x004C9693

_BuildingClass__Visual_Character_Spectator_Stuff:
    mov ecx, [PlayerPtr]
    mov ecx, [ecx+0x20]
    cmp dword [Spawner__IsSpectatorArray+ecx*4], 1
    jz 0x004384DF

    mov ecx, [PlayerPtr]
    test ecx, ecx
    jz 0x00438549

    jmp 0x0043852A

_TechnoClass__Visual_Character_Spectator_Stuff:
    mov ecx, [PlayerPtr]
    mov ecx, [ecx+0x20]
    cmp dword [Spawner__IsSpectatorArray+ecx*4], 1
    jz 0x00633EAC

    mov ecx, [PlayerPtr]
    test ecx, ecx
    jz 0x00633CFE
    jmp 0x00633E84

_HouseClass__AI_Spectator_Stuff:
    call 0x004C9560

    cmp dword [PlayerPtr], esi
    jnz .Ret

    cmp byte [SpectatorStuffInit], 0
    jnz .Ret


    mov ecx, [PlayerPtr]
    mov ecx, [ecx+0x20]
    cmp dword [Spawner__IsSpectatorArray+ecx*4], 0
    jz .Ret

    mov byte [0x00749808], 1

    push 1
    mov ecx, MouseClass_Map
    call 0x005BBEE0

    mov byte [SpectatorStuffInit], 1

.Ret:
    jmp 0x004BC60D

_Create_Units_Dont_Create_For_Dead_Houses:
    mov     edx, [HouseClassArray]
    mov     esi, [edx+ecx*4]

    cmp byte [esi+0x0CB], 1
    jz 0x005DEF1D ; if dead jump to next unit

    jmp 0x005DE902

_sub_5B9B90_Set_Up_Spectator_Player_Stuff:
    mov byte [SpectatorStuffInit], 0

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

cglobal Load_Spectators_Spawner
Load_Spectators_Spawner:
    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi1, 0
    mov dword [Spawner__IsSpectatorArray+0], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi2, 0
    mov dword [Spawner__IsSpectatorArray+4], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi3, 0
    mov dword [Spawner__IsSpectatorArray+8], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi4, 0
    mov dword [Spawner__IsSpectatorArray+12], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi5, 0
    mov dword [Spawner__IsSpectatorArray+16], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi6, 0
    mov dword [Spawner__IsSpectatorArray+20], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi7, 0
    mov dword [Spawner__IsSpectatorArray+24], eax

    call_INIClass__GetBool Spawner__INIClass, str_IsSpectator, str_Multi8, 0
    mov dword [Spawner__IsSpectatorArray+28], eax

    retn