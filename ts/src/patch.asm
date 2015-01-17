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


;;; data
;;%include "src/data.asm"
;;
;;; bss
;;%include "src/var.asm"
;;
;;; spawner
;;%include "src/spawner.asm"
;;%include "src/spawner/selectable_spawns.asm"
;;%include "src/spawner/spectators.asm"
;;%include "src/spawner/statistics.asm"
;;%include "src/spawner/build_off_ally.asm"
;;;%include "src/spawner/auto_ss.asm"
;;
;;; other
;;;%include "src/remove_16bit_windowed_check.asm"
