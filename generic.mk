# Generic patch project master Makefile

REV        ?= $(shell sh -c 'git rev-parse --short @{0}')

RM         ?= rm -f
CC         ?= gcc
CXX        ?= clang++
CC_LD      ?= $(CC)
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
CC_LDFLAGS ?= $(CFLAGS) \
		-Wl,-mi386pe \
		-Wl,--enable-stdcall-fixup \
		-Wl,--allow-multiple-definition \
		-Wl,--subsystem=windows

$(GAME).exe: link.lds bin.dat $(OBJS)
	$(CC_LD) -Wl,-T$< -Wl,--file-alignment=0x0400 $(CC_LDFLAGS) -o $@ $(OBJS) $(LIBS)
	$(PETOOL) setdd $@ $(IMPORT)
	$(PETOOL) setvs $@ $(VSIZE)
	-$(PETOOL) patch $@
	$(STRIP) -R .patch $@
	$(PETOOL) dump $@

$(GAME).dll: $(DLL_OBJS)
	$(CC_LD) -s -shared -Wl,--exclude-all-symbols $(CC_LDFLAGS) -o $@ $(DLL_OBJS) $(DLL_LIBS)
	$(PETOOL) dump $@

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
