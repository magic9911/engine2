[org 0x00B93000]

; variables and definitions
%include "src/def.asm"
%include "src/var.asm"
%include "src/data.inc"

; macro
%include "src/macros/INIclass_macros.asm"

%include "src/loading.asm"

%include "src/copy_protection.asm"
%include "src/no-cd.asm"

