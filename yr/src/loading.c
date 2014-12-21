#define _MSVCRT_
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#define WINDOWS_LEAN_AND_MEAN
#include <windows.h>

#include "macros/patch.h"

#include "INIClass.h"

extern INIClass RA2md_INI asm("_INIClass_RA2md_INI");

const char *str_Options = "Options";
const char *str_Video = "Video";

extern bool NoCD__Disable_CD;
extern bool WindowedMode;
extern bool Graphics__Enable_Patch;
extern bool Disable_Movie_Playback;
extern bool Disable_Blowfish_DLL;

CALL(0x006BC0DC, _read_extra_options);

// we mimmic INIClass::GetBool to end with original function call
bool __thiscall
read_extra_options(INIClass *old_INI, const char *section, const char *key, bool def)
{
    // this creates hook in .patch, linker is ignoring .patch from this file however

    NoCD__Disable_CD       	= INIClass__GetBool(old_INI, str_Options, "NoCD", true);
    Graphics__Enable_Patch 	= INIClass__GetBool(old_INI, str_Video, "UseGraphicsPatch", true);
    WindowedMode           	= INIClass__GetBool(old_INI, str_Video, "Windowed", false);
	Disable_Movie_Playback	= INIClass__GetBool(old_INI, str_Options, "DisableMoviePlayback", false);
	Disable_Blowfish_DLL	= INIClass__GetBool(old_INI, str_Options, "DisableBlowfishDLL", false);
	
    // original command
    return INIClass__GetBool(old_INI, section, key, def);
}