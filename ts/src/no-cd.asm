%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

extern var.IsNoCD

@LJMP 0x004754A0, _NoCD_Patch1
@LJMP 0x004756E4, _NoCD_Patch2
@LJMP 0x0047578F, _NoCD_Patch3
@LJMP 0x004AB8FB, _NoCD_Patch4


[section .text]
_NoCD_Patch1:
    cmp byte[var.IsNoCD], 1
    jnz .out
    xor eax, eax
    cmp edi, 1
    jnz .ret
    inc eax
	
.ret:
    RETN

.out:
    sub esp, 0x148
    jmp 0x004754A6

	
_NoCD_Patch2:
    cmp byte[var.IsNoCD], 1
    jnz .out
    cmp eax, dword[0x711A00]
    jnz 0x0047578F
    jmp 0x004756F2

.out:
    cmp eax, -1
	jle 0x004756FE
    jmp 0x004756E9


_NoCD_Patch3:
    cmp byte[var.IsNoCD], 1
    jnz .out
    cmp eax, edi
    jnz 0x004756F2
    mov dword[0x711A00], eax
    jmp 0x004757AC

.out:
    mov ecx, dword[esp+0x10]
    test ecx, ecx
    jmp 0x00475795

	
_NoCD_Patch4:
    cmp byte[var.IsNoCD], 1
    jnz .out
    cmp eax, 3
    jnz 0x004AB91E
    jmp 0x004AB900

.out:
    cmp eax, 5
    jnz 0x004AB91E
	jmp 0x004AB900
