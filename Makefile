BUILD_DIR = .
# should be tools repo
TOOLS_DIR = ../petool

COMFLAGS  = -c -m32 -I$(BUILD_DIR)/include/ -Wall -Wextra -DREV=\"$(REV)\"

PCFLAGS   = -std=gnu99 $(COMFLAGS)
PCC       = i686-w64-mingw32-gcc

ifdef DEBUG
PCFLAGS  += -g
else
PCFLAGS  += -O2
endif

PCXXFLAGS = -std=gnu++98 $(COMFLAGS)
PCXX      = i686-w64-mingw32-g++

WINDRES   = i686-w64-mingw32-windres

NASM     ?= nasm
NFLAGS    = -f elf -I$(BUILD_DIR)/include/ --prefix _ -DREV=\"$(REV)\"

PETOOL    = $(BUILD_DIR)/petool$(EXT)

EXE       = gamemd
PATCH_OBJ = $(foreach o,patch,$(BUILD_DIR)/$(o).o)

$(BUILD_DIR)/$(EXE).exe: $(EXE).lds $(EXE).dat $(PATCH_OBJ) $(PETOOL)
	i686-w64-mingw32-ld -T $< --just-symbols=$(basename $@).sym \
		--file-alignment=0x1000 --subsystem=windows -o $@ $(PATCH_OBJ)
	$(PETOOL) patch $@
	$(PETOOL) setdd $@ 1 0x40f0E0 320
	$(PETOOL) setvs $@ .data 3670600
	strip -R .patch $@
	$(PETOOL) dump  $@

$(BUILD_DIR)/%res.o: res/%.rc
	$(WINDRES) --preprocessor=type $< $@

$(BUILD_DIR)/%.o: src/%.cpp
	$(PCXX) $(PCXXFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: src/%.c
	$(PCC) $(PCFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: src/%.asm
	$(NASM) $(NFLAGS) -o $@ $<


include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: default clean
