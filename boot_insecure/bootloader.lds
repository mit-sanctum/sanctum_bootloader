OUTPUT_ARCH( "riscv" )

ENTRY( _entry )

SECTIONS
{
  . = 0x11020;

  /* the bootloader should be position-independent
     to allow a variety of devicetree string sizes */

  .text :
  {
    PROVIDE( _entry = .);
    *(.reset)
    *(*)
  }

  INCLUDE common/header.lds
}
