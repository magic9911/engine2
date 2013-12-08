;@JMP 0x005B4FAE _Execute_DoList_Send_Statistics_Game_Leave
;@JMP 0x005B4FD3 _Execute_DoList_Send_Statistics_Game_Leave2
@JMP 0x004BAC2C _HouseClass__HouseClass_Allocate_UnitTrackerClass_Stuff

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