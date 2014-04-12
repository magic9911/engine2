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
%include "ts/src/data.asm"

; bss
%include "ts/src/var.asm"


; loading
%include "ts/src/loading.asm"

; savegame
%include "ts/src/savegame.asm"

;fixes
%include "ts/src/fix_wce_errors.asm"
%include "ts/src/alt_scout_fix.asm"

; spawner
%include "ts/src/spawner.asm"
%include "ts/src/spawner/tunnel.asm"
%include "ts/src/spawner/nethack.asm"
%include "ts/src/spawner/selectable_spawns.asm"
%include "ts/src/spawner/spectators.asm"
%include "ts/src/spawner/statistics.asm"
%include "ts/src/spawner/build_off_ally.asm"
;%include "ts/src/spawner/auto_ss.asm"
%include "ts/src/anticheat_test.asm"

; other
%include "ts/src/no-cd.asm"
%include "ts/src/display_messages_typed_by_yourself.asm"
;%include "ts/src/remove_16bit_windowed_check.asm"
%include "ts/src/graphics_patch.asm"
%include "ts/src/multiplayer_units_placing.asm"
%include "ts/src/no_options_menu_animation.asm"
%include "ts/src/internet_cncnet.asm"
