/* GNU ld linker script for ra2.exe */

ENTRY(_start);

SECTIONS
{
    .text           0x401000   : { org/ra2.dat(.text) }
    .rdata          0x7E1000   : { org/ra2.dat(.rdata) }
    .data           0x812000   : { org/ra2.dat(.data) }
    .rsrc           0xB7A000   : { org/ra2.dat(.rsrc) }

    .p_text     ALIGN(0x1000)  : { *(.text) }
    .p_rdata    ALIGN(0x1000)  : { *(.rdata) }
    .p_bss      ALIGN(0x1000)  : { *(.bss) }

    .patch      ALIGN(0x1000)  : { *(.patch) }
}
