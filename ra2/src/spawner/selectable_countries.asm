Load_Selectable_Countries:
    SpawnINI__GetInt _str_HouseCountries, _str_Multi1, -1
    mov dword [_PlayersCountries+0], eax
    
    SpawnINI__GetInt _str_HouseCountries, _str_Multi2, -1
    mov dword [_PlayersCountries+4], eax
    
    SpawnINI__GetInt _str_HouseCountries, _str_Multi3, -1
    mov dword [_PlayersCountries+8], eax
      
    SpawnINI__GetInt _str_HouseCountries, _str_Multi4, -1
    mov dword [_PlayersCountries+12], eax
    
    SpawnINI__GetInt _str_HouseCountries, _str_Multi5, -1
    mov dword [_PlayersCountries+16], eax
    
    SpawnINI__GetInt _str_HouseCountries, _str_Multi6, -1
    mov dword [_PlayersCountries+20], eax
    
    SpawnINI__GetInt _str_HouseCountries, _str_Multi7, -1
    mov dword [_PlayersCountries+24], eax
    
    SpawnINI__GetInt _str_HouseCountries, _str_Multi8, -1
    mov dword [_PlayersCountries+28], eax

    retn
