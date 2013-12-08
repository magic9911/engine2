@JMP 0x005B4FAE _Execute_DoList_Send_Statistics_Game_Leave
@JMP 0x005B4FD3 _Execute_DoList_Send_Statistics_Game_Leave2
@JMP 0x004BAC2C _HouseClass__HouseClass_Allocate_UnitTrackerClass_Stuff
@JMP 0x0060A79C _Send_Statistics_Packet_Write_Statistics_Dump

_Send_Statistics_Packet_Write_Statistics_Dump:
    cmp dword [var.SpawnerActive], 0
    jz .Normal_Code
    
    call Write_Stats_File
    mov dword [StatisticsPacketSent], 1
    jmp 0x0060A7DF
    
.Normal_Code:
    mov edx, [0x0080CA48]
    jmp 0x0060A7A2

Write_Stats_File:
    push ebp
    mov ebp, esp

%define stats_buf     EBP-4
%define stats_length  EBP-4-4
%define stats_file    EBP-4-4-256
    sub esp,4+4+256

    lea ebx, [stats_buf]
    mov [ebx], eax
    lea ebx,[stats_length]
    mov edx, [0x0080CA48] ; packet size
    mov [ebx],edx

    lea ecx,[stats_file]
    push str_stats_dmp
    call FileClass__FileClass

    push 3
    lea ecx, [stats_file]
    call FileClass__Open
    test eax, eax
    je .exit

    mov ebx, [stats_length]
    push ebx
    mov edx,[stats_buf]
    push edx

    lea ecx, [stats_file]
    CALL FileClass__Write

    lea ecx,[stats_file]
    CALL FileClass__Close

.exit:
    MOV eax,1

    mov esp,ebp
    pop ebp
    retn 
    
    
_HouseClass__HouseClass_Allocate_UnitTrackerClass_Stuff:
    cmp dword [var.SpawnerActive], 0
    jz .Normal_Code

    cmp dword [SessionType], 0
    jz .Normal_Code
    
    jmp .Allocate

.Normal_Code:
    cmp dword [SessionType], 4
    jnz .Dont_Allocate
    jmp .Allocate

.Allocate:
    jmp 0x004BAC39
    
.Dont_Allocate:
    jmp 0x004BADB0

_Execute_DoList_Send_Statistics_Game_Leave2:
    cmp dword [var.SpawnerActive], 0
    jz .Normal_Code
    mov edx, [SessionType]
    cmp edx, 0
    jz .Normal_Code
    
    jmp .Send
    
.Send:
 jmp 0x005B4FDE

.Dont_Send:
 jmp 0x005B500C
 
 .Normal_Code:
    mov edx, [SessionType]
    cmp edx, 4
    jnz .Dont_Send
    jmp .Send


_Execute_DoList_Send_Statistics_Game_Leave:
    cmp dword [var.SpawnerActive], 0
    jz .Normal_Code
    mov edx, [SessionType]
    cmp edx, 0
    jz .Normal_Code
    
    jmp 0x005B4FB9

.Dont_Send:
    jmp 0x005B500C
    
.Normal_Code:
    mov edx, [SessionType]
    cmp edx, 4
    jnz .Dont_Send
    jmp 0x005B4FB9

;.text:005B4FD3                 mov     edx, SessionClass_Session