BUILD_DIR  ?= .

REV        ?= $(shell sh -c 'git rev-parse --short @{0}')

EXT	       ?=
RM	       ?= rm -f
CC	       ?= gcc

PCOMFLAGS  ?= -c -m32 -Ishared/inc/ -Wall -Wextra -DREV=\"$(REV)\" \
	-target i686-pc-win32 -mllvm --x86-asm-syntax=intel

ifdef DEBUG
PCOMFLAGS  += -g
else
PCOMFLAGS  += -O3
endif

PCC        ?= clang
PCFLAGS    ?= -std=gnu99 $(PCOMFLAGS)
PLD        ?= ld

PCXX       ?= clang++
PCXXFLAGS  ?= -std=gnu++98 $(PCOMFLAGS)

WINDRES    ?= windres
WFLAGS     ?= -Ishared/res/ -DREV=\"$(REV)\"

NASM       ?= nasm
NFLAGS     ?= -f elf -Ishared/inc/ -DREV=\"$(REV)\"

# should be tools repo
PETOOL     ?= ../petool/petool$(EXT)

default: $(foreach prog,$(PROGRAMS),$(BUILD_DIR)/$(prog).exe)

$(PETOOL):
	$(MAKE) -C $(dir $(PETOOL)) EXT=$(EXT) CC=$(CC)

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

clean:
	rm -f *.exe *.o

.PHONY: default clean
