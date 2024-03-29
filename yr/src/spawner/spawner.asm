%include "macros/patch.inc"
%include "macros/string.inc"

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

StringZ gcanyonmap,       "blitz_test.map"
StringZ debugplayer,      "debugplayer"
StringZ debugplayer2,     "debugplayer2"
StringZ wsock32_dll,      "wsock32.dll"
StringZ inet_addr,        "inet_addr"
StringZ localhost,        "127.0.0.1"
StringZ spawn_ini,        "SPAWN.INI"
StringZ Settings,         "Settings"
StringZ UnitCount,        "UnitCount"
StringZ Scenario,         "Scenario"
StringZ Empty,            ""
StringZ GameSpeed,        "GameSpeed"
StringZ Seed,             "Seed"
StringZ TechLevel,        "TechLevel"
StringZ AIPlayers,        "AIPlayers"
StringZ AIDifficulty,     "AIDifficulty"
StringZ BuildOffAlly,     "BuildOffAlly"
StringZ Superweapons,     "Superweapons"
StringZ HarvesterTruce,   "HarvesterTruce"
StringZ GameMode,         "GameMode"
StringZ BridgeDestroy,    "BridgeDestroy"
StringZ FogOfWar,         "FogOfWar"
StringZ Crates,           "Crates"
StringZ ShortGame,        "ShortGame"
StringZ Bases,            "Bases"
StringZ MCVRedeploy,      "MCVRedeploy"
StringZ Credits,          "Credits"
StringZ Name,             "Name"
StringZ Side,             "Side"
StringZ Color,            "Color"
StringZ OtherSectionFmt,  "Other%d"

StringZ Other1,           "Other1"
StringZ Other2,           "Other2"
StringZ Other3,           "Other3"
StringZ Other4,           "Other4"
StringZ Other5,           "Other5"
StringZ Other6,           "Other6"
StringZ Other7,           "Other7"

StringZ Port,             "Port"
StringZ Ip,               "Ip"
StringZ SpawnArg,         "-SPAWN"
StringZ MultiEngineer,    "MultiEngineer"
StringZ Firestorm,        "Firestorm"
StringZ Tunnel,           "Tunnel"
StringZ IsSinglePlayer,   "IsSinglePlayer"
StringZ LoadSaveGame,     "LoadSaveGame"
StringZ SaveGameName,     "SaveGameName"
StringZ MultipleFactory,  "MultipleFactory"
StringZ AlliesAllowed,    "AlliesAllowed"
StringZ IsSpectator,	  "IsSpectator"

cextern Load_Predetermined_Alliances
cextern Load_Selectable_Countries
cextern Load_Selectable_Handicaps
cextern Load_Selectable_Colors
cextern Load_Selectable_Spawns
cextern ObserverMode

section .bss
cglobal INIClass_SPAWN
INIClass_SPAWN             RESB 256 ; FIXME: make this a local able

section .text

%macro SpawnINI__GetInt 3
     call_INIClass__GetInt    INIClass_SPAWN, %1, %2, %3
%endmacro

%macro SpawnINI__GetBool 3
     call_INIClass__GetBool   INIClass_SPAWN, %1, %2, %3
%endmacro

%macro SpawnINI__GetString 5
     call_INIClass__GetString INIClass_SPAWN, %1, %2, %3, %4, %5
%endmacro

%macro SpawnINI__GetFixed 4
     call_INIClass__GetFixed  INIClass_SPAWN, %1, %2, %3, %4
%endmacro

@LJMP 0x0052C5D3, _Init_Game_Check_Spawn_Arg_No_Intro
@LJMP 0x0052D9A0, _Select_Game_Init_Spawner
@LJMP 0x00687F15, _Assign_Houses_Do_Spawner_Stuff
@LJMP 0x00688378, _Assign_Houses_Epilogue_Do_Spawner_Stuff

