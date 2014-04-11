BUILD_DIR   = .
# should be tools repo
TOOLS_DIR   = ../petool

REV         = $(shell sh -c 'git rev-parse --short @{0}')

PCOMFLAGS   = -c -m32 -Ishared/inc/ -Wall -Wextra -DREV=\"$(REV)\" \
	-target i686-pc-win32 -mllvm --x86-asm-syntax=intel

ifdef DEBUG
PCOMFLAGS  += -g
else
PCOMFLAGS  += -O3
endif

PCFLAGS     = -std=gnu99 $(PCOMFLAGS)
PCC         = clang
PLD         = ld

PCXXFLAGS   = -std=gnu++98 $(PCOMFLAGS)
PCXX        = clang++

WINDRES     = windres
WFLAGS      = -Ishared/res/ -DREV=\"$(REV)\"

NASM       ?= nasm
NFLAGS      = -f elf -Ishared/inc/ -DREV=\"$(REV)\"

PETOOL      = $(BUILD_DIR)/petool$(EXT)

PROGRAMS    = ts ra2

shared_OBJS = $(foreach o,,$(BUILD_DIR)/shared_$(o).o)

ts_IMPR     = 1 0x2EC050 280
ts_VSIZ     = 0x17AF74
ts_OBJS     = $(foreach o,callsites res sym,$(BUILD_DIR)/ts_$(o).o) $(shared_OBJS)

ra2_IMPR    = 1 0x40f0E0 320
ra2_VSIZ    = 0x367BE4
ra2_OBJS    = $(foreach o,callsites main res sym,$(BUILD_DIR)/ra2_$(o).o) $(shared_OBJS)


default: $(foreach prog,$(PROGRAMS),$(BUILD_DIR)/$(prog).exe)

.SECONDEXPANSION:
$(BUILD_DIR)/%.exe: %/link.lds %/bin.dat $$($$*_OBJS) $(PETOOL)
	$(PLD) -T $< -mi386pe --allow-multiple-definition --file-alignment=0x1000 \
		--subsystem=windows -o $@ $($*_OBJS)
	$(PETOOL) setdd $@ $($*_IMPR)
	$(PETOOL) setvs $@ .data $($*_VSIZ)
	$(PETOOL) patch $@
#	strip -R .patch $@
	$(PETOOL) dump  $@

define RULES
$(BUILD_DIR)/$(1)_%.o: $(1)/src/%.cpp
	$(PCXX)    -I$(1)/inc/ $(PCXXFLAGS) -o $$@ $$<

$(BUILD_DIR)/$(1)_%.o: $(1)/src/%.c
	$(PCC)     -I$(1)/inc/ $(PCFLAGS)   -o $$@ $$<

$(BUILD_DIR)/$(1)_%.o: $(1)/src/%.asm
	$(NASM)    -I$(1)/inc/ $(NFLAGS)    -o $$@ $$<

# callsites and symbols do not go in /*/src
$(BUILD_DIR)/$(1)_%.o: $(1)/%.asm
	$(NASM)                $(NFLAGS)    -o $$@ $$<

$(BUILD_DIR)/$(1)_%.o: $(1)/res/%.rc
	$(WINDRES) -I$(1)/res/ $(WFLAGS) $$< $$@
endef

$(foreach prog,$(PROGRAMS) shared,$(eval $(call RULES,$(prog))))

include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: default clean
