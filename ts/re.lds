/* GNU ld linker script for ts.dat */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { *(.text) }
    .rdata     0x6CA000        : { bin.dat(.rdata) }
    .data      0x6EE000        : { bin.dat(.data) }
    .rsrc      0x869000        : { *(.rsrc) }
}
