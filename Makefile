.PHONY: all
all: ra2yr/ra2yr.exe ra2yr/ra2yr.dll \
     ts/ts.exe       ts/ts.dll

.PHONY: pure
pure: ra2yr/pure-ra2yr.exe ts/pure-ts.exe

.PHONY: re
re: ra2yr/re-ra2yr.exe ts/re-ts.exe

.PHONY: check
check: pure
	diff ra2yr/pure-ra2yr.exe ra2yr/re-ra2yr.exe
	diff ts/pure-ts.exe       ts/re-ts.exe

ra2yr/%:
	$(MAKE) -C ra2yr $*

ts/%:
	$(MAKE) -C ts  $*

.PHONY: clean
clean:
	$(MAKE) -C ts clean
	$(MAKE) -C ra2yr clean
