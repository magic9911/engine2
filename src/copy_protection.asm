
; FIXME: this call terminates the game for me at least -hifi
@CLEAR 0x006BD6A0, 0x90, 0x006BD71D

; unhook COPYPROTECTION_Check
@CLEAR 0x006BBE2B, 0x90, 0x006BBE56

; unhook COPYPROTECTION_Notify
@CLEAR 0x006BDD11, 0x90, 0x006BDD2E

; unhook COPYPROTECTION_Receive
@CLEAR 0x005D4DB7, 0x90, 0x005D4DBC

; unhook COPYPROTECTION_Shutdown
@CLEAR 0x006BEC3D, 0x90, 0x006BEC42

; wipe all COPYPROTECTION code
@CLEAR 0x0049F5C0, 0x90, 0x0049F7A0
@CLEAR 0x0049F7A6, 0x90, 0x0049F915

; Remove the douchebag blowing up your base, taken from Ares Source code

@JMP 0x0055CFDF, 0x0055D059

section .text ; because we are chaining includes
