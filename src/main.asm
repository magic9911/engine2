[org 0x0086922B]

; For some reason the game executes the first function found in the extended EXE space during exit
; So have it run this dummy function
Dummy_Function:
    retn

; spawner
%include "src/spawner/spawner.asm"
%include "src/spawner/tunneling.asm"
%include "src/spawner/nethack.asm"
%include "src/spawner/selectable_spawns.asm"

; other
%include "src/display_messages_typed_by_yourself.asm"
