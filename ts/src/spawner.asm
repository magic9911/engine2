%include "c.inc"
%include "FileClass.inc"
%include "House.inc"
%include "INIClass.inc"
%include "Message.inc"
%include "Mouse.inc"
%include "Network.inc"
%include "Players.inc"
%include "Random.inc"
%include "SaveGame.inc"
%include "Scenario.inc"
%include "session.inc"
%include "socket.inc"
%include "win.inc"
%include "misc_instances.inc"

%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/extern.inc"
%include "macros/string.inc"


StringZ gcanyonmap,                 "blitz_test.map"
StringZ debugplayer,                "debugplayer"
StringZ debugplayer2,               "debugplayer2"
StringZ wsock32_dll,                "wsock32.dll"
StringZ inet_addr,                  "inet_addr"
StringZ localhost,                  "127.0.0.1"
StringZ spawn_ini,                  "SPAWN.INI"
StringZ Settings,                   "Settings"
StringZ UnitCount,                  "UnitCount"
StringZ Scenario,                   "Scenario"
StringZ Empty,                      ""
StringZ GameSpeed,                  "GameSpeed"
StringZ Seed,                       "Seed"
StringZ TechLevel,                  "TechLevel"
StringZ AIPlayers,                  "AIPlayers"
StringZ AIDifficulty,               "AIDifficulty"
StringZ HarvesterTruce,             "HarvesterTruce"
StringZ BridgeDestroy,              "BridgeDestroy"
StringZ FogOfWar,                   "FogOfWar"
StringZ Crates,                     "Crates"
StringZ ShortGame,                  "ShortGame"
StringZ Bases,                      "Bases"
StringZ MCVRedeploy,                "MCVRedeploy"
StringZ Credits,                    "Credits"
StringZ Name,                       "Name"
StringZ Side,                       "Side"
StringZ Color,                      "Color"
StringZ OtherSectionFmt,            "Other%d"
StringZ Port,                       "Port"
StringZ Ip,                         "Ip"
StringZ SpawnArg,                   "-SPAWN"
StringZ MultiEngineer,              "MultiEngineer"
StringZ Firestorm,                  "Firestorm"
StringZ HouseColors,                "HouseColors"
StringZ HouseCountries,             "HouseCountries"
StringZ HouseHandicaps,             "HouseHandicaps"
StringZ Tunnel,                     "Tunnel"
StringZ SpawnLocations,             "SpawnLocations"
StringZ IsSinglePlayer,             "IsSinglePlayer"
StringZ LoadSaveGame,               "LoadSaveGame"
StringZ SaveGameName,               "SaveGameName"
StringZ MultipleFactory,            "MultipleFactory"
StringZ AlliesAllowed,              "AlliesAllowed"
StringZ SidebarHack,                "SidebarHack"
StringZ BuildOffAlly,               "BuildOffAlly"
StringZ Host,                       "Host"

StringZ DifficultyMode1,            "DifficultyMode1"
StringZ DifficultyMode2,            "DifficultyMode2"

StringZ Multi1,                     "Multi1"
StringZ Multi2,                     "Multi2"
StringZ Multi3,                     "Multi3"
StringZ Multi4,                     "Multi4"
StringZ Multi5,                     "Multi5"
StringZ Multi6,                     "Multi6"
StringZ Multi7,                     "Multi7"
StringZ Multi8,                     "Multi8"

StringZ HouseAllyOne,               "HouseAllyOne"
StringZ HouseAllyTwo,               "HouseAllyTwo"
StringZ HouseAllyThree,             "HouseAllyThree"
StringZ HouseAllyFour,              "HouseAllyFour"
StringZ HouseAllyFive,              "HouseAllyFive"
StringZ HouseAllySix,               "HouseAllySix"
StringZ HouseAllySeven,             "HouseAllySeven"

