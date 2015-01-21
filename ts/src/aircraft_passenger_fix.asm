%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

; AircraftType passenger landing issue fix by CCHyper taken from HyperPatch v0.3

@LJMP 0x0040A56D, 0x0040A5C2
@LJMP 0x0040A669, 0x0040A6BA



