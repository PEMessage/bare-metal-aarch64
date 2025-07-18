# Relative path to the prefix where the compiler was installed.
COMPILER_PREFIX = ../compiler/prefix

# Prefix to use before all binutils, gcc and gdb commands.
BINROOT = ${COMPILER_PREFIX}/bin/aarch64-none-elf-

# Variable used to control the printing of commands.
# Printing is disabled by default (due to the "@").
# To enable command printing run "make Q= ..." instead of "make ...".
Q = @

# Flags passed to GCC.
GCC_FLAGS = -ffreestanding -Wall -Wextra -Werror -pedantic -O0

.PHONY: all
all: kernel8.img

boot.o: boot.S
	@echo "[AS]      $@"
	${Q}${BINROOT}as -c $< -o $@

kernel.o: kernel.c
	@echo "[gcc]     $@"
	${Q}${BINROOT}gcc ${GCC_FLAGS} -c $< -o $@

kernel8.elf: kernel8.ld boot.o kernel.o
	@echo "[LD]      $@"
	${Q}${BINROOT}ld -T $< -o $@ $(filter-out $<,$^)

kernel8.img: kernel8.elf
	@echo "[OBJCOPY] $@"
	${Q}${BINROOT}objcopy -O binary $< $@

.PHONY: run
run: kernel8.img
	@echo "[QEMU]    running with $<"
	@echo "(Press Ctrl-A X to exit QEMU.)"
	${Q}qemu-system-aarch64 -M raspi3b -nographic -kernel $<

.PHONY: run-gdb
run-gdb: kernel8.img
	@echo "[QEMU]    running with $< (waiting for GDB)"
	@echo "(Press Ctrl-A X to exit QEMU.)"
	${Q}qemu-system-aarch64 -s -S -M raspi3b -nographic -kernel $<

.PHONY: gdb
gdb: kernel8.elf
	@echo "[GDB]     running with $<"
	${Q}${BINROOT}gdb -ex "target remote :1234" $<

.PHONY: clean
clean:
	@rm -f *.o
	@rm -f kernel8.elf
	@rm -f kernel8.img
