-include ../config.mk

GAME        = ts

LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x2EC050 280


INCLUDES    = -Iinc/ -I../shared/inc/ -I../common/inc/

PATCH_OBJS  = src/patch.o \
		../shared/src/nethack.o

ifdef ANTICHEAT
	PATCH_OBJS +=
endif


LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		$(PATCH_OBJS) \
		res/res.o \
		\
		sym.o

PURE_OBJS   = sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		$(PATCH_OBJS) \
		../shared/src/ares.o \
		\
		sym.o

.PHONY: default
default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.$(GAME).exe
	$(CP) $< $@

pure-$(GAME).exe: .dump-.import-.pure-$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@



include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
