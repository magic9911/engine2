copy gamemd.dat gamemd.exe
start /w tools\petool.exe gamemd.exe add .pcode rxc 102400
start /w tools\petool.exe gamemd.exe add .pdata ri 102400
start /w tools\petool.exe gamemd.exe add .pvar rwu 102400
start /w tools\linker.exe src\data.asm src\data.inc gamemd.exe tools\nasm.exe
start /w tools\linker.exe src\code.asm src\code.inc gamemd.exe tools\nasm.exe
