-include ../config.mk

GAME        = ra2

REV         = $(shell sh -c 'git rev-parse --short @{0}')
LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4


INCLUDES    = -I../shared/inc/ -Iinc/

LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		src/main.o \
		res/res.o \
		\
		sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		src/main.o \
		../shared/src/ares.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

$(GAME).exe: link/dump/patch/import/vsize/$(GAME).exe

$(GAME).dll: link/dump/$(GAME).dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
