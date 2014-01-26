BUILD_DIR   = .
# should be tools repo
TOOLS_DIR   = ../petool

PCOMFLAGS   = -c -m32 -I$(BUILD_DIR)/include/ -Wall -Wextra -DREV=\"$(REV)\" \
	-target i686-pc-win32 -mllvm --x86-asm-syntax=intel

ifdef DEBUG
PCOMFLAGS  += -g
else
PCOMFLAGS  += -O3
endif

PCFLAGS     = -std=gnu99 $(COMFLAGS)
PCC         = clang
PLD         = ld

PCXXFLAGS   = -std=gnu++98 $(PCOMFLAGS)
PCXX        = clang++

WINDRES     = windres

NASM       ?= nasm
NFLAGS      = -f elf -I$(BUILD_DIR)/include/ -DREV=\"$(REV)\"

PETOOL      = $(BUILD_DIR)/petool$(EXT)

PROGRAMS    = ts ra2

ts_IMPR     = 1 0x2EC050 280
ts_VSIZ     = 0x17AF74
ts_OBJS     = $(foreach o,callsites res sym,$(BUILD_DIR)/ts_$(o).o)

ra2_IMPR    = 1 0x40f0E0 320
ra2_VSIZ    = 0x367BE4
ra2_OBJS    = $(foreach o,callsites patch sym,$(BUILD_DIR)/ra2_$(o).o)


default: $(foreach prog,$(PROGRAMS),$(BUILD_DIR)/$(prog).exe)

.SECONDEXPANSION:
$(BUILD_DIR)/%.exe: org/%.lds org/%.dat $$($$*_OBJS) $(PETOOL)
	$(PLD) -T $< -mi386pe --allow-multiple-definition --file-alignment=0x1000 \
		--subsystem=windows -o $@ $($*_OBJS)
	$(PETOOL) setdd $@ $($*_IMPR)
	$(PETOOL) setvs $@ .data $($*_VSIZ)
	$(PETOOL) patch $@
#	strip -R .patch $@
	$(PETOOL) dump  $@

define RULES =
$(BUILD_DIR)/$(1)_%.o: $(1)_src/%.cpp	
	$(PCXX) $(PCXXFLAGS) -o $$@ $$<		

$(BUILD_DIR)/$(1)_%.o: $(1)_src/%.c		
	$(PCC) $(PCFLAGS) -o $$@ $$<			

$(BUILD_DIR)/$(1)_%.o: $(1)_src/%.asm	
	$(NASM) $(NFLAGS) -o $$@ $$<			
endef

$(foreach prog,$(PROGRAMS),$(eval $(call RULES,$(prog))))

$(BUILD_DIR)/%_res.o: res/%.rc
	$(WINDRES) $< $@

$(BUILD_DIR)/%.o: org/%.asm
	$(NASM) $(NFLAGS) -o $@ $<

include $(TOOLS_DIR)/Makefile

clean:
	rm -f *.exe *.o

.PHONY: default clean
