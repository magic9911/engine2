; winapi
extern sendto
extern recvfrom
extern htonl
extern GetCommandLineA
extern stristr
extern LoadLibraryA
extern GetProcAddress
extern sprintf
extern timeGetTime ; idata pointer
extern strcmpi
extern strtok

; Memory
extern new
extern memcpy
extern memset

; House
extern HouseClassArray
extern HouseClassArray_Count
extern HouseTypesArray
extern HouseClass__Assign_Handicap
extern HouseClass__Make_Ally
extern Assign_Houses
extern Get_MP_Color
extern HouseType_From_Name
extern Read_Scenario_Houses

; Arrays
extern UnitClassArray_Count

; INI
extern INIClass__INIClass
extern INIClass__Load
extern INIClass__GetBool
extern INIClass__GetInt
extern INIClass__GetString
extern INIClass__GetFixed

extern INIClass_SUN_INI

; File
extern FileClass__FileClass
extern FileClass__Is_Available
extern FileClass__Open
extern FileClass__Close
extern FileClass__Write

; Session
extern SessionClass_this
extern SessionClass__Create_Connections
extern GameActive
extern SessionType
extern UnitCount
extern TechLevel
extern AIPlayers
extern AIDifficulty
extern HarvesterTruce
extern BridgeDestroy
extern FogOfWar
extern Crates
extern ShortGame
extern Bases
extern MCVRedeploy
extern Credits
extern GameSpeed
extern MultiEngineer
extern AlliesAllowed
extern Frame
extern GameIDNumber
extern PlayerColor

; Random
extern Seed
extern Init_Random

; Message
extern MessageListClass_this
extern PlayerPtr
extern MessageListClass__Add_Message
extern Get_Message_Delay_Or_Duration
extern Message_Input_Player_Dead

; Network
extern ListenPort
extern UDPInterfaceClass__UDPInterfaceClass
extern WinsockInterface_this
extern WinsockInterfaceClass__Init
extern UDPInterfaceClass__Open_Socket
extern WinsockInterfaceClass__Start_Listening
extern WinsockInterfaceClass__Discard_In_Buffers
extern WinsockInterfaceClass__Discard_Out_Buffers
extern IPXManagerClass_this
extern IPXManagerClass__Set_Timing
extern IPXAddressClass__IPXAddressClass

extern MaxAhead
extern MaxMaxAhead
extern FrameSendRate
extern LatencyFudge
extern RequestedFPS
extern ProtocolVersion

extern Init_Network
extern NameNodes_CurrentSize
extern HumanPlayers

; Scenario
extern ScenarioName
extern Start_Scenario
extern NameNodeVector
extern NameNodeVector_Add
extern SessionClass__Read_Scenario_Descriptions
extern DifficultyMode1
extern DifficultyMode2

; Save games
extern Load_Game

; Mouse
extern WWMouseClas_Mouse
extern MouseClass_Map

; Statistics
extern StatisticsPacketSent

; Sidebar
; cannot extern *_STRIP due to linker restriction
%define LEFT_STRIP                                  0x00749874
%define RIGHT_STRIP                                 0x00749C48
%define StripClass_Size                             980

; strings
extern str_Video
extern str_Options
extern str_Delim

; definitions of common structures
struc sockaddr_in
    .sin_family     RESW 1
    .sin_port       RESW 1
    .sin_addr       RESD 1
    .sin_zero       RESB 8
endstruc

struc ListAddress
    .port:      RESD 1
    .ip:        RESD 1
endstruc

struc NetAddress
    .port:      RESD 1
    .ip:        RESD 1
    .zero:      RESW 1
endstruc

struc SpawnAddress
    .pad1:      RESD 1
    .id:        RESD 1
    .pad2:      RESW 1
endstruc
