%macro SpawnINI_Get_Int 3
    push %3 
    push %2
    push %1
    mov ecx, var.INIClass_SPAWN
    call _INIClass__GetInt
%endmacro 

%macro SpawnINI_Get_Bool 3
    push %3 
    push %2
    push %1
    mov ecx, var.INIClass_SPAWN
    call INIClass__GetBool
%endmacro
   
%macro SpawnINI_Get_String 5
    push %5
    push %4
    push %3
    push %2
    push %1
    mov ecx, var.INIClass_SPAWN
    call _INIClass__GetString
%endmacro

%macro SpawnINI_Get_Fixed 4
    push %4
    push %3 
    push %2
    push %1
    mov ecx, var.INIClass_SPAWN
    call _INIClass__GetFixed

%endmacro

; max number of players in static address list
extern _AddressList
extern _TunnelId
extern _TunnelIp
extern _TunnelPort
extern _PortHack
extern _NetHack_SendTo
extern _NetHack_RecvFrom

@CALL 0x006A2525, _NetHack_SendTo
@CALL 0x006A25F9, _NetHack_RecvFrom

@LJMP 0x004E1DE0, _Select_Game_Init_Spawner
;@LJMP 0x00609470, _Send_Statistics_Packet_Return_If_Spawner_Active ; Games tries to send statistics when match ends which causes crash
@LJMP 0x005E08E3, _Read_Scenario_INI_Assign_Houses_And_Spawner_House_Settings
@LJMP 0x004BDDB1, _HouseClass__Make_Ally_STFU_when_Allying_In_Loading_Screen_Spawner
@LJMP 0x004E078C, _Init_Game_Check_Spawn_Arg_No_Intro

; Inside HouseClass::Mplayer_Defeated skip some checks which makes game continue
; even if there are only allied AI players left, in skirmish
@SJMP 0x004BF7B6, 0x004BF7BF
@SJMP 0x004BF7F0, 0x004BF7F9

@LJMP 0x005ED477, _sub_5ED470_Dont_Read_Scenario_Descriptions_When_Spawner_Active

@LJMP 0x004C06EF, _HouseClass__AI_Attack_Stuff_Alliance_Check

@LJMP 0x005DE3D7, _Assign_Houses_AI_Countries

@LJMP 0x004C3630, _HouseClass__Computer_Paranoid_Disable_With_Spawner

@LJMP 0x005DDAF1, _Read_Scenario_INI_Dont_Create_Units_Earlier
@LJMP 0x005DDEDD, _Read_Scenario_INI_Dont_Create_Units_Earlier_Dont_Create_Twice

@LJMP 0x0065860D, _UnitClass__Read_INI_Jump_Out_When_Units_Section_Missing

_UnitClass__Read_INI_Jump_Out_When_Units_Section_Missing:
    cmp eax, ebx
    jle .Jump_Out
    
    jmp 0x00658613
    
.Jump_Out:
    jmp 0x00658A10

_Read_Scenario_INI_Dont_Create_Units_Earlier:
    call 0x0058C980
    
    cmp dword [_SessionType], 0
    jz  .Ret
    
    push    0
    push    0x0070CAA8 ; offset aOfficial ; "Official"
    push    0x007020A8 ; offset aBasic   ; "Basic"
    mov     ecx, ebp
    call    INIClass__GetBool
    mov     cl, al
    call    0x005DD290 ; Create_Units(int)

.Ret:
    jmp 0x005DDAF6


_Read_Scenario_INI_Dont_Create_Units_Earlier_Dont_Create_Twice:
    jmp 0x005DDEF8

_HouseClass__Computer_Paranoid_Disable_With_Spawner:
    cmp dword [var.IsSpawnArgPresent], 1
    jz  .Ret

.Normal_Code:
    mov ecx, [_HouseClassArray_Count]
    jmp 0x004C3636
    
.Ret:
    jmp 0x004C3700 ; jump to RETN instruction

_Assign_Houses_AI_Countries:
    mov ebp, [_HouseClassArray_Count]
    cmp dword [var.HouseCountriesArray+ebp*4], -1
    jz  .Ret
  
    mov ecx, [var.HouseCountriesArray+ebp*4]  
    mov ecx,[edx+ecx*4]
  
.Ret:
    push ecx
    mov ecx, eax
    call 0x004BA0B0 ; HouseClass::HouseClass(HousesType)
    jmp 0x005DE3DF

