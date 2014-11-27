%include "macros/setsym.inc"

setcglob 0x007CD80F, start
setcglob 0x006BB9A0, WinMain@16

; WWDebug
setcglob 0x004068E0, WWDebug_Printf

; winapi
setcglob 0x007C89B0, sendto
setcglob 0x007C89AA, recvfrom
setcglob 0x007E1558, _imp__sendto
setcglob 0x007E154C, _imp__recvfrom
setcglob 0x007C8962, htonl
setcglob 0x007E1280, GetCommandLineA
setcglob 0x007CA4B0, strstr
setcglob 0x007E1220, LoadLibraryA
setcglob 0x007E1250, GetProcAddress
setcglob 0x007C8EF4, sprintf
setcglob 0x007CC2AC, mbstowcs

; Memory
setcglob 0x007C8E17, new
setcglob 0x007CA090, memcpy
setcglob 0x007D3374, calloc

; House
setcglob 0x00A8022C, HouseClassArray
setcglob 0x00A80238, HouseClassArray_Count
setcglob 0x00A83C9C, HouseTypesArray
;setcglob 0x004BB460, HouseClass__Assign_Handicap
setcglob 0x004F9B50, HouseClass__Make_Ally
setcglob 0x00687F10, Assign_Houses
;setcglob 0x005EEF70, Get_MP_Color

setcglob 0x00A8B29C, PlayersCountries
setcglob 0x00A8B2BC, PlayersColors
setcglob 0x00A8B2DC, PlayersSpawns
setcglob 0x00A8B27C, PlayersHandicaps
setcglob 0x00A8B2FC, PlayersTeams

; INI
setcglob 0x00535B30, INIClass__INIClass
setcglob 0x004741F0, INIClass__Load
setcglob 0x005295F0, INIClass__GetBool
setcglob 0x005276D0, INIClass__GetInt
setcglob 0x00528A10, INIClass__GetString

; File
setcglob 0x004739F0, FileClass__FileClass
setcglob 0x00473C50, FileClass__Is_Available

; Session
setcglob 0x00A8B238, SessionClass_this
setcglob 0x00697B70, SessionClass__Create_Connections
setcglob 0x005D5F30, Set_Game_Mode
setcglob 0x00A8E9A0, GameActive
setcglob 0x00A8B238, SessionType
setcglob 0x00A8B270, UnitCount
setcglob 0x00822CF4, TechLevel
setcglob 0x00A8B274, AIPlayers
setcglob 0x00A8B278, AIDifficulty
setcglob 0x00A8B264, BuildOffAlly
setcglob 0x00A8B260, BridgeDestroy
setcglob 0x00A8B31F, FogOfWar
setcglob 0x00A8B261, Crates
setcglob 0x00A8B262, ShortGame
setcglob 0x00A8B258, Bases
setcglob 0x00A8B320, MCVRedeploy
setcglob 0x00A8B25C, Credits
setcglob 0x00A8B31D, HarvesterTruce
setcglob 0x00A8B263, SuperWeapons
setcglob 0x00A8B268, GameSpeed
setcglob 0x00A8B26C, MultiEngineer
setcglob 0x00A8B394, PlayerColor
setcglob 0x00A8B23C, GameMode

; Network
setcglob 0x00841F30, ListenPort

; Random
setcglob 0x00A8ED94, Seed
setcglob 0x0052FC20, Init_Random

; Message
;setcglob 0x007E2C34, MessageListClass_this
;setcglob 0x007E2284, PlayerPtr
;setcglob 0x00572FE0, MessageListClass__Add_Message
;setcglob 0x006B2330, Get_Message_Delay_Or_Duration


; Network
setcglob 0x007B2DB0, UDPInterfaceClass__UDPInterfaceClass
setcglob 0x00887628, WinsockInterface_this
setcglob 0x007B1DE0, WinsockInterfaceClass__Init
setcglob 0x007B30B0, UDPInterfaceClass__Open_Socket
setcglob 0x007B1BC0, WinsockInterfaceClass__Start_Listening
setcglob 0x007B1CA0, WinsockInterfaceClass__Discard_In_Buffers
setcglob 0x007B1D10, WinsockInterfaceClass__Discard_Out_Buffers
setcglob 0x00A8E9C0, IPXManagerClass_this
setcglob 0x00540C60, IPXManagerClass__Set_Timing
setcglob 0x0053ECB0, IPXAddressClass__IPXAddressClass

setcglob 0x00A8B550, MaxAhead
setcglob 0x00A8B568, MaxMaxAhead
setcglob 0x00A8B554, FrameSendRate
setcglob 0x00A8DB9C, LatencyFudge
setcglob 0x00A8B558, RequestedFPS
setcglob 0x00A8B24C, ProtocolVersion
setcglob 0x00A8ED84, Frame

setcglob 0x005DA6C0, Init_Network
setcglob 0x00A8DA84, NameNodes_CurrentSize
setcglob 0x00A8B54C, HumanPlayers

; Scenario
setcglob 0x00A8B8E0, ScenarioName
setcglob 0x00683AB0, Start_Scenario
setcglob 0x00A8DA74, NameNodeVector
setcglob 0x00A8DA78, NameNode
setcglob 0x00477EC0, NameNodeVector_Add
setcglob 0x00699980, SessionClass__Read_Scenario_Descriptions

; Save games
;setcglob 0x005D6910, Load_Game

; Mouse
setcglob 0x00887640, WWMouseClas_Mouse
setcglob 0x0087F7E8, MouseClass_Map

; misc
setcglob 0x008870C0, INIClass_RA2md_INI
setcglob 0x008254DC, str_Options
setcglob 0x00833160, str_Video
setcglob 0x0089F978, WindowedMode
