/* GNU ld linker script for ra2.exe */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { bin.dat(.text) }
    .rdata     0x7E1000        : { bin.dat(.rdata) }
    .data      0x812000        : { bin.dat(.data); . = ALIGN(0x1000); }
    .bss       ALIGN(0x1000)   : { . = 0x2FBBE4; }

    /DISCARD/                  : { bin.dat(.rsrc) }
    /DISCARD/                  : { *(.drectve) }

    .p_text    ALIGN(0x1000)   : { *(.text) }
    .p_rdata   ALIGN(0x1000)   : { *(.rdata) }
    .p_data    ALIGN(0x1000)   : { *(.data) }
    .p_bss     ALIGN(0x1000)   : { *(.bss) *(COMMON) }

    .rsrc      ALIGN(0x1000)   : { *(.rsrc) }

    .patch     ALIGN(0x1000)   : { *(.patch) }
}