_HouseClass__AI_Attack_Stuff_Alliance_Check:
    cmp esi, edi
    jz 0x004C0777
    
    push esi
    mov ecx, edi
    call 0x004BDA20 ; HouseClass::Is_Ally
    cmp al, 1
    jz 0x004C0777
    
.Ret:
    jmp 0x004C06F7

_sub_5ED470_Dont_Read_Scenario_Descriptions_When_Spawner_Active:
    cmp dword [var.IsSpawnArgPresent], 1
    jz  .Ret
    
    call _SessionClass__Read_Scenario_Descriptions

.Ret:
    call [_timeGetTime]
    jmp 0x005ED482

    
Init_Game_Spawner:
    lea eax, [var.UsedSpawnsArray]
    push 32             ; Size
    push 0xFF              ; Val
    push eax             ; Dst
    call _memset
    add esp, 0Ch
   
    retn
   
_Init_Game_Check_Spawn_Arg_No_Intro:
    pushad
    
    call Init_Game_Spawner

    call [_GetCommandLineA]
    push _str_SpawnArg
    push eax
    call _stristr
    add esp, 8
    xor ebx, ebx
    cmp eax, 0  
    setne bl
    mov [var.IsSpawnArgPresent], ebx
    popad
    
    cmp dword [var.IsSpawnArgPresent], 0
    jz .Normal_Code
    
.No_Intro:
    jmp 0x004E0848


.Normal_Code:
    and ecx, 4
    cmp cl, 4
    jmp 0x004E0792


_HouseClass__Make_Ally_STFU_when_Allying_In_Loading_Screen_Spawner:
    cmp byte [var.IsDoingAlliancesSpawner], 1
    jz 0x004BDE68
    test al, al          ; hooked by patch
    jz 0x4BDE68
    jmp 0x004BDDB9

_SessionClass__Free_Scenario_Descriptions_RETN_Patch:
    retn   

_Send_Statistics_Packet_Return_If_Spawner_Active:
    cmp dword [var.SpawnerActive], 1
    jz .ret

    sub esp, 374h
    jmp 0x00609476
    
.ret:
    retn

; args <House number>, <ColorType>
%macro Set_House_Color 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Set_Color_%3
    mov edi, [_HouseClassArray] ; _HouseClassArray
    mov edi, [edi+%1*4]
    
;    mov dword [edi+0x10DFC], eax
    mov esi, [edi+0x24]
    mov dword [esi+0x6C], eax
    mov dword [edi+10DFCh], eax
    
    push eax
    call _Get_MP_Color
    
    mov dword [edi+0x10DFC], eax
    
    mov ecx, edi
    call 0x004CBAA0

.Dont_Set_Color_%3:
%endmacro

; args <House number>, <HouseType>
%macro Set_House_Country 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Set_Country_%3
    mov edi, [_HouseClassArray]
    mov edi, [edi+%1*4]
    
    mov ecx, [_HouseTypesArray]
    mov eax, [ecx+eax*4]
    
    mov dword [edi+24h], eax

.Dont_Set_Country_%3:
%endmacro


; args <House number>, <identifier>
%macro Set_Spectator 2
    
    cmp dword [var.IsSpectatorArray+4*%1], 0
    jz .No_Spectator_%2

    mov edi, [_HouseClassArray]
    mov edi, [edi+%1*4]
    
    xor eax, eax
    cmp dword [var.IsSpectatorArray+4*%1], 1
    sete al
    
    mov byte [edi+0x0CB], 1

.No_Spectator_%2:
%endmacro

; args <House number>, <DifficultyType>
%macro Set_House_Handicap 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Set_Handicap_%3
    mov edi, [_HouseClassArray]
    mov edi, [edi+%1*4]
    
    push eax
    mov ecx, edi
    call _HouseClass__Assign_Handicap ; DiffType HouseClass::Assign_Handicap(DiffType)

.Dont_Set_Handicap_%3:
%endmacro

; args <House number>, <House number to ally>
%macro House_Make_Ally 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Make_Ally_%3
    mov esi, [_HouseClassArray] ; _HouseClassArray
    mov edi, [esi+4*%1]
    
    push eax
    mov ecx, edi
    call _HouseClass__Make_Ally
    
;    mov eax, [esi+4*eax]
    
    
;    mov esi, [edi+0x578]
;    mov ecx, [eax+0x20]
    
