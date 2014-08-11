@LJMP 0x0052C5D3, _Init_Game_Check_Spawn_Arg_No_Intro
@LJMP 0x0052D9A0, _Select_Game_Init_Spawner
@LJMP 0x004FCBD0, _HouseClass__Flag_To_Lose_RETN_Patch ; for debugging
@LJMP 0x00687F15, _Assign_Houses_Do_Spawner_Stuff
@LJMP 0x00688378, _Assign_Houses_Epilogue_Do_Spawner_Stuff

@LJMP 0x00501721, _Dont_Do_Alliances_At_Game_Start
@LJMP 0x00686A9E, _More_Alliances_Crap
@LJMP 0x005D74A0, _Teams_Alliances_Stuff

; max number of players in static address list
extern _AddressList
extern _TunnelId
extern _TunnelIp
extern _TunnelPort
extern _PortHack
extern _NetHack_SendTo
extern _NetHack_RecvFrom

@CALL 0x007B3D75, _NetHack_SendTo
@CALL 0x007B3EEC, _NetHack_RecvFrom

%push

section .bss

%$SpawnerActive              resd 1
%$inet_addr                  resd 1
%$IsDoingAlliancesSpawner    resb 1
%$IsSpawnArgPresent          resd 1

;HouseColorsArray           resd 8
;HouseCountriesArray        resd 8
;HouseHandicapsArray        resd 8
;SpawnLocationsArray        resd 8

SaveGameNameBuf              resb 60

;DoingAutoSS                  resd 1

%$OtherSection               resd 1
;Anticheat1                   resd 1


section .text
_Teams_Alliances_Stuff:
    push ecx
    mov edx, [_HouseClassArray_Count]

    cmp dword [%$SpawnerActive], 1
    jz .Ret

    jmp 0x005D74A7

.Ret:
    mov al, 1
    jmp 0x005D7548


_More_Alliances_Crap:
    mov ecx, [_HouseClassArray]

    cmp dword [%$SpawnerActive], 1
    jz 0x00686AC6

    jmp 0x00686AA4


_Dont_Do_Alliances_At_Game_Start:
    cmp dword [%$SpawnerActive], 1
    jz .Skip

.Normal_Code:
    test cl, cl
    push 0
    push eax
    mov ecx, esi
    jmp 0x00501728

.Skip:
    jmp 0x00501736

_Dont_Make_Enemy_At_Game_Start:
    cmp dword [%$SpawnerActive], 0
    jz .Normal_Code

    add esp, 8
    jmp 0x0050172F

.Normal_Code:
    call 0x004F9F90 ; HouseClass::Make_Enemy
    jmp 0x0050172F

_Assign_Houses_Epilogue_Do_Spawner_Stuff:
    cmp dword [%$SpawnerActive], 0
    jz .Ret

    call Load_Predetermined_Alliances

.Ret:
    pop edi
    pop esi
    add esp, 4Ch
    jmp 0x0068837D

_Assign_Houses_Do_Spawner_Stuff:
    pushad

    cmp dword [%$SpawnerActive], 0
    jz .Ret

    call Load_Selectable_Countries
    call Load_Selectable_Handicaps
    call Load_Selectable_Colors
    call Load_Selectable_Spawns

    ; Make sure players aren't the same team by default
    ; Spawner uses a different system to set up teams
    mov dword [_PlayersTeams+0], -1
    mov dword [_PlayersTeams+4], -1
    mov dword [_PlayersTeams+8], -1
    mov dword [_PlayersTeams+12], -1
    mov dword [_PlayersTeams+16], -1
    mov dword [_PlayersTeams+20], -1
    mov dword [_PlayersTeams+24], -1
    mov dword [_PlayersTeams+28], -1

.Ret:
    popad
    mov edi, [_NameNodes_CurrentSize]
    jmp  0x00687F1B

_HouseClass__Flag_To_Lose_RETN_Patch:
    retn 4

Initialize_Spawn:
%push
    push ebp
    mov ebp,esp
    sub esp,128

