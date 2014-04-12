/*
 This very simple CPP file replaces _WinMain@16 of TS with a nice message
  - from hifi and sonarpulse, with love <3
*/
#define _MSVCRT_
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#define WINDOWS_LEAN_AND_MEAN
#include <windows.h>

class Balls {
public:
    static int test_fuzz[69];       // .hp_data
    static const bool haha = true;  // .hp_rdata
};

bool derpderp[4] = {false, true, false, false};  // .hp_rdata

/*
 linker transparently uses _start implicity defined here
 see org/ts_callsites.asm, org/ts_sym.asm
 org/ts.lds, and the order of linking in the Makefile
*/
int CALLBACK WinMain(
  _In_  HINSTANCE hInstance     __attribute__((unused)),
  _In_  HINSTANCE hPrevInstance __attribute__((unused)),
  _In_  LPSTR lpCmdLine         __attribute__((unused)),
  _In_  int nCmdShow            __attribute__((unused)))
{
    MessageBoxA(NULL, "Sod off you bloody drunk!", "Oi!", MB_ICONEXCLAMATION);
    MessageBoxA(NULL, "Ya better install MSYS2 now!", "Grrrr!", MB_ICONEXCLAMATION);
    return 1;
}
