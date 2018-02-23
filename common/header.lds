. = 0x80000000; /* load starting at the beginning of DRAM */

/* ## manufacturer_keys : */

/* 8 Bytes : manufacturer meta/reserved */
PROVIDE( sanctum_m_meta = .);
. += 0x8;

/* 32 Bytes : manufacturer public key */
PROVIDE( sanctum_m_public_key = . );
. += 0x20;

/* ## device_keys : */

/* 8 Bytes : device meta/reserved */
PROVIDE( sanctum_dev_meta = . );
. += 0x8;

/* 16 Bytes : device PUF b */
PROVIDE( sanctum_dev_puf_b = . );
. += 0x10;

/* 32 Bytes : device PUF e */
PROVIDE( sanctum_dev_puf_e = . );
. += 0x20;

/* 32 Bytes : device PUF s */
PROVIDE( sanctum_dev_puf_s = . );
. += 0x20;

/* 64 Bytes : device symmetric key */
PROVIDE( sanctum_dev_symmetric_key = . );
. += 0x40;

/* 32 Bytes : device public key */
PROVIDE( sanctum_dev_public_key = . );
. += 0x20;

/* 64 Bytes : device secret key */
PROVIDE( sanctum_dev_secret_key = . );
. += 0x40;

/* 64 Bytes : device's signature by manufacturer */
PROVIDE( sanctum_dev_signature = . );
. += 0x40;

/* ## security_monitor_keys : */

/* 8 Bytes : security monitor meta/reserved */
PROVIDE( sanctum_sm_meta = . );
. += 0x8;

/* 8 Bytes : security monitor size (bytes) */
PROVIDE( sanctum_sm_size = . );
. += 0x4;

/* 64 Bytes : security monitor hash */
PROVIDE( sanctum_sm_hash = . );
. += 0x40;

/* 64 Bytes : security monitor symmetric key */
PROVIDE( sanctum_sm_symmetric_key = . );
. += 0x40;

/* 32 Bytes : security monitor public key */
PROVIDE( sanctum_sm_public_key = . );
. += 0x20;

/* 64 Bytes : security monitor secret key */
PROVIDE( sanctum_sm_secret_key = . );
. += 0x40;

/* 64 Bytes : security monitor's signature by device */
PROVIDE( sanctum_sm_signature = . );
. += 0x40;

/* ## .security_monitor : */
PROVIDE( sanctum_sm_ptr = . );