%define TempBuf     ebp-128

    cmp dword [%$$IsSpawnArgPresent], 0
    je .Exit_Error

    cmp dword [%$$SpawnerActive], 1
    jz .Ret_Exit

    mov dword [%$$SpawnerActive], 1
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

    mov [%$$inet_addr], eax

    mov byte [_GameActive], 1 ; needs to be set here or the game gets into an infinite loop trying to create spawning units

    ; set session
    mov dword [_SessionType], 5


    SpawnINI__GetInt _str_Settings, _str_UnitCount, 0
    mov dword [_UnitCount], eax

    SpawnINI__GetInt _str_Settings, _str_TechLevel, 10
    mov dword [_TechLevel], eax

    SpawnINI__GetInt _str_Settings, _str_AIPlayers, 0
    mov dword [_AIPlayers], eax

    SpawnINI__GetInt _str_Settings, _str_AIDifficulty, 1
    mov dword [_AIDifficulty], eax

    SpawnINI__GetBool _str_Settings, _str_BuildOffAlly, 0
    mov dword [_BuildOffAlly], eax

    SpawnINI__GetBool _str_Settings, _str_SuperWeapons, 1
    mov byte [_SuperWeapons], al

    SpawnINI__GetBool _str_Settings, _str_HarvesterTruce, 0
    mov byte [_HarvesterTruce], al

    SpawnINI__GetBool _str_Settings, _str_BridgeDestroy, 1
    mov byte [_BridgeDestroy], al

    SpawnINI__GetBool _str_Settings, _str_FogOfWar, 0
    mov byte [_FogOfWar], al

    SpawnINI__GetBool _str_Settings, _str_Crates, 0
    mov byte [_Crates], al

    SpawnINI__GetBool _str_Settings, _str_ShortGame, 0
    mov byte [_ShortGame], al

    SpawnINI__GetBool _str_Settings, _str_Bases, 1
    mov byte [_Bases], al

    SpawnINI__GetBool _str_Settings, _str_MCVRedeploy, 1
    mov byte [_MCVRedeploy], al

    SpawnINI__GetInt _str_Settings, _str_Credits, 10000
    mov dword [_Credits], eax

    SpawnINI__GetInt _str_Settings, _str_GameSpeed, 0
    mov dword [_GameSpeed], eax

    SpawnINI__GetBool _str_Settings, _str_MultiEngineer, 0
    mov byte [_MultiEngineer], al

    ; tunnel ip
    lea eax, [TempBuf]
    SpawnINI__GetString _str_Tunnel, _str_Ip, _str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [%$$inet_addr]
    mov [_TunnelIp], eax

    ; tunnel port
    SpawnINI__GetInt _str_Tunnel, _str_Port, 0
    and eax, 0xffff
    push eax
    call _htonl
    mov [_TunnelPort], eax

    ; tunnel id
    SpawnINI__GetInt _str_Settings, _str_Port, 0
    and eax, 0xffff
    push eax
    call _htonl
    mov [_TunnelId], eax

    cmp dword [_TunnelPort],0
    jne .nosetport
    SpawnINI__GetInt _str_Settings, _str_Port, 1234
    mov word [_ListenPort], ax
