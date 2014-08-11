Load_Selectable_Spawns:
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi1, -1
    mov dword [_PlayersSpawns+0], eax
    
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi2, -1
    mov dword [_PlayersSpawns+4], eax
    
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi3, -1
    mov dword [_PlayersSpawns+8], eax
      
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi4, -1
    mov dword [_PlayersSpawns+12], eax
    
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi5, -1
    mov dword [_PlayersSpawns+16], eax
    
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi6, -1
    mov dword [_PlayersSpawns+20], eax
    
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi7, -1
    mov dword [_PlayersSpawns+24], eax
    
    SpawnINI__GetInt _str_SpawnLocations, _str_Multi8, -1
    mov dword [_PlayersSpawns+28], eax

    retn
