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

;%include "src/loading.asm"

%push spawner
%include "src/spawner/spawn_ini.asm"
%include "src/spawner/spawner.asm"
%include "src/spawner/selectable_countries.asm"
%include "src/spawner/selectable_handicaps.asm"
%include "src/spawner/selectable_colors.asm"
%include "src/spawner/selectable_spawns.asm"
%include "src/spawner/predetermined_alliances.asm"
%include "src/spawner/spectators.asm"
%pop