@LJMP 0x00501721, _Dont_Do_Alliances_At_Game_Start
@LJMP 0x00686A9E, _More_Alliances_Crap
@LJMP 0x005D74A0, _Teams_Alliances_Stuff

;; max number of players in static address list
cextern AddressList
cextern TunnelId
cextern TunnelIp
cextern TunnelPort
cextern PortHack
cextern NetHack_SendTo
cextern NetHack_RecvFrom

;@CALL 0x007B3D75, NetHack_SendTo
;@CALL 0x007B3EEC, NetHack_RecvFrom

[section .bss]
cglobal SpawnerCheck
SpawnerCheck resb 1
__SECT__

@CALL 0x007B3D75, NetHack_SendTo_
@CALL 0x007B3EEC, NetHack_RecvFrom_

NetHack_SendTo_:
%push
    push ebp
    mov ebp, esp
    sub esp, sockaddr_in_size
    push esi
    push edi

%define TempDest    ebp-sockaddr_in_size

%define addrlen     ebp+28
%define dest_addr   ebp+24
%define flags       ebp+20
%define len         ebp+16
%define buf         ebp+12
%define sockfd      ebp+8

    ; pull index
    mov ecx, [dest_addr]
    mov ecx, [ecx + sockaddr_in.sin_addr]

    ; validate index
    cmp ecx, 1
    jl .error
    cmp ecx, 8
    jg .error

    ; change to zero based
    dec ecx

    ; sin_family
    lea edx, [TempDest + sockaddr_in.sin_family]
    mov word [edx], 2

    ; sin_port
    mov ax, word [ecx * ListAddress_size + AddressList + ListAddress.port]
    lea edx, [TempDest + sockaddr_in.sin_port]
    mov word [edx], ax

    ; sin_addr
    mov eax, dword [ecx * ListAddress_size + AddressList + ListAddress.ip]
    lea edx, [TempDest + sockaddr_in.sin_addr]
    mov dword [edx], eax

    ; sin_zero
    xor eax, eax
    lea edx, [TempDest + sockaddr_in.sin_zero]
    mov dword [edx], eax
    add edx, 4
    mov dword [edx], eax

    ; do call to sendto
    mov eax, [addrlen]
    push eax
    lea eax, [TempDest]
    push eax
    mov eax, [flags]
    push eax
    mov eax, [len]
    push eax
    mov eax, [buf]
    push eax
    mov eax, [sockfd]
    push eax
    call Tunnel_SendTo_

    jmp .exit
.error:
    mov eax,-1
.exit:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    retn 24
%pop

NetHack_RecvFrom_:
%push
    push ebp
    mov ebp, esp
    push esi
    push edi

%define addrlen     ebp+28
%define src_addr    ebp+24
%define flags       ebp+20
%define len         ebp+16
%define buf         ebp+12
%define sockfd      ebp+8

    ; call recvfrom first to get the packet
    mov eax, [addrlen]
    push eax
    mov eax, [src_addr]
    push eax
    mov eax, [flags]
    push eax
    mov eax, [len]
    push eax
    mov eax, [buf]
    push eax
    mov eax, [sockfd]
    push eax
    call Tunnel_RecvFrom_

    ; bail out if error
    cmp eax, -1
    je .exit

    ; now, we need to map src_addr ip/port to index by reversing the search!
    xor ecx,ecx
.nextaddr:

    ; compare ip
    mov edx, [src_addr]
    mov edx, [edx + sockaddr_in.sin_addr]
    cmp edx, [ecx * ListAddress_size + AddressList + ListAddress.ip]
    jne .next

    cmp dword [PortHack], 1
    je .skipPort
    ; compare port
    mov edx,[src_addr]
    mov dx, [edx + sockaddr_in.sin_port]
    and edx, 0xffff
    cmp dx, [ecx * ListAddress_size + AddressList + ListAddress.port]
    jne .next
