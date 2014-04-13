# This config should make all the tweaks nessisary to build on linux

WINDRES     = i686-w64-mingw32-windres
LD          = i686-w64-mingw32-ld

# should be tools repo
PETOOL      = ../petool/petool$(EXT)

# needed because config gets included first
build_both_games: default

$(PETOOL):
	$(MAKE) -C $(dir $(PETOOL)) EXT=$(EXT)

distclean: clean
	$(MAKE) -C $(dir $(PETOOL)) EXT=$(EXT) clean

.PHONY: build_both_games clean_tools
