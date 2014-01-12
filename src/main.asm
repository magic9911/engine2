%include "macros/proc.inc"

global WinMain@16

PROC WinMain@16
    push   ebp
    mov    ebp, esp
    push   0xffffffff
    push   0x7f3718
    push   0x7cc1d4
    mov    eax, [fs:0x0]
    push   eax
    mov    dword [fs:0x0], esp
    sub    esp, 0xe1c
    push   ebx
    push   esi
    push   edi
    mov    dword [ebp-0x18], esp
    mov    edi, dword [ebp+0x8]
    mov    dword [ds:0xb732f0], edi
    call   dword [ds:0x7e11d0]
    mov    [ds:0xb730e8], eax
    push   0x98
    push   0x67c
    push   0x840f5c
    call   0x4068e0
    push   0x4c
    push   0x67d
    push   0x840f5c
    call   0x4068e0
    push   0x4c
    push   0x67e
    push   0x840f5c
    call   0x4068e0
    push   0x13
    push   0x67f
    push   0x840f5c
    call   0x4068e0
    push   0xe18
    push   0x680
    push   0x840f5c
    call   0x4068e0
    push   0x6d8
    push   0x681
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0xe10
    push   0x682
    push   0x840f5c
    call   0x4068e0
    push   0x110
    push   0x683
    push   0x840f5c
    call   0x4068e0
    push   0x1c8
    push   0x684
    push   0x840f5c
    call   0x4068e0
    push   0x378
    push   0x685
    push   0x840f5c
    call   0x4068e0
    push   0x78
    push   0x686
    push   0x840f5c
    call   0x4068e0
    push   0x720
    push   0x687
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0x1798
    push   0x688
    push   0x840f5c
    call   0x4068e0
    push   0x160
    push   0x689
    push   0x840f5c
    call   0x4068e0
    push   0x2f8
    push   0x68a
    push   0x840f5c
    call   0x4068e0
    push   0x148
    push   0x68b
    push   0x840f5c
    call   0x4068e0
    push   0x74
    push   0x68c
    push   0x840f5c
    call   0x4068e0
    push   0x160b8
    push   0x68d
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0x1b0
    push   0x68e
    push   0x840f5c
    call   0x4068e0
    push   0x6f0
    push   0x68f
    push   0x840f5c
    call   0x4068e0
    push   0xed0
    push   0x690
    push   0x840f5c
    call   0x4068e0
    push   0x18
    push   0x691
    push   0x840f5c
    call   0x4068e0
    push   0x556c
    push   0x692
    push   0x840f5c
    call   0x4068e0
    push   0xe18
    push   0x693
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0xb0
    push   0x694
    push   0x840f5c
    call   0x4068e0
    push   0x2bc
    push   0x695
    push   0x840f5c
    call   0x4068e0
    push   0xb0
    push   0x696
    push   0x840f5c
    call   0x4068e0
    push   0x2a4
    push   0x697
    push   0x840f5c
    call   0x4068e0
    push   0xd4
    push   0x698
    push   0x840f5c
    call   0x4068e0
    push   0xa0
    push   0x699
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0xf8
    push   0x69a
    push   0x840f5c
    call   0x4068e0
    push   0xe0
    push   0x69b
    push   0x840f5c
    call   0x4068e0
    push   0x2bc
    push   0x69c
    push   0x840f5c
    call   0x4068e0
    push   0x48
    push   0x69d
    push   0x840f5c
    call   0x4068e0
    push   0xb4
    push   0x69e
    push   0x840f5c
    call   0x4068e0
    push   0xa4
    push   0x69f
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0x38
    push   0x6a0
    push   0x840f5c
    call   0x4068e0
    push   0x8e8
    push   0x6a1
    push   0x840f5c
    call   0x4068e0
    push   0xe78
    push   0x6a2
    push   0x840f5c
    call   0x4068e0
    push   0x3740
    push   0x6a3
    push   0x840f5c
    call   0x4068e0
    push   0x100
    push   0x6a4
    push   0x840f5c
    call   0x4068e0
    push   0x80
    push   0x6a5
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0x1b0
    push   0x6a6
    push   0x840f5c
    call   0x4068e0
    push   0x18c0
    push   0x6a7
    push   0x840f5c
    call   0x4068e0
    push   0x400
    push   0x6a8
    push   0x840f5c
    call   0x4068e0
    push   0x1
    push   0x6a9
    push   0x840f5c
    call   0x4068e0
    push   0x520
    push   0x6aa
    push   0x840f5c
    call   0x4068e0
    push   0xf0
    push   0x6ab
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0xd4
    push   0x6ac
    push   0x840f5c
    call   0x4068e0
    push   0x8
    push   0x6ad
    push   0x840f5c
    call   0x4068e0
    push   0x1c
    push   0x6ae
    push   0x840f5c
    call   0x4068e0
    push   0x4
    push   0x6af
    push   0x840f5c
    call   0x4068e0
    push   0x8
    push   0x6b0
    push   0x840f5c
    call   0x4068e0
    push   0x10
    push   0x6b1
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x48
    push   0x20
    push   0x6b2
    push   0x840f5c
    call   0x4068e0
    push   0x18
    push   0x6b3
    push   0x840f5c
    call   0x4068e0
    add    esp, 0x18
    call   0x49f5c0
    test   al, al
    jne    0x6bbe56
    push   0x840f3c
    call   0x4068e0
    add    esp, 0x4
    xor    eax, eax
    mov    ecx, dword [ebp-0x10]
    mov    dword [fs:0x0], ecx
    pop    edi
    pop    esi
    pop    ebx
    mov    esp, ebp
    pop    ebp
    ret    0x10
ENDPROC