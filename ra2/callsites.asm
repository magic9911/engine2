;
; This file is strictly for adding relocations to calls/jmps/etc that
; exist in the vanilla exe. Write your real patches elsewhere.
;

%include "macros/patch.inc"

%include "main.inc"

@CALL 0x007CD8EA, WinMain@16 ; _start calls _WinMain@16. Should be only callsite of WinMain@16
