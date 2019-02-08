    .section    .text
_start:

    li  sp, 0x00000900

    jal main

finish:
    j   finish

    nop
    nop
    nop
    nop
    nop
    nop
