-include ../config.mk

REV         = $(shell sh -c 'git rev-parse --short @{0}')
LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

GAME        = ra2
IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4


INCLUDES    = -I../shared/inc/ -Iinc/

LIBS        = -nostdlib
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

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		../shared/src/ares.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

$(GAME).exe: dump/patch/import/vsize/$(GAME).exe

$(GAME).dll: dump/$(GAME).dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
