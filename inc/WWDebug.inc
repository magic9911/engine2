extern _WWDebug_Printf

%macro call_WWDebug_Printf 1-*
    %rep %0
        %rotate -1
        push %1
    %endrep
    call _WWDebug_Printf
;    add esp, (%0 * 4)
%endmacro