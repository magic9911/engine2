-include ../config.mk

REV         = $(shell sh -c 'git rev-parse --short @{0}')
LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

GAME        = ts
IMPORT      = 1 0x2EC050 280
VSIZE       = .data 0x17AF74


INCLUDES    = -I../shared/inc/ -Iinc/

LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		res/res.o \
		\
		sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		../shared/src/ares.o \
		\
		sym.o

default: exe dll

.PHONY: exe
exe: dump/patch/import/vsize/ts.exe

.PHONY: dll
dll: dump/ts.dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
