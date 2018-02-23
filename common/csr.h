#ifndef CSR_H
#define CSR_H

#define CSR_TRNG        (0xcc0)
#define CSR_MPUFSELECT  (0x7cb)
#define CSR_MPUFDISABLE (0x7cc)
#define CSR_MPUFREADOUT (0xfc0)

#define read_csr(reg) ({ unsigned long __tmp; \
  asm volatile ("csrr %0, " #reg : "=r"(__tmp)); \
  __tmp; })

#define write_csr(reg, val) ({ \
  asm volatile ("csrw " #reg ", %0" :: "rK"(val)); })

#endif
