[org 0x0086922B]

retn ; For some reason the game executes the first function found in the extended EXE space during exit

%include "src/def.asm"
%include "src/var.asm"
%include "src/data.inc"

; macros
%include "src/macros/INIClass_macros.asm"

; loading
%include "src/loading.asm"

; spawner
%include "src/spawner.asm"
%include "src/spawner/tunnel.asm"
%include "src/spawner/nethack.asm"
%include "src/spawner/selectable_spawns.asm"
%include "src/spawner/statistics.asm"
;%include "src/spawner/auto_ss.asm"
%include "src/anticheat_test.asm"

; other
%include "src/display_messages_typed_by_yourself.asm"
;%include "src/remove_16bit_windowed_check.asm"
%include "src/graphics_patch.asm"
