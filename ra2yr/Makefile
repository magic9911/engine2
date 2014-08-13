-include ../config.mk

GAME        = ra2yr

COMMON_DIR  = ../common

LSCRIPT     = patch.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4


INCLUDES    = -I../shared/inc/ -I$(COMMON_DIR)/inc/ -Iinc/

LIBS        =
OBJS        = callsites.o \
		\
		src/patch.o \
		src/loading.o \
		src/no-cd.o \
		src/graphics-patch.o \
		src/copy-protection.o \
		../shared/src/nethack.o \
		res/res.o \
		\
		sym.o

PURE_OBJS   = sym.o res/res.o
RE_OBJS      = re/text.o res/res.o sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		../shared/src/ares.o \
		\
		sym.o

.PHONY: default
default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.$(GAME).exe
	$(CP) $< $@

pure-$(GAME).exe: .dump-.import-.pure-$(GAME).exe
	$(CP) $< $@

re-$(GAME).exe: .dump-.import-.re-$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@

include $(COMMON_DIR)/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I$(COMMON_DIR)/res/