StringZ Multi1_Alliances,           "Multi1_Alliances"
StringZ Multi2_Alliances,           "Multi2_Alliances"
StringZ Multi3_Alliances,           "Multi3_Alliances"
StringZ Multi4_Alliances,           "Multi4_Alliances"
StringZ Multi5_Alliances,           "Multi5_Alliances"
StringZ Multi6_Alliances,           "Multi6_Alliances"
StringZ Multi7_Alliances,           "Multi7_Alliances"
StringZ Multi8_Alliances,           "Multi8_Alliances"

section .bss
; global
    cglobal Spawner__Active
    Spawner__Active               resd 1
    cglobal Spawner__INIClass
    Spawner__INIClass             resb 256
    cglobal Spawner__SpawnLocations_Array
    Spawner__SpawnLocations_Array resd 8
    cglobal Spawner__IsSpectatorArray
    Spawner__IsSpectatorArray     resd 8

; local
    inet_addr                     resd 1

    HouseColorsArray              resd 8
    HouseCountriesArray           resd 8
    HouseHandicapsArray           resd 8

    IsDoingAlliancesSpawner       resb 1
    IsSpawnArgPresent             resd 1

    SaveGameNameBuf               resb 60

section .text

cextern Load_Spectators_Spawner
cextern UsedSpawnsArray
; max number of players in static address list
cextern AddressList
cextern TunnelId
cextern TunnelIp
cextern TunnelPort
cextern PortHack
cextern NetHack_SendTo
cextern NetHack_RecvFrom
cextern IsHost

@CALL 0x006A2525, NetHack_SendTo
@CALL 0x006A25F9, NetHack_RecvFrom

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

    cmp dword [SessionType], 0
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
    cmp dword [IsSpawnArgPresent], 1
    jz  .Ret

.Normal_Code:
    mov ecx, [HouseClassArray_Count]
    jmp 0x004C3636

.Ret:
    jmp 0x004C3700 ; jump to RETN instruction

_Assign_Houses_AI_Countries:
    mov ebp, [HouseClassArray_Count]
    cmp dword [HouseCountriesArray+ebp*4], -1
    jz  .Ret

    mov ecx, [HouseCountriesArray+ebp*4]
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
    cmp dword [IsSpawnArgPresent], 1
    jz  .Ret

    call SessionClass__Read_Scenario_Descriptions

.Ret:
    call [timeGetTime]
    jmp 0x005ED482


Init_Game_Spawner:
    lea eax, [UsedSpawnsArray]
    push 32             ; Size
    push 0xFF              ; Val
    push eax             ; Dst
    call memset
    add esp, 0Ch

    retn

_Init_Game_Check_Spawn_Arg_No_Intro:
    pushad

    call Init_Game_Spawner

    call [GetCommandLineA]
    push str_SpawnArg
    push eax
    call stristr
    add esp, 8
    xor ebx, ebx
    cmp eax, 0
    setne bl
    mov [IsSpawnArgPresent], ebx
    popad

    cmp dword [IsSpawnArgPresent], 0
    jz .Normal_Code

.No_Intro:
    jmp 0x004E0848


.Normal_Code:
    and ecx, 4
    cmp cl, 4
    jmp 0x004E0792


_HouseClass__Make_Ally_STFU_when_Allying_In_Loading_Screen_Spawner:
    cmp byte [IsDoingAlliancesSpawner], 1
    jz 0x004BDE68
    test al, al          ; hooked by patch
    jz 0x4BDE68
    jmp 0x004BDDB9

_SessionClass__Free_Scenario_Descriptions_RETN_Patch:
    retn

_Send_Statistics_Packet_Return_If_Spawner_Active:
    cmp dword [Spawner__Active], 1
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
    mov edi, [HouseClassArray] ; HouseClassArray
    mov edi, [edi+%1*4]

;    mov dword [edi+0x10DFC], eax
    mov esi, [edi+0x24]
    mov dword [esi+0x6C], eax
    mov dword [edi+10DFCh], eax

    push eax
    call Get_MP_Color

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
    mov edi, [HouseClassArray]
    mov edi, [edi+%1*4]

    mov ecx, [HouseTypesArray]
    mov eax, [ecx+eax*4]

    mov dword [edi+24h], eax

.Dont_Set_Country_%3:
%endmacro


