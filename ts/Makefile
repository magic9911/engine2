-include ../config.mk

GAME        = ts
IMPORT      = 1 0x2EC050 280
VSIZE       = .data 0x17AF74

INCLUDES    = -I../shared/inc/ -Iinc/

OBJS        = callsites.o \
		\
		src/patch.o \
		res/res.o \
		../shared/src/nethack.o \
		\
		sym.o

DLL_OBJS    = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		../shared/src/ares.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
