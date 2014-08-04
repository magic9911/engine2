PROGRAMS        = ts ra2

shared_LIBS     = $(foreach l,,-l$(o))
shared_DLL_LIBS = $(foreach l,msvcrt,-l$(o))
shared_OBJS     = $(foreach o,,$(BUILD_DIR)/shared_$(o).o)
shared_DLL_OBJS = $(foreach o,ares,$(BUILD_DIR)/shared_$(o).o)

ts_IMPR         = 1 0x2EC050 280
ts_VSIZ         = 0x17AF74
ts_LIBS         = $(foreach l,,-l$(o)) $(shared_LIBS)
ts_DLL_LIBS     = $(foreach l,,-l$(o)) $(shared_DLL_LIBS)
ts_OBJS         = $(foreach o,callsites patch res sym,$(BUILD_DIR)/ts_$(o).o) $(shared_OBJS)
ts_DLL_OBJS     = $(foreach o,callsites patch sym,$(BUILD_DIR)/ts_$(o).o) $(shared_DLL_OBJS)

ra2_IMPR        = 1 0x40f0E0 320
ra2_VSIZ        = 0x367BE4
ra2_LIBS        = $(foreach l,,-l$(o)) $(shared_LIBS)
ra2_DLL_LIBS    = $(foreach l,,-l$(o)) $(shared_DLL_LIBS)
ra2_OBJS        = $(foreach o,callsites patch res sym,$(BUILD_DIR)/ra2_$(o).o) $(shared_OBJS)
ra2_DLL_OBJS    = $(foreach o,callsites patch sym,$(BUILD_DIR)/ra2_$(o).o) $(shared_DLL_OBJS)

-include config.mk
include generic.mk