.skipPort:

    ; found it, set this index to source addr
    inc ecx
    mov edx, [src_addr]
    mov [edx + sockaddr_in.sin_addr], ecx

    mov edx, [src_addr]
    mov word [edx + sockaddr_in.sin_port], 0

    jmp .exit

.next:
    inc ecx
    cmp ecx, 7
    jg .exit
    jmp .nextaddr

.exit:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    retn 24
%pop

Tunnel_SendTo_:
%push
    push ebp
    mov ebp,esp
    sub esp,1024
    push esi
    push edi

%define TempBuf     (ebp-1024)

%define addrlen     ebp+28
%define dest_addr   ebp+24
%define flags       ebp+20
%define len         ebp+16
%define buf         ebp+12
%define sockfd      ebp+8

    ; no processing if no tunnel
    cmp dword [TunnelPort], 0
    je .notunnel

    ; copy packet to our buffer
    mov esi, [buf]
    lea edi, [TempBuf + 4]
    mov ecx, [len]
    cld
    rep movsb

    ; pull dest port to header
    lea eax, [TempBuf]

    mov ecx, [dest_addr]
    lea ecx, [ecx + sockaddr_in.sin_port]
    mov edx, [ecx]
    shl edx, 16
    mov [eax], edx

    mov edx, [TunnelId]
    shr edx, 16
    or [eax], edx

    and edx,0xffff
    or [eax], edx

    ; set dest_addr to tunnel address
    mov eax, [dest_addr]
    lea eax, [eax + sockaddr_in.sin_port]
    mov edx, [TunnelPort]
    shr edx, 16
    mov word [eax],dx

    mov eax, [dest_addr]
    lea eax, [eax + sockaddr_in.sin_addr]
    mov edx, [TunnelIp]
    mov dword [eax], edx

    mov eax, [addrlen]
    push eax
    mov eax, [dest_addr]
    push eax
    mov eax, [flags]
    push eax
    mov eax, [len]
    add eax, 4
    push eax
    lea eax, [TempBuf]
    push eax
    mov eax, [sockfd]
    push eax
    call sendto
    jmp .exit

.notunnel:
    mov eax, [addrlen]
    push eax
    mov eax, [dest_addr]
    push eax
    mov eax, [flags]
    push eax
    mov eax, [len]
    push eax
    mov eax, [buf]
    push eax
    mov eax, [sockfd]
    push eax
    call sendto

.exit:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    retn 24
%pop

Tunnel_RecvFrom_:
%push
    push ebp
    mov ebp, esp
    sub esp, 1024
    push esi
    push edi

%define TempBuf     (ebp-1024)

%define addrlen     ebp+28
%define src_addr    ebp+24
%define flags       ebp+20
%define len         ebp+16
%define buf         ebp+12
%define sockfd      ebp+8

    ; no processing if no tunnel
    cmp dword [TunnelPort], 0
    je .notunnel

    ; call recvfrom first to get the packet
    mov eax, [addrlen]
    push eax
    mov eax, [src_addr]
    push eax
    mov eax, [flags]
    push eax
    mov eax, 1024        ; len
    push eax
    lea eax, [TempBuf]
    push eax
    mov eax, [sockfd]
    push eax
    call recvfrom

    ; no processing if returnng error
    cmp eax, -1
    je .exit

    ; no processing if less than 5 bytes of data
    cmp eax, 5
    jl .error

    ; remove header from return length
    sub eax, 4

    ; copy real packet after header to game buf
    lea esi, [TempBuf + 4]
    mov edi, [buf]
    mov ecx, eax
    cld
    rep movsb

    ; pull our header
    lea edx, [TempBuf]
    mov edx, [edx]

    ; fixme: going to assume packets are meant for me, someone can validate the "to" part later...
    ; leaving just from here
    and edx, 0xffff

    ; set from port to header identifier
    mov ecx, [src_addr]
    lea ecx, [ecx + sockaddr_in.sin_port]
    mov word [ecx],dx

    xor edx,edx
    mov ecx,[src_addr]
    lea ecx,[ecx + sockaddr_in.sin_addr]
    mov dword [ecx],edx

    jmp .exit

