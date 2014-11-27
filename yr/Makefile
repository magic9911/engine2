-include ../config.mk

GAME        = yr

LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4


INCLUDES    = -I../shared/inc/ -I../common/inc/ -Iinc/

LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		src/no-cd.o \
		src/loading.o \
		src/graphics-patch.o \
		src/copy-protection.o \
		src/spawner/selectable_countries.o \
		src/spawner/selectable_handicaps.o \
		src/spawner/selectable_colors.o \
		src/spawner/selectable_spawns.o \
		src/spawner/predetermined_alliances.o \
		src/spawner/spectators.o \
		src/spawner/spawn_ini.o \
		src/spawner/spawner.o \
		../shared/src/nethack.o \
		res/res.o \
		\
		sym.o
		
ifdef ANTICHEAT
	OBJS 		+= 		src/anticheat/rename.o \
				src/anticheat/radar_hack.o \
				src/anticheat/fog_hack.o \
				src/anticheat/sidebar_hack.o \
				src/anticheat/building_hack.o \
				src/anticheat/auto_ss.o \
				src/anticheat/frame_func.o
endif

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		src/patch.o \
		../shared/src/nethack.o \
		../shared/src/ares.o \
		\
		sym.o

default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.vsize-.$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@
	


include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/