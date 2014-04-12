Westwood RTS Engine 2
================================================================================
Random enhancements and bug fixes for Westwood's "engine 2" games: Command and
Conquer: Tiberian Sun, and Command and Conquer: Red Alert 2

Building
--------------------------------------------------------------------------------

### Prerequisites

 - GNU Make
 - Clang (or GCC if it ever supports the 32-bit MSVC++ ABI)
 - MinGW-W64 (for headers / libraries if you don't have MSVC)
 - NASM
 - PETool (itself requiring GCC, or Clang if the makefile is fiddled with)

On Unix, everything but PETool is installable via your package manager. However,
Clang will need to be pointed to Windows headers and libraries, even though it
works as a cross-compiler out of the box. Good luck with that!

On Windows, please install MSYS 2 (a separate project from the original MSYS).
MSYS 2 provides a minimal *nix environment, including a port of `pacman`, the
Arch Linux package manager. Once MSYS 2 is installed, installing everything but
Clang and PETool will be just as easy as on Linux, just do `pacman -S
<package>`.

Clang is not provided by MSYS, but it can be obtained via a windows installer
available from its website. Install it via that, and edit your MSYS `~/.bashrc`
so that Clang's binaries are on the `$PATH`. The following command should
automate this, but I make no guarantees:

```sh
$ echo 'export PATH=/c/Program\ Files/llvm/bin:$PATH' > ~/.bashrc
```

For reasons i do not know, Clang seemed fine to use MSYS/MinGW-W64 headers or
libraries with the `i686-pc-win32` target, even though it wasn't on Unix. Weird,
but I'm not complaining!

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
$ cp /path/to/yr/installation/gamemd.exe ./ra2/bin.dat
$ make
$ cp ts.exe /path/to/fs/installation/
$ cp ra2.exe /path/to/yr/installation/
```
and likewise for Tiberian Sun.

From the shell (MinGW shell on Windows).

Credits
--------------------------------------------------------------------------------

 - Hifi
 - Iran
 - Sonarpulse
