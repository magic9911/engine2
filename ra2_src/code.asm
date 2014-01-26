section .text

; imported routines
%include "c.inc"
%include "FileClass.inc"
%include "House.inc"
%include "INIClass.inc"
%include "Message.inc"
%include "Mouse.inc"
%include "Network.inc"
%include "Players.inc"
%include "Random.inc"
%include "SaveGame.inc"
%include "Scenario.inc"
%include "session.inc"
%include "socket.inc"
%include "win.inc"

; macro
%include "macros/patch.inc"
%include "macros/string.inc"

%include "ra2_src/loading.asm"

%push spawner
%include "ra2_src/spawner/spawn_ini.asm"
%include "ra2_src/spawner/spawner.asm"
%include "ra2_src/spawner/tunnel.asm"
%include "ra2_src/spawner/nethack.asm"
%include "ra2_src/spawner/selectable_countries.asm"
%include "ra2_src/spawner/selectable_handicaps.asm"
%include "ra2_src/spawner/selectable_colors.asm"
%include "ra2_src/spawner/selectable_spawns.asm"
%include "ra2_src/spawner/predetermined_alliances.asm"
%include "ra2_src/spawner/spectators.asm"
%pop

; misc
%include "ra2_src/copy_protection.asm"
%include "ra2_src/no-cd.asm"
%include "ra2_src/graphics_patch.asm"
