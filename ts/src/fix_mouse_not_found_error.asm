%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

;"Tiberian Sun requires a mouse to play" error - remove the GetSystemMetrics check
@CLEAR 0x005FFDCC, 0x90, 0x005FFDEA