; args <House number>, <identifier>
%macro Set_Spectator 2

    cmp dword [Spawner__IsSpectatorArray+4*%1], 0
    jz .No_Spectator_%2

    mov edi, [HouseClassArray]
    mov edi, [edi+%1*4]

    xor eax, eax
    cmp dword [Spawner__IsSpectatorArray+4*%1], 1
    sete al

    mov byte [edi+0x0CB], 1

.No_Spectator_%2:
%endmacro

; args <House number>, <DifficultyType>
%macro Set_House_Handicap 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Set_Handicap_%3
    mov edi, [HouseClassArray]
    mov edi, [edi+%1*4]

    push eax
    mov ecx, edi
    call HouseClass__Assign_Handicap ; DiffType HouseClass::Assign_Handicap(DiffType)

.Dont_Set_Handicap_%3:
%endmacro

; args <House number>, <House number to ally>
%macro House_Make_Ally 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Make_Ally_%3
    mov esi, [HouseClassArray] ; HouseClassArray
    mov edi, [esi+4*%1]

    push eax
    mov ecx, edi
    call HouseClass__Make_Ally

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
    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllyOne, -1
    cmp al, -1
    jz .Dont_Ally_Multi1_%3
    House_Make_Ally %2, eax, a%3

.Dont_Ally_Multi1_%3:

    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllyTwo, -1
    cmp al, -1
    jz .Dont_Ally_Multi2_%3
    House_Make_Ally %2, eax, b%3

.Dont_Ally_Multi2_%3:

    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllyThree, -1
    cmp al, -1
    jz .Dont_Ally_Multi3_%3
    House_Make_Ally %2, eax, c%3

.Dont_Ally_Multi3_%3:

    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllyFour, -1
    cmp al, -1
    jz .Dont_Ally_Multi4_%3
    House_Make_Ally %2, eax, d%3

.Dont_Ally_Multi4_%3:

    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllyFive, -1
    cmp al, -1
    jz .Dont_Ally_Multi5_%3
    House_Make_Ally %2, eax, e%3

.Dont_Ally_Multi5_%3:

    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllySix, -1
    cmp al, -1
    jz .Dont_Ally_Multi6_%3
    House_Make_Ally %2, eax, f%3

.Dont_Ally_Multi6_%3:

    call_INIClass__GetInt Spawner__INIClass, %1, str_HouseAllySeven, -1
    cmp al, -1
    jz .Dont_Ally_Multi7_%3
    House_Make_Ally %2, eax, g%3

.Dont_Ally_Multi7_%3:
%endmacro

Load_House_Countries_Spawner:
    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi1, -1
    mov dword [HouseCountriesArray+0], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi2, -1
    mov dword [HouseCountriesArray+4], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi3, -1
    mov dword [HouseCountriesArray+8], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi4, -1
    mov dword [HouseCountriesArray+12], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi5, -1
    mov dword [HouseCountriesArray+16], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi6, -1
    mov dword [HouseCountriesArray+20], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi7, -1
    mov dword [HouseCountriesArray+24], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseCountries, str_Multi8, -1
    mov dword [HouseCountriesArray+28], eax

    retn

Load_House_Colors_Spawner:
    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi1, -1
    mov dword [HouseColorsArray+0], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi2, -1
    mov dword [HouseColorsArray+4], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi3, -1
    mov dword [HouseColorsArray+8], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi4, -1
    mov dword [HouseColorsArray+12], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi5, -1
    mov dword [HouseColorsArray+16], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi6, -1
    mov dword [HouseColorsArray+20], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi7, -1
    mov dword [HouseColorsArray+24], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseColors, str_Multi8, -1
    mov dword [HouseColorsArray+28], eax

    retn

Load_Spawn_Locations_Spawner:
    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi1, -1
    mov dword [Spawner__SpawnLocations_Array+0], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi2, -1
    mov dword [Spawner__SpawnLocations_Array+4], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi3, -1
    mov dword [Spawner__SpawnLocations_Array+8], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi4, -1
    mov dword [Spawner__SpawnLocations_Array+12], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi5, -1
    mov dword [Spawner__SpawnLocations_Array+16], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi6, -1
    mov dword [Spawner__SpawnLocations_Array+20], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi7, -1
    mov dword [Spawner__SpawnLocations_Array+24], eax

    call_INIClass__GetInt Spawner__INIClass, str_SpawnLocations, str_Multi8, -1
    mov dword [Spawner__SpawnLocations_Array+28], eax

    retn

