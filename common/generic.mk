# Generic patch project master Makefile

REV         ?= UNKNOWN_VERSION

CP          ?= copy
RM          ?= rm -f
CC          ?= gcc
CXX         ?= clang++
STRIP       ?= strip
WINDRES     ?= windres
NASM        ?= nasm
PETOOL      ?= petool

REVFLAG     ?= -DREV=\"$(REV)\"

CC_COMMON   ?= $(REVFLAG) $(INCLUDES) -m32 -Wall -Wextra

ifdef DEBUG
CC_COMMON   += -g
else
CC_COMMON   += -O3
endif

CFLAGS      ?= $(CC_COMMON) -std=gnu99 -masm=intel
CXXFLAGS    ?= $(CC_COMMON) -std=gnu++98 -target i686-pc-win32 -mllvm --x86-asm-syntax=intel
WFLAGS      ?= $(REVFLAG)
NFLAGS      ?= $(REVFLAG) $(INCLUDES) -f elf
LD_COMMON   ?= $(CFLAGS) \
		-Wl,-mi386pe \
		-Wl,--enable-stdcall-fixup \
		-Wl,--allow-multiple-definition \
		-Wl,--subsystem=windows

LDFLAGS     ?= $(LD_COMMON) -Wl,--file-alignment=$(ALIGNMENT) -nostdlib
DLL_LDFLAGS ?= $(LD_COMMON) -s -shared -Wl,--strip-all -Wl,--exclude-all-symbols

.$(GAME).exe: $(LSCRIPT) $(INBIN) $(OBJS)
	$(CC) -T $< $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.pure-$(GAME).exe: $(LSCRIPT) $(INBIN) $(PURE_OBJS)
	$(CC) -T $< $(LDFLAGS) -o $@ $(PURE_OBJS)

.re-$(GAME).exe: re.lds $(RE_OBJS)
	$(CC) -T $< $(LDFLAGS) -o $@ $(RE_OBJS)

.$(GAME).dll: $(DLL_OBJS)
	$(CC) $(DLL_LDFLAGS) -o $@ $(DLL_OBJS) $(DLL_LIBS)

.import-%: %
	$(CP) $< $@
	$(PETOOL) setdd $@ $(IMPORT)

.vsize-%: %
	$(CP) $< $@
	$(PETOOL) setvs $@ $(VSIZE)

.patch-%: %
	$(CP) $< $@
	-$(PETOOL) patch $@

.strip-%: %
	$(CP) $< $@
	$(STRIP) -R .patch $@

.dump-%: %
	$(CP) $< $@
	$(PETOOL) dump $@


re/%.dump: .pure-$(GAME).exe
	mkdir -p re
	objdump -D --no-show-raw-insn -M intel_nmemonic -z -j .$* $< > $@

%.asm: %.dump
	sed -r $< \
		-e '1,3d' \
		-e '4s;^;___ImageBase equ 0x00401000;' \
		-e 's|^[^:]*: *||' \
		\
		-e 's|([0-9a-z]*) *<(.*)>$$|(\2) ;RAW: \1|' \
		-e 's_(.s:)\[_[\1_g' \
		\
		-e 's_(BYTE|WORD|DWORD|QWORD) PTR_\1_g' \
		\
		-e 's_lods BYTE_lodsb_' \
		-e 's_lods WORD_lodsw_' \
		-e 's_lods DWORD_lodsd_' \
		\
		-e 's_movs BYTE_movsb_' \
		-e 's_movs WORD_movsw_' \
		-e 's_movs DWORD_movsd_' \
		\
		-e 's_stos BYTE_stosb_' \
		-e 's_stos WORD_stosw_' \
		-e 's_stos DWORD_stosd_' \
		\
		-e 's_scas BYTE_scasb_' \
		-e 's_scas WORD_scasw_' \
		-e 's_scas DWORD_scasd_' \
		\
		-e 's_cmps BYTE_cmpsb_' \
		-e 's_cmps WORD_cmpsw_' \
		-e 's_cmps DWORD_cmpsd_' \
		\
		-e 's_ins BYTE_insb_' \
		-e 's_ins WORD_insw_' \
		-e 's_ins DWORD_insd_' \
		\
		-e 's_outs BYTE_outsb_' \
		-e 's_outs WORD_outsw_' \
		-e 's_outs DWORD_outsd_' \
		\
		> $@

%.o: %.cpp
	$(CXX)  $(CXXFLAGS) -c -o $@ $<

%.o: %.c
	$(CC)   $(CFLAGS)   -c -o $@ $<

%.o: %.asm
	$(NASM) $(NFLAGS)      -o $@ $<

%.o: %.rc
	$(WINDRES) $(WFLAGS) $< $@

.PHONY: clean
clean:
	$(RM) *.exe *.dll $(OBJS) $(DLL_OBJS)
