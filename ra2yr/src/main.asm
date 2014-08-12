%include "macros/proc.inc"

%include "WWDebug.inc"

global _WinMain@16

PROC _WinMain@16
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
    call_WWDebug_Printf 0x840f5c, 0x67c, 0x98
    call_WWDebug_Printf 0x840f5c, 0x67d, 0x4c
    call_WWDebug_Printf 0x840f5c, 0x67e, 0x4c
    call_WWDebug_Printf 0x840f5c, 0x67f, 0x13
    call_WWDebug_Printf 0x840f5c, 0x680, 0xe18
    call_WWDebug_Printf 0x840f5c, 0x681, 0x6d8
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x682, 0xe10
    call_WWDebug_Printf 0x840f5c, 0x683, 0x110
    call_WWDebug_Printf 0x840f5c, 0x684, 0x1c8
    call_WWDebug_Printf 0x840f5c, 0x685, 0x378
    call_WWDebug_Printf 0x840f5c, 0x686, 0x78
    call_WWDebug_Printf 0x840f5c, 0x687, 0x720
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x688, 0x1798
    call_WWDebug_Printf 0x840f5c, 0x689, 0x160
    call_WWDebug_Printf 0x840f5c, 0x68a, 0x2f8
    call_WWDebug_Printf 0x840f5c, 0x68b, 0x148
    call_WWDebug_Printf 0x840f5c, 0x68c, 0x74
    call_WWDebug_Printf 0x840f5c, 0x68d, 0x160b8
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x68e, 0x1b0
    call_WWDebug_Printf 0x840f5c, 0x68f, 0x6f0
    call_WWDebug_Printf 0x840f5c, 0x690, 0xed0
    call_WWDebug_Printf 0x840f5c, 0x691, 0x18
    call_WWDebug_Printf 0x840f5c, 0x692, 0x556c
    call_WWDebug_Printf 0x840f5c, 0x693, 0xe18
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x694, 0xb0
    call_WWDebug_Printf 0x840f5c, 0x695, 0x2bc
    call_WWDebug_Printf 0x840f5c, 0x696, 0xb0
    call_WWDebug_Printf 0x840f5c, 0x697, 0x2a4
    call_WWDebug_Printf 0x840f5c, 0x698, 0xd4
    call_WWDebug_Printf 0x840f5c, 0x699, 0xa0
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x69a, 0xf8
    call_WWDebug_Printf 0x840f5c, 0x69b, 0xe0
    call_WWDebug_Printf 0x840f5c, 0x69c, 0x2bc
    call_WWDebug_Printf 0x840f5c, 0x69d, 0x48
    call_WWDebug_Printf 0x840f5c, 0x69e, 0xb4
    call_WWDebug_Printf 0x840f5c, 0x69f, 0xa4
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x6a0, 0x38
    call_WWDebug_Printf 0x840f5c, 0x6a1, 0x8e8
    call_WWDebug_Printf 0x840f5c, 0x6a2, 0xe78
    call_WWDebug_Printf 0x840f5c, 0x6a3, 0x3740
    call_WWDebug_Printf 0x840f5c, 0x6a4, 0x100
    call_WWDebug_Printf 0x840f5c, 0x6a5, 0x80
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x6a6, 0x1b0
    call_WWDebug_Printf 0x840f5c, 0x6a7, 0x18c0
    call_WWDebug_Printf 0x840f5c, 0x6a8, 0x400
    call_WWDebug_Printf 0x840f5c, 0x6a9, 0x1
    call_WWDebug_Printf 0x840f5c, 0x6aa, 0x520
    call_WWDebug_Printf 0x840f5c, 0x6ab, 0xf0
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x6ac, 0xd4
    call_WWDebug_Printf 0x840f5c, 0x6ad, 0x8
    call_WWDebug_Printf 0x840f5c, 0x6ae, 0x1c
    call_WWDebug_Printf 0x840f5c, 0x6af, 0x4
    call_WWDebug_Printf 0x840f5c, 0x6b0, 0x8
    call_WWDebug_Printf 0x840f5c, 0x6b1, 0x10
    add    esp, 0x48
    call_WWDebug_Printf 0x840f5c, 0x6b2, 0x20
    call_WWDebug_Printf 0x840f5c, 0x6b3, 0x18
    add    esp, 0x18
    call   0x49f5c0
    test   al, al
    jne    0x6bbe56
    call_WWDebug_Printf 0x840f3c
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
    push   0x840f14
    push   0x0
    push   0x0
    call   dword [ds:0x7e1248]
    mov    [ds:0xb0bce4], eax
    call   dword [ds:0x7e1200]
    cmp    eax, 0xb7
    jne    0x6bbed6
    push   0x0
    push   0x840f14
    call   dword [ds:0x7e1448]
    mov    esi, eax
    test   esi, esi
    je     0x6bbe9a
    push   esi
    call   dword [ds:0x7e14d0]
    push   0x9
    push   esi
    call   dword [ds:0x7e1498]
    mov    eax, [ds:0xb0bce4]
    test   eax, eax
    je     0x6bbeb4
    push   eax
    call   dword [ds:0x7e11e0]
    mov    dword [ds:0xb0bce4], 0x0

    call_WWDebug_Printf 0x840ef0
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
    call_WWDebug_Printf 0x840ed8
    add    esp, 0x4
    mov    esi, dword [ds:0x7e11e0]
    mov    ebx, dword [ds:0x7e114c]
    push   0x840eb0
    push   0x0
    push   0x1f0001
    call   ebx
    mov    [ds:0xb0bce8], eax
    test   eax, eax
    je     0x6bbf49
    call_WWDebug_Printf 0x840e90
    add    esp, 0x4
    push   0x7530
    mov    eax, [ds:0xb0bce8]
    push   eax
    call   dword [ds:0x7e11dc]
    cmp    eax, 0xffffffff
    jne    0x6bbf49
    call_WWDebug_Printf 0x840e6c
    add    esp, 0x4
    mov    ecx, dword [ds:0xb0bce8]
    push   ecx
    call   esi
    mov    dword [ds:0xb0bce8], 0x0

    mov    eax, [ds:0xb0bce8]
    test   eax, eax
    jne    0x6bbfad
    push   0x840eb0
    push   0x0
    push   0x0
    call   dword [ds:0x7e1248]
    mov    [ds:0xb0bce8], eax
    call   dword [ds:0x7e1200]
    cmp    eax, 0xb7
    jne    0x6bbf93
    mov    edx, dword [ds:0xb0bce8]
    push   edx
    call   esi
    mov    dword [ds:0xb0bce8], 0x0

    push   0x9c4
    call   dword [ds:0x7e11f0]
    jmp    0x6bbfa0
    call_WWDebug_Printf 0x840e54
    add    esp, 0x4
    mov    eax, [ds:0xb0bce8]
    test   eax, eax
    je     0x6bbeef
    call_WWDebug_Printf 0x840e38
    push   0x300
    push   0x300
    call   0x7cbf49
    add    esp, 0xc
    call   0x7c5ee4
    push   0x84
    lea    eax, [ebp-0x5f8]
    push   eax
    push   edi
    call   dword [ds:0x7e11a8]
    mov    ebx, 0x1
    mov    edi, ebx
    mov    dword [ebp-0x1c], edi
    lea    ecx, [ebp-0x5f8]
    mov    dword [ebp-0x174], ecx
    push   0x830a14
    mov    edx, dword [ebp+0x10]
    push   edx
    call   0x7c9cc2
    add    esp, 0x8
    lea    esi, [ebp-0x170]
    test   eax, eax
    je     0x6bc033
    mov    ecx, eax
    call   0x727cf0
    mov    dword [esi], eax
    inc    edi
    add    esi, 0x4
    push   0x830a14
    push   0x0
    call   0x7c9cc2
    add    esp, 0x8
    cmp    edi, 0x14
    jl     0x6bc00e
    mov    dword [ebp-0x1c], edi
    push   0x0
    push   0x0
    lea    eax, [ebp-0x6fc]
    push   eax
    lea    ecx, [ebp-0x700]
    push   ecx
    mov    edx, dword [ebp-0x174]
    push   edx
    call   0x7cb673
    push   0x0
    push   0x0
    lea    eax, [ebp-0x6fc]
    push   eax
    lea    ecx, [ebp-0x700]
    push   ecx
    lea    edx, [ebp-0x120]
    push   edx
    call   0x7c9ff0
    add    esp, 0x28
    lea    eax, [ebp-0x120]
    push   eax
    call   dword [ds:0x7e1148]
    mov    esi, ebx
    lea    edx, [ebp-0x174]
    mov    ecx, edi
    call   0x52f620
    test   al, al
    je     0x6be0eb
    push   0x24
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc0b5
    push   0x826444
    mov    ecx, eax
    call   0x65ca80
    jmp    0x6bc0b7
    xor    eax, eax
    mov    dword [ebp-0x70c], eax
    push   0x0
    push   0x0
    push   eax
    mov    ecx, 0x8870c0
    call   0x4741f0
    push   ebx
    push   0x840e28
    push   0x833160
    mov    ecx, 0x8870c0
    call   0x5295f0
    mov    [ds:0x840a6c], al
    push   0x0
    push   0x8330dc
    push   0x833160
    mov    ecx, 0x8870c0
    call   0x5295f0
    mov    [ds:0xa8ed63], al
    mov    ecx, dword [ds:0xa8eb84]
    push   ecx
    push   0x833168
    push   0x833160
    mov    ecx, 0x8870c0
    call   0x5276d0
    mov    [ds:0xa8eb84], eax
    mov    edx, dword [ds:0xa8eb88]
    push   edx
    push   0x833150
    push   0x833160
    mov    ecx, 0x8870c0
    call   0x5276d0
    mov    [ds:0xa8eb88], eax
    push   0x0
    push   0x83301c
    push   0x833060
    mov    ecx, 0x8870c0
    call   0x5276d0
    test   eax, eax
    jle    0x6bc179
    add    eax, 0x4000
    cmp    eax, 0x4000
    jl     0x6bc179
    cmp    eax, 0x8000
    jge    0x6bc179
    push   eax
    mov    ecx, 0xa8e9c0
    call   0x542430
    mov    ecx, 0x80
    xor    eax, eax
    lea    edi, [ebp-0x9f8]
    rep stosd; dword [es:edi], eax
    push   0x200
    lea    eax, [ebp-0x9f8]
    push   eax
    push   0x0
    push   0x83300c
    push   0x833060
    mov    ecx, 0x8870c0
    call   0x528a10
    test   eax, eax
    setne  al
    test   al, al
    je     0x6bc28e
    lea    ecx, [ebp-0x9f8]
    test   ecx, ecx
    je     0x6bc28e
    lea    edi, [ebp-0x9f8]
    or     ecx, 0xffffffff
    xor    eax, eax
    repnz scasb ;al, byte [es:edi]
    not    ecx
    dec    ecx
    je     0x6bc28e
    xor    esi, esi
    push   0x826598
    lea    edx, [ebp-0x9f8]
    push   edx
    call   0x7c9cc2
    add    esp, 0x8
    test   eax, eax
    je     0x6bc23f
    lea    ecx, [ebp-0xa14]
    push   ecx
    push   0x825bd4
    push   eax
    call   0x7ca530
    add    esp, 0xc
    cmp    esi, 0x4
    jge    0x6bc21e
    mov    dl, byte [ebp-0xa14]
    mov    byte [ebp+esi*1-0xa10], dl
    jmp    0x6bc22b
    mov    al, byte [ebp-0xa14]
    mov    byte [ebp+esi*1-0xa10], al
    inc    esi
    push   0x826598
    push   0x0
    call   0x7c9cc2
    add    esp, 0x8
    test   eax, eax
    jne    0x6bc1f5
    cmp    esi, 0x4
    jl     0x6bc28e
    mov    dword [ds:0xa8d5fc], ebx
    or     ecx, 0xffffffff
    mov    dword [ebp-0xa0c], ecx
    mov    word [ebp-0xa08], cx
    push   0x0
    lea    edx, [ebp-0xa0c]
    push   edx
    lea    eax, [ebp-0xa10]
    push   eax
    lea    ecx, [ebp-0xa24]
    call   0x53ece0
    mov    ecx, dword [eax]
    mov    dword [ds:0xa8d600], ecx
    mov    edx, dword [eax+0x4]
    mov    dword [ds:0xa8d604], edx
    mov    eax, dword [eax+0x8]
    mov    [ds:0xa8d608], eax
    push   0x320
    call   0x7c8e17
    add    esp, 0x4
    mov    esi, eax
    test   esi, esi
    je     0x6bc2b6
    mov    ecx, esi
    call   0x54ee60
    mov    dword [esi+0x31c], ebx
    mov    dword [ds:0x87f770], esi
    jmp    0x6bc2c0
    mov    dword [ds:0x87f770], 0x0

    call   0x48dd50
    cmp    eax, 0x2000
    jae    0x6bc33a
    push   0x0
    push   0x78b
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840df8
    call   0x734e60
    push   eax
    lea    ecx, [ebp-0x574]
    push   ecx
    call   0x7ca564
    add    esp, 0xc
    push   0x24
    push   0x78c
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    lea    edx, [ebp-0x574]
    xor    ecx, ecx
    call   0x734fe0
    cmp    eax, 0x7
    jne    0x6bc33a
    call   dword [ds:0x7e15d0]
    mov    eax, ebx
    mov    ecx, dword [ebp-0x10]
    mov    dword [fs:0x0], ecx
    pop    edi
    pop    esi
    pop    ebx
    mov    esp, ebp
    pop    ebp
    ret    0x10
    push   0x0
    call   dword [ds:0x7e15d4]
    mov    esi, 0x7f3710
    mov    ebx, dword [ds:0x7e1220]
    mov    dword [ebp-0xa3c], 0x0

    push   0x7
    push   0x0
    mov    edx, dword [esi]
    push   edx
    lea    ecx, [ebp-0xa3c]
    call   0x6bedb0
    test   eax, eax
    setl   al
    mov    byte [ebp-0xa2c], al
    test   al, al
    je     0x6bc3ca
    mov    byte [ebp-0xa2c], 0x0
    mov    eax, dword [esi+0x4]
    push   eax
    call   ebx
    mov    edi, eax
    test   edi, edi
    je     0x6bc3c3
    push   0x840de4
    push   edi
    call   dword [ds:0x7e1250]
    test   eax, eax
    je     0x6bc3b3
    call   eax
    push   0x7
    push   0x0
    mov    ecx, dword [esi]
    push   ecx
    lea    ecx, [ebp-0xa3c]
    call   0x6bedb0
    test   eax, eax
    jge    0x6bc3ba
    mov    byte [ebp-0xa2c], 0x1
    push   edi
    call   dword [ds:0x7e1224]
    jmp    0x6bc3ca
    mov    byte [ebp-0xa2c], 0x1
    mov    al, byte [ebp-0xa2c]
    test   al, al
    jne    0x6bc41a
    mov    eax, dword [ebp-0xa3c]
    test   eax, eax
    jne    0x6bc3ee
    push   0x80004003
    call   0x7dc720
    mov    eax, dword [ebp-0xa3c]
    mov    edx, dword [eax]
    push   eax
    call   dword [edx+0x8]
    mov    dword [ebp-0xa3c], 0x0

    lea    ecx, [ebp-0xa3c]
    call   0x6c61c0
    add    esi, 0x8
    cmp    esi, 0x7f3718
    jl     0x6bc34d
    jmp    0x6bc425
    lea    ecx, [ebp-0xa3c]
    call   0x6c61c0
    call   0x6bb390
    lea    eax, [ebp-0xa34]
    push   eax
    push   0x1
    push   0x1
    push   0xa8e8c8
    push   0x7e9520
    mov    esi, dword [ds:0x7e15d8]
    call   esi
    lea    ecx, [ebp-0xa34]
    push   ecx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc46f
    mov    ecx, eax
    call   0x6bee40
    jmp    0x6bc471
    xor    eax, eax
    lea    edx, [ebp-0xa34]
    push   edx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9540
    call   esi
    lea    eax, [ebp-0xa34]
    push   eax
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc4ac
    mov    ecx, eax
    call   0x6befc0
    jmp    0x6bc4ae
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9720
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc4e9
    mov    ecx, eax
    call   0x6bf140
    jmp    0x6bc4eb
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e95e0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc526
    mov    ecx, eax
    call   0x6bf2c0
    jmp    0x6bc528
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9740
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc563
    mov    ecx, eax
    call   0x6bf440
    jmp    0x6bc565
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9570
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc5a0
    mov    ecx, eax
    call   0x6bf5c0
    jmp    0x6bc5a2
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9580
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc5dd
    mov    ecx, eax
    call   0x6bf740
    jmp    0x6bc5df
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9950
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc61a
    mov    ecx, eax
    call   0x6bf8c0
    jmp    0x6bc61c
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9930
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc657
    mov    ecx, eax
    call   0x6bfa40
    jmp    0x6bc659
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9940
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc694
    mov    ecx, eax
    call   0x6bfbc0
    jmp    0x6bc696
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e98f0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc6d1
    mov    ecx, eax
    call   0x6bfd40
    jmp    0x6bc6d3
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9910
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc70e
    mov    ecx, eax
    call   0x6bfec0
    jmp    0x6bc710
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9920
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc74b
    mov    ecx, eax
    call   0x6c0040
    jmp    0x6bc74d
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9750
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc788
    mov    ecx, eax
    call   0x6c01c0
    jmp    0x6bc78a
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9900
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc7c5
    mov    ecx, eax
    call   0x6c0340
    jmp    0x6bc7c7
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9730
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc802
    mov    ecx, eax
    call   0x6c04c0
    jmp    0x6bc804
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9850
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc83f
    mov    ecx, eax
    call   0x6c0640
    jmp    0x6bc841
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e98d0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc87c
    mov    ecx, eax
    call   0x6c07c0
    jmp    0x6bc87e
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e98e0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc8b9
    mov    ecx, eax
    call   0x6c0940
    jmp    0x6bc8bb
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9860
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc8f6
    mov    ecx, eax
    call   0x6c0ac0
    jmp    0x6bc8f8
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9870
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc933
    mov    ecx, eax
    call   0x6c0c40
    jmp    0x6bc935
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9880
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc970
    mov    ecx, eax
    call   0x6c0dc0
    jmp    0x6bc972
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9890
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc9ad
    mov    ecx, eax
    call   0x6c0f40
    jmp    0x6bc9af
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e98a0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bc9ea
    mov    ecx, eax
    call   0x6c10c0
    jmp    0x6bc9ec
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e98b0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bca27
    mov    ecx, eax
    call   0x6c1240
    jmp    0x6bca29
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e98c0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bca64
    mov    ecx, eax
    call   0x6c13c0
    jmp    0x6bca66
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9810
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcaa1
    mov    ecx, eax
    call   0x6c1540
    jmp    0x6bcaa3
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9790
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcade
    mov    ecx, eax
    call   0x6c16c0
    jmp    0x6bcae0
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9650
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcb1b
    mov    ecx, eax
    call   0x6c1840
    jmp    0x6bcb1d
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9800
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcb58
    mov    ecx, eax
    call   0x6c19c0
    jmp    0x6bcb5a
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e97e0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcb95
    mov    ecx, eax
    call   0x6c1b40
    jmp    0x6bcb97
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e97f0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcbd2
    mov    ecx, eax
    call   0x6c1cc0
    jmp    0x6bcbd4
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e97a0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcc0f
    mov    ecx, eax
    call   0x6c1e40
    jmp    0x6bcc11
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e97b0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcc4c
    mov    ecx, eax
    call   0x6c1fc0
    jmp    0x6bcc4e
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e97c0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcc89
    mov    ecx, eax
    call   0x6c2140
    jmp    0x6bcc8b
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e97d0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bccc6
    mov    ecx, eax
    call   0x6c22c0
    jmp    0x6bccc8
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9760
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcd03
    mov    ecx, eax
    call   0x6c2440
    jmp    0x6bcd05
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9780
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcd40
    mov    ecx, eax
    call   0x6c25c0
    jmp    0x6bcd42
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9770
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcd7d
    mov    ecx, eax
    call   0x6c2740
    jmp    0x6bcd7f
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9590
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcdba
    mov    ecx, eax
    call   0x6c28c0
    jmp    0x6bcdbc
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e95c0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcdf7
    mov    ecx, eax
    call   0x6c2a40
    jmp    0x6bcdf9
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e95b0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bce34
    mov    ecx, eax
    call   0x6c2bc0
    jmp    0x6bce36
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e95a0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bce71
    mov    ecx, eax
    call   0x6c2d40
    jmp    0x6bce73
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e95d0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bceae
    mov    ecx, eax
    call   0x6c2ec0
    jmp    0x6bceb0
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e95f0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bceeb
    mov    ecx, eax
    call   0x6c3040
    jmp    0x6bceed
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9600
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcf28
    mov    ecx, eax
    call   0x6c31c0
    jmp    0x6bcf2a
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9610
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcf65
    mov    ecx, eax
    call   0x6c3340
    jmp    0x6bcf67
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e96f0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcfa2
    mov    ecx, eax
    call   0x6c34c0
    jmp    0x6bcfa4
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e96a0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bcfdf
    mov    ecx, eax
    call   0x6c3640
    jmp    0x6bcfe1
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9660
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd01c
    mov    ecx, eax
    call   0x6c37c0
    jmp    0x6bd01e
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9680
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd059
    mov    ecx, eax
    call   0x6c3940
    jmp    0x6bd05b
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9670
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd096
    mov    ecx, eax
    call   0x6c3ac0
    jmp    0x6bd098
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9620
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd0d3
    mov    ecx, eax
    call   0x6c3c40
    jmp    0x6bd0d5
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9630
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd110
    mov    ecx, eax
    call   0x6c3dc0
    jmp    0x6bd112
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9560
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd14d
    mov    ecx, eax
    call   0x6c3f40
    jmp    0x6bd14f
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a30
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd18a
    mov    ecx, eax
    call   0x6c40c0
    jmp    0x6bd18c
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9ac0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd1c7
    mov    ecx, eax
    call   0x6c4240
    jmp    0x6bd1c9
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a40
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd204
    mov    ecx, eax
    call   0x6c43c0
    jmp    0x6bd206
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9ad0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd241
    mov    ecx, eax
    call   0x6c4540
    jmp    0x6bd243
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a50
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd27e
    mov    ecx, eax
    call   0x6c46c0
    jmp    0x6bd280
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a60
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd2bb
    mov    ecx, eax
    call   0x6c4840
    jmp    0x6bd2bd
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a70
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd2f8
    mov    ecx, eax
    call   0x6c49c0
    jmp    0x6bd2fa
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a80
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd335
    mov    ecx, eax
    call   0x6c4b40
    jmp    0x6bd337
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9a90
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd372
    mov    ecx, eax
    call   0x6c4cc0
    jmp    0x6bd374
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9aa0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd3af
    mov    ecx, eax
    call   0x6c4e40
    jmp    0x6bd3b1
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9ab0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd3ec
    mov    ecx, eax
    call   0x6c4fc0
    jmp    0x6bd3ee
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e96e0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd429
    mov    ecx, eax
    call   0x6c5140
    jmp    0x6bd42b
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9820
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd466
    mov    ecx, eax
    call   0x6c52c0
    jmp    0x6bd468
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9840
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd4a3
    mov    ecx, eax
    call   0x6c5440
    jmp    0x6bd4a5
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9830
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd4e0
    mov    ecx, eax
    call   0x6c55c0
    jmp    0x6bd4e2
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9700
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd51d
    mov    ecx, eax
    call   0x6c5740
    jmp    0x6bd51f
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9710
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd55a
    mov    ecx, eax
    call   0x6c58c0
    jmp    0x6bd55c
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e96c0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd597
    mov    ecx, eax
    call   0x6c5a40
    jmp    0x6bd599
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e96d0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd5d4
    mov    ecx, eax
    call   0x6c5bc0
    jmp    0x6bd5d6
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9960
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd611
    mov    ecx, eax
    call   0x6c5d40
    jmp    0x6bd613
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9980
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd64e
    mov    ecx, eax
    call   0x6c5ec0
    jmp    0x6bd650
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e9990
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0x8
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd68b
    mov    ecx, eax
    call   0x6c6040
    jmp    0x6bd68d
    xor    eax, eax
    lea    ecx, [ebp-0xa34]
    push   ecx
    push   0x1
    push   0x1
    push   eax
    push   0x7e99a0
    call   esi
    lea    edx, [ebp-0xa34]
    push   edx
    mov    ecx, 0xb0bc88
    call   0x6c6400
    push   0xb0bcec
    push   0x1
    push   0x7e9520
    push   0x89a29c
    mov    ebx, dword [ds:0x7e1370]
    call   ebx
    mov    al, byte [ebp-0xa2c]
    test   al, al
    je     0x6bd71d
    push   0x30
    push   0x652
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    push   0x652
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840dcc
    call   0x734e60
    mov    edx, eax
    xor    ecx, ecx
    call   0x734fe0
    mov    al, byte [ebp-0xa2c]
    test   al, al
    je     0x6bd71d
    push   0x1
    call   0x7cbddc
    call_WWDebug_Printf 0x840db4
    call_WWDebug_Printf 0x840d98
    add    esp, 0x8
    mov    edi, 0x7e1a80
    or     ecx, 0xffffffff
    xor    eax, eax
    repnz scasb; al, byte [es:edi]
    not    ecx
    dec    ecx
    push   ecx
    push   0x7e1a80
    lea    ecx, [ebp-0xbd8]
    call   0x65c250
    lea    ecx, [ebp-0xbb8]
    call   0x535aa0
    call_WWDebug_Printf 0x840d84
    add    esp, 0x4
    push   0x0
    lea    eax, [ebp-0xbd8]
    push   eax
    lea    ecx, [ebp-0xbb8]
    call   0x525a10
    call_WWDebug_Printf 0x840d68
    add    esp, 0x4
    push   0x1
    lea    ecx, [ebp-0xddc]
    push   ecx
    lea    ecx, [ebp-0xbb8]
    call   0x52a670
    mov    ecx, 0x81
    mov    esi, eax
    mov    edi, 0x886980
    rep movsd; dword es:[edi], dword ds:[esi]
    lea    ecx, [ebp-0xbb8]
    call   0x5256f0
    lea    ecx, [ebp-0xbd8]
    call   0x65c2a0
    mov    esi, dword [ds:0x81c1d0]
    mov    ecx, 0xfffffffe
    call   0x4790b0
    push   0x28
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd7fb
    push   0x886980
    push   0x840d5c
    mov    ecx, eax
    call   0x5b3c20
    mov    [ds:0x884e04], eax
    jmp    0x6bd805
    mov    dword [ds:0x884e04], 0x0

    push   0x28
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bd82b
    push   0x886980
    push   0x840d4c
    mov    ecx, eax
    call   0x5b3c20
    mov    [ds:0x884e00], eax
    jmp    0x6bd835
    mov    dword [ds:0x884e00], 0x0

    mov    ecx, esi
    call   0x4790b0
    push   0x6be1c0
    call   0x7c978a
    add    esp, 0x4
    call   0x7b84f0
    mov    ecx, 0x840d40
    call   0x7346a0
    test   eax, eax
    jne    0x6bd884
    push   0x10
    push   0x840d34
    push   0x840c58
    push   eax
    call   dword [ds:0x7e1460]
    xor    eax, eax
    mov    ecx, dword [ebp-0x10]
    mov    dword [fs:0x0], ecx
    pop    edi
    pop    esi
    pop    ebx
    mov    esp, ebp
    pop    ebp
    ret    0x10
    mov    cl, 0x1
    call   0x4a3bf0
    test   al, al
    jne    0x6bd8a4
    xor    eax, eax
    mov    ecx, dword [ebp-0x10]
    mov    dword [fs:0x0], ecx
    pop    edi
    pop    esi
    pop    ebx
    mov    esp, ebp
    pop    ebp
    ret    0x10
    push   0x13
    mov    esi, dword [ds:0x7e13ec]
    call   esi
    test   eax, eax
    je     0x6be176
    push   0x2b
    call   esi
    test   eax, eax
    je     0x6be176
    mov    ecx, 0x840c48
    call   0x4aecd0
    cmp    eax, 0x40046
    jae    0x6bd934
    push   0x840c48
    push   0x46
    push   0x4
    push   0x840c48
    push   0x7d9
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840c38
    call   0x734e60
    push   eax
    lea    edx, [ebp-0x574]
    push   edx
    call   0x7ca564
    add    esp, 0x18
    push   0x10
    push   0x7da
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    lea    edx, [ebp-0x574]
    xor    ecx, ecx
    call   0x734fe0
    push   0x1
    call   0x7cbddc
    push   0x840a74
    push   0x1
    push   0x7e9520
    push   0x87f7e8
    call   ebx
    or     eax, 0xffffffff
    cmp    dword [ds:0xa8eb84], eax
    je     0x6bd95a
    cmp    dword [ds:0xa8eb88], eax
    jne    0x6bd9b0
    mov    al, [ds:0x887625]
    test   al, al
    je     0x6bd973
    cmp    dword [ds:0x887598], 0x5
    jge    0x6bd973
    mov    eax, 0x1
    jmp    0x6bd975
    xor    eax, eax
    test   al, al
    jne    0x6bd99c
    call   0x4a4130
    cmp    eax, 0x200000
    ja     0x6bd99c
    mov    ebx, 0x280
    mov    dword [ds:0xa8eb84], ebx
    mov    dword [ds:0xa8eb88], 0x1e0

    jmp    0x6bd9b5
    mov    dword [ds:0xa8eb84], 0x320

    mov    dword [ds:0xa8eb88], 0x258

    mov    ebx, 0x280
    mov    al, [ds:0xa8ed63]
    test   al, al
    je     0x6bdaf9
    mov    esi, 0x1e0
    push   esi
    push   ebx
    mov    edx, dword [ebp+0x14]
    mov    ecx, dword [ebp+0x8]
    call   0x777c30
    call   0x4a3fd0
    mov    al, [ds:0x89f978]
    test   al, al
    je     0x6bda61
    xor    eax, eax
    xor    ecx, ecx
    mov    edx, ebx
    mov    [ds:0x886fb0], eax
    mov    dword [ds:0x886fb4], ecx
    mov    dword [ds:0x886fb8], edx
    mov    dword [ds:0x886fbc], esi
    mov    dword [ds:0x8a00a4], ebx
    mov    dword [ds:0x8a00a8], esi
    mov    al, [ds:0x8175b0]
    neg    al
    sbb    eax, eax
    and    eax, 0x8
    add    eax, 0x8
    mov    [ds:0x8a00ac], eax
    xor    esi, esi
    cmp    dword [ds:0xa8f784], esi
    je     0x6bdca0
    mov    edx, 0x19000
    mov    ecx, 0x3e8
    call   0x53de00
    test   eax, eax
    je     0x6bdca0
    mov    eax, [ds:0xa8f784]
    cmp    eax, 0x1
    jne    0x6bdc91
    mov    ecx, 0x840c2c
    call   0x53e4f0
    jmp    0x6bdca0
    mov    cl, byte [ds:0x8175b0]
    neg    cl
    sbb    ecx, ecx
    and    ecx, 0x8
    add    ecx, 0x8
    push   ecx
    push   esi
    mov    edx, ebx
    mov    ecx, dword [ds:0xb73550]
    call   0x4a42f0
    and    eax, 0xff
    mov    dword [ebp-0x720], eax
    mov    eax, 0x0
    mov    ecx, eax
    mov    edx, ebx
    mov    [ds:0x886fb0], eax
    mov    dword [ds:0x886fb4], ecx
    mov    dword [ds:0x886fb8], edx
    mov    dword [ds:0x886fbc], esi
    jne    0x6bda1f
    call   0x4a40c0
    push   0x30
    push   0x870
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    push   0x86f
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840c1c
    call   0x734e60
    mov    edx, eax
    mov    ecx, dword [ds:0xb73550]
    call   0x734fe0
    push   0x1
    call   0x7cbddc
    mov    edx, dword [ds:0xa8eb90]
    push   edx
    mov    eax, [ds:0xa8eb8c]
    push   eax
    mov    edx, dword [ebp+0x14]
    mov    ecx, dword [ebp+0x8]
    call   0x777c30
    call   0x4a3fd0
    mov    al, [ds:0x89f978]
    test   al, al
    je     0x6bdb6d
    xor    eax, eax
    xor    ecx, ecx
    mov    edx, dword [ds:0xa8eb8c]
    mov    esi, dword [ds:0xa8eb90]
    mov    [ds:0x886fb0], eax
    mov    dword [ds:0x886fb4], ecx
    mov    dword [ds:0x886fb8], edx
    mov    dword [ds:0x886fbc], esi
    mov    dword [ds:0x8a00a4], edx
    mov    dword [ds:0x8a00a8], esi
    mov    cl, byte [ds:0x8175b0]
    neg    cl
    sbb    ecx, ecx
    and    ecx, 0x8
    add    ecx, 0x8
    mov    dword [ds:0x8a00ac], ecx
    jmp    0x6bda1f
    mov    dl, byte [ds:0x8175b0]
    neg    dl
    sbb    edx, edx
    and    edx, 0x8
    add    edx, 0x8
    push   edx
    mov    eax, [ds:0xa8eb90]
    push   eax
    mov    edx, dword [ds:0xa8eb8c]
    mov    ecx, dword [ds:0xb73550]
    call   0x4a42f0
    and    eax, 0xff
    mov    edi, eax
    mov    eax, 0x0
    mov    ecx, eax
    mov    edx, dword [ds:0xa8eb8c]
    mov    esi, dword [ds:0xa8eb90]
    mov    [ds:0x886fb0], eax
    mov    dword [ds:0x886fb4], ecx
    mov    dword [ds:0x886fb8], edx
    mov    dword [ds:0x886fbc], esi
    jne    0x6bda1f
    cmp    dword [ds:0xa8eb84], ebx
    jne    0x6bdbe0
    cmp    dword [ds:0xa8eb88], 0x1e0

    je     0x6bdc41
    mov    dword [ds:0xa8eb84], ebx
    mov    dword [ds:0xa8eb88], 0x1e0

    mov    cl, byte [ds:0x8175b0]
    neg    cl
    sbb    ecx, ecx
    and    ecx, 0x8
    add    ecx, 0x8
    push   ecx
    push   0x1e0
    mov    edx, ebx
    mov    ecx, dword [ds:0xb73550]
    call   0x4a42f0
    and    eax, 0xff
    mov    edi, eax
    xor    eax, eax
    xor    ecx, ecx
    mov    edx, dword [ds:0xa8eb84]
    mov    esi, dword [ds:0xa8eb88]
    mov    [ds:0x886fb0], eax
    mov    dword [ds:0x886fb4], ecx
    mov    dword [ds:0x886fb8], edx
    mov    dword [ds:0x886fbc], esi
    test   edi, edi
    jne    0x6bda1f
    call   0x4a40c0
    push   0x30
    push   0x8a8
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    push   0x8a7
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840c1c
    call   0x734e60
    mov    edx, eax
    mov    ecx, dword [ds:0xb73550]
    call   0x734fe0
    push   0x1
    call   0x7cbddc
    cmp    eax, 0x2
    jne    0x6bdca0
    mov    ecx, 0x840c2c
    call   0x53e550
    xor    ecx, ecx
    call   0x4ba770
    mov    [ds:0x887308], eax
    mov    edx, dword [eax]
    mov    ecx, eax
    call   dword [edx+0x70]
    cmp    eax, 0x2
    sete   al
    mov    [ds:0x8175b0], al
    test   al, al
    jne    0x6bdd03
    push   0x30
    push   0x8c5
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    push   0x8c5
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840c0c
    call   0x734e60
    mov    edx, eax
    mov    ecx, dword [ds:0xb73550]
    call   0x734fe0
    call   0x6bec60
    call   0x5d4d50
    mov    al, [ds:0xa8ed80]
    test   al, al
    je     0x6bdd03
    call   0x49f620
    test   al, al
    jne    0x6bdd2e
    call_WWDebug_Printf 0x840bf0
    add    esp, 0x4
    push   0x1
    call   0x7cbddc
    call   0x5d4d50
    mov    al, [ds:0xa8ed80]
    test   al, al
    je     0x6bdd2e
    mov    byte [ds:0x8a00a0], 0x0
    mov    al, [ds:0x89f978]
    test   al, al
    jne    0x6bdd58
    mov    ecx, dword [ds:0x887308]
    mov    eax, dword [ecx]
    push   esi
    call   dword [eax+0x18]
    mov    cl, byte [ds:0x89f978]
    push   ecx
    mov    edx, dword [ds:0xb73550]
    mov    ecx, dword [ds:0xb732f0]
    call   0x5bc180
    call   0x637070
    call   0x52cb80
    mov    al, [ds:0x8a0def]
    test   al, al
    je     0x6bdd98
    call   0x4c1600
    cmp    eax, esi
    je     0x6bdd9f
    call   0x4c19b0
    mov    byte [ds:0x8a0def], 0x0
    mov    byte [ds:0x8a0df0], 0x0
    mov    dword [ebp-0x79c], esi
    mov    dword [ebp-0x798], esi
    mov    edx, dword [ds:0x7f5bf8]
    mov    dword [ebp-0x794], edx
    mov    ecx, dword [ds:0x886fbc]
    mov    dword [ebp-0x790], ecx
    mov    eax, [ds:0x886fb8]
    sub    eax, edx
    mov    dword [ebp-0x7ac], esi
    mov    dword [ebp-0x7a8], esi
    mov    dword [ebp-0x7a4], eax
    mov    dword [ebp-0x7a0], ecx
    mov    dword [ebp-0x7bc], esi
    mov    dword [ebp-0x7b8], esi
    mov    dword [ebp-0x7b4], eax
    mov    dword [ebp-0x7b0], ecx
    push   esi
    lea    edx, [ebp-0x79c]
    push   edx
    lea    eax, [ebp-0x7ac]
    push   eax
    lea    edx, [ebp-0x7bc]
    mov    ecx, 0x886fb0
    call   0x533fd0
    mov    al, [ds:0x8a0def]
    test   al, al
    je     0x6bde3e
    call   0x4c16a0
    cmp    eax, esi
    je     0x6bde3e
    call   0x4c19b0
    mov    byte [ds:0x8a0def], 0x0
    mov    byte [ds:0x8a0df0], 0x0
    mov    edx, dword [ds:0x88730c]
    mov    dword [ds:0x887314], edx
    push   esi
    mov    cl, 0x1
    call   0x4f4780
    push   0x30
    call   0x7c8e17
    add    esp, 0x4
    cmp    eax, esi
    je     0x6bde91
    mov    edx, 0x1e0
    mov    ecx, dword [ds:0x886fa4]
    sub    edx, ecx
    mov    esi, dword [ds:0x886fa0]
    mov    edi, 0x1e0
    sub    esp, 0x10
    mov    ebx, esp
    mov    dword [ebx], esi
    mov    dword [ebx+0x4], ecx
    mov    dword [ebx+0x8], edi
    mov    dword [ebx+0xc], edx
    mov    ecx, eax
    call   0x7bc970
    jmp    0x6bde93
    xor    eax, eax
    mov    [ds:0x887644], eax
    mov    esi, dword [ebp-0x70c]
    mov    dword [eax+0x24], 0x8000
    push   0x30
    call   0x7c8e17
    add    esp, 0x4
    test   eax, eax
    je     0x6bdeef
    mov    edx, 0x1e0
    mov    ecx, dword [ds:0x886fa4]
    sub    edx, ecx
    mov    esi, dword [ds:0x886fa0]
    mov    edi, 0x1e0
    sub    esp, 0x10
    mov    ebx, esp
    mov    dword [ebx], esi
    mov    dword [ebx+0x4], ecx
    mov    dword [ebx+0x8], edi
    mov    dword [ebx+0xc], edx
    mov    ecx, eax
    call   0x410ce0
    mov    [ds:0x87e8a4], eax
    mov    esi, dword [ebp-0x70c]
    jmp    0x6bdef9
    mov    dword [ds:0x87e8a4], 0x0

    push   0x98
    call   0x7c8e17
    add    esp, 0x4
    xor    ebx, ebx
    cmp    eax, ebx
    je     0x6bdf23
    mov    ecx, dword [ds:0xb73550]
    push   ecx
    mov    edx, dword [ds:0x887308]
    push   edx
    mov    ecx, eax
    call   0x7b8730
    jmp    0x6bdf25
    xor    eax, eax
    mov    [ds:0x887640], eax
    mov    edx, dword [eax]
    mov    ecx, eax
    call   dword [edx+0xc]
    mov    dword [ds:0xa8e954], ebx
    cmp    dword [ds:0xa8e950], ebx
    je     0x6bdf52
    mov    ecx, dword [ds:0xa8e8e8]
    mov    edi, 0x1
    mov    dword [ds:0xa8e954], edi
    jmp    0x6bdf5a
    or     ecx, 0xffffffff
    mov    edi, 0x1
    call   0x47ada0
    call   0x5355d0
    push   edi
    push   0x840be8
    push   0x8241c0
    mov    ecx, 0x8870c0
    call   0x5295f0
    and    eax, edi
    shl    eax, 0x2
    mov    ecx, dword [ds:0xa8e960]
    and    ecx, 0xfffffffb
    or     eax, ecx
    mov    [ds:0xa8e960], eax
    mov    dword [ebp-0x71c], ebx
    mov    byte [ebp-0x718], 0x0
    lea    ecx, [ebp-0x71c]
    call   0x5175f0
    lea    ecx, [ebp-0x71c]
    call   0x5176a0
    test   al, al
    jne    0x6bdfdf
    lea    ecx, [ebp-0x71c]
    call   0x5176c0
    test   al, al
    jne    0x6bdfdf
    lea    ecx, [ebp-0x71c]
    call   0x5176b0
    test   al, al
    jne    0x6bdfdf
    mov    eax, [ds:0xa8e960]
    or     al, 0x8
    mov    [ds:0xa8e960], eax
    mov    edx, dword [ds:0xa8e960]
    and    edx, 0x4
    cmp    dl, 0x4
    jne    0x6be01d
    push   ebx
    push   0x840be8
    push   0x8241c0
    mov    ecx, 0x8870c0
    call   0x529560
    mov    eax, dword [esi]
    mov    ecx, esi
    call   dword [eax+0x34]
    mov    edx, dword [esi]
    push   edi
    mov    ecx, esi
    call   dword [edx+0x1c]
    push   ebx
    push   esi
    mov    ecx, 0x8870c0
    call   0x474430
    mov    eax, dword [esi]
    mov    ecx, esi
    call   dword [eax+0x34]
    cmp    esi, ebx
    je     0x6be02f
    mov    edx, dword [esi]
    push   edi
    mov    ecx, esi
    call   dword [edx]
    mov    al, [ds:0xa8f7ac]
    test   al, al
    je     0x6be048
    lea    edx, [ebp-0x174]
    mov    ecx, dword [ebp-0x1c]
    call   0x48ccc0
    jmp    0x6be091
    mov    dword [ebp-0x4], ebx
    call_WWDebug_Printf 0x840bdc
    add    esp, 0x4
    lea    edx, [ebp-0x174]
    mov    ecx, dword [ebp-0x1c]
    call   0x48ccc0
    jmp    0x6be078
    mov    edx, dword [ebp-0x14]
    mov    eax, dword [edx]
    mov    ecx, dword [eax]
    jmp    0x4c8fe0
    ret
    mov    esp, dword [ebp-0x18]
    mov    dword [ebp-0x4], 0xffffffff
    push   0x6bb990
    call   dword [ds:0x7e1144]
    xor    ebx, ebx
    mov    edi, 0x1
    mov    ecx, dword [ds:0x887640]
    mov    edx, dword [ecx]
    call   dword [edx+0xc]
    mov    ecx, dword [ds:0x88730c]
    mov    eax, dword [ecx]
    push   ebx
    call   dword [eax+0x18]
    push   ebx
    mov    edx, dword [ds:0x88730c]
    mov    cl, 0x1
    call   0x4f4780
    mov    dword [ds:0xa8edd8], edi
    mov    ecx, 0xa83d10
    call   0x720770
    call   0x406d40
    push   ebx
    push   ebx
    push   0x2
    mov    ecx, dword [ds:0xb73550]
    push   ecx
    call   dword [ds:0x7e14ac]
    call   0x5d4d50
    cmp    dword [ds:0xa8edd8], edi
    je     0x6be0dc
    xor    esi, esi
    call   0x5d7e50
    call   0x65fd50
    mov    ecx, 0x87f7e8
    call   0x6d0270
    call   0x626ff0
    call   0x5bc300
    call   0x5f77f0
    call   0x60d440
    call   0x6370a0
    call   0x72ac40
    call   0x730970
    call   0x552aa0
    call   0x5be940
    call   0x5db6f0
    mov    eax, [ds:0x840a74]
    cmp    eax, 0xffffffff
    je     0x6be14e
    push   0x0
    push   eax
    call   dword [ds:0x7e1384]
    mov    dword [ds:0x840a74], 0xffffffff

    push   0x0
    push   0x89a29c
    call   dword [ds:0x7e15dc]
    call   dword [ds:0x7e15d0]
    mov    eax, esi
    mov    ecx, dword [ebp-0x10]
    mov    dword [fs:0x0], ecx
    pop    edi
    pop    esi
    pop    ebx
    mov    esp, ebp
    pop    ebp
    ret    0x10
    push   0x10
    push   0x7cf
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x81d57c
    call   0x734e60
    push   eax
    push   0x7cf
    push   0x840e0c
    xor    edx, edx
    mov    ecx, 0x840bc8
    call   0x734e60
    mov    edx, eax
    xor    ecx, ecx
    call   0x734fe0
    push   0x1
    call   0x7cbddc
ENDPROC
