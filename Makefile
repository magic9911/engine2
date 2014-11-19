.PHONY: all
all: yr/yr.exe yr/yr.dll ts/ts.exe ts/ts.dll

ra2/%:
	$(MAKE) -C yr $*

ts/%:
	$(MAKE) -C ts  $*

.PHONY: clean
clean:
	$(MAKE) -C ts clean
	$(MAKE) -C yr clean
