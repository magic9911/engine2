-include ../config.mk

GAME        = ra2

LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4


INCLUDES    = -I../shared/inc/ -I../common/inc/ -Iinc/

LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		src/patch.o \
		src/no-cd.o \
		src/loading.o \
		src/graphics-patch.o \
		src/copy-protection.o \
		../shared/src/nethack.o \
		res/res.o \
		\
		sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		../shared/src/ares.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.vsize-.$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@
	


include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
