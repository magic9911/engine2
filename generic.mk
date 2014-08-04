BUILD_DIR  ?= .

REV        ?= $(shell sh -c 'git rev-parse --short @{0}')

EXT        ?=
RM         ?= rm -f

COMFLAGS   ?= -Ishared/inc/ -DREV=\"$(REV)\" -c -m32 -Wall -Wextra

ifdef DEBUG
COMFLAGS   += -g
else
COMFLAGS   += -O3
endif

CC         ?= gcc
CFLAGS     ?= -std=gnu99 $(COMFLAGS) -masm=intel
LD         ?= ld

CXX        ?= clang++
CXXFLAGS   ?= -std=gnu++98 $(COMFLAGS) -target i686-pc-win32 -mllvm --x86-asm-syntax=intel

STRIP      ?= strip

WINDRES    ?= windres
WFLAGS     ?= -Ishared/res/ -DREV=\"$(REV)\"

NASM       ?= nasm
NFLAGS     ?= -Ishared/inc/ -DREV=\"$(REV)\" -f elf

PETOOL     ?= petool

default: $(foreach prog,$(PROGRAMS),$(BUILD_DIR)/$(prog).exe)

.SECONDEXPANSION:
$(BUILD_DIR)/%.exe: %/link.lds %/bin.dat $$($$*_OBJS)
	$(LD) -T $< -mi386pe \
		--allow-multiple-definition \
		--file-alignment=0x1000 \
		--subsystem=windows -o $@ $($*_OBJS)
	$(PETOOL) setdd $@ $($*_IMPR)
	$(PETOOL) setvs $@ .data $($*_VSIZ)
	$(PETOOL) patch $@
#	$(STRIP) -R .patch $@
	$(PETOOL) dump  $@

define RULES
$(BUILD_DIR)/$(1)_%.o: $(1)/src/%.cpp
	$(CXX)    -I$(1)/inc/ $(CXXFLAGS) -o $$@ $$<

$(BUILD_DIR)/$(1)_%.o: $(1)/src/%.c
	$(CC)     -I$(1)/inc/ $(CFLAGS)   -o $$@ $$<

$(BUILD_DIR)/$(1)_%.o: $(1)/src/%.asm
	$(NASM)   -I$(1)/inc/ $(NFLAGS)   -o $$@ $$<

# callsites and symbols do not go in /*/src
$(BUILD_DIR)/$(1)_%.o: $(1)/%.asm
	$(NASM)               $(NFLAGS)   -o $$@ $$<

$(BUILD_DIR)/$(1)_%.o: $(1)/res/%.rc
	$(WINDRES) -I$(1)/res/ $(WFLAGS) $$< $$@
endef

$(foreach prog,$(PROGRAMS) shared,$(eval $(call RULES,$(prog))))

clean:
	rm -f *.exe *.o

.PHONY: default clean
