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

extern char *str_Options;
extern char *str_Video;

extern bool NoCD__Disable_CD;
extern bool WindowedMode;
extern bool Graphics__Enable_Patch;

LJMP(0x006BC0DC, _read_extra_options);

// we mimmic INIClass::GetBool to end with original function call
bool __thiscall
read_extra_options(INIClass *old_INI, const char *section, const char *key, bool def)
{
    // this creates hook in .patch, linker is ignoring .patch from this file however

    NoCD__Disable_CD       = INIClass__GetBool(&RA2md_INI, str_Options, "NoCD", false);
    Graphics__Enable_Patch = INIClass__GetBool(&RA2md_INI, str_Video, "UseGraphicsPatch", true);
    WindowedMode           = INIClass__GetBool(&RA2md_INI, str_Video, "Windowed", false);

    // original command
    return INIClass__GetBool(old_INI, section, key, def);
}
