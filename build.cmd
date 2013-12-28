tools\nasm.exe -f elf src\patch.asm -o patch.o
tools\ld.exe -T gamemd.lds --file-alignment=4096 --subsystem=windows -o gamemd.exe
tools\petool.exe patch gamemd.exe
tools\petool.exe setdd gamemd.exe 1 0x40F0E0 320
tools\petool.exe setvs gamemd.exe .data 3570660
tools\strip.exe -R .patch gamemd.exe
tools\petool.exe dump gamemd.exe 
