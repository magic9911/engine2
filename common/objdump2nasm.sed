#!/bin/sed -f

1,3d
4s;^;___ImageBase equ 0x00401000;
s|^[^:]*: *||

s|([0-9a-z]*) *<(.*)>$$|(\2) ;RAW: \1|
s_(.s:)\[_[\1_g

s_(BYTE|WORD|DWORD|QWORD) PTR_\1_g

s_lods BYTE_lodsb_
s_lods WORD_lodsw_
s_lods DWORD_lodsd_

s_movs BYTE_movsb_
s_movs WORD_movsw_
s_movs DWORD_movsd_

s_stos BYTE_stosb_
s_stos WORD_stosw_
s_stos DWORD_stosd_

s_scas BYTE_scasb_
s_scas WORD_scasw_
s_scas DWORD_scasd_

s_cmps BYTE_cmpsb_
s_cmps WORD_cmpsw_
s_cmps DWORD_cmpsd_

s_ins BYTE_insb_
s_ins WORD_insw_
s_ins DWORD_insd_

s_outs BYTE_outsb_
s_outs WORD_outsw_
s_outs DWORD_outsd_
