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
		src/win8-fix-func.o \
		src/win8-fix.o \
		src/data.o \
		src/fix_mouse_not_found_error.o \
		src/graphics_patch.o \
		src/loading.o \
		src/no-cd.o \
		src/var.o \
		src/single-proc-affinity.o \
		res/res.o \
		\
		sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.vsize-.$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@

include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
