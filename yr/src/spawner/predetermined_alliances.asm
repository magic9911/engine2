%include "macros/patch.inc"
%include "macros/string.inc"
%include "INIClass.inc"
%include "House.inc"

StringZ HouseAllyOne,     "HouseAllyOne"
StringZ HouseAllyTwo,     "HouseAllyTwo"
StringZ HouseAllyThree,   "HouseAllyThree"
StringZ HouseAllyFour,    "HouseAllyFour"
StringZ HouseAllyFive,    "HouseAllyFive"
StringZ HouseAllySix,     "HouseAllySix"
StringZ HouseAllySeven,   "HouseAllySeven"
StringZ HouseAllyEight,   "HouseAllyEight"

StringZ Multi1_Alliances, "Multi1_Alliances"
StringZ Multi2_Alliances, "Multi2_Alliances"
StringZ Multi3_Alliances, "Multi3_Alliances"
StringZ Multi4_Alliances, "Multi4_Alliances"
StringZ Multi5_Alliances, "Multi5_Alliances"
StringZ Multi6_Alliances, "Multi6_Alliances"
StringZ Multi7_Alliances, "Multi7_Alliances"
StringZ Multi8_Alliances, "Multi8_Alliances"

cextern NameNode
cextern INIClass_SPAWN

%macro SpawnINI__GetInt 3
     call_INIClass__GetInt    INIClass_SPAWN, %1, %2, %3
%endmacro

; args <House number>, <House number to ally>
%macro House_Make_Ally 3
    mov eax, %2
    cmp eax, -1
    jz .Dont_Make_Ally_%3
    mov esi, [HouseClassArray] ; HouseClassArray
    mov edi, [esi+4*%1]
    
    push 0
    push eax
    mov ecx, edi
    call HouseClass__Make_Ally ; void HouseClass::Make_Ally(HousesType)

.Dont_Make_Ally_%3:
%endmacro

; args <string of section to load from>, <House number which will ally>
%macro  House_Make_Allies_Spawner 3
    SpawnINI__GetInt %1, str_HouseAllyOne, -1
    cmp al, -1
    jz .Dont_Ally_Multi1_%3
    House_Make_Ally %2, eax, a%3
    
.Dont_Ally_Multi1_%3:

    SpawnINI__GetInt %1, str_HouseAllyTwo, -1
    cmp al, -1
    jz .Dont_Ally_Multi2_%3
    House_Make_Ally %2, eax, b%3
    
.Dont_Ally_Multi2_%3:

    SpawnINI__GetInt %1, str_HouseAllyThree, -1
    cmp al, -1
    jz .Dont_Ally_Multi3_%3
    House_Make_Ally %2, eax, c%3
    
.Dont_Ally_Multi3_%3:

    SpawnINI__GetInt %1, str_HouseAllyFour, -1
    cmp al, -1
    jz .Dont_Ally_Multi4_%3
    House_Make_Ally %2, eax, d%3
    
.Dont_Ally_Multi4_%3:

    SpawnINI__GetInt %1, str_HouseAllyFive, -1
    cmp al, -1
    jz .Dont_Ally_Multi5_%3
    House_Make_Ally %2, eax, e%3
    
.Dont_Ally_Multi5_%3:

    SpawnINI__GetInt %1, str_HouseAllySix, -1
    cmp al, -1
    jz .Dont_Ally_Multi6_%3
    House_Make_Ally %2, eax, f%3
    
.Dont_Ally_Multi6_%3:

    SpawnINI__GetInt %1, str_HouseAllySeven, -1
    cmp al, -1
    jz .Dont_Ally_Multi7_%3
    House_Make_Ally %2, eax, g%3
    
.Dont_Ally_Multi7_%3:

    SpawnINI__GetInt %1, str_HouseAllyEight, -1
    cmp al, -1
    jz .Dont_Ally_Multi8_%3
    House_Make_Ally %2, eax, h%3
    
.Dont_Ally_Multi8_%3:
%endmacro

cglobal Load_Predetermined_Alliances

Load_Predetermined_Alliances:

    House_Make_Allies_Spawner str_Multi1_Alliances, 0, a
    House_Make_Allies_Spawner str_Multi2_Alliances, 1, b
    House_Make_Allies_Spawner str_Multi3_Alliances, 2, c
    House_Make_Allies_Spawner str_Multi4_Alliances, 3, d
    House_Make_Allies_Spawner str_Multi5_Alliances, 4, e
    House_Make_Allies_Spawner str_Multi6_Alliances, 5, f
    House_Make_Allies_Spawner str_Multi7_Alliances, 6, g
    House_Make_Allies_Spawner str_Multi8_Alliances, 7, h
    
    retn