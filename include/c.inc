; C(++) standard library
extern strstr
extern stristr
extern strcmpi
extern strtok

extern sprintf

extern new
extern calloc
extern memcpy
extern memset

%macro strcmp_i 2
    push    %1             ; Str2
    push    %2             ; Str1
    call    strcmpi
    add     esp, 8
%endmacro
