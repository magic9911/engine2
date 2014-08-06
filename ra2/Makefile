-include ../config.mk

GAME        = ra2
IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4
ALIGNMENT   = 0x0400

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

default: exe dll

.PHONY: exe
exe: dump/patch/import/vsize/ra2.exe

.PHONY: dll
dll: dump/ra2.dll

include ../generic.mk

WFLAGS	   += -Ires/ -I../shared/res/
