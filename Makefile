.PHONY: all
all: yr/yr.exe yr/yr.dll ts/ts.exe ts/ts.dll

.PHONY: pure
pure: yr/pure-yr.exe ts/pure-ts.exe

yr/%:
	$(MAKE) -C yr $*

ts/%:
	$(MAKE) -C ts  $*

.PHONY: clean
clean:
	$(MAKE) -C ts clean
	$(MAKE) -C yr clean
