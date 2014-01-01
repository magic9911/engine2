/* GNU ld linker script for Game.dat */
start = 0x6B7E21;
ENTRY(start);

SECTIONS
{
    .text      0x401000        :   { game.dat(.text) }
    .rdata     0x6CA000        :   { game.dat(.rdata) }
    .data      0x6EE000        :   { game.dat(.data); }
    /DISCARD/                  :   { game.dat(.rsrc) }

    .hp_code   0x869000        :   { sodoff.o(.text);  . = 0x200000; }
    .hp_data   0xA69000        :   { sodoff.o(.rdata); . = 0x100000; }
    .hp_var    0xB69000        :   { sodoff.o(.bss);   . = 0x8000; }

    .rsrc      0xB71000        :   { gameres.o(.rsrc) }

    .patch     ALIGN(0x1000)   :   { *.o(.patch) }
}
