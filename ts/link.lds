/* GNU ld linker script for ts.dat */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { ts/bin.dat(.text) }
    .rdata     0x6CA000        : { ts/bin.dat(.rdata) }
    .data      0x6EE000        : { ts/bin.dat(.data); }

    /DISCARD/                  : { ts/bin.dat(.rsrc) }
    /DISCARD/                  : { *(.drectve) }

    .hp_text   0x869000        : { *(.text);  . = 0x200000; } =0x90
    .hp_rdata  ALIGN(0x1000)   : { *(.rdata); . = 0x100000; } =0x00
    .hp_data   ALIGN(0x1000)   : { *(.data) *(.bss); . = 0x100000; } =0x00

    .rsrc      ALIGN(0x1000)   : { *(.rsrc) }

    .patch     ALIGN(0x1000)   : { *(.patch) }
}
