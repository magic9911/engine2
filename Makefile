# if you are on windows you can use build.cmd instead of make

BUILD_DIR = .
# should be tools repo
TOOLS_DIR = ../petool

NASM     ?= nasm
NFLAGS    = -f elf -I$(BUILD_DIR)/include/ --prefix _

PETOOL    = $(BUILD_DIR)/petool$(EXT)

default: gamemd.exe

$(BUILD_DIR)/%.o: src/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

$(BUILD_DIR)/%.exe: %.lds %.dat $(BUILD_DIR)/patch.o       $(PETOOL)
	i686-w64-mingw32-ld -T $< --just-symbols=$(basename $@).sym \
		--file-alignment=4096 --subsystem=windows -o $@
	$(PETOOL) patch $@
	$(PETOOL) setdd $@ 1 0x40f0E0 320
	$(PETOOL) setvs $@ .data 3670600
	strip -R .patch $@
	$(PETOOL) dump  $@

include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: default clean