;    mov eax, 1
;    shl eax, cl
;    or  esi, eax
;    mov [edi+0x578], esi


.Dont_Make_Ally_%3:
%endmacro

; args <string of section to load from>, <House number which will ally>
%macro  House_Make_Allies_Spawner 3
    SpawnINI_Get_Int %1, _str_HouseAllyOne, -1
    cmp al, -1
    jz .Dont_Ally_Multi1_%3
    House_Make_Ally %2, eax, a%3
    
.Dont_Ally_Multi1_%3:

    SpawnINI_Get_Int %1, _str_HouseAllyTwo, -1
    cmp al, -1
    jz .Dont_Ally_Multi2_%3
    House_Make_Ally %2, eax, b%3
    
.Dont_Ally_Multi2_%3:

    SpawnINI_Get_Int %1, _str_HouseAllyThree, -1
    cmp al, -1
    jz .Dont_Ally_Multi3_%3
    House_Make_Ally %2, eax, c%3
    
.Dont_Ally_Multi3_%3:

    SpawnINI_Get_Int %1, _str_HouseAllyFour, -1
    cmp al, -1
    jz .Dont_Ally_Multi4_%3
    House_Make_Ally %2, eax, d%3
    
.Dont_Ally_Multi4_%3:

    SpawnINI_Get_Int %1, _str_HouseAllyFive, -1
    cmp al, -1
    jz .Dont_Ally_Multi5_%3
    House_Make_Ally %2, eax, e%3
    
.Dont_Ally_Multi5_%3:

    SpawnINI_Get_Int %1, _str_HouseAllySix, -1
    cmp al, -1
    jz .Dont_Ally_Multi6_%3
    House_Make_Ally %2, eax, f%3
    
.Dont_Ally_Multi6_%3:

    SpawnINI_Get_Int %1, _str_HouseAllySeven, -1
    cmp al, -1
    jz .Dont_Ally_Multi7_%3
    House_Make_Ally %2, eax, g%3
    
.Dont_Ally_Multi7_%3:
%endmacro

Load_House_Countries_Spawner:
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi1, -1
    mov dword [var.HouseCountriesArray+0], eax
    
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi2, -1
    mov dword [var.HouseCountriesArray+4], eax
    
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi3, -1
    mov dword [var.HouseCountriesArray+8], eax
      
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi4, -1
    mov dword [var.HouseCountriesArray+12], eax
    
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi5, -1
    mov dword [var.HouseCountriesArray+16], eax
    
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi6, -1
    mov dword [var.HouseCountriesArray+20], eax
    
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi7, -1
    mov dword [var.HouseCountriesArray+24], eax
    
    SpawnINI_Get_Int _str_HouseCountries, _str_Multi8, -1
    mov dword [var.HouseCountriesArray+28], eax

    retn

Load_House_Colors_Spawner:
    SpawnINI_Get_Int _str_HouseColors, _str_Multi1, -1
    mov dword [var.HouseColorsArray+0], eax
    
    SpawnINI_Get_Int _str_HouseColors, _str_Multi2, -1
    mov dword [var.HouseColorsArray+4], eax
    
    SpawnINI_Get_Int _str_HouseColors, _str_Multi3, -1
    mov dword [var.HouseColorsArray+8], eax
      
    SpawnINI_Get_Int _str_HouseColors, _str_Multi4, -1
    mov dword [var.HouseColorsArray+12], eax
    
    SpawnINI_Get_Int _str_HouseColors, _str_Multi5, -1
    mov dword [var.HouseColorsArray+16], eax
    
    SpawnINI_Get_Int _str_HouseColors, _str_Multi6, -1
    mov dword [var.HouseColorsArray+20], eax
    
    SpawnINI_Get_Int _str_HouseColors, _str_Multi7, -1
    mov dword [var.HouseColorsArray+24], eax
    
    SpawnINI_Get_Int _str_HouseColors, _str_Multi8, -1
    mov dword [var.HouseColorsArray+28], eax

    retn

Load_Spawn_Locations_Spawner:
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi1, -1
    mov dword [var.SpawnLocationsArray+0], eax
    
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi2, -1
    mov dword [var.SpawnLocationsArray+4], eax
    
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi3, -1
    mov dword [var.SpawnLocationsArray+8], eax
      
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi4, -1
    mov dword [var.SpawnLocationsArray+12], eax
    
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi5, -1
    mov dword [var.SpawnLocationsArray+16], eax
    
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi6, -1
    mov dword [var.SpawnLocationsArray+20], eax
    
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi7, -1
    mov dword [var.SpawnLocationsArray+24], eax
    
    SpawnINI_Get_Int _str_SpawnLocations, _str_Multi8, -1
    mov dword [var.SpawnLocationsArray+28], eax

    retn   

