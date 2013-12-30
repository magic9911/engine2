/* GNU ld linker script for gamemd.exe */
ENTRY(_start);
SECTIONS
{
    .text           0x401000   : { gamemd.dat(.text) }
    .rdata          0x7E1000   : { gamemd.dat(.rdata) }
    .data           0x812000   : { gamemd.dat(.data) }
    .rsrc           0xB7A000   : { gamemd.dat(.rsrc) }
    .p_text     ALIGN(0x1000)  : { patch.o(.text) }
    .p_rdata    ALIGN(0x1000)  : { patch.o(.rdata) }
    .p_bss      ALIGN(0x1000)  : { patch.o(.bss) }
    .patch      ALIGN(0x1000)  : { patch.o(.patch) }
}
