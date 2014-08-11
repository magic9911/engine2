Load_Selectable_Colors:
    SpawnINI__GetInt _str_HouseColors, _str_Multi1, -1
    mov dword [_PlayersColors+0], eax
    
    SpawnINI__GetInt _str_HouseColors, _str_Multi2, -1
    mov dword [_PlayersColors+4], eax
    
    SpawnINI__GetInt _str_HouseColors, _str_Multi3, -1
    mov dword [_PlayersColors+8], eax
      
    SpawnINI__GetInt _str_HouseColors, _str_Multi4, -1
    mov dword [_PlayersColors+12], eax
    
    SpawnINI__GetInt _str_HouseColors, _str_Multi5, -1
    mov dword [_PlayersColors+16], eax
    
    SpawnINI__GetInt _str_HouseColors, _str_Multi6, -1
    mov dword [_PlayersColors+20], eax
    
    SpawnINI__GetInt _str_HouseColors, _str_Multi7, -1
    mov dword [_PlayersColors+24], eax
    
    SpawnINI__GetInt _str_HouseColors, _str_Multi8, -1
    mov dword [_PlayersColors+28], eax

    retn