Load_House_Handicaps_Spawner:
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi1, -1
    mov dword [var.HouseHandicapsArray+0], eax
   
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi2, -1
    mov dword [var.HouseHandicapsArray+4], eax
   
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi3, -1
    mov dword [var.HouseHandicapsArray+8], eax
    
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi4, -1
    mov dword [var.HouseHandicapsArray+12], eax
    
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi5, -1
    mov dword [var.HouseHandicapsArray+16], eax
    
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi6, -1
    mov dword [var.HouseHandicapsArray+20], eax
    
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi7, -1
    mov dword [var.HouseHandicapsArray+24], eax
    
    SpawnINI_Get_Int _str_HouseHandicaps, _str_Multi8, -1
    mov dword [var.HouseHandicapsArray+28], eax

    retn
   
_Read_Scenario_INI_Assign_Houses_And_Spawner_House_Settings:
    pushad
    call _Assign_Houses
    
    cmp dword [var.SpawnerActive], 0
    jz  .Ret
    
;    Set_House_Country 0, dword [var.HouseCountriesArray+0], a
;    Set_House_Country 1, dword [var.HouseCountriesArray+4], b
;    Set_House_Country 2, dword [var.HouseCountriesArray+8], c
;    Set_House_Country 3, dword [var.HouseCountriesArray+12], d
;    Set_House_Country 4, dword [var.HouseCountriesArray+16], e
;    Set_House_Country 5, dword [var.HouseCountriesArray+20], f
;    Set_House_Country 6, dword [var.HouseCountriesArray+24], g
;    Set_House_Country 7, dword [var.HouseCountriesArray+28], h
    
    Set_House_Color 0, dword [var.HouseColorsArray+0], a
    Set_House_Color 1, dword [var.HouseColorsArray+4], b
    Set_House_Color 2, dword [var.HouseColorsArray+8], c
    Set_House_Color 3, dword [var.HouseColorsArray+12], d
    Set_House_Color 4, dword [var.HouseColorsArray+16], e
    Set_House_Color 5, dword [var.HouseColorsArray+20], f
    Set_House_Color 6, dword [var.HouseColorsArray+24], g
    Set_House_Color 7, dword [var.HouseColorsArray+28], h
        
    mov byte [var.IsDoingAlliancesSpawner], 1
    
    House_Make_Allies_Spawner _str_Multi1_Alliances, 0, a
    House_Make_Allies_Spawner _str_Multi2_Alliances, 1, b
    House_Make_Allies_Spawner _str_Multi3_Alliances, 2, c
    House_Make_Allies_Spawner _str_Multi4_Alliances, 3, d
    House_Make_Allies_Spawner _str_Multi5_Alliances, 4, e
    House_Make_Allies_Spawner _str_Multi6_Alliances, 5, f
    House_Make_Allies_Spawner _str_Multi7_Alliances, 6, g
    House_Make_Allies_Spawner _str_Multi8_Alliances, 7, h
    
    mov byte [var.IsDoingAlliancesSpawner], 0
    
    Set_House_Handicap 0, dword [var.HouseHandicapsArray+0], a
    Set_House_Handicap 1, dword [var.HouseHandicapsArray+4], b
    Set_House_Handicap 2, dword [var.HouseHandicapsArray+8], c
    Set_House_Handicap 3, dword [var.HouseHandicapsArray+12], d
    Set_House_Handicap 4, dword [var.HouseHandicapsArray+16], e
    Set_House_Handicap 5, dword [var.HouseHandicapsArray+20], f
    Set_House_Handicap 6, dword [var.HouseHandicapsArray+24], g
    Set_House_Handicap 7, dword [var.HouseHandicapsArray+28], h
    
    Set_Spectator 0, a
    Set_Spectator 1, b
    Set_Spectator 2, c
    Set_Spectator 3, d
    Set_Spectator 4, e
    Set_Spectator 5, f
    Set_Spectator 6, g
    Set_Spectator 7, h
    
.Ret:  
    popad
    jmp 0x005E08E8

