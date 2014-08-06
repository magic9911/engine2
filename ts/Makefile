-include ../config.mk

GAME        = ts
IMPORT      = 1 0x2EC050 280
VSIZE       = .data 0x17AF74

INCLUDES    = -I../shared/inc/ -Iinc/

OBJS        = callsites.o \
		\
		res/res.o \
		\
		sym.o

DLL_OBJS    = callsites.o \
		\
		../shared/src/ares.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
