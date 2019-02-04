    .section    .text
_start:

    li  x1, 0
    li  x2, 0
    li  x3, 0
    li  x4, 0
    li  x5, 0
    li  x6, 0
    li  x7, 0
    li  x8, 0
    li  x9, 0
    li  x10, 0

    li  x10, 0xd0580000
    la  x11, character
loop:
    lb      x1, 0(x11)
    sw      x1, 0(x10)
    addi    x11, x11, 1
    bnez    x1, loop

finish:
    j   finish

    nop
    nop
    nop
    nop
    nop
    nop

character:
    .ascii "Hello, msyksphinz"
