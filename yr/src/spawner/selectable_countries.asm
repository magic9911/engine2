%include "macros/patch.inc"
%include "macros/string.inc"
%include "INIClass.inc"

StringZ Multi1,           "Multi1"
StringZ Multi2,           "Multi2"
StringZ Multi3,           "Multi3"
StringZ Multi4,           "Multi4"
StringZ Multi5,           "Multi5"
StringZ Multi6,           "Multi6"
StringZ Multi7,           "Multi7"
StringZ Multi8,           "Multi8"

StringZ HouseCountries,   "HouseCountries"

cextern PlayersCountries
cextern INIClass_SPAWN

%macro SpawnINI__GetInt 3
     call_INIClass__GetInt    INIClass_SPAWN, %1, %2, %3
%endmacro

cglobal Load_Selectable_Countries

Load_Selectable_Countries:
    SpawnINI__GetInt str_HouseCountries, str_Multi1, -1
    mov dword [PlayersCountries+0], eax
    
    SpawnINI__GetInt str_HouseCountries, str_Multi2, -1
    mov dword [PlayersCountries+4], eax
    
    SpawnINI__GetInt str_HouseCountries, str_Multi3, -1
    mov dword [PlayersCountries+8], eax
      
    SpawnINI__GetInt str_HouseCountries, str_Multi4, -1
    mov dword [PlayersCountries+12], eax
    
    SpawnINI__GetInt str_HouseCountries, str_Multi5, -1
    mov dword [PlayersCountries+16], eax
    
    SpawnINI__GetInt str_HouseCountries, str_Multi6, -1
    mov dword [PlayersCountries+20], eax
    
    SpawnINI__GetInt str_HouseCountries, str_Multi7, -1
    mov dword [PlayersCountries+24], eax
    
    SpawnINI__GetInt str_HouseCountries, str_Multi8, -1
    mov dword [PlayersCountries+28], eax

    retn