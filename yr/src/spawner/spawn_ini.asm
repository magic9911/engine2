section .bss
INIClass_SPAWN             RESB 256 ; FIXME: make this a local able

section .text

%macro SpawnINI__GetInt 3
     call_INIClass__GetInt    INIClass_SPAWN, %1, %2, %3
%endmacro

%macro SpawnINI__GetBool 3
     call_INIClass__GetBool   INIClass_SPAWN, %1, %2, %3
%endmacro

%macro SpawnINI__GetString 5
     call_INIClass__GetString INIClass_SPAWN, %1, %2, %3, %4, %5
%endmacro

%macro SpawnINI__GetFixed 4
     call_INIClass__GetFixed  INIClass_SPAWN, %1, %2, %3, %4
%endmacro
