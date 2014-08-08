.PHONY: all
all: ra2/ra2.exe ra2/ra2.dll ts/ts.exe ts/ts.dll

ra2/%:
	$(MAKE) -C ra2 $*

ts/%:
	$(MAKE) -C ts  $*

.PHONY: clean
clean:
	$(MAKE) -C ts clean
	$(MAKE) -C ra2 clean
