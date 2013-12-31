#!/bin/sh
set -v

nasm -f elf src/sodoff.asm -o sodoff.o
i686-w64-mingw32-windres --preprocessor=type res/game.rc gameres.o
i686-w64-mingw32-ld -T game.lds --subsystem=windows --just-symbols=game.sym -o game.exe
./petool patch game.exe
./petool setdd game.exe 1 0x2EC050 280
./petool setvs game.exe .data 1552244
i686-w64-mingw32-objcopy --section-alignment=4096 --file-alignment=4096 -R .patch game.exe
#strip -R .patch game.exe
./petool dump game.exe 
