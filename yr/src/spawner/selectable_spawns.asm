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

StringZ SpawnLocations,   "SpawnLocations"

cextern PlayersSpawns
cextern INIClass_SPAWN
cextern HouseClassArray
cextern HouseClassArray_Count

%macro SpawnINI__GetInt 3
     call_INIClass__GetInt    INIClass_SPAWN, %1, %2, %3
%endmacro

cglobal Load_Selectable_Spawns

; PlayersSpawns IS actually only used for AI players or something..HouseClass data member is used for all
Load_Selectable_Spawns:




	
	cmp dword [HouseClassArray_Count], 3
	jl .Ret

	SpawnINI__GetInt str_SpawnLocations, str_Multi1, -2
	
	mov ebx, [HouseClassArray]
	mov ebx, [ebx+0]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 4
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi2, -2
	
	mov ebx, [HouseClassArray]
	mov ebx, [ebx+4]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 5
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi3, -2
	
	mov ebx, [HouseClassArray]
	mov ebx, [ebx+8]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 6
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi4, -2
	
	mov ebx, [HouseClassArray]
	mov ebx, [ebx+12]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 7
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi5, -2

	mov ebx, [HouseClassArray]	
	mov ebx, [ebx+16]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 8
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi6, -2

	mov ebx, [HouseClassArray]
	mov ebx, [ebx+20]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 9
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi7, -2
	
	mov ebx, [HouseClassArray]
	mov ebx, [ebx+24]
	mov [ebx+0x16058], eax
	
	cmp dword [HouseClassArray_Count], 10
	jl .Ret
	
	SpawnINI__GetInt str_SpawnLocations, str_Multi8, -2
	
	mov ebx, [HouseClassArray]
	mov ebx, [ebx+28]
	mov [ebx+0x16058], eax
	
.Ret:
    retn