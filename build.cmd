copy gamemd.dat gamemd.exe
tools\linker.exe src\data.asm src\data.inc gamemd.exe tools\nasm.exe
tools\linker.exe src\code.asm src\code.inc gamemd.exe tools\nasm.exe