.notunnel:
    ; call recvfrom first to get the packet
    mov eax, [addrlen]
    push eax
    mov eax, [src_addr]
    push eax
    mov eax, [flags]
    push eax
    mov eax, [len]
    push eax
    mov eax, [buf]
    push eax
    mov eax, [sockfd]
    push eax
    call recvfrom
    jmp .exit

.error:
    mov eax, -1
.exit:
    pop edi
    pop esi
    mov esp,ebp
    pop ebp
    retn 24
%pop

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
    mov edx, [HouseClassArray_Count]

    cmp dword [%$SpawnerActive], 1
    jz .Ret

    jmp 0x005D74A7

.Ret:
    mov al, 1
    jmp 0x005D7548


_More_Alliances_Crap:
    mov ecx, [HouseClassArray]

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
	call Load_Selectable_Spawns

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


    ; Make sure players aren't the same team by default
    ; Spawner uses a different system to set up teams
    mov dword [PlayersTeams+0], -1
    mov dword [PlayersTeams+4], -1
    mov dword [PlayersTeams+8], -1
    mov dword [PlayersTeams+12], -1
    mov dword [PlayersTeams+16], -1
    mov dword [PlayersTeams+20], -1
    mov dword [PlayersTeams+24], -1
    mov dword [PlayersTeams+28], -1

.Ret:
    popad
    mov edi, [NameNodes_CurrentSize]
    jmp  0x00687F1B

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

    mov [%$$inet_addr], eax

    mov byte [GameActive], 1 ; needs to be set here or the game gets into an infinite loop trying to create spawning units

    ; set session
    mov dword [SessionType], 5


    SpawnINI__GetInt str_Settings, str_UnitCount, 0
    mov dword [UnitCount], eax

    SpawnINI__GetInt str_Settings, str_TechLevel, 10
    mov dword [TechLevel], eax

    SpawnINI__GetInt str_Settings, str_AIPlayers, 0
    mov dword [AIPlayers], eax

    SpawnINI__GetInt str_Settings, str_AIDifficulty, 1
    mov dword [AIDifficulty], eax

    SpawnINI__GetBool str_Settings, str_BuildOffAlly, 0
    mov dword [BuildOffAlly], eax

    SpawnINI__GetBool str_Settings, str_Superweapons, 1
    mov byte [SuperWeapons], al

    SpawnINI__GetBool str_Settings, str_HarvesterTruce, 0
    mov byte [HarvesterTruce], al

    SpawnINI__GetBool str_Settings, str_BridgeDestroy, 1
    mov byte [BridgeDestroy], al

    SpawnINI__GetBool str_Settings, str_FogOfWar, 0
    mov byte [FogOfWar], al

    SpawnINI__GetBool str_Settings, str_Crates, 0
    mov byte [Crates], al

    SpawnINI__GetBool str_Settings, str_ShortGame, 0
    mov byte [ShortGame], al

    SpawnINI__GetBool str_Settings, str_Bases, 1
    mov byte [Bases], al

    SpawnINI__GetBool str_Settings, str_MCVRedeploy, 1
    mov byte [MCVRedeploy], al

    SpawnINI__GetInt str_Settings, str_Credits, 10000
    mov dword [Credits], eax

    SpawnINI__GetInt str_Settings, str_GameSpeed, 0
    mov dword [GameSpeed], eax

    SpawnINI__GetBool str_Settings, str_MultiEngineer, 0
    mov byte [MultiEngineer], al

    ; tunnel ip
    lea eax, [TempBuf]
    SpawnINI__GetString str_Tunnel, str_Ip, str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [%$$inet_addr]
    mov [TunnelIp], eax

    ; tunnel port
    SpawnINI__GetInt str_Tunnel, str_Port, 0
    and eax, 0xffff
    push eax
    call htonl
    mov [TunnelPort], eax

    ; tunnel id
    SpawnINI__GetInt str_Settings, str_Port, 0
    and eax, 0xffff
    push eax
    call htonl
    mov [TunnelId], eax

    cmp dword [TunnelPort],0
    jne .nosetport
    SpawnINI__GetInt str_Settings, str_Port, 1234
    mov word [ListenPort], ax