Load_SPAWN_INI:
%push
    push ebp
    mov ebp,esp
    sub esp,128

%define TempFileClass ebp-128

    ; initialize FileClass
    push _str_spawn_ini
    lea ecx, [TempFileClass]
    call _FileClass__FileClass

    ; check ini exists
    lea ecx, [TempFileClass]
    xor edx, edx
    push edx
    call _FileClass__Is_Available
    test al, al
    je .error

    ; initialize INIClass
    mov ecx, var.INIClass_SPAWN
    call _INIClass__INIClass

    ; load FileClass to INIClass
    push 0
    push 0
    lea eax, [TempFileClass]
    push eax
    Mov ecx, var.INIClass_SPAWN
    call _INIClass__Load
    
    mov eax, 1
    jmp .exit

.error:
    mov eax, 0
.exit:
    mov esp,ebp
    pop ebp
    retn
%pop

Initialize_Spawn:
%push
    push ebp
    mov ebp,esp
    sub esp,128

%define TempBuf     ebp-128

    
    cmp dword [var.IsSpawnArgPresent], 0
    je .Exit_Error
    
    cmp dword [var.SpawnerActive], 1
    jz .Ret_Exit
    
    mov dword [var.SpawnerActive], 1
    mov dword [_PortHack], 1 ; default enabled
    
    call Load_SPAWN_INI
    cmp eax, 0
    jz .Exit_Error
   
    ; get pointer to inet_addr
    push _str_wsock32_dll
    call [_LoadLibraryA]

    push _str_inet_addr
    push eax
    call [_GetProcAddress]

    mov [var.inet_addr], eax
    
    call Load_House_Colors_Spawner
    call Load_House_Countries_Spawner
    call Load_House_Handicaps_Spawner
    call Load_Spawn_Locations_Spawner
    call Load_Spectators_Spawner
    
    mov byte [_GameActive], 1 ; needs to be set here or the game gets into an infinite loop trying to create spawning units

    ; set session 
    mov dword [_SessionType], 5
       
    SpawnINI_Get_Int _str_Settings, _str_UnitCount, 1
    mov dword [_UnitCount], eax
      
    SpawnINI_Get_Int _str_Settings, _str_TechLevel, 10
    mov dword [_TechLevel], eax
      
    SpawnINI_Get_Int _str_Settings, _str_AIPlayers, 0
    mov dword [_AIPlayers], eax
   
    SpawnINI_Get_Int _str_Settings, _str_AIDifficulty, 1   
    mov dword [_AIDifficulty], eax
      
    SpawnINI_Get_Bool _str_Settings, _str_HarvesterTruce, 0
    mov byte [_HarvesterTruce], al
      
    SpawnINI_Get_Bool _str_Settings, _str_BridgeDestroy, 1 
    mov byte [_BridgeDestroy], al
      
    SpawnINI_Get_Bool _str_Settings, _str_FogOfWar, 0
    mov byte [_FogOfWar], al
    
    SpawnINI_Get_Bool _str_Settings, _str_BuildOffAlly, 0
    mov byte [var.BuildOffAlly], al
 
    SpawnINI_Get_Bool _str_Settings, _str_Crates, 0
    mov byte [_Crates], al
     
    SpawnINI_Get_Bool _str_Settings, _str_ShortGame, 0
    mov byte [_ShortGame], al     
  
    SpawnINI_Get_Bool _str_Settings, _str_Bases, 1
    mov byte [_Bases], al      
    
    SpawnINI_Get_Bool _str_Settings, _str_AlliesAllowed, 1
    mov byte [_AlliesAllowed], al
 
    SpawnINI_Get_Bool _str_Settings, _str_MCVRedeploy, 1
    mov byte [_MCVRedeploy], al   
      
    SpawnINI_Get_Int _str_Settings, _str_Credits, 10000
    mov dword [_Credits], eax   
      
    SpawnINI_Get_Int _str_Settings, _str_GameSpeed, 0
    mov dword [_GameSpeed], eax
     
    SpawnINI_Get_Bool _str_Settings, _str_MultiEngineer, 0
    mov byte [_MultiEngineer], al
         
    ; tunnel ip
    lea eax, [TempBuf]
    SpawnINI_Get_String _str_Tunnel, _str_Ip, _str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [var.inet_addr]
    mov [_TunnelIp], eax

    ; tunnel port
    SpawnINI_Get_Int _str_Tunnel, _str_Port, 0
    and eax, 0xffff
    push eax
    call _htonl
    mov [_TunnelPort], eax

    ; tunnel id 
    SpawnINI_Get_Int _str_Settings, _str_Port, 0
    and eax, 0xffff
    push eax
    call _htonl
    mov [_TunnelId], eax

    cmp dword [_TunnelPort],0
    jne .nosetport
    SpawnINI_Get_Int _str_Settings, _str_Port, 1234
    mov word [_ListenPort], ax
