Westwood RTS Engine 2
================================================================================
Random enhancements and bug fixes for Westwood's "engine 2" games: Command and
Conquer: Tiberian Sun, and Command and Conquer: Red Alert 2

Building
--------------------------------------------------------------------------------

### Prerequisites

 - GNU Make
 - Clang (or GCC if it ever support the MSVC++ ABI)
 - NASM
 - PETool (itself requiring GCC, or Clang if the makefile is fiddled with)

On Unix, everything is installable via your package manager. On Windows, please
install MSYS 2 (a seperate project from the original MSYS). MSYS 2 provides a
minimal *nix environment, including a port of pacman, the Arch linux package
manager. Once MSYS 2 is installed, installing the above packages will be just as
easy as on Linux.

GNU Make, MinGW, NASM are both easily installable via your package
manager. On windows, first install MinGW, and then drop NASM somewhere MinGW's
shell will find it. Note that window's MinGW release also contains GNU Make,
Unix shell, and other components needed to emulated Unix build environment,
whereas on unix MinGW is strictly the cross-compiling toolchain itself. On both
platforms, we recommend the MinGW-w64 release of MinGW, even though we are
patching a 32-bit executable.

PETool is a utility made by us to do the patching itself and tie some loose
ends. Please `git clone` its repo too, and in the same directory as this one --
i.e. both repositories are in the same folder. Then PETool will be built
automatically when calling make to patch the games.

### Instructions

Once everything is installed, just copy your YR executable to this repo under
the name `org/ra2.dat` (TS is freeware, and thus included), run `make`, and copy
the patched executables back to your game installations. (Make sure to backup
your original executables!)

Or if you rather just copy and paste some commands, do:

```sh
$ cd /path/to/yr/installation
$ cp ra2.exe ra2-backup.exe
$ cd /path/to/this/repo
$ cp /path/to/yr/installation/gamemd.exe ./org/ra2.dat
$ make
$ cp ts.exe /path/to/fs/installation/
$ cp ra2.exe /path/to/yr/installation/
```

From the shell (MinGW shell on Windows).

Credits
--------------------------------------------------------------------------------

 - Hifi
 - Iran
 - Sonarpulse
