# Generic patch project master Makefile

REV        ?= UNKNOWN_VERSION

RM         ?= rm -f
CC         ?= gcc
CXX        ?= clang++
STRIP      ?= strip
WINDRES    ?= windres
NASM       ?= nasm
PETOOL     ?= petool

REVFLAG    ?= -DREV=\"$(REV)\"

CC_COMMON  ?= $(REVFLAG) $(INCLUDES) -m32 -Wall -Wextra

ifdef DEBUG
CC_COMMON  += -g
else
CC_COMMON  += -O3
endif

CFLAGS     ?= $(CC_COMMON) -std=gnu99 -masm=intel
CXXFLAGS   ?= $(CC_COMMON) -std=gnu++98 -target i686-pc-win32 -mllvm --x86-asm-syntax=intel
WFLAGS     ?= $(REVFLAG)
NFLAGS     ?= $(REVFLAG) $(INCLUDES) -f elf
LDFLAGS    ?= $(CFLAGS) \
		-Wl,-mi386pe \
		-Wl,--enable-stdcall-fixup \
		-Wl,--allow-multiple-definition \
		-Wl,--subsystem=windows

$(GAME).exe: $(LSCRIPT) $(INBIN) $(OBJS)
	$(LD) -T $< -Wl,--file-alignment=$(ALIGNMENT) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

$(GAME).dll: $(DLL_OBJS)
	$(LD) -s -shared -Wl,--exclude-all-symbols $(LDFLAGS) -o $@ $(DLL_OBJS) $(DLL_LIBS)


.PHONY: clean

import/%: %
	$(PETOOL) setdd $(*F) $(IMPORT)

vsize/%: %
	$(PETOOL) setvs $(*F) $(VSIZE)

patch/%: %
	-$(PETOOL) patch $(*F)

strip/%: %
	$(STRIP) -R .patch $(*F)

dump/%: %
	$(PETOOL) dump $(*F)

%.o: %.cpp
	$(CXX)  $(CXXFLAGS) -c -o $@ $<

%.o: %.c
	$(CC)   $(CFLAGS)   -c -o $@ $<

%.o: %.asm
	$(NASM) $(NFLAGS)      -o $@ $<

%.o: %.rc
	$(WINDRES) $(WFLAGS) $< $@

.PHONY: clean
clean:
	$(RM) *.exe *.dll $(OBJS)
