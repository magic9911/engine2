[section .bss]

var:
    .SpawnerActive              RESD 1
    .INIClass_SPAWN             RESB 256 ; FIXME: make this a local variable
    .inet_addr                  RESD 1

    .IsDoingAlliancesSpawner    RESB 1
    .IsSpawnArgPresent           RESD 1

    .HouseColorsArray           RESD 8
    .HouseCountriesArray        RESD 8
    .HouseHandicapsArray        RESD 8
    .SpawnLocationsArray        RESD 8
    .IsSpectatorArray           RESD 8
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
