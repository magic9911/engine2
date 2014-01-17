BUILD_DIR   = .
# should be tools repo
TOOLS_DIR   = ../petool

COMFLAGS    = -c -m32 -I$(BUILD_DIR)/include/ -Wall -Wextra -DREV=\"$(REV)\" -masm=intel

PCFLAGS     = -std=gnu99 $(COMFLAGS)
PCC         = i686-w64-mingw32-gcc
PLD         = ld

ifdef DEBUG
COMFLAGS   += -g
else
COMFLAGS   += -O2
endif

PCXXFLAGS   = -std=gnu++98 $(COMFLAGS)
PCXX        = i686-w64-mingw32-g++

WINDRES     = windres

NASM       ?= nasm
NFLAGS      = -f elf -I$(BUILD_DIR)/include/ --prefix _ -DREV=\"$(REV)\"

PETOOL      = $(BUILD_DIR)/petool$(EXT)

gamemd_IMPR = 1 0x40f0E0 320
gamemd_VSIZ = 0x367BE4
gamemd_OBJS = $(foreach o,gamemd_callsites patch gamemd_sym,$(BUILD_DIR)/$(o).o)


default: $(BUILD_DIR)/gamemd.exe

.SECONDEXPANSION:
$(BUILD_DIR)/%.exe: org/%.lds org/%.dat $$($$*_OBJS) $(PETOOL)
	$(PLD) -T $< -mi386pe --allow-multiple-definition --file-alignment=0x1000 \
		--subsystem=windows -o $@ $($*_OBJS)
	$(PETOOL) setdd $@ $($*_IMPR)
	$(PETOOL) setvs $@ .data $($*_VSIZ)
	$(PETOOL) patch $@
#	strip -R .patch $@
	$(PETOOL) dump  $@

$(BUILD_DIR)/%_res.o: res/%.rc
	$(WINDRES) --preprocessor=type $< $@

$(BUILD_DIR)/%.o: src/%.cpp
	$(PCXX) $(PCXXFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: src/%.c
	$(PCC) $(PCFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: src/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: org/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: default clean
