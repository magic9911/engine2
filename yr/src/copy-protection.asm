%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

; Remove the douchebag blowing up your base, taken from Ares Source code
@LJMP 0x0055CFDF, 0x0055D059

@HACK 0x49F5C0, _CopyProtection_IsLauncherRunning
	mov al, 1
	retn
@ENDHACK


@HACK 0x49F620, _CopyProtection_NotifyLauncher
	mov al, 1
	retn
@ENDHACK

@HACK 0x49F7A0, _CopyProtection_CheckProtectedData
	mov al, 1
	retn
@ENDHACK
