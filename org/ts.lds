/* GNU ld linker script for ts.dat */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { org/ts.dat(.text) }
    .rdata     0x6CA000        : { org/ts.dat(.rdata) }
    .data      0x6EE000        : { org/ts.dat(.data); }

    .hp_code   0x869000        : { org/ts.dat(.hp_code) }
    .hp_data   0xA69000        : { org/ts.dat(.hp_data) }
    .hp_var    0xA89000        : { org/ts.dat(.hp_var) }

    /DISCARD/                  : { org/ts.dat(.rsrc) }
    /DISCARD/                  : { *(.drectve) }

    .p_text    ALIGN(0x1000)   : { *(.text); }
    .p_rdata   ALIGN(0x1000)   : { *(.rdata); }
    .p_data    ALIGN(0x1000)   : { *(.data) *(.bss); }

    .rsrc      ALIGN(0x1000)   : { *(.rsrc) }

    .patch     ALIGN(0x1000)   : { *(.patch) }
}
