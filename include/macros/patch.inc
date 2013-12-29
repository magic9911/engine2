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

%macro @CLEAR 3
    [section .patch]
    dd %1
    dd %3 - %1
    times (%3 - %1) db %2
    __SECT__
%endmacro

; FIXME: do both near and far jumps
%macro @JMP 2
    [section .patch]
    dd %1           ; patch address
    dd 5            ; length of the patch
    db 0xE9         ; far jump
    dd %2 - %1 - 5  ; relative offset
    __SECT__
%endmacro

%macro @CALL 2
    [section .patch]
    dd %1           ; patch addrss
    dd 5            ; length of the patch
    db 0xE8         ; far call
    dd %2 - %1 - 5  ; relative offset
    __SECT__
%endmacro
