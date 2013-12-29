; easier way to define null terminated string
%macro StringZ 2
    [section .rdata]
    str_%1 db %2,0
    __SECT__
%endmacro
