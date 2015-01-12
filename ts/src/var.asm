[section .bss]

var:
    .UsedSpawnsArray            RESD 8
    
    .SaveGameNameBuf            RESB 60
    
    .DoingAutoSS                RESD 1
    .Anticheat1                 RESD 1
    .AntiCheatArray             RESB (StripClass_Size * 2)
    
    .BuildOffAlly               RESB 1
    .SpectatorStuffInit         RESB 1
    .OldUnitClassArrayCount     RESD 1

;%define AddressList var.AddressList
__SECT__