.nosetport:

    mov ecx, _SessionClass_this
    call _SessionClass__Read_Scenario_Descriptions

    call Add_Human_Player
    call Add_Human_Opponents

    call Load_Spectators

    ; scenario
    lea eax, [_ScenarioName] ; FIXME: name this
    SpawnINI__GetString _str_Settings, _str_Scenario, _str_Empty, eax, 32

    ; Needs to be done after SessionClass is set, or the seed value will be overwritten
    ; inside the _Init_Random() call if sessiontype == SKIRMISH
    SpawnINI__GetInt _str_Settings, _str_Seed, 0
    mov dword [_Seed], eax
    call _Init_Random

    ; Initialize networking

    push 3F5CCh
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

    mov dword [_MaxAhead], 9
    mov dword [_MaxMaxAhead], 0
    MOV dword [_FrameSendRate], 3
    mov dword [_LatencyFudge], 0
    mov dword [_RequestedFPS], 60
    mov dword [_ProtocolVersion], 2

    call _Init_Network

    mov dword eax, [_NameNodes_CurrentSize]
    mov dword [_HumanPlayers], eax

    ; Load HouseTypes background and stuff for scenario loading screen
    call Load_Sides_Stuff

    call 0x0061F210 ; Load_Country_Flags_And_Stuff

    SpawnINI__GetInt _str_Settings, _str_GameMode, 1
    mov ecx, eax
    call _Set_Game_Mode
    mov [_GameMode], eax

    ; _start scenario
    push -1
    xor edx, edx
    mov ecx, _ScenarioName
    call _Start_Scenario

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


    mov ecx, [_WWMouseClas_Mouse]
    mov edx, [ecx]
    call dword [edx+0Ch]

    mov     ecx, [0x0088730C]
    push    0
    mov     eax, [ecx]
    call    dword [eax+18h]

    mov     edx, [0x0088730C]
    mov     cl, 1
    push    0
    call    0x004F4780

    mov ecx, [_WWMouseClas_Mouse]
    mov edx, [ecx]
    call dword [edx+10h]

    mov eax, [0x0088730C]
    mov [0x00887314], eax

    push 0
    push 13h
    mov ecx, _MouseClass_Map
    call 0x005BDC80

    mov ecx, _MouseClass_Map
    call 0x005BDAA0

    push 1
    mov ecx, _MouseClass_Map
    call 0x006D04F0

    push    0
    mov     ecx, _MouseClass_Map
    call    0x004F42F0

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
    call Initialize_Spawn
    cmp eax,-1
    ; if spawn not initialized, go to main menu
    je .Normal_Code

    retn

.Normal_Code:
    sub esp, 110h
    jmp 0x0052D9A6

_Init_Game_Check_Spawn_Arg_No_Intro:
    pushad

    call [_GetCommandLineA]
    push _str_SpawnArg
    push eax
    call _strstr
    add esp, 8
    xor ebx, ebx
    cmp eax, 0
    setne bl

;    mov ebx, 1 ; HACK DONT CHECK -SPAWN

    mov [%$IsSpawnArgPresent], ebx
    popad

    cmp dword [%$IsSpawnArgPresent], 0
    jz .Normal_Code


    jmp 0x0052C5F8

.Normal_Code:
    push 0x00826064  ;  offset a___ok   ; " ...OK\n"
    jmp 0x0052C5D8

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
    mov ecx, INIClass_SPAWN
    call _INIClass__INIClass

    ; load FileClass to INIClass
    push 0
    push 0
    lea eax, [TempFileClass]
    push eax
    Mov ecx, INIClass_SPAWN
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

Add_Human_Player:
%push
    push ebp
    mov ebp,esp
    sub esp,256

%define TempPtr ebp-4
%define NameBuf ebp-256

    push 1
    push 0x85
    call _calloc

    mov esi, eax

    lea ecx, [esi+28h]
    call _IPXAddressClass__IPXAddressClass

;    lea eax, [esi]
;    SpawnINI__GetString _str_Settings, _str_Name, _str_Empty, eax, 0x14

    lea eax, [NameBuf]
    SpawnINI__GetString _str_Settings, _str_Name, _str_Empty, eax, 0x28

    lea eax, [NameBuf]
    push 0x28
    push eax
    push esi
    call _mbstowcs

    ; Player side
    SpawnINI__GetInt _str_Settings, _str_Side, 0
    mov dword [esi+0x4B], eax ; side

    ; Invert AL to set byte related to what sidebar and speech graphics to load
    cmp al, 1
    jz .Set_AL_To_Zero

    mov al, 1
    jmp .Past_AL_Invert

.Set_AL_To_Zero:
    mov al, 0

.Past_AL_Invert:
;    mov byte [0x7E2500], al ; For side specific mix files loading and stuff, without sidebar and speech hack

    SpawnINI__GetInt _str_Settings, _str_Color, 0
    mov dword [esi+0x53], eax  ; color
    mov dword [_PlayerColor], eax

    mov dword [esi+0x73], -1

    mov [TempPtr], esi
    lea eax, [TempPtr]
    push eax
    mov ecx, _NameNodeVector
    call _NameNodeVector_Add

    mov esp,ebp
    pop ebp
    retn
