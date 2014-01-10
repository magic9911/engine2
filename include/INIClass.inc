; INIClass
extern INIClass__INIClass
extern INIClass__Load
extern INIClass__GetBool
extern INIClass__GetInt
extern INIClass__GetString

; args: <INIClass this>, <INI section string>, <INI key string>, <default value if missing>
%macro call_INIClass__GetInt 4
    push %4
    push %3
    push %2
    mov ecx, %1
    call INIClass__GetInt
%endmacro

; args: <INIClass this>, <INI section string>, <INI key string>, <default value if missing>
%macro call_INIClass__GetBool 4
    push %4
    push %3
    push %2
    mov ecx, %1
    call INIClass__GetBool
%endmacro

%macro call_INIClass__GetString 6
    push %6
    push %5
    push %4
    push %3
    push %2
    mov ecx, %1
    call INIClass__GetString
%endmacro

%macro call_INIClass__GetFixed 5
    push %5
    push %4
    push %3
    push %2
    mov ecx, %1
    call INIClass__GetFixed
%endmacro
