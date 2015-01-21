-include ../config.mk

GAME        = ts

LSCRIPT     = link.lds
INBIN       = bin.dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x2EC050 280


INCLUDES    = -Iinc/ -I../shared/inc/ -I../common/inc/

PATCH_OBJS  = src/loading.o \
		src/patch.o \
		\
		src/win8-fix-func.o \
		src/win8-fix.o \
		src/single-proc-affinity.o \
		\
		src/spawner.o \
		src/spawner/selectable_spawns.o \
		src/spawner/spectators.o \
		src/spawner/statistics.o \
		src/spawner/build_off_ally.o \
        src/spawner/tunnel.o \
        src/spawner/nethack.asm.o \
		\
		src/anticheat_test.o \
		\
		src/savegame.o \
		\
		src/fix_wce_errors.o \
		src/alt_scout_fix.o \
		src/fix_mouse_not_found_error.o \
		src/aircraft_passenger_fix.o \
		\
		src/display_messages_typed_by_yourself.o \
		src/multiplayer_units_placing.o \
		src/no_options_menu_animation.o \
		src/internet_cncnet.o \
		src/trigger_actions_extended.o \
		src/briefing_screen_mission_start.o \
		src/briefing_restate_map_file.o \
		src/reinforcements_player_specific.o \
		src/only_the_host_may_change_gamespeed.o \
		src/tiberium_stuff.o \
		src/no-cd-old.o \
		src/graphics_patch.o \

ifdef ANTICHEAT
	PATCH_OBJS +=
endif

FUNK_PATCH_OBJS = src/win8-fix-func.o \
		src/win8-fix.o \
		src/data.o \
		src/fix_mouse_not_found_error.o \
		src/graphics_patch.o \
		src/loading.o \
		src/no-cd-old.o \
		src/var.o \
		src/single-proc-affinity.o

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

$(GAME).exe: .dump-.patch-.import-.$(GAME).exe
	$(CP) $< $@

pure-$(GAME).exe: .dump-.import-.pure-$(GAME).exe
	$(CP) $< $@

$(GAME).dll: .dump-.$(GAME).dll
	$(CP) $< $@



include ../common/generic.mk

WFLAGS	   += -Ires/ -I../shared/res/ -I../common/res/
