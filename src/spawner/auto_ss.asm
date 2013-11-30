@JMP 0x00509383 _Main_Loop_Auto_SS

; TODO NEED TO CHECK FOR SESSION == 3 AND SPAWNER ACTIVE

_Main_Loop_Auto_SS:
    mov edx, 0
    mov ebx, 255
    mov eax, [0x007E4924] ; Frame
    
    idiv ebx
    
    cmp dx, 1
    jnz .Ret

    call 0x004EAB00 ; screen capture
    
.Ret:
    call 0x005094A0; Sync_Delay(void)
    jmp 0x00509388