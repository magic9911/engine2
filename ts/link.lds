/* GNU ld linker script for ts.dat */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { bin.dat(.text) }
    .rdata     0x6CA000        : { bin.dat(.rdata) }
    .data      0x6EE000        : { bin.dat(.data); }

    .hp_code   0x869000        : { bin.dat(.hp_code) }
    .hp_data   0xA69000        : { bin.dat(.hp_data) }
    .hp_var    0xA89000        : { bin.dat(.hp_var) }

    /DISCARD/                  : { bin.dat(.rsrc) }
    /DISCARD/                  : { *(.drectve) }

    .p_text    ALIGN(0x1000)   : { *(.text) }
    .p_rdata   ALIGN(0x1000)   : { *(.rdata) }
    .p_data    ALIGN(0x1000)   : { *(.data) *(.bss) *(COMMON) }

    .rsrc      ALIGN(0x1000)   : { *(.rsrc) }

    .patch     ALIGN(0x1000)   : { *(.patch) }
}
