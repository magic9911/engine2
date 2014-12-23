#include <windows.h>
#include <stdbool.h>
 
typedef int (_stdcall *SetAppCompatData_)(int index, int data);
 
static HMODULE hModule;
static SetAppCompatData_ setAppCompatData;
 
bool DWMOffForPrimaryLock = false;
bool DWMOffForPrimaryBlt = false;
bool ForceFullscreenSprite = false;
bool ForceBltToPrimary = false;
bool DWMOffForFullscreen = false;
bool EnableOverlays = false;
bool DisableSurfaceLock = false;
bool RedirectPrimarySurfBlts = false;
bool StripMaxWindowBorder = false;
bool DisableMaxWindowedMode = true;
 
void SetWin8CompatData()
{
    if (!hModule) hModule = LoadLibraryA("ddraw.dll");
    if (!hModule) return;
    if (!setAppCompatData) setAppCompatData = (SetAppCompatData_)GetProcAddress(hModule, "SetAppCompatData");
    if (!setAppCompatData) return;
   
    //case 7: g_bDWMOffForPrimaryLock = 1;
 
    if (DWMOffForPrimaryLock) setAppCompatData(1, 0);
    if (DWMOffForPrimaryBlt) setAppCompatData(2, 0);
    if (ForceFullscreenSprite) setAppCompatData(3, 0);
    if (ForceBltToPrimary) setAppCompatData(4, 0);
    if (DWMOffForFullscreen) setAppCompatData(6, 0);
    if (EnableOverlays) setAppCompatData(8, 0);
    if (DisableSurfaceLock) setAppCompatData(9, 0);
    if (RedirectPrimarySurfBlts) setAppCompatData(10, 0);
    if (StripMaxWindowBorder) setAppCompatData(11, 0);
    if (DisableMaxWindowedMode) setAppCompatData(12, 0);
}