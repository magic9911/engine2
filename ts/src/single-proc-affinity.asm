%include "win.inc"

%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

cglobal SetSingleProcAffinity

StringZ kernel32dll, "Kernel32.dll"
StringZ SetProcessAffinityMask, "SetProcessAffinityMask"

[section .data]
SetProcessAffinityMask dd 0

[section .text]
SetSingleProcAffinity:
    pushad
    push str_kernel32dll
    call [LoadLibraryA]
    test eax, eax
    jz .out
    push str_SetProcessAffinityMask
    push eax
    call [GetProcAddress]
    test eax, eax
    jz .out
    mov [SetProcessAffinityMask], eax
    push 1
    call [GetCurrentProcess]
    push eax
    call [SetProcessAffinityMask]
.out:
    popad
    retn
