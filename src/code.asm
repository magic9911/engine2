section .text

; imported routines
%include "include/c.inc"
%include "include/FileClass.inc"
%include "include/House.inc"
%include "include/INIClass.inc"
%include "include/Message.inc"
%include "include/Mouse.inc"
%include "include/Network.inc"
%include "include/Players.inc"
%include "include/Random.inc"
%include "include/SaveGame.inc"
%include "include/Scenario.inc"
%include "include/session.inc"
%include "include/socket.inc"
%include "include/win.inc"

; variables
%include "src/var.asm"

; macro
%include "src/macros/spawner_macros.asm"
%include "src/macros/patch.asm"

;%include "src/loading.asm"

; spawner
%include "src/spawner/spawner.asm"
%include "src/spawner/tunnel.asm"
%include "src/spawner/nethack.asm"
%include "src/spawner/selectable_countries.asm"
%include "src/spawner/selectable_handicaps.asm"
%include "src/spawner/selectable_colors.asm"
%include "src/spawner/selectable_spawns.asm"
%include "src/spawner/predetermined_alliances.asm"
%include "src/spawner/spectators.asm"

; misc
;%include "src/copy_protection.asm"
;%include "src/no-cd.asm"
;%include "src/graphics_patch.asm"
