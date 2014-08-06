all: ra2/exe ra2/dll ts/exe ts/dll

ra2/%:
	$(MAKE) -C ra2 $*

ts/%:
	$(MAKE) -C ts  $*

.PHONY: clean
clean:
	$(MAKE) -C ts clean
	$(MAKE) -C ra2 clean
