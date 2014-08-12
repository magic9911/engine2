/* GNU ld linker script for ra2.exe */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        : { *(.text) }
    .rdata     0x7E1000        : { bin.dat(.rdata) }
    .data      0x812000        : { bin.dat(.data) }
    .rsrc      0xB7A000        : { *(.rsrc) }
}
