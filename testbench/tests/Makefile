all: program.hex data.hex

program.hex: program.elf
	elf2hex 8 1024 $< > $@

data.hex: program.elf
	elf2hex 16 1024 $< > $@

.S.o:
	riscv32-unknown-elf-as -march=rv32im $< -c -o $@

.s.o:
	riscv32-unknown-elf-as -march=rv32im $< -c

.c.o:
	riscv32-unknown-elf-gcc -march=rv32im $< -c

program.elf: startup.o main.o
	riscv32-unknown-elf-ld $^ -Tlink.ld -o $@
	riscv32-unknown-elf-objdump -D $@ > $@.dump

clean:
	rm -rf *.o *.hex *.elf
