/* GNU ld linker script for Game.dat */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        :   { game.dat(.text) }
    .rdata     0x6CA000        :   { game.dat(.rdata) }
    .data      0x6EE000        :   { game.dat(.data); }
    /DISCARD/                  :   { game.dat(.rsrc) }
    .hp_code   0x869000        :   { game.dat(.hp_code) }
    .hp_data   0xA69000        :   { game.dat(.hp_data) }
    .hp_var    0xA89000        :   { game.dat(.hp_data) }

    .p_text    ALIGN(0x1000)   :   { *(.text); }
    .p_rdata   ALIGN(0x1000)   :   { *(.rdata); }
    .p_var     ALIGN(0x1000)   :   { *(.bss); }

    .rsrc      ALIGN(0x1000)   :   { *(.rsrc) }

    .patch     ALIGN(0x1000)   :   { *(.patch) }
}
