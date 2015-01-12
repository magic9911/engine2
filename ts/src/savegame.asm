%include "c.inc"
%include "Sidebar.inc"

%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/extern.inc"
%include "macros/string.inc"

cextern Anticheat__1
cextern Anticheat__Array

@HACK 0x005D4FF5, Save_Game_Pre_Save_Game_Hook
    mov eax, [Anticheat__1]
    mov [0x00749800], eax

    push (StripClass_Size * 2)
    push Anticheat__Array
    push LEFT_STRIP
    call memcpy
    add esp, 0x0c

    call 0x004082D0
    jmp 0x005D4FFA
@ENDHACK

@HACK 0x005D6B92, Load_Game_Post_Load_Game_Hook
    mov eax, [0x00749800]
    mov [Anticheat__1], eax

    push (StripClass_Size * 2)
    push LEFT_STRIP
    push Anticheat__Array
    call memcpy
    add esp, 0x0c

    call 0x004082D0
    jmp 0x005D6B97
@ENDHACK