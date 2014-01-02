section .text

; macros
%include "macros/patch.inc"
%include "src/macros/INIClass_macros.asm"
%include "src/macros/string_macros.asm"

; symbols
%include "src/def.asm"

; bss
%include "src/var.asm"

; loading
%include "src/loading.asm"

; spawner
%include "src/spawner.asm"
%include "src/spawner/tunnel.asm"
%include "src/spawner/nethack.asm"
%include "src/spawner/selectable_spawns.asm"
%include "src/spawner/spectators.asm"
%include "src/spawner/statistics.asm"
;%include "src/spawner/auto_ss.asm"
%include "src/anticheat_test.asm"

; other
%include "src/no-cd.asm"
%include "src/display_messages_typed_by_yourself.asm"
;%include "src/remove_16bit_windowed_check.asm"
%include "src/graphics_patch.asm"
%include "src/fix_wce_errors.asm"
%include "src/multiplayer_units_placing.asm"
%include "src/no_options_menu_animation.asm"