Load_House_Handicaps_Spawner:
    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi1, -1
    mov dword [HouseHandicapsArray+0], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi2, -1
    mov dword [HouseHandicapsArray+4], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi3, -1
    mov dword [HouseHandicapsArray+8], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi4, -1
    mov dword [HouseHandicapsArray+12], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi5, -1
    mov dword [HouseHandicapsArray+16], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi6, -1
    mov dword [HouseHandicapsArray+20], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi7, -1
    mov dword [HouseHandicapsArray+24], eax

    call_INIClass__GetInt Spawner__INIClass, str_HouseHandicaps, str_Multi8, -1
    mov dword [HouseHandicapsArray+28], eax

    retn

_Read_Scenario_INI_Assign_Houses_And_Spawner_House_Settings:
    pushad
    call Assign_Houses

    cmp dword [Spawner__Active], 0
    jz  .Ret

;    Set_House_Country 0, dword [HouseCountriesArray+0], a
;    Set_House_Country 1, dword [HouseCountriesArray+4], b
;    Set_House_Country 2, dword [HouseCountriesArray+8], c
;    Set_House_Country 3, dword [HouseCountriesArray+12], d
;    Set_House_Country 4, dword [HouseCountriesArray+16], e
;    Set_House_Country 5, dword [HouseCountriesArray+20], f
;    Set_House_Country 6, dword [HouseCountriesArray+24], g
;    Set_House_Country 7, dword [HouseCountriesArray+28], h

    Set_House_Color 0, dword [HouseColorsArray+0], a
    Set_House_Color 1, dword [HouseColorsArray+4], b
    Set_House_Color 2, dword [HouseColorsArray+8], c
    Set_House_Color 3, dword [HouseColorsArray+12], d
    Set_House_Color 4, dword [HouseColorsArray+16], e
    Set_House_Color 5, dword [HouseColorsArray+20], f
    Set_House_Color 6, dword [HouseColorsArray+24], g
    Set_House_Color 7, dword [HouseColorsArray+28], h

    mov byte [IsDoingAlliancesSpawner], 1

    House_Make_Allies_Spawner str_Multi1_Alliances, 0, a
    House_Make_Allies_Spawner str_Multi2_Alliances, 1, b
    House_Make_Allies_Spawner str_Multi3_Alliances, 2, c
    House_Make_Allies_Spawner str_Multi4_Alliances, 3, d
    House_Make_Allies_Spawner str_Multi5_Alliances, 4, e
    House_Make_Allies_Spawner str_Multi6_Alliances, 5, f
    House_Make_Allies_Spawner str_Multi7_Alliances, 6, g
    House_Make_Allies_Spawner str_Multi8_Alliances, 7, h

    mov byte [IsDoingAlliancesSpawner], 0

    Set_House_Handicap 0, dword [HouseHandicapsArray+0], a
    Set_House_Handicap 1, dword [HouseHandicapsArray+4], b
    Set_House_Handicap 2, dword [HouseHandicapsArray+8], c
    Set_House_Handicap 3, dword [HouseHandicapsArray+12], d
    Set_House_Handicap 4, dword [HouseHandicapsArray+16], e
    Set_House_Handicap 5, dword [HouseHandicapsArray+20], f
    Set_House_Handicap 6, dword [HouseHandicapsArray+24], g
    Set_House_Handicap 7, dword [HouseHandicapsArray+28], h

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
    push str_spawn_ini
    lea ecx, [TempFileClass]
    call FileClass__FileClass

    ; check ini exists
    lea ecx, [TempFileClass]
    xor edx, edx
    push edx
    call FileClass__Is_Available
    test al, al
    je .error

    ; initialize INIClass
    mov ecx, Spawner__INIClass
    call INIClass__INIClass

    ; load FileClass to INIClass
    push 0
    push 0
    lea eax, [TempFileClass]
    push eax
    Mov ecx, Spawner__INIClass
    call INIClass__Load

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


    cmp dword [IsSpawnArgPresent], 0
    je .Exit_Error

    cmp dword [Spawner__Active], 1
    jz .Ret_Exit

    mov dword [Spawner__Active], 1
    mov dword [PortHack], 1 ; default enabled

    call Load_SPAWN_INI
    cmp eax, 0
    jz .Exit_Error

    ; get pointer to inet_addr
    push str_wsock32_dll
    call [LoadLibraryA]

    push str_inet_addr
    push eax
    call [GetProcAddress]

    mov [inet_addr], eax

    call Load_House_Colors_Spawner
    call Load_House_Countries_Spawner
    call Load_House_Handicaps_Spawner
    call Load_Spawn_Locations_Spawner
    call Load_Spectators_Spawner

    mov byte [GameActive], 1 ; needs to be set here or the game gets into an infinite loop trying to create spawning units

    ; set session
    mov dword [SessionType], 5

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_UnitCount, 1
    mov dword [UnitCount], eax

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_TechLevel, 10
    mov dword [TechLevel], eax

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_AIPlayers, 0
    mov dword [AIPlayers], eax

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_AIDifficulty, 1
    mov dword [AIDifficulty], eax

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_HarvesterTruce, 0
    mov byte [HarvesterTruce], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_BridgeDestroy, 1
    mov byte [BridgeDestroy], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_FogOfWar, 0
    mov byte [FogOfWar], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_BuildOffAlly, 0
    mov byte [BuildOffAlly], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_Crates, 0
    mov byte [Crates], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_ShortGame, 0
    mov byte [ShortGame], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_Bases, 1
    mov byte [Bases], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_AlliesAllowed, 1
    mov byte [AlliesAllowed], al

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_MCVRedeploy, 1
    mov byte [MCVRedeploy], al

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_Credits, 10000
    mov dword [Credits], eax

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_GameSpeed, 0
    mov dword [GameSpeed], eax

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_MultiEngineer, 0
    mov byte [MultiEngineer], al
    
    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_Host, 0
    mov byte [IsHost], al

    ; tunnel ip
    lea eax, [TempBuf]
    call_INIClass__GetString Spawner__INIClass, str_Tunnel, str_Ip, str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [inet_addr]
    mov [TunnelIp], eax

    ; tunnel port
    call_INIClass__GetInt Spawner__INIClass, str_Tunnel, str_Port, 0
    and eax, 0xffff
    push eax
    call htonl
    mov [TunnelPort], eax

    ; tunnel id
    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_Port, 0
    and eax, 0xffff
    push eax
    call htonl
    mov [TunnelId], eax

    cmp dword [TunnelPort],0
    jne .nosetport
    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_Port, 1234
    mov word [ListenPort], ax
