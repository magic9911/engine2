%macro SaveRegisters 0
	push ecx
	push edx
	push eax
	push esi
%endmacro

;; arg1 : number of params of the called function
%macro RestoreRegisters 1
	add esp,((%1) * 4)
	pop esi
	pop eax
	pop edx
	pop ecx
%endmacro
