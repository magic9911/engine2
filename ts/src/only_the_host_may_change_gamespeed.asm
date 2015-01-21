%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"



@CLEAR 0x004AA5D2, 0x90, 0x004AA5DB
@LJMP 0x004AA5D2, _only_the_host_may_change_gamespeed

[section .data]
cglobal IsHost
IsHost db 0

[section .text]
_only_the_host_may_change_gamespeed:
	cmp byte[0x7E4580], 1
	jnz 0x004AA64B
	cmp byte[IsHost], 1
	jnz 0x004AA651
	jmp 0x004AA5DB
    