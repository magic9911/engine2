; Fixes for WaveClass errors related to laser and Ion Cannon ripple effect
@LJMP 0x006715F0, _sub_6715F0_RETN_Patch
@LJMP 0x004EEB26, _sub_4EEAC0_WCE_Fix_Patch

_sub_4EEAC0_WCE_Fix_Patch:
    jmp 0x004EEB43 ; jump to epilogue

_sub_6715F0_RETN_Patch:
    jmp 0x0067191F ; jump to RETN instruction