.nosetport:

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_Firestorm, 0

    cmp al, 0
    jz .No_Firestorm

    ; Firestorm related variables
    mov dword [0x006F2638], 3 ; FIXME: name this
    mov dword [0x006F263C], 3 ; FIXME: name this

.No_Firestorm:

    mov ecx, SessionClass_this
    call SessionClass__Read_Scenario_Descriptions

    ; scenario
    lea eax, [ScenarioName]
    call_INIClass__GetString Spawner__INIClass, str_Settings, str_Scenario, str_Empty, eax, 32

;    push str_gcanyonmap
;    push 0x007E28B0 ; map buffer used by something
;    call 0x006BE630 ; strcpy
;    add esp, 8

    call Add_Human_Player
    call Add_Human_Opponents

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_IsSinglePlayer, 0
    cmp al, 0
    jz .Not_Single_Player

    mov dword [SessionType], 0 ; single player

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_DifficultyMode1, 1
    push eax

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_DifficultyMode2, 1

    pop edx
    mov ebx, [ScenarioStuff]

    mov dword [ebx+0x60C], edx ; DifficultyMode1
    mov dword [ebx+0x608], eax ; DifficultyMode2

.Not_Single_Player:

    ; Needs to be done after SessionClass is set, or the seed value will be overwritten
    ; inside the Init_Random() call if sessiontype == SKIRMISH
    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_Seed, 0
    mov dword [Seed], eax
    call Init_Random

    ; Initialize networking

    push 35088h
    call new
    add esp, 4

    mov ecx, eax
    call UDPInterfaceClass__UDPInterfaceClass

    mov [WinsockInterface_this], eax

    mov ecx, [WinsockInterface_this]
    call WinsockInterfaceClass__Init

    push 0
    mov ecx, [WinsockInterface_this]
    call UDPInterfaceClass__Open_Socket

    mov ecx, [WinsockInterface_this]
    call WinsockInterfaceClass__Start_Listening

    mov ecx, [WinsockInterface_this]
    call WinsockInterfaceClass__Discard_In_Buffers

    mov ecx, [WinsockInterface_this]
    call WinsockInterfaceClass__Discard_Out_Buffers

    mov ecx, IPXManagerClass_this
    push 1
    push 258h
    push 0FFFFFFFFh
    push 3Ch
    call IPXManagerClass__Set_Timing

    ; WOL settings
 ;   mov dword [MaxAhead], 40
 ;   mov dword [FrameSendRate], 10

    mov dword [MaxAhead], 20
    mov dword [FrameSendRate], 4

    mov dword [MaxMaxAhead], 0
    mov dword [LatencyFudge], 0
    mov dword [RequestedFPS], 60
    mov dword [ProtocolVersion], 2

    call Init_Network

    mov dword eax, [NameNodes_CurrentSize]
    mov dword [HumanPlayers], eax

    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_LoadSaveGame, 0
    cmp al, 0
    jz  .Dont_Load_Savegame

    lea eax, [SaveGameNameBuf]
    call_INIClass__GetString Spawner__INIClass, str_Settings, str_SaveGameName, str_Empty, eax, 60

    mov byte [0x7E48FC], 0
    mov byte [0x7E4040], 0
    lea ecx, [SaveGameNameBuf]
    call Load_Game

    jmp .Dont_Load_Scenario

