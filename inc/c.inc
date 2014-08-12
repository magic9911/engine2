; C(++) standard library
extern _strstr
extern _stristr
extern _strcmpi
extern _strtok

extern _sprintf

extern _new
extern _calloc
extern _memcpy
extern _memset

%macro strcmp_i 2
    push    %1             ; Str2
    push    %2             ; Str1
    call    _strcmpi
    add     esp, 8
%endmacro
