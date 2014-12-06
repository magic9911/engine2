%include "macros/patch.inc"

@LJMP 0x00671152, _RulesClass__Read_General_Absolute_PrismSupportModifier_Bug_Fix

_100_FP: dd 100

_RulesClass__Read_General_Absolute_PrismSupportModifier_Bug_Fix:

	fild dword [esi+49Ch]
	fidiv dword [_100_FP]
	
	jmp 0x00671158