.Dont_Load_Savegame:

    ; start scenario
    push -1
    xor edx, edx
    mov ecx, ScenarioName
    call Start_Scenario

    ; modify some RulesClass (RULES.INI stuff) settings
    mov esi, [0x0074C488] ; RulesClass pointer

    ; Load MultipleFactory from SPAWN.INI if not missing
    ; Else use the value already loaded from a RULES.INI file
    call_INIClass__GetFixed Spawner__INIClass, str_Settings, str_MultipleFactory, dword [esi+2B0h], dword [esi+2B4h]
    fstp qword [esi+2B0h]

    ; THIS ONE DOESN'T SEEM TO WORK
;    mov byte [esi+0F48h], 0 ; Disable Paranoid RulesClass setting

.Dont_Load_Scenario:

    ; HACK: If SessonType was set to WOL then set it to LAN now
    ; We had to set SessionType to WOL to make sure players connect
    ; while Start_Scenario was being executed

    cmp dword [SessionType], 4
    jnz .Dont_Set_SessionType_To_Lan

    mov dword [SessionType], 3

.Dont_Set_SessionType_To_Lan:

    mov ecx, SessionClass_this
    call SessionClass__Create_Connections

    mov ecx, IPXManagerClass_this
    push 1
    push 258h
    push 0FFFFFFFFh
    push 3Ch
    call IPXManagerClass__Set_Timing

    call 0x00462C60 ; FIXME: name this and everything below

    mov ecx, [WWMouseClas_Mouse]
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

    mov ecx, [WWMouseClas_Mouse]
    mov edx, [ecx]
    call dword [edx+10h]

    mov eax, [0x0074C5DC]
    mov [0x0074C5E4], eax

    push 0
    push 13h
    mov ecx, MouseClass_Map
    call 0x00562390

    mov ecx, MouseClass_Map
    call 0x005621F0

    push 1
    mov ecx, MouseClass_Map
    call 0x005F3E60

    push 0
    mov ecx, MouseClass_Map
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
    mov ecx, [WWMouseClas_Mouse]
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
    call new

    add esp, 4

    mov esi, eax

    lea ecx, [esi+14h]
    call IPXAddressClass__IPXAddressClass

    lea eax, [esi]
    call_INIClass__GetString Spawner__INIClass, str_Settings, str_Name, str_Empty, eax, 0x14

