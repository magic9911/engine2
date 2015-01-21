%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/extern.inc"
%include "macros/string.inc"

cextern Spawner__Active
cextern Spawner__IsSpectatorArray
cextern Spawner__SpawnLocations_Array
cextern UsedSpawnsArray

@LJMP 0x005DEBCD, _Create_Units_Selectable_Spawning_Locations
@LJMP 0x005DEAF7, _Create_Units_First_Spawn_EDI_Patch
@LJMP 0x005DE8CB, _Create_Units_Set_Selected_Spawn_Locations
@LJMP 0x005DEAD7, _Create_Units_First_Spawn_Check_If_Not_Selected

[section .text]
_Create_Units_First_Spawn_Check_If_Not_Selected:
    call 0x005BE080 ;    RandomClass::operator()(int,int)
;    pushad

    cmp dword [Spawner__IsSpectatorArray+0*4], 1
    jz .Ret

    cmp dword [Spawner__SpawnLocations_Array+0*4], -1
    jnz .First_Spawn_Selected

    cmp dword [Spawner__Active], 0
    jz .Ret

    mov esi, 0

.Loop:
    cmp     esi, 7
    jg      .Ret

    mov     edi, DWORD [Spawner__SpawnLocations_Array+esi*4]
    cmp     edi, eax
    jz     .Find_Another_Spawn

    inc     esi
    jmp     .Loop

.Ret:
;    popad
    jmp 0x005DEADC

.Find_Another_Spawn:
;    popad
    jmp 0x005DEAC2

.First_Spawn_Selected:
    mov eax, [Spawner__SpawnLocations_Array+0*4]
    jmp 0x005DEADC

_Create_Units_Set_Selected_Spawn_Locations:
    mov [esp+0x90], ecx
    mov [esp+0x94], ecx ; clear more spawn spots used
;    pushad

    cmp dword [Spawner__Active], 0
    jz .Ret

    mov esi, 0

.Loop:
    cmp esi, 7
    jg  .Ret

    mov edi, DWORD [Spawner__SpawnLocations_Array+esi*4] ; Get the waypoint value for spawn loc multi1...multi2 (in esi)
    cmp edi, -1 ; check if there's a spawn location set for this player
    jz  .Dont_Set_Spawn_As_Used
    mov byte [esp+edi+0x90], 1 ; if so, set spawn location selected

.Dont_Set_Spawn_As_Used:
    inc esi
    jmp .Loop

.Ret:
;    popad
    xor     ebp, ebp
    jmp     0x005DE8DB

_Create_Units_First_Spawn_EDI_Patch:
    mov edi, eax ; EAX has spawn that is being used
    jmp 0x005DEBCD

_Create_Units_Selectable_Spawning_Locations:
    cmp dword [Spawner__Active], 0
    jz .Normal_Code

    ; edi contains the currently used spawn
    mov byte [esp+edi+0x90], 1 ; Set the currenly used spawn as used

    mov eax, [esp+0x24] ; House number to generate for

    mov dword [UsedSpawnsArray+4*edi], eax

    cmp dword [Spawner__SpawnLocations_Array+eax*4], -1
    jz .Normal_Code

    mov dword [UsedSpawnsArray+4*edi], -1

    mov edx, eax

    mov eax, dword [Spawner__SpawnLocations_Array+eax*4]
    mov byte [esp+edi+0x90], 0 ; Set the spawn the gamed wanted to use as unused
    mov byte [esp+eax+0x90], 1 ; Set the spawn we want to use as used


    mov dword [UsedSpawnsArray+4*eax], edx

    mov dword edx, [esp+0x7C]  ; SpawnLocationsArray
    mov dword edx, [edx+eax*4] ; Get our spawn location

    mov dword [esp+0x20], edx ; Set spawn location to use



.Normal_Code:
    mov edi, [esp+0x10] ; HouseClass to generate for
    xor edx, edx
    jmp 0x005DEBD3