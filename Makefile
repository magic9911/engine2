# if you are on windows you can use build.bat instead of make

BUILD_DIR = .
# should be tools repo
TOOLS_DIR = ../petool

NASM     ?= nasm
NFLAGS    = -f elf -I$(BUILD_DIR)/include/

PETOOL    = $(BUILD_DIR)/petool$(EXT)

default: gamemd.exe

$(BUILD_DIR)/%.o: src/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.dat                $(PETOOL)
	$(PETOOL) pe2obj $< $@

$(BUILD_DIR)/%.exe: %.lds %.o $(BUILD_DIR)/patch.o  $(PETOOL)
	i686-w64-mingw32-ld -T $< --file-alignment=4096 --subsystem=windows -o $@
	$(PETOOL) patch $@
	$(PETOOL) setdd $@ 1 0x40f0E0 320
	$(PETOOL) setvs $@ .data 3670600
	strip -R .patch $@
	$(PETOOL) dump  $@

include $(TOOLS_DIR)/Makefile

clean: clean_tools
	rm -f *.exe *.o

.PHONY: default clean
