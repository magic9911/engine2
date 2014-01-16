/* GNU ld linker script for gamemd.exe */
ENTRY(_start);
SECTIONS
{
    .text           0x401000   : { org/gamemd.dat(.text) }
    .rdata          0x7E1000   : { org/gamemd.dat(.rdata) }
    .data           0x812000   : { org/gamemd.dat(.data) }
    .rsrc           0xB7A000   : { org/gamemd.dat(.rsrc) }
    .p_text     ALIGN(0x1000)  : { *(.text) }
    .p_rdata    ALIGN(0x1000)  : { *(.rdata) }
    .p_bss      ALIGN(0x1000)  : { *(.bss) }
    .patch      ALIGN(0x1000)  : { *(.patch) }
}
