%macro setglob 2
    global %2
    %2 equ %1
%endmacro

setglob 0x007CD80F, start
setglob 0x006BB9A0, WinMain@16

; winapi
setglob 0x007C89B0, sendto
setglob 0x007C89AA, recvfrom
setglob 0x007C8962, htonl
setglob 0x007E1280, GetCommandLineA
setglob 0x007CA4B0, strstr
setglob 0x007E1220, LoadLibraryA
setglob 0x007E1250, GetProcAddress
setglob 0x007C8EF4, sprintf
setglob 0x007CC2AC, mbstowcs

; Memory
setglob 0x007C8E17, new
setglob 0x007D3374, calloc

; House
setglob 0x00A8022C, HouseClassArray
setglob 0x00A80238, HouseClassArray_Count
setglob 0x00A83C9C, HouseTypesArray
;setglob 0x004BB460, HouseClass__Assign_Handicap
setglob 0x004F9B50, HouseClass__Make_Ally
setglob 0x00687F10, Assign_Houses
;setglob 0x005EEF70, Get_MP_Color

setglob 0x00A8B29C, PlayersCountries
setglob 0x00A8B2BC, PlayersColors
setglob 0x00A8B2DC, PlayersSpawns
setglob 0x00A8B27C, PlayersHandicaps
setglob 0x00A8B2FC, PlayersTeams

; INI
setglob 0x00535B30, INIClass__INIClass
setglob 0x004741F0, INIClass__Load
setglob 0x005295F0, INIClass__GetBool
setglob 0x005276D0, INIClass__GetInt
setglob 0x00528A10, INIClass__GetString

; File
setglob 0x004739F0, FileClass__FileClass
setglob 0x00473C50, FileClass__Is_Available

; Session
setglob 0x00A8B238, SessionClass_this
setglob 0x00697B70, SessionClass__Create_Connections
setglob 0x005D5F30, Set_Game_Mode
setglob 0x00A8E9A0, GameActive
setglob 0x00A8B238, SessionType
setglob 0x00A8B270, UnitCount
setglob 0x00822CF4, TechLevel
setglob 0x00A8B274, AIPlayers
setglob 0x00A8B278, AIDifficulty
setglob 0x00A8B264, BuildOffAlly
setglob 0x00A8B260, BridgeDestroy
setglob 0x00A8B31F, FogOfWar
setglob 0x00A8B261, Crates
setglob 0x00A8B262, ShortGame
setglob 0x00A8B258, Bases
setglob 0x00A8B320, MCVRedeploy
setglob 0x00A8B25C, Credits
setglob 0x00A8B31D, HarvesterTruce
setglob 0x00A8B263, SuperWeapons
setglob 0x00A8B268, GameSpeed
setglob 0x00A8B26C, MultiEngineer
setglob 0x00A8B394, PlayerColor
setglob 0x00A8B23C, GameMode

; Network
setglob 0x00841F30, ListenPort

; Random
setglob 0x00A8ED94, Seed
setglob 0x0052FC20, Init_Random

; Message
;setglob 0x007E2C34, MessageListClass_this
;setglob 0x007E2284, PlayerPtr
;setglob 0x00572FE0, MessageListClass__Add_Message
;setglob 0x006B2330, Get_Message_Delay_Or_Duration


; Network
setglob 0x007B2DB0, UDPInterfaceClass__UDPInterfaceClass
setglob 0x00887628, WinsockInterface_this
setglob 0x007B1DE0, WinsockInterfaceClass__Init
setglob 0x007B30B0, UDPInterfaceClass__Open_Socket
setglob 0x007B1BC0, WinsockInterfaceClass__Start_Listening
setglob 0x007B1CA0, WinsockInterfaceClass__Discard_In_Buffers
setglob 0x007B1D10, WinsockInterfaceClass__Discard_Out_Buffers
setglob 0x00A8E9C0, IPXManagerClass_this
setglob 0x00540C60, IPXManagerClass__Set_Timing
setglob 0x0053ECB0, IPXAddressClass__IPXAddressClass

setglob 0x00A8B550, MaxAhead
setglob 0x00A8B568, MaxMaxAhead
setglob 0x00A8B554, FrameSendRate
setglob 0x00A8DB9C, LatencyFudge
setglob 0x00A8B558, RequestedFPS
setglob 0x00A8B24C, ProtocolVersion

setglob 0x005DA6C0, Init_Network
setglob 0x00A8DA84, NameNodes_CurrentSize
setglob 0x00A8B54C, HumanPlayers

; Scenario
setglob 0x00A8B8E0, ScenarioName
setglob 0x00683AB0, Start_Scenario
setglob 0x00A8DA74, NameNodeVector
setglob 0x00A8DA78, NameNode
setglob 0x00477EC0, NameNodeVector_Add
setglob 0x00699980, SessionClass__Read_Scenario_Descriptions

; Save games
;setglob 0x005D6910, Load_Game

; Mouse
setglob 0x00887640, WWMouseClas_Mouse
setglob 0x0087F7E8, MouseClass_Map

; misc
setglob 0x008870C0, INIClass_RA2md_INI
setglob 0x008254DC, str_Options
setglob 0x00833160, str_Video
setglob 0x0089F978, WindowedMode
