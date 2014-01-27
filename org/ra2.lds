/* GNU ld linker script for ra2.exe */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { org/ra2.dat(.text) }
    .rdata     0x7E1000        : { org/ra2.dat(.rdata) }
    .data      0x812000        : { org/ra2.dat(.data) }

    /DISCARD/                  : { org/ra2.dat(.rsrc) }
    /DISCARD/                  : { *(.drectve) }

    .p_text    0xB7A000        : { *(.text) }
    .p_rdata   ALIGN(0x1000)   : { *(.rdata) }
    .p_data    ALIGN(0x1000)   : { *(.data) *(.bss); }

    .rsrc      ALIGN(0x1000)   : { *(.rsrc) }

    .patch     ALIGN(0x1000)   : { *(.patch) }
}
