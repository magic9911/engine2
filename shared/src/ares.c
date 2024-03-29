/*
 * Copyright (c) 2013, 2014 Toni Spets <toni.spets@iki.fi>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include <windows.h>
#include <stdio.h>

// this tricks syringe to load this dll
asm (
    ".section .syhks00,\"d0\";"
    ".long 0;"
    ".long 0;"
    ".string \"stub\";"
);

static DWORD get_dword(char **p)
{
    DWORD ret = *(DWORD *)*p;
    *p += sizeof(DWORD);
    return ret;
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
    if (fdwReason == DLL_PROCESS_ATTACH)
    {
        if (!IsDebuggerPresent())
            return TRUE;

        char buf[MAX_PATH + 1] = { 0 };
        GetModuleFileName(NULL, buf, sizeof buf);

        printf("Patching CnCNet 5 to %s\n", buf);

        PIMAGE_DOS_HEADER dos_hdr = (void *)hinstDLL;
        PIMAGE_NT_HEADERS nt_hdr = (void *)((char *)hinstDLL + dos_hdr->e_lfanew);

        char *patch = NULL;
        int patch_len = 0;

        for (int i = 0; i < nt_hdr->FileHeader.NumberOfSections; i++)
        {
            PIMAGE_SECTION_HEADER sct_hdr = IMAGE_FIRST_SECTION(nt_hdr) + i;

            if (strcmp(".patch", (char *)sct_hdr->Name) == 0)
            {
                patch = (char *)((char *)hinstDLL + sct_hdr->VirtualAddress);
                patch_len = sct_hdr->Misc.VirtualSize;
                break;
            }

            sct_hdr++;
        }

        printf("Found .patch @ %p (%d bytes)\n", patch, patch_len);

        if (patch)
        {
            for (char *p = patch; p < patch + patch_len;)
            {
                DWORD paddress = get_dword(&p);
                if (paddress == 0) break;

                DWORD plength = get_dword(&p);

                printf("PATCH  %8u bytes -> %8X\n", (unsigned int)plength, (unsigned int)paddress);
                DWORD protect = 0;
                VirtualProtect((void *)paddress, plength, PAGE_EXECUTE_READWRITE, &protect);
                memcpy((void *)paddress, p, plength);
                VirtualProtect((void *)paddress, plength, protect, NULL);

                p += plength;
            }
        }
    }

    return TRUE;
}
