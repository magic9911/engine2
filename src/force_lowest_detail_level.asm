; Workaround for WaveClass laser crash errors by forcing detail level to the lowest

@JMP 0x00589D21 _Read_Game_Options_Force_Lowest_Detail_Level

_Read_Game_Options_Force_Lowest_Detail_Level:
    mov eax, 0

    jmp 0x00589D31