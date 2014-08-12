.PHONY: all
all: ra2yr/ra2yr.exe ra2yr/ra2yr.dll ts/ts.exe ts/ts.dll

ra2yr/%:
	$(MAKE) -C ra2yr $*

ts/%:
	$(MAKE) -C ts  $*

.PHONY: clean
clean:
	$(MAKE) -C ts clean
	$(MAKE) -C ra2yr clean
