CC = riscv64-unknown-elf-gcc
OBJCOPY= riscv64-unknown-elf-objcopy
CFLAGS = \
	-march=rv64imac -mcmodel=medany -mabi=lp64 \
	-nostdlib -nostartfiles -fno-common -std=gnu11 \
	-static \
	-DENTROPY=0 -DNONSMP_HART=0 \
	-O2 -Wall\
	#-g -Og -Wall\

# ^ consider taking out -g -Og and putting in -O2

bootloaders=\
	boot_insecure.bin\
	boot_trng.bin\

.PHONY: all
all: $(bootloaders)

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

%.elf: $(%_sources) %/bootloader.lds
	$(CC) $(CFLAGS) -I common/ -L . -T $*/bootloader.lds -o $@ $($*_sources)
	cp $@ _$@

%.bin: %.elf
	$(OBJCOPY) -O binary --only-section=.text $< $@;
