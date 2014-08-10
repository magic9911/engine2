-include ../config.mk

GAME        = ts

LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x2EC050 280
VSIZE       = .data 0x17AF74


INCLUDES    = -I../shared/inc/ -I../common/inc/ -Iinc/

LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		src/patch.o \
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

$(GAME).exe: link/dump/patch/import/vsize/$(GAME).exe

$(GAME).dll: link/dump/$(GAME).dll

include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
