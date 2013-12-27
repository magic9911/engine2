@JMP 0x00658658 _UnitClass__Read_INI_Get_HouseType_From_Name

_UnitClass__Read_INI_Get_HouseType_From_Name:
    call Check_For_Spawn_Fake_HouseType_Name
    cmp eax, -1
    jz .Normal_Code
    
    mov eax, [var.UsedSpawnsArray+eax*4]
    cmp eax, -1
    jz .Normal_Code
    
    mov esi, [HouseClassArray]
    mov eax, [esi+eax*4]
    
    mov esi, eax
    push str_Delim ; ","
    push ebx             ; Str
    call _strtok
    add esp, 8
    mov ecx, eax        ; Str2
    call 0x0065BB30
    mov edi, eax
    cmp edi, 0FFFFFFFFh
    mov eax, esi
    jmp 0x00658686
    
    
.Normal_Code:
    call HouseType_From_Name
    jmp 0x0065865D
    
Check_For_Spawn_Fake_HouseType_Name:
    push ebx
    push edi
    mov ebx, 0
    
    mov edi, ecx
    
    
    strcmp_i ecx, str_Spawn1
    cmp eax, 0
    jz .Ret
    
    mov ecx, edi
    inc ebx
    strcmp_i ecx, str_Spawn2
    cmp eax, 0
    jz .Ret
    
    inc ebx
    strcmp_i ecx, str_Spawn3
    cmp eax, 0
    jz .Ret
    
    mov ecx, edi
    inc ebx
    strcmp_i ecx, str_Spawn4
    cmp eax, 0
    jz .Ret
    
    mov ecx, edi
    inc ebx
    strcmp_i ecx, str_Spawn5
    cmp eax, 0
    jz .Ret
    
    mov ecx, edi
    inc ebx
    strcmp_i ecx, str_Spawn6
    cmp eax, 0
    jz .Ret
    
    mov ecx, edi
    inc ebx
    strcmp_i ecx, str_Spawn7
    cmp eax, 0
    jz .Ret
    
    mov ecx, edi
    inc ebx
    strcmp_i ecx, str_Spawn8
    cmp eax, 0
    jz .Ret
    
    mov ebx, -1
    
.Ret:
    mov ecx, edi
    mov eax, ebx
    pop edi
    pop ebx
    retn