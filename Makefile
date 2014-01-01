# if you are on windows you can use build.cmd instead of make

BUILD_DIR = .
# should be tools repo
TOOLS_DIR = ../petool

WINDRES   = i686-w64-mingw32-windres
NASM     ?= nasm
NFLAGS    = -f elf -I$(BUILD_DIR)/include/ --prefix _

PETOOL    = $(BUILD_DIR)/petool$(EXT)

EXE       = game
PATCH_OBJ = $(foreach o,patch gameres,$(BUILD_DIR)/$(o).o)

$(BUILD_DIR)/$(EXE).exe: $(EXE).lds $(EXE).dat $(PATCH_OBJ) $(PETOOL)
	i686-w64-mingw32-ld -T $< --just-symbols=$(basename $@).sym \
		--file-alignment=0x1000 --subsystem=windows -o $@ $(PATCH_OBJ)
	$(PETOOL) patch $@
	$(PETOOL) setdd $@ 1 0x2EC050 280
	$(PETOOL) setvs $@ .data 1552244
#	strip -R .patch $@
	$(PETOOL) dump  $@

$(BUILD_DIR)/%res.o: res/%.rc
	$(WINDRES) --preprocessor=type $< $@

$(BUILD_DIR)/%.o: src/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: clean
