;; requires that "macros/patch.inc" also be included

%macro @HACK 2
    %ifctx __hack
        %error "can't nest hacks"
    %else
        @LJMP %1, %2
        [section .text]
        align 16, db 0xCC
        %2:
        %push __hack
    %endif
%endmacro

%macro @ENDHACK 0
    %ifctx __hack
        align 16, db 0xCC
        %pop
        __SECT__
    %else
        %error "no corrosponding `@HACK'"
    %endif
%endmacro
