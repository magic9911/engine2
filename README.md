Command and Conquer: Yuri's Revenge patch
================================================================================

Random patches and CnCNet 5 spawner.

Building
--------------------------------------------------------------------------------

### Prerequisites

 - GNU Make
 - MinGW (really, a 32-bit portable-executable-compatible version of GCC and GNU Binutils)
 - NASM
 - PETool (itself requiring native GCC, GNU Binutils, and GNU Make)

On Unix, GNU Make, MinGW, NASM are both easily installable via your package
manager. On windows, first install MinGW, and then drop NASM somewhere MinGW's
shell will find it. Note that window's MinGW release also contains GNU Make,
Unix shell, and other components needed to emulated Unix build environment,
whereas on unix MinGW is strictly the cross-compiling toolchain itself. On both
platforms, we recommend the MinGW-w64 release of MinGW, even though we are
patching a 32-bit executable.

PETool is a utility made by us to do the patching itself and tie some loose
ends. Please `git clone` its repo too, in the same directory as this one --
i.e. both repositories are in the same folder. Then PETool will be built
automatically. On Unix you will want native GCC and GNU Binutils installed to
natively build PETool. On windows MinGW *is* the native version, so it
will be used both for patching the game and building PETool.

### Instructions

Once everything is installed, just backup your executable, copy it to this repo
under the name `gamemd.dat`, run `make`, and copy the patched executable back to
your YR installation. Or if you rather just copy and paste some commands, do:

```sh
$ cd /path/to/yr/installation
$ cp gamemd.exe gamemd-backup.exe
$ cd /path/to/this/repo
$ cp /path/to/yr/installation/gamemd.exe ./gamemd.dat
$ make
$ cp gamemd.exe /path/to/yr/installation
```

From the shell (MinGW shell on Windows).

Credits
--------------------------------------------------------------------------------

 - Hifi
 - Iran
 - Sonarpulse
