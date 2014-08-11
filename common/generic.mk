# Generic patch project master Makefile

REV         ?= UNKNOWN_VERSION

CP          ?= copy
RM          ?= rm -f
CC          ?= gcc
CXX         ?= clang++
STRIP       ?= strip
WINDRES     ?= windres
NASM        ?= nasm
PETOOL      ?= petool

REVFLAG     ?= -DREV=\"$(REV)\"

CC_COMMON   ?= $(REVFLAG) $(INCLUDES) -m32 -Wall -Wextra

ifdef DEBUG
CC_COMMON   += -g
else
CC_COMMON   += -O3
endif

CFLAGS      ?= $(CC_COMMON) -std=gnu99 -masm=intel
CXXFLAGS    ?= $(CC_COMMON) -std=gnu++98 -target i686-pc-win32 -mllvm --x86-asm-syntax=intel
WFLAGS      ?= $(REVFLAG)
NFLAGS      ?= $(REVFLAG) $(INCLUDES) -f elf
LD_COMMON   ?= $(CFLAGS) \
		-Wl,-mi386pe \
		-Wl,--enable-stdcall-fixup \
		-Wl,--allow-multiple-definition \
		-Wl,--subsystem=windows

LDFLAGS     ?= $(LD_COMMON) -Wl,--file-alignment=$(ALIGNMENT)
DLL_LDFLAGS ?= $(LD_COMMON) -s -shared -Wl,--strip-all -Wl,--exclude-all-symbols

.$(GAME).exe: $(LSCRIPT) $(INBIN) $(OBJS)
	$(CC) -T $< $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.$(GAME).dll: $(DLL_OBJS)
	$(CC) $(DLL_LDFLAGS) -o $@ $(DLL_OBJS) $(DLL_LIBS)

.import-%: %
	$(CP) $< $@
	$(PETOOL) setdd $@ $(IMPORT)

.vsize-%: %
	$(CP) $< $@
	$(PETOOL) setvs $@ $(VSIZE)

.patch-%: %
	$(CP) $< $@
	-$(PETOOL) patch $@

.strip-%: %
	$(CP) $< $@
	$(STRIP) -R .patch $@

.dump-%: %
	$(CP) $< $@
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
	$(RM) *.exe *.dll $(OBJS) $(DLL_OBJS)