.nosetport:
     
    SpawnINI_Get_Bool _str_Settings, _str_Firestorm, 0
    
    cmp al, 0
    jz .No_Firestorm
    
    ; Firestorm related variables
    mov dword [0x006F2638], 3 ; FIXME: name this
    mov dword [0x006F263C], 3 ; FIXME: name this
    
.No_Firestorm:
    
    mov ecx, _SessionClass_this
    call _SessionClass__Read_Scenario_Descriptions
        
    ; scenario
    lea eax, [_ScenarioName]
    SpawnINI_Get_String _str_Settings, _str_Scenario, _str_Empty, eax, 32

;    push _str_gcanyonmap
;    push 0x007E28B0 ; map buffer used by something
;    call 0x006BE630 ; strcpy
;    add esp, 8

    call Add_Human_Player
    call Add_Human_Opponents
    
    SpawnINI_Get_Bool _str_Settings, _str_IsSinglePlayer, 0
    cmp al, 0
    jz .Not_Single_Player
    
    mov dword [_SessionType], 0 ; single player
    
    SpawnINI_Get_Int _str_Settings, _str_DifficultyMode1, 1
    push eax
    
    SpawnINI_Get_Int _str_Settings, _str_DifficultyMode2, 1
    
    pop edx
    mov ebx, [_ScenarioStuff]
    
    mov dword [ebx+0x60C], edx ; DifficultyMode1
    mov dword [ebx+0x608], eax ; DifficultyMode2
   
.Not_Single_Player:
        
    ; Needs to be done after SessionClass is set, or the seed value will be overwritten
    ; inside the _Init_Random() call if sessiontype == SKIRMISH
    SpawnINI_Get_Int _str_Settings, _str_Seed, 0
    mov dword [_Seed], eax
    call _Init_Random
    
    ; Initialize networking
    
    push 35088h
    call _new
    add esp, 4
    
    mov ecx, eax
    call _UDPInterfaceClass__UDPInterfaceClass
    
    mov [_WinsockInterface_this], eax
    
    mov ecx, [_WinsockInterface_this]
    call _WinsockInterfaceClass__Init
    
    push 0
    mov ecx, [_WinsockInterface_this]
    call _UDPInterfaceClass__Open_Socket
    
    mov ecx, [_WinsockInterface_this]
    call _WinsockInterfaceClass__Start_Listening
    
    mov ecx, [_WinsockInterface_this]
    call _WinsockInterfaceClass__Discard_In_Buffers
    
    mov ecx, [_WinsockInterface_this]
    call _WinsockInterfaceClass__Discard_Out_Buffers
    
    mov ecx, _IPXManagerClass_this
    push 1
    push 258h
    push 0FFFFFFFFh
    push 3Ch
    call _IPXManagerClass__Set_Timing

    ; WOL settings
 ;   mov dword [_MaxAhead], 40
 ;   mov dword [_FrameSendRate], 10
   
    mov dword [_MaxAhead], 20
    mov dword [_FrameSendRate], 4
    
    mov dword [_MaxMaxAhead], 0
    mov dword [_LatencyFudge], 0
    mov dword [_RequestedFPS], 60
    mov dword [_ProtocolVersion], 2

    call _Init_Network
    
    mov dword eax, [_NameNodes_CurrentSize]
    mov dword [_HumanPlayers], eax
    
    SpawnINI_Get_Bool _str_Settings, _str_LoadSaveGame, 0
    cmp al, 0
    jz  .Dont_Load_Savegame
    
    lea eax, [var.SaveGameNameBuf]
    SpawnINI_Get_String _str_Settings, _str_SaveGameName, _str_Empty, eax, 60
 
    mov byte [0x7E48FC], 0
    mov byte [0x7E4040], 0
    lea ecx, [var.SaveGameNameBuf]
    call _Load_Game
    
    jmp .Dont_Load_Scenario
   