%pop

Load_Sides_Stuff:
    mov eax, [0x00887048]
    mov ecx, [0x008871E0]
    push eax
    mov dword [esp+8], 0FFFFFFFFh
    call 0x006722F0
    mov ecx, [0x00887048]
    push ecx
    mov ecx, [0x008871E0]
    call 0x00672440
    mov eax, [0x00A83CA8]
    xor esi, esi
    test eax, eax
    jle .Ret

.Loop:
    mov edx, [0x00A83C9C] ; HouseTypesArray?
    mov ecx, [edx+esi*4]
    mov edx, [0x00887048]
    push edx
    mov eax, [ecx]
    call dword [eax+64h]
    mov eax, [0x00A83CA8]
    inc esi
    cmp esi, eax
    jl .Loop

.Ret:
    retn

%push

%macro Add_Human_Opponent 2
    mov dword [%$$OtherSection], %2
    mov eax, %1
    call Add_Human_Opponent_
%endmacro

Add_Human_Opponents:
    Add_Human_Opponent 1, _str_Other1
    Add_Human_Opponent 2, _str_Other2
    Add_Human_Opponent 3, _str_Other3
    Add_Human_Opponent 4, _str_Other4
    Add_Human_Opponent 5, _str_Other5
    Add_Human_Opponent 6, _str_Other6
    Add_Human_Opponent 7, _str_Other7
retn

%pop

Add_Human_Opponent_:
%push
    push ebp
    mov ebp,esp
    sub esp,128+128+4+4

%define TempBuf         ebp-128
%define TempPtr         ebp-128-128-4
%define CurrentOpponent ebp-128-128-4-4

    ; copy opponents
    mov ecx, eax
    mov dword [CurrentOpponent], ecx

    push 1
    push 0x85
    call _calloc

    mov esi, eax
    lea ecx, [esi+28h]
    call _IPXAddressClass__IPXAddressClass

    lea eax, [TempBuf]
    mov ecx, [%$$OtherSection]
    SpawnINI__GetString ecx, _str_Name, _str_Empty, eax, 0x28

    lea eax, [TempBuf]
    mov eax, [eax]
    test eax, eax
    ; if no name present for this section, this is the last
    je .Exit

    lea eax, [TempBuf]
    push 0x28
    push eax
    push esi
    call _mbstowcs

    mov ecx, [%$$OtherSection]
    SpawnINI__GetInt ecx, _str_Side, -1
    mov dword [esi+0x4B], eax ; side

    cmp eax,-1
    je .Exit

    mov ecx, [%$$OtherSection]
    SpawnINI__GetInt ecx, _str_Color, -1
    mov dword [esi+0x53], eax  ; color

    cmp eax,-1
    je .Exit

    mov eax, 1
    mov dword [_SessionType], 4 ; HACK: SessonType set to WOL, will be set to LAN later

    ; set addresses to indexes for send/receive hack
    mov [esi + 0x28 + SpawnAddress.pad1], word 0
    mov ecx, dword [CurrentOpponent]
    mov [esi + 0x28 + SpawnAddress.id], ecx
    mov [esi + 0x28 + SpawnAddress.pad2], word 0

    lea eax, [TempBuf]
    mov ecx, [%$$OtherSection]
    SpawnINI__GetString ecx, _str_Ip, _str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [%$$inet_addr]

    mov ecx, dword [CurrentOpponent]
    dec ecx
    mov [ecx * ListAddress_size + _AddressList + ListAddress.ip], eax

    mov ecx, [%$$OtherSection]
    SpawnINI__GetInt ecx, _str_Port, 0
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

    mov dword [esi+0x73], -1

    mov byte [esi+0x1E], 1

    mov [TempPtr], esi
    lea eax, [TempPtr]
    push eax
    mov ecx, _NameNodeVector ; FIXME: name this
    call _NameNodeVector_Add ; FIXME: name this

 ;   jmp .next_opp
.Exit:
    mov esp,ebp
    pop ebp
    retn
%pop

%pop
