all: program.hex data.hex

program.hex: program.elf
	elf2hex 8 128 $< > $@

data.hex: program.elf
	elf2hex 8 128 $< > $@

program.elf: startup.S
	riscv32-unknown-elf-as -march=rv32im $< -c -o $<.o
	riscv32-unknown-elf-ld $<.o -Tlink.ld -o $@