.Dont_Load_Savegame:

    ; _start scenario 
    push -1 
    xor edx, edx 
    mov ecx, _ScenarioName
    call _Start_Scenario

    ; modify some RulesClass (RULES.INI stuff) settings
    mov esi, [0x0074C488] ; RulesClass pointer

    ; Load MultipleFactory from SPAWN.INI if not missing
    ; Else use the value already loaded from a RULES.INI file
    SpawnINI_Get_Fixed _str_Settings, _str_MultipleFactory, dword [esi+2B0h], dword [esi+2B4h]
    fstp qword [esi+2B0h]
    
    ; THIS ONE DOESN'T SEEM TO WORK
;    mov byte [esi+0F48h], 0 ; Disable Paranoid RulesClass setting
    
.Dont_Load_Scenario:

    ; HACK: If SessonType was set to WOL then set it to LAN now
    ; We had to set _SessionType to WOL to make sure players connect
    ; while _Start_Scenario was being executed
    
    cmp dword [_SessionType], 4
    jnz .Dont_Set_SessionType_To_Lan
    
    mov dword [_SessionType], 3 
      
.Dont_Set_SessionType_To_Lan:

    mov ecx, _SessionClass_this
    call _SessionClass__Create_Connections
      
    mov ecx, _IPXManagerClass_this
    push 1
    push 258h
    push 0FFFFFFFFh
    push 3Ch
    call _IPXManagerClass__Set_Timing
       
    call 0x00462C60 ; FIXME: name this and everything below
       
    mov ecx, [_WWMouseClas_Mouse] 
    mov edx, [ecx] 
    call dword [edx+0Ch] 
       
    mov ecx, [0x0074C5DC] 
    push 0 
    mov eax, [ecx] 
    call dword [eax+18h] 
       
    push 0 
    mov cl, 1 
    mov edx, [0x0074C5DC] 
    call 0x004B96C0 
       
    mov ecx, [_WWMouseClas_Mouse] 
    mov edx, [ecx] 
    call dword [edx+10h] 
       
    mov eax, [0x0074C5DC] 
    mov [0x0074C5E4], eax 
       
    push 0 
    push 13h 
    mov ecx, _MouseClass_Map 
    call 0x00562390 
       
    mov ecx, _MouseClass_Map 
    call 0x005621F0 
       
    push 1 
    mov ecx, _MouseClass_Map 
    call 0x005F3E60 
       
    push 0 
    mov ecx, _MouseClass_Map 
    call 0x004B9440 
       
    call 0x00462C60 
     
;; Hide mouse, shouldn't be needed and makes mouse invisible in the match if it's there.
;    mov ecx, [0x0074C8F0] 
;    mov edx, [ecx] 
;    call dword [edx+0Ch]
   
.Ret:   
    mov eax, 1
    jmp .exit
.Ret_Exit:
    mov eax, 0
    jmp .exit
.Exit_Error:
    mov eax, -1
    jmp .exit

.exit:
    mov esp,ebp
    pop ebp
    retn
%pop

_Select_Game_Init_Spawner:
    push ebx
    call Initialize_Spawn
    cmp eax,-1
    pop ebx
    ; if spawn not initialized, go to main menu
    je .Normal_Code
    
    retn
   
.Normal_Code:   
    mov ecx, [_WWMouseClas_Mouse]
    sub esp, 1ACh
    mov eax, [ecx]
    push ebx
    push ebp
    push esi
    push edi
    jmp 0x004E1DF2
    
Add_Human_Player:      
%push
    push ebp
    mov ebp,esp
    sub esp,4

%define TempPtr ebp-4

    push 0x4D 
    call _new
       
    add esp, 4 
       
    mov esi, eax 

    lea ecx, [esi+14h] 
    call _IPXAddressClass__IPXAddressClass 

    lea eax, [esi]
    SpawnINI_Get_String _str_Settings, _str_Name, _str_Empty, eax, 0x14

;    lea ecx,  
;    push _str_debugplayer 
;    push ecx 
;    call 0x006BE630 ; strcpy     
;    add esp, 8 
       
    ; Player side
    SpawnINI_Get_Int _str_Settings, _str_Side, 0
    mov dword [esi+0x35], eax ; side
    push eax
    
    ; Sidebar hack for mods which add _new sides and _new sidebars for them
    ; this will not fuck invert al which is needed for normal TS sidebar loading
    ; as GDI needs 1 and Nod 0 for sidebar (which is the opposite of their side index)
    SpawnINI_Get_Bool _str_Settings, _str_SidebarHack, 0
    cmp al, 1
    pop eax
    jz  .Sidebar_Hack

    ; Invert AL to set byte related to what sidebar and speech graphics to load
    cmp al, 1
    jz .Set_AL_To_Zero
        
    mov al, 1
    jmp .Past_AL_Invert
        