;    lea ecx,
;    push str_debugplayer
;    push ecx
;    call 0x006BE630 ; strcpy
;    add esp, 8

    ; Player side
    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_Side, 0
    mov dword [esi+0x35], eax ; side
    push eax

    ; Sidebar hack for mods which add new sides and new sidebars for them
    ; this will not fuck invert al which is needed for normal TS sidebar loading
    ; as GDI needs 1 and Nod 0 for sidebar (which is the opposite of their side index)
    call_INIClass__GetBool Spawner__INIClass, str_Settings, str_SidebarHack, 0
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

    call_INIClass__GetInt Spawner__INIClass, str_Settings, str_Color, 0
    mov dword [esi+0x39], eax  ; color
    mov dword [PlayerColor], eax

    mov dword [esi+0x41], -1

    mov [TempPtr], esi
    lea eax, [TempPtr]
    push eax
    mov ecx, NameNodeVector
    call NameNodeVector_Add

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
    push str_OtherSectionFmt ; Other%d
    lea eax, [OtherSection]
    push eax
    call sprintf
    add esp, 0x0C

    push 0x4D
    call new
    add esp, 4

    mov esi, eax
    lea ecx, [esi+14h]
    call IPXAddressClass__IPXAddressClass

    lea eax, [esi]
    lea ecx, [OtherSection]
    call_INIClass__GetString Spawner__INIClass, ecx, str_Name, str_Empty, eax, 0x14

    lea eax, [esi]
    mov eax, [eax]
    test eax, eax
    ; if no name present for this section, this is the last
    je .Exit

    lea ecx, [OtherSection]
    call_INIClass__GetInt Spawner__INIClass, ecx, str_Side, -1
    mov dword [esi+0x35], eax ; side

    cmp eax,-1
    je .next_opp

    lea ecx, [OtherSection]
    call_INIClass__GetInt Spawner__INIClass, ecx, str_Color, -1
    mov dword [esi+0x39], eax ; color

    cmp eax,-1
    je .next_opp

    mov eax, 1
    mov dword [SessionType], 4 ; HACK: SessonType set to WOL, will be set to LAN later

    ; set addresses to indexes for send/receive hack
    mov [esi + 0x14 + SpawnAddress.pad1], word 0
    mov ecx, dword [CurrentOpponent]
    mov [esi + 0x14 + SpawnAddress.id], ecx
    mov [esi + 0x14 + SpawnAddress.pad2], word 0

    lea eax, [TempBuf]
    lea ecx, [OtherSection]
    call_INIClass__GetString Spawner__INIClass, ecx, str_Ip, str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [inet_addr]

    mov ecx, dword [CurrentOpponent]
    dec ecx
    mov [ecx * ListAddress_size + AddressList + ListAddress.ip], eax

    lea ecx, [OtherSection]
    call_INIClass__GetInt Spawner__INIClass, ecx, str_Port, 0
    and eax, 0xffff

    push eax
    call htonl
    shr eax,16

    ; disable PortHack if different port than own
    cmp ax, [ListenPort]
    je .samePort
    mov dword [PortHack], 0
.samePort:

    mov ecx, dword [CurrentOpponent]
    dec ecx
    mov [ecx * ListAddress_size + AddressList + ListAddress.port], ax

    mov dword [esi+0x41], -1

    mov byte [esi+0x1E], 1

    mov [TempPtr], esi
    lea eax, [TempPtr]
    push eax
    mov ecx, NameNodeVector ; FIXME: name this
    call NameNodeVector_Add ; FIXME: name this

    jmp .next_opp
.Exit:
    mov esp,ebp
    pop ebp
    retn
%pop
