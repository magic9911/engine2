/*
 * Copyright (c) 2013 Toni Spets <toni.spets@iki.fi>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

typedef struct
__attribute__ ((packed))
{
    void   *address;
    size_t  length;
    uint8_t body[];
} patch_t;

#define CLEAR(_ADDR, _LENGTH)                           \
    patch_t clear_ ## __COUNTER__                       \
    __attribute__((used))                               \
    __attribute__((section(".patch,\"aw\", @note#")))   \
    = {                                                 \
        .address = _ADDR,                               \
        .length  = _LENGTH,                             \
        .body[_LENGTH] = {}                             \
    }                                                   \

#define PATCH(_ADDR, _STUFF)                            \
    asm(".section .patch,\"dn\""                "\n\t"  \
        ".long %c[addr]"                        "\n\t"  \
        ".long 2b - 1b"                         "\n"    \
        "1:"                                    "\n\t"  \
        _STUFF                                          \
        "2:"                                    "\n\t"  \
        ".section .text"                        "\n\t"  \
        :                                               \
        : [addr] "p" (_ADDR)                            \
        :                                               \
        )

#define LJMP(_SRC, _DST)                                \
    asm(".section .patch,\"dn\""                "\n\t"  \
        ".long %c[src]"                         "\n\t"  \
        ".long 2f - 1f"                         "\n"    \
        "1:"                                    "\n\t"  \
        ".byte 0xE9"                            "\n\t"  \
        ".long %c[dst] - %c[src] - 5"           "\n"    \
        "2:"                                    "\n\t"  \
        ".section .text"                        "\n\t"  \
        :                                               \
        : [src] "p" (_SRC), [dst] "p" (_DST)            \
        :                                               \
    )