.nosetport:

    mov ecx, SessionClass_this
    call SessionClass__Read_Scenario_Descriptions

    call Add_Human_Player
    call Add_Human_Opponents

    ; scenario
    lea eax, [ScenarioName] ; FIXME: name this
    SpawnINI__GetString str_Settings, str_Scenario, str_Empty, eax, 32
	
	SpawnINI__GetBool str_Settings, str_IsSinglePlayer, 0
    cmp al, 0
    jz .Not_Single_Player
    
    mov dword [SessionType], 0 ; single player
       
.Not_Single_Player:

    ; Needs to be done after SessionClass is set, or the seed value will be overwritten
    ; inside the Init_Random() call if sessiontype == SKIRMISH
    SpawnINI__GetInt str_Settings, str_Seed, 0
    mov dword [Seed], eax
    call Init_Random

    ; Initialize networking

    push 3F5CCh
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

    mov dword [MaxAhead], 20
    mov dword [FrameSendRate], 4
    
    mov dword [MaxMaxAhead], 0
    mov dword [LatencyFudge], 0
    mov dword [RequestedFPS], 60
    mov dword [ProtocolVersion], 2

    call Init_Network

    mov dword eax, [NameNodes_CurrentSize]
    mov dword [HumanPlayers], eax

    ; Load HouseTypes background and stuff for scenario loading screen
    call Load_Sides_Stuff

    call 0x0061F210 ; Load_Country_Flags_And_Stuff

    SpawnINI__GetInt str_Settings, str_GameMode, 1
    mov ecx, eax
    call Set_Game_Mode
    mov [GameMode], eax

    cmp dword [SessionType], 0
    jnz .Start_Scenario_NOT_Singleplayer

    ; start scenario for singleplayer
    push 0
    mov edx, 1
    mov ecx, ScenarioName
    call Start_Scenario
    
    jmp .Past_Start_Scenario
    
.Start_Scenario_NOT_Singleplayer:
    
    ; start scenario for multiplayer
    push -1 
    xor edx, edx 
    mov ecx, ScenarioName
    call Start_Scenario

.Past_Start_Scenario:  

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


    mov ecx, [WWMouseClas_Mouse]
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

    mov ecx, [WWMouseClas_Mouse]
    mov edx, [ecx]
    call dword [edx+10h]

    mov eax, [0x0088730C]
    mov [0x00887314], eax

    push 0
    push 13h
    mov ecx, MouseClass_Map
    call 0x005BDC80

    mov ecx, MouseClass_Map
    call 0x005BDAA0

    push 1
    mov ecx, MouseClass_Map
    call 0x006D04F0

    push    0
    mov     ecx, MouseClass_Map
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

    call [GetCommandLineA]
    push str_SpawnArg
    push eax
    call strstr
    add esp, 8
    xor ebx, ebx
    cmp eax, 0
    setne bl

;    mov ebx, 1 ; HACK DONT CHECK -SPAWN

    mov [%$IsSpawnArgPresent], ebx
	mov [SpawnerCheck], bl
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
    mov ecx, INIClass_SPAWN
    call INIClass__INIClass

    ; load FileClass to INIClass
    push 0
    push 0
    lea eax, [TempFileClass]
    push eax
    Mov ecx, INIClass_SPAWN
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

Add_Human_Player:
%push
    push ebp
    mov ebp,esp
    sub esp,256

%define TempPtr ebp-4
%define NameBuf ebp-256

    push 1
    push 0x85
    call calloc

    mov esi, eax

    lea ecx, [esi+28h]
    call IPXAddressClass__IPXAddressClass

