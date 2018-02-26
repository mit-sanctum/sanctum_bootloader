CC = riscv64-unknown-elf-gcc
OBJCOPY= riscv64-unknown-elf-objcopy
CFLAGS = \
	-march=rv64imac -mcmodel=medany -mabi=lp64 \
	-nostdlib -nostartfiles -fno-common -std=gnu11 \
	-static \
	-fPIC \
	-DENTROPY=0 -DNONSMP_HART=0 \
	-Og -Og -Wall

	#-O2 -Wall\
	#-fPIC \

# ^ consider taking out -g -Og and putting in -O2

bootloaders=\
	boot_insecure.bin\
	boot_trng.bin\

.PHONY: all
all: $(bootloaders)

.PHONY: clean
clean:
	-rm -f boot_insecure.elf boot_trng.elf
	-rm -f boot_insecure.bin boot_trng.bin

boot_insecure_sources = \
	boot_insecure/bootloader.S \
	boot_insecure/bootloader.c \

boot_trng_sources= \
	boot_trng/bootloader.S \
	boot_trng/bootloader.c \
	common/ed25519/*.c \

.PRECIOUS: %.elf

%.elf: $(%_sources) %/bootloader.lds
	$(CC) $(CFLAGS) -I common/ -L . -T $*/bootloader.lds -o $@ $($*_sources)

%.bin: %.elf
	$(OBJCOPY) -O binary --only-section=.text $< $@;
