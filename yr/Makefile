-include ../config.mk

GAME        = yr

LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x40f0E0 320
VSIZE       = .data 0x367BE4


INCLUDES    = -Iinc/ -I../shared/inc/ -I../common/inc/

PATCH_OBJS  = src/no-cd.o \
		src/loading.o \
		src/graphics-patch.o \
		src/copy-protection.o \
		src/multi_spectators_hack.o \
		src/absolute_prism_bug_fix.o \
		src/self_spy_exploit_fix.o \
		src/invisible_mcv_exploit_fix.o \
		src/blowfish_dll_disable_option.o \
		src/movie_playback_disable_option.o \
		src/disable_wol_menu.o \
		src/multi-engineer_enhancements.o \
		src/win8_compat-func.o \
		src/win8_compat.o \
		src/spawner/selectable_countries.o \
		src/spawner/selectable_handicaps.o \
		src/spawner/selectable_colors.o \
		src/spawner/selectable_spawns.o \
		src/spawner/coop.o \
		src/spawner/predetermined_alliances.o \
		src/spawner/spectators.o \
		src/spawner/spawn_ini.o \
		src/spawner/spawner.o \
		../shared/src/nethack.o

ifdef ANTICHEAT
	PATCH_OBJS +=	src/anticheat/rename.o \
			src/anticheat/radar_hack.o \
			src/anticheat/fog_hack.o \
			src/anticheat/sidebar_hack.o \
			src/anticheat/building_hack.o \
			src/anticheat/auto_ss.o \
			src/anticheat/frame_func.o \
			src/anticheat/spawner_files.o \
			src/anticheat/guard_command_exploit.o
endif


LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		$(PATCH_OBJS) \
		res/res.o \
		\
		sym.o

PURE_OBJS   = sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = callsites.o \
		\
		$(PATCH_OBJS) \
		../shared/src/ares.o \
		\
		sym.o

.PHONY: default
default: $(GAME).exe $(GAME).dll

$(GAME).exe: .dump-.patch-.import-.vsize-.$(GAME).exe
	$(CP) $< $@

pure-$(GAME).exe: .dump-.import-.vsize-.pure-$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@



include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
