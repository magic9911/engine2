-include ../config.mk

GAME        = ts
IMPORT      = 1 0x2EC050 280
VSIZE       = .data 0x17AF74
ALIGNMENT   = 0x0400

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

default: exe dll

.PHONY: exe
exe: dump/patch/import/vsize/ts.exe

.PHONY: dll
dll: dump/ts.dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
