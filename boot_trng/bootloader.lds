OUTPUT_ARCH( "riscv" )

ENTRY( _entry )

SECTIONS
{
  . = 0x11020; /* boot loader lives in boot ROM after the device tree */

  .text :
  {
    PROVIDE( _entry = .);
    *(.reset)
    *(*)
  }

  INCLUDE common/header.lds
}
