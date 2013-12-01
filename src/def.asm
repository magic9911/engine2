; winapi
%define sendto                                      0x006B4D6C
%define recvfrom                                    0x006B4D66
%define htonl                                       0x006B4D24
%define GetCommandLineA                             0x006CA24C
%define stristr_                                    0x006B6730
%define LoadLibraryA                                0x006CA16C
%define GetProcAddress                              0x006CA174
%define _sprintf                                    0x006B52EE

; Memory
%define new                                         0x006B51D7

; House
%define HouseClassArray                             0x007E155C
%define HouseTypesArray                             0x007E21D4
%define HouseClass__Assign_Handicap                 0x004BB460
%define HouseClass__Make_Ally                       0x004BDB30
%define Assign_Houses                               0x005DE210
%define Get_MP_Color                                0x005EEF70

; INI
%define INIClass__INIClass                          0x004E8A30
%define INIClass__Load                              0x00449F30
%define INIClass__GetBool                           0x004DE140
%define INIClass__GetInt                            0x004DD140
%define INIClass__GetString                         0x004DDF60
%define INIClass__GetFixed                          0x004DD9F0

; File
%define FileClass__FileClass                        0x004497B0
%define FileClass__Is_Available                     0x004499C0

; Session
%define SessionClass_this                           0x007E2458
%define SessionClass__Create_Connections            0x005ED510
%define GameActive                                  0x007E4580
%define SessionType                                 0x007E2458
%define UnitCount                                   0x007E2480
%define TechLevel                                   0x006FB628
%define AIPlayers                                   0x007E2484
%define AIDifficulty                                0x007E2488
%define HarvesterTruce                              0x007E248D
%define BridgeDestroy                               0x007E2474
%define FogOfWar                                    0x007E248F
%define Crates                                      0x007E2475
%define ShortGame                                   0x007E2476
%define Bases                                       0x007E246C
%define MCVRedeploy                                 0x007E2490
%define Credits                                     0x007E2470
%define GameSpeed                                   0x007E4720
%define MultiEngineer                               0x007E247C
%define Frame                                       0x007E4924
%define GameIDNumber                                0x00867014

; Network
%define ListenPort                                  0x0070FCF0

; Random
%define Seed                                        0x007E4934
%define Init_Random                                 0x004E38A0

; Message
%define MessageListClass_this                       0x007E2C34
%define PlayerPtr                                   0x007E2284
%define MessageListClass__Add_Message               0x00572FE0
%define Get_Message_Delay_Or_Duration               0x006B2330

; Network
%define UDPInterfaceClass__UDPInterfaceClass        0x006A1E70
%define WinsockInterface_this                       0x0074C8D8
%define WinsockInterfaceClass__Init                 0x006A1180
%define UDPInterfaceClass__Open_Socket              0x006A2130
%define WinsockInterfaceClass__Start_Listening      0x006A1030
%define WinsockInterfaceClass__Discard_In_Buffers   0x006A10A0
%define WinsockInterfaceClass__Discard_Out_Buffers  0x006A1110
%define IPXManagerClass_this                        0x007E45A0
%define IPXManagerClass__Set_Timing                 0x004F05B0
%define IPXAddressClass__IPXAddressClass            0x004EF040

%define MaxAhead                                    0x007E250C
%define MaxMaxAhead                                 0x007E2524
%define FrameSendRate                               0x007E2510
%define LatencyFudge                                0x007E3FA8
%define RequestedFPS                                0x007E2514
%define ProtocolVersion                             0x007E2464

%define Init_Network                                0x00574F90
%define NameNodes_CurrentSize                       0x007E3EA0
%define HumanPlayers                                0x007E2508

; Scenario
%define ScenarioName                                0x007E28B8
%define Start_Scenario                              0x005DB170
%define NameNodeVector                              0x007E3E90
%define NameNodeVector_Add                          0x0044D690
%define SessionClass__Read_Scenario_Descriptions    0x005EE7D0

; Save games
%define Load_Game                                   0x005D6910

; Mouse
%define WWMouseClas_Mouse                           0x0074C8F0
%define MouseClass_Map                              0x00748348

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
