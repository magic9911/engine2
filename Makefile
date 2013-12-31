# if you are on windows you can use build.cmd instead of make

BUILD_DIR = .
# should be tools repo
TOOLS_DIR = ../petool

WINDRES   = i686-w64-mingw32-windres
NASM     ?= nasm
NFLAGS    = -f elf -I$(BUILD_DIR)/include/ --prefix _

PETOOL    = $(BUILD_DIR)/petool$(EXT)

default: game.exe

$(BUILD_DIR)/%res.o: res/%.rc
	$(WINDRES) --preprocessor=type $< $@

$(BUILD_DIR)/%.o: src/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

$(BUILD_DIR)/%.exe: %.lds %.dat $(BUILD_DIR)/sodoff.o $(BUILD_DIR)/gameres.o $(PETOOL)
	i686-w64-mingw32-ld -T $< --just-symbols=$(basename $@).sym \
		--file-alignment=0x1000 --subsystem=windows -o $@
	$(PETOOL) patch $@
	$(PETOOL) setdd $@ 1 0x2EC050 280
	$(PETOOL) setvs $@ .data 1552244
#	strip -R .patch $@
	$(PETOOL) dump  $@

include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: default clean
