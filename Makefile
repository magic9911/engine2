BUILD_DIR = .
# should be tools repo
TOOLS_DIR = ../petool

COMFLAGS  = -c -m32 -I$(BUILD_DIR)/include/ -Wall -Wextra -DREV=\"$(REV)\" -masm=intel

PCFLAGS   = -std=gnu99 $(COMFLAGS)
PCC       = i686-w64-mingw32-gcc
PLD       = ld

ifdef DEBUG
COMFLAGS += -g
else
COMFLAGS += -O2
endif

PCXXFLAGS = -std=gnu++98 $(COMFLAGS)
PCXX      = i686-w64-mingw32-g++

WINDRES   = i686-w64-mingw32-windres

NASM     ?= nasm
NFLAGS    = -f elf -I$(BUILD_DIR)/include/ --prefix _ -DREV=\"$(REV)\"

PETOOL    = $(BUILD_DIR)/petool$(EXT)

EXE       = gamemd
OBJS      = $(foreach o,callsites sym,$(BUILD_DIR)/$(o).o)

$(BUILD_DIR)/$(EXE).exe: $(EXE).lds $(EXE).dat $(OBJS) $(PETOOL)
	$(PLD) -T $< -mi386pe --file-alignment=0x1000 --subsystem=windows -o $@ $(OBJS)
	$(PETOOL) setdd $@ 1 0x40f0E0 320
	$(PETOOL) setvs $@ .data 0x367BE4
	$(PETOOL) patch $@
#	strip -R .patch $@
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
