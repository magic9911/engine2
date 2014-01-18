/* GNU ld linker script for Game.dat */

ENTRY(_start);

SECTIONS
{
    .text      0x401000        :   { org/game.dat(.text) }
    .rdata     0x6CA000        :   { org/game.dat(.rdata) }
    .data      0x6EE000        :   { org/game.dat(.data); }

    .hp_code   0x869000        :   { org/game.dat(.hp_code) }
    .hp_data   0xA69000        :   { org/game.dat(.hp_data) }
    .hp_var    0xA89000        :   { org/game.dat(.hp_var) }

    /DISCARD/                  :   { org/game.dat(.rsrc) }

    .p_text    ALIGN(0x1000)   :   { *(.text); }
    .p_rdata   ALIGN(0x1000)   :   { *(.rdata); }
    .p_bss     ALIGN(0x1000)   :   { *(.bss); }

    .rsrc      ALIGN(0x1000)   :   { *(.rsrc) }

    .patch     ALIGN(0x1000)   :   { *(.patch) }
}
