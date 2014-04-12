Load_Selectable_Handicaps:
;    SpawnINI__GetInt str_HouseHandicaps, str_Multi1, -1
    mov dword [PlayersHandicaps+0], 0
    
    SpawnINI__GetInt str_HouseHandicaps, str_Multi2, -1
    mov dword [PlayersHandicaps+4], eax
    
    SpawnINI__GetInt str_HouseHandicaps, str_Multi3, -1
    mov dword [PlayersHandicaps+8], eax
      
    SpawnINI__GetInt str_HouseHandicaps, str_Multi4, -1
    mov dword [PlayersHandicaps+12], eax
    
    SpawnINI__GetInt str_HouseHandicaps, str_Multi5, -1
    mov dword [PlayersHandicaps+16], eax
    
    SpawnINI__GetInt str_HouseHandicaps, str_Multi6, -1
    mov dword [PlayersHandicaps+20], eax
    
    SpawnINI__GetInt str_HouseHandicaps, str_Multi7, -1
    mov dword [PlayersHandicaps+24], eax
    
    SpawnINI__GetInt str_HouseHandicaps, str_Multi8, -1
    mov dword [PlayersHandicaps+28], eax

    retn