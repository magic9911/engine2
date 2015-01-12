%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

global str_UseGraphicsPatch
global str_NoCD
global str_Video_Windowed

global str_DWMOffForPrimaryBlt
global str_ForceFullscreenSprite
global str_ForceBltToPrimary
global str_DWMOffForFullscreen
global str_DWMOffForPrimaryLock
global str_EnableOverlays
global str_DisableSurfaceLock
global str_RedirectPrimarySurfBlts
global str_StripMaxWindowBorder
global str_DisableMaxWindowedMode
global str_SingleProcAffinity

[section .rdata]

StringZ gcanyonmap,                 "blitz_test.map"
StringZ debugplayer,                "debugplayer"
StringZ debugplayer2,               "debugplayer2"
StringZ wsock32_dll,                "wsock32.dll"
StringZ inet_addr,                  "inet_addr"
StringZ localhost,                  "127.0.0.1"
StringZ spawn_ini,                  "SPAWN.INI"
StringZ Settings,                   "Settings"
StringZ UnitCount,                  "UnitCount"
StringZ Scenario,                   "Scenario"
StringZ Empty,                      ""
StringZ GameSpeed,                  "GameSpeed"
StringZ Seed,                       "Seed"
StringZ TechLevel,                  "TechLevel"
StringZ AIPlayers,                  "AIPlayers"
StringZ AIDifficulty,               "AIDifficulty"
StringZ HarvesterTruce,             "HarvesterTruce"
StringZ BridgeDestroy,              "BridgeDestroy"
StringZ FogOfWar,                   "FogOfWar"
StringZ Crates,                     "Crates"
StringZ ShortGame,                  "ShortGame"
StringZ Bases,                      "Bases"
StringZ MCVRedeploy,                "MCVRedeploy"
StringZ Credits,                    "Credits"
StringZ Name,                       "Name"
StringZ Side,                       "Side"
StringZ Color,                      "Color"
StringZ OtherSectionFmt,            "Other%d"
StringZ Port,                       "Port"
StringZ Ip,                         "Ip"
StringZ SpawnArg,                   "-SPAWN"
StringZ MultiEngineer,              "MultiEngineer"
StringZ Firestorm,                  "Firestorm"
StringZ HouseColors,                "HouseColors"
StringZ HouseCountries,             "HouseCountries"
StringZ HouseHandicaps,             "HouseHandicaps"
StringZ Tunnel,                     "Tunnel"
StringZ SpawnLocations,             "SpawnLocations"
StringZ IsSinglePlayer,             "IsSinglePlayer"
StringZ LoadSaveGame,               "LoadSaveGame"
StringZ SaveGameName,               "SaveGameName"
StringZ MultipleFactory,            "MultipleFactory"
StringZ AlliesAllowed,              "AlliesAllowed"
StringZ SidebarHack,                "SidebarHack"
StringZ BuildOffAlly,               "BuildOffAlly"

StringZ DifficultyMode1,            "DifficultyMode1"
StringZ DifficultyMode2,            "DifficultyMode2"

StringZ Multi1,                     "Multi1"
StringZ Multi2,                     "Multi2"
StringZ Multi3,                     "Multi3"
StringZ Multi4,                     "Multi4"
StringZ Multi5,                     "Multi5"
StringZ Multi6,                     "Multi6"
StringZ Multi7,                     "Multi7"
StringZ Multi8,                     "Multi8"

StringZ HouseAllyOne,               "HouseAllyOne"
StringZ HouseAllyTwo,               "HouseAllyTwo"
StringZ HouseAllyThree,             "HouseAllyThree"
StringZ HouseAllyFour,              "HouseAllyFour"
StringZ HouseAllyFive,              "HouseAllyFive"
StringZ HouseAllySix,               "HouseAllySix"
StringZ HouseAllySeven,             "HouseAllySeven"

StringZ Multi1_Alliances,           "Multi1_Alliances"
StringZ Multi2_Alliances,           "Multi2_Alliances"
StringZ Multi3_Alliances,           "Multi3_Alliances"
StringZ Multi4_Alliances,           "Multi4_Alliances"
StringZ Multi5_Alliances,           "Multi5_Alliances"
StringZ Multi6_Alliances,           "Multi6_Alliances"
StringZ Multi7_Alliances,           "Multi7_Alliances"
StringZ Multi8_Alliances,           "Multi8_Alliances"

StringZ Spawn1,                     "Spawn1"
StringZ Spawn2,                     "Spawn2"
StringZ Spawn3,                     "Spawn3"
StringZ Spawn4,                     "Spawn4"
StringZ Spawn5,                     "Spawn5"
StringZ Spawn6,                     "Spawn6"
StringZ Spawn7,                     "Spawn7"
StringZ Spawn8,                     "Spawn8"

StringZ IsSpectator,                "IsSpectator"

StringZ message_fmt,                "%s: %s"

StringZ AutoSSFileNameFormat,       "AUTOSS\\AutoSS-%d-%d_%d.PCX"
StringZ AutoSSDir,                  "./AutoSS"

StringZ stats_dmp,                  "stats.dmp"

StringZ UseGraphicsPatch,           "UseGraphicsPatch"

StringZ DWMOffForPrimaryBlt,       "DWMOffForPrimaryBlt"
StringZ ForceFullscreenSprite,     "ForceFullscreenSprite"
StringZ ForceBltToPrimary,         "ForceBltToPrimary"
StringZ DWMOffForFullscreen,     "DWMOffForFullscreen"
StringZ DWMOffForPrimaryLock,     "DWMOffForPrimaryLock"
StringZ EnableOverlays,     "EnableOverlays"
StringZ DisableSurfaceLock,     "DisableSurfaceLock"
StringZ RedirectPrimarySurfBlts,     "RedirectPrimarySurfBlts"
StringZ StripMaxWindowBorder,     "StripMaxWindowBorder"
StringZ DisableMaxWindowedMode,     "DisableMaxWindowedMode"


StringZ ForceLowestDetailLevel,     "ForceLowestDetailLevel"

StringZ Video_Windowed,             "Video.Windowed"
StringZ Video_WindowedScreenHeight, "Video.WindowedScreenHeight"
StringZ Video_WindowedScreenWidth,  "Video.WindowedScreenWidth"

StringZ InternetDisabled,           "This version of Tiberian Sun only supports online play on CnCNet 5  (www.cncnet.org)"

StringZ NoCD,                       "NoCD"

StringZ SingleProcAffinity,         "SingleProcAffinity"

_2Bin:                              incbin "res/2.bin"
_1Bin:                              incbin "res/1.bin"

__SECT__
