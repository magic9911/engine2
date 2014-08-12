-include ../config.mk

GAME        = ts

LSCRIPT     = patch.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x2EC050 280
VSIZE       = .data 0x17AF74


INCLUDES    = -I../shared/inc/ -I../common/inc/ -Iinc/

LIBS        =
OBJS        = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		res/res.o \
		\
		sym.o

PURE_OBJS   = sym.o res/res.o
RE_OBJS      = re/text.o re/rdata.o re/data.o res/res.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		../shared/src/ares.o \
		\
		sym.o

.PHONY: default
default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.vsize-.$(GAME).exe
	$(CP) $< $@

pure-$(GAME).exe: .dump-.import-.vsize-.pure-$(GAME).exe
	$(CP) $< $@

re-$(GAME).exe: .dump-.import-.vsize-.re-$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@

include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
