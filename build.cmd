tools\nasm.exe -f elf src\sodoff.asm -o sodoff.o
tools\windres.exe --preprocessor=type res\game.rc gameres.o
tools\ld.exe -T game.lds --file-alignment=0x1000 --subsystem=windows --just-symbols=game.sym -o game.exe
tools\petool.exe patch game.exe
tools\petool.exe setdd game.exe 1 0x2EC050 280
tools\petool.exe setvs game.exe .data 1552244
@rem tools\strip.exe -R .patch game.exe
tools\petool.exe dump game.exe 
