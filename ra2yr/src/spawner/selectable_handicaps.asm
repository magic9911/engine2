Load_Selectable_Handicaps:
;    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi1, -1
    mov dword [_PlayersHandicaps+0], 0
    
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi2, -1
    mov dword [_PlayersHandicaps+4], eax
    
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi3, -1
    mov dword [_PlayersHandicaps+8], eax
      
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi4, -1
    mov dword [_PlayersHandicaps+12], eax
    
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi5, -1
    mov dword [_PlayersHandicaps+16], eax
    
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi6, -1
    mov dword [_PlayersHandicaps+20], eax
    
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi7, -1
    mov dword [_PlayersHandicaps+24], eax
    
    SpawnINI__GetInt _str_HouseHandicaps, _str_Multi8, -1
    mov dword [_PlayersHandicaps+28], eax

    retn
