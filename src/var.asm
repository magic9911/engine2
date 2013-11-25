[absolute 0xA89000]

; max number of players in static address list
%define AddressList_length 8

var:
    .SpawnerActive          RESD 1
    .INIClass_SPAWN         RESB 256 ; FIXME: make this a local variable
    .inet_addr              RESD 1

    .IsDoingAlliancesSpawner RESB 1

    .HouseColorsArray       RESD 8
    .HouseCountriesArray    RESD 8
    .HouseHandicapsArray    RESD 8
    .SpawnLocationsArray    RESD 8

    .TunnelId               RESD 1
    .TunnelIp               RESD 1
    .TunnelPort             RESD 1
    .AddressList            RESB (ListAddress_size * AddressList_length)
    .PortHack               RESD 1
    .SaveGameNameBuf        RESB 60

[section .text]
