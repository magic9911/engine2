section .text

; cextern symbols
%include "c.inc"
%include "socket.inc"

%include "win.inc"

%include "FileClass.inc"
%include "INIClass.inc"
%include "House.inc"
%include "session.inc"
%include "Message.inc"
%include "Mouse.inc"
%include "Network.inc"
%include "Random.inc"
%include "Scenario.inc"
%include "SaveGame.inc"
%include "Statistics.inc"

%include "Sidebar.inc"
%include "misc_instances.inc"

; macros
%include "macros/patch.inc"
%include "macros/string.inc"


; data
%include "ts_src/data.asm"

; bss
%include "ts_src/var.asm"


; loading
%include "ts_src/loading.asm"

; savegame
%include "ts_src/savegame.asm"

;fixes
%include "ts_src/fix_wce_errors.asm"
%include "ts_src/alt_scout_fix.asm"

; spawner
%include "ts_src/spawner.asm"
%include "ts_src/spawner/tunnel.asm"
%include "ts_src/spawner/nethack.asm"
%include "ts_src/spawner/selectable_spawns.asm"
%include "ts_src/spawner/spectators.asm"
%include "ts_src/spawner/statistics.asm"
%include "ts_src/spawner/build_off_ally.asm"
;%include "ts_src/spawner/auto_ss.asm"
%include "ts_src/anticheat_test.asm"

; other
%include "ts_src/no-cd.asm"
%include "ts_src/display_messages_typed_by_yourself.asm"
;%include "ts_src/remove_16bit_windowed_check.asm"
%include "ts_src/graphics_patch.asm"
%include "ts_src/multiplayer_units_placing.asm"
%include "ts_src/no_options_menu_animation.asm"
%include "ts_src/internet_cncnet.asm"
