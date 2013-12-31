%macro CODE_START 1
    [section .text]
    %1:
    %push __proc
%endmacro

%macro CODE_END 0
    %ifctx __proc
        align   16, db 0xCC
        %pop
        __SECT__
    %else
        %error "expected `CODE_START' before `CODE_END'"
    %endif
%endmacro