.Set_AL_To_Zero:
    mov al, 0
        
.Past_AL_Invert:
.Sidebar_Hack:     
    mov byte [0x7E2500], al ; For side specific mix files loading and stuff, without sidebar and speech hack

    SpawnINI_Get_Int _str_Settings, _str_Color, 0
    mov dword [esi+0x39], eax  ; color
    mov dword [_PlayerColor], eax

    mov dword [esi+0x41], -1 
       
    mov [TempPtr], esi 
    lea eax, [TempPtr] 
    push eax 
    mov ecx, _NameNodeVector
    call _NameNodeVector_Add

    mov esp,ebp
    pop ebp
    retn
%pop
      
Add_Human_Opponents:
%push
    push ebp
    mov ebp,esp
    sub esp,128+128+4+4

%define TempBuf         ebp-128
%define OtherSection    ebp-128-128
%define TempPtr         ebp-128-128-4
%define CurrentOpponent ebp-128-128-4-4

    ; copy opponents
    xor ecx,ecx
    mov dword [CurrentOpponent], ecx
    
.next_opp:
    mov ecx, [CurrentOpponent]
    add ecx,1
    mov dword [CurrentOpponent], ecx

    push ecx
    push _str_OtherSectionFmt ; Other%d
    lea eax, [OtherSection]
    push eax
    call _sprintf
    add esp, 0x0C
    
    push 0x4D 
    call _new
    add esp, 4 
      
    mov esi, eax 
    lea ecx, [esi+14h] 
    call _IPXAddressClass__IPXAddressClass
      
    lea eax, [esi]
    lea ecx, [OtherSection]
    SpawnINI_Get_String ecx, _str_Name, _str_Empty, eax, 0x14
    
    lea eax, [esi]
    mov eax, [eax]
    test eax, eax
    ; if no name present for this section, this is the last
    je .Exit
    
    lea ecx, [OtherSection]
    SpawnINI_Get_Int ecx, _str_Side, -1
    mov dword [esi+0x35], eax ; side 
        
    cmp eax,-1
    je .next_opp

    lea ecx, [OtherSection]
    SpawnINI_Get_Int ecx, _str_Color, -1
    mov dword [esi+0x39], eax ; color
        
    cmp eax,-1
    je .next_opp
     
    mov eax, 1
    mov dword [_SessionType], 4 ; HACK: SessonType set to WOL, will be set to LAN later

    ; set addresses to indexes for send/receive hack
    mov [esi + 0x14 + SpawnAddress.pad1], word 0
    mov ecx, dword [CurrentOpponent]
    mov [esi + 0x14 + SpawnAddress.id], ecx
    mov [esi + 0x14 + SpawnAddress.pad2], word 0

    lea eax, [TempBuf]
    lea ecx, [OtherSection]
    SpawnINI_Get_String ecx, _str_Ip, _str_Empty, eax, 32
    
    lea eax, [TempBuf]
    push eax
    call [var.inet_addr]
    
    mov ecx, dword [CurrentOpponent]
    dec ecx
    mov [ecx * ListAddress_size + _AddressList + ListAddress.ip], eax
    
    lea ecx, [OtherSection]
    SpawnINI_Get_Int ecx, _str_Port, 0
    and eax, 0xffff

    push eax
    call _htonl
    shr eax,16

    ; disable _PortHack if different port than own
    cmp ax, [_ListenPort]
    je .samePort
    mov dword [_PortHack], 0    
.samePort:

    mov ecx, dword [CurrentOpponent]
    dec ecx
    mov [ecx * ListAddress_size + _AddressList + ListAddress.port], ax

    mov dword [esi+0x41], -1 
    
    mov byte [esi+0x1E], 1
       
    mov [TempPtr], esi 
    lea eax, [TempPtr] 
    push eax 
    mov ecx, _NameNodeVector ; FIXME: name this
    call _NameNodeVector_Add ; FIXME: name this
      
    jmp .next_opp
.Exit:
    mov esp,ebp
    pop ebp
    retn
%pop
