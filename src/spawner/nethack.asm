;
; Copyright (c) 2013 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

@CALL 0x006A2525 TS_SendHack
@CALL 0x006A25F9 TS_RecvHack

struc sockaddr_in
    .sin_family     RESW 1
    .sin_port       RESW 1
    .sin_addr       RESD 1
    .sin_zero       RESB 8
endstruc

TS_SendHack:
%push
    PUSH EBP
    MOV EBP,ESP
    SUB ESP,sockaddr_in_size
    PUSH ESI
    PUSH EDI

%define var_dest    EBP-sockaddr_in_size

%define addrlen     EBP+28
%define dest_addr   EBP+24
%define flags       EBP+20
%define len         EBP+16
%define buf         EBP+12
%define sockfd      EBP+8

    ; pull index
    MOV ECX,[dest_addr]
    MOV ECX,[ECX + sockaddr_in.sin_addr]

    ; validate index
    CMP ECX,1
    JL .error
    CMP ECX,addressList_length
    JG .error

    ; change to zero based
    DEC ECX

    ; sin_family
    LEA EDX, [var_dest + sockaddr_in.sin_family]
    MOV WORD [EDX], 2

    ; sin_port
    MOV AX, WORD [ECX * ListAddress_size + hp_data.addressList + ListAddress.port]
    LEA EDX, [var_dest + sockaddr_in.sin_port]
    MOV WORD [EDX], AX

    ; sin_addr
    MOV EAX, DWORD [ECX * ListAddress_size + hp_data.addressList + ListAddress.ip]
    LEA EDX, [var_dest + sockaddr_in.sin_addr]
    MOV DWORD [EDX], EAX

    ; sin_zero
    XOR EAX,EAX
    LEA EDX, [var_dest + sockaddr_in.sin_zero]
    MOV DWORD [EDX], EAX
    ADD EDX,4
    MOV DWORD [EDX], EAX

    ; do call to sendto
    MOV EAX,[addrlen]
    PUSH EAX
    LEA EAX,[var_dest]
    PUSH EAX
    MOV EAX,[flags]
    PUSH EAX
    MOV EAX,[len]
    PUSH EAX
    MOV EAX,[buf]
    PUSH EAX
    MOV EAX,[sockfd]
    PUSH EAX
    CALL Tunnel_SendTo

    JMP .exit
.error:
    MOV EAX,-1
.exit:
    POP EDI
    POP ESI
    MOV ESP,EBP
    POP EBP
    RETN 24
%pop


TS_RecvHack:
%push
    PUSH EBP
    MOV EBP,ESP
    PUSH ESI
    PUSH EDI

%define addrlen     EBP+28
%define src_addr    EBP+24
%define flags       EBP+20
%define len         EBP+16
%define buf         EBP+12
%define sockfd      EBP+8

    ; call recvfrom first to get the packet
    MOV EAX,[addrlen]
    PUSH EAX
    MOV EAX,[src_addr]
    PUSH EAX
    MOV EAX,[flags]
    PUSH EAX
    MOV EAX,[len]
    PUSH EAX
    MOV EAX,[buf]
    PUSH EAX
    MOV EAX,[sockfd]
    PUSH EAX
    CALL Tunnel_RecvFrom

    ; bail out if error
    CMP EAX,-1
    JE .exit

    ; now, we need to map src_addr ip/port to index by reversing the search!
    XOR ECX,ECX
.nextAddr:

    ; compare ip
    MOV EDX,[src_addr]
    MOV EDX,[EDX + sockaddr_in.sin_addr]
    CMP EDX, [ECX * ListAddress_size + hp_data.addressList + ListAddress.ip]
    JNE .next

    ; compare port
    MOV EDX,[src_addr]
    MOV DX,[EDX + sockaddr_in.sin_port]
    AND EDX,0xFFFF
    CMP DX, [ECX * ListAddress_size + hp_data.addressList + ListAddress.port]
    JNE .next

    ; found it, set this index to source addr
    INC ECX
    MOV EDX,[src_addr]
    MOV [EDX + sockaddr_in.sin_addr], ECX

    MOV EDX,[src_addr]
    MOV WORD [EDX + sockaddr_in.sin_port], 0

    JMP .exit

.next:
    INC ECX
    CMP ECX,7
    JG .exit
    JMP .nextAddr

.exit:
    POP EDI
    POP ESI
    MOV ESP,EBP
    POP EBP
    RETN 24
%pop
