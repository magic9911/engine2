%macro SpawnINI__GetInt 3
     call_INIClass__GetInt    var.INIClass_SPAWN, %1, %2, %3
%endmacro

%macro SpawnINI__GetBool 3
     call_INIClass__GetBool   var.INIClass_SPAWN, %1, %2, %3
%endmacro

%macro SpawnINI__GetString 5
     call_INIClass__GetString var.INIClass_SPAWN, %1, %2, %3, %4, %5
%endmacro

%macro SpawnINI__GetFixed 4
     call_INIClass__GetFixed  var.INIClass_SPAWN, %1, %2, %3, %4
%endmacro
