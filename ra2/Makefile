-include ../config.mk

GAME        = ra2
IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4

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
