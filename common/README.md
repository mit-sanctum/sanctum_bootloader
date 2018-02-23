

Build  this mess with:

riscv64-unknown-elf-gcc -march=rv64imac -mcmodel=medany -O2 -std=gnu11 -Wall -nostartfiles -fno-common -g -DENTROPY=0 -mabi=lp64 -DNONSMP_HART=0 -static -nostdlib -L . -T bootloader.lds -o bootloader.elf bootloader.c lpn_puf.c sd_sim.c aes/*.c ed25519/*.c
