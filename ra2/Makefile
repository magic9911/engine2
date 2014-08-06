-include ../config.mk

GAME        = ra2
IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4

INCLUDES    = -I../shared/inc/ -Iinc/

OBJS        = callsites.o \
		\
		src/patch.o \
		src/loading.o \
		src/no-cd.o \
		src/graphics-patch.o \
		src/copy-protection.o \
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