;    lea eax, [esi]
;    SpawnINI__GetString str_Settings, str_Name, str_Empty, eax, 0x14

    lea eax, [NameBuf]
    SpawnINI__GetString str_Settings, str_Name, str_Empty, eax, 0x28

    lea eax, [NameBuf]
    push 0x28
    push eax
    push esi
    call mbstowcs

    ; Player side
    SpawnINI__GetInt str_Settings, str_Side, 0
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

    SpawnINI__GetInt str_Settings, str_Color, 0
    mov dword [esi+0x53], eax  ; color
    mov dword [PlayerColor], eax

	SpawnINI__GetBool str_Settings, str_IsSpectator, 0
	
	cmp al, 0
	jz .Skip_Set_Spectator
	
	mov dword [esi+0x6B], -1
	mov dword [ObserverMode], 1
	
.Skip_Set_Spectator:	
	
    mov dword [esi+0x73], -1

    mov [TempPtr], esi
    lea eax, [TempPtr]
    push eax
    mov ecx, NameNodeVector
    call NameNodeVector_Add

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
    Add_Human_Opponent 1, str_Other1
    Add_Human_Opponent 2, str_Other2
    Add_Human_Opponent 3, str_Other3
    Add_Human_Opponent 4, str_Other4
    Add_Human_Opponent 5, str_Other5
    Add_Human_Opponent 6, str_Other6
    Add_Human_Opponent 7, str_Other7
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
    call calloc

    mov esi, eax
    lea ecx, [esi+28h]
    call IPXAddressClass__IPXAddressClass

    lea eax, [TempBuf]
    mov ecx, [%$$OtherSection]
    SpawnINI__GetString ecx, str_Name, str_Empty, eax, 0x28

    lea eax, [TempBuf]
    mov eax, [eax]
    test eax, eax
    ; if no name present for this section, this is the last
    je .Exit

    lea eax, [TempBuf]
    push 0x28
    push eax
    push esi
    call mbstowcs

    mov ecx, [%$$OtherSection]
    SpawnINI__GetInt ecx, str_Side, -1
    mov dword [esi+0x4B], eax ; side

    cmp eax,-1
    je .Exit

    mov ecx, [%$$OtherSection]
    SpawnINI__GetInt ecx, str_Color, -1
    mov dword [esi+0x53], eax  ; color

    cmp eax,-1
    je .Exit

    mov ecx, [%$$OtherSection]	
	SpawnINI__GetBool ecx, str_IsSpectator, 0
	cmp al, 0
	jz .Not_Spectator
	
	mov dword [esi+0x6B], -1
	
.Not_Spectator:	

    mov eax, 1
    mov dword [SessionType], 4 ; HACK: SessonType set to WOL, will be set to LAN later

    ; set addresses to indexes for send/receive hack
    mov [esi + 0x28 + SpawnAddress.pad1], word 0
    mov ecx, dword [CurrentOpponent]
    mov [esi + 0x28 + SpawnAddress.id], ecx
    mov [esi + 0x28 + SpawnAddress.pad2], word 0

    lea eax, [TempBuf]
    mov ecx, [%$$OtherSection]
    SpawnINI__GetString ecx, str_Ip, str_Empty, eax, 32

    lea eax, [TempBuf]
    push eax
    call [%$$inet_addr]

    mov ecx, dword [CurrentOpponent]
    dec ecx
    mov [ecx * ListAddress_size + AddressList + ListAddress.ip], eax

    mov ecx, [%$$OtherSection]
    SpawnINI__GetInt ecx, str_Port, 0
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

    mov dword [esi+0x73], -1

    mov byte [esi+0x1E], 1

    mov [TempPtr], esi
    lea eax, [TempPtr]
    push eax
    mov ecx, NameNodeVector ; FIXME: name this
    call NameNodeVector_Add ; FIXME: name this

 ;   jmp .next_opp
.Exit:
    mov esp,ebp
    pop ebp
    retn
%pop

%pop
