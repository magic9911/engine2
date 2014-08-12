/* GNU ld linker script for ra2.exe */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { bin.dat(.text) }
    .rdata     0x7E1000        : { bin.dat(.rdata) }
    .data      0x812000        : { bin.dat(.data) }

    /DISCARD/                  : { bin.dat(.rsrc) }
    /DISCARD/                  : { *(.drectve) }

    .p_text    0xB7A000        : { *(.text) }
    .p_rdata   ALIGN(0x1000)   : { *(.rdata) }
    .p_data    ALIGN(0x1000)   : { *(.data) *(.bss) *(COMMON) }

    .rsrc      ALIGN(0x1000)   : { *(.rsrc) }

    .patch     ALIGN(0x1000)   : { *(.patch) }
}
