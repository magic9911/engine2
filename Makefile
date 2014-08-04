PROGRAMS        = ts ra2

shared_OBJS     = $(foreach o,,$(BUILD_DIR)/shared_$(o).o)
shared_DLLOBJS  = $(foreach o,ares,$(BUILD_DIR)/shared_$(o).o)

ts_IMPR         = 1 0x2EC050 280
ts_VSIZ         = 0x17AF74
ts_OBJS         = $(foreach o,callsites res sym,$(BUILD_DIR)/ts_$(o).o) $(shared_OBJS)
ts_DLLOBJS      = $(foreach o,callsites sym,$(BUILD_DIR)/ts_$(o).o) $(shared_DLLOBJS)

ra2_IMPR        = 1 0x40f0E0 320
ra2_VSIZ        = 0x367BE4
ra2_OBJS        = $(foreach o,callsites main res sym,$(BUILD_DIR)/ra2_$(o).o) $(shared_OBJS)
ra2_DLLOBJS     = $(foreach o,callsites main sym,$(BUILD_DIR)/ra2_$(o).o) $(shared_DLLOBJS)

-include config.mk
include generic.mk
