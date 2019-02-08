OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x00000000;
  .text : { *(.text) }
  text_size = .;

  .rodata 0x00000800 + text_size : AT (0x00000000 + text_size) { *(.rodata) }
  .data : { *(.data) }
  .bss : { *(.bss) }
  _end = .;
}
