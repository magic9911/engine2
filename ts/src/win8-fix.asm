%include "macros/patch.inc"
%include "macros/hack.inc"

extern _SetWin8CompatData

@CALLC 0x00472AE9, 0x00472AF0, 0, CallSetWin8CompatData
    call _SetWin8CompatData
@FINISHCALLC
    push 0
    push 0x007A1EAC
@ENDCALLC
