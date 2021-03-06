#ifdef CHAR_CLASSES_TABLE
int CHAR_CLASSES_TABLE[] =
{
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<12, 1L<<11, 1L<<11, 1L<<12, 1L<<12, 1L<<11, 1L<<14, 1L<<14,
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<15, 1L<<0, 1L<<13, 1L<<0, 1L<<0, 1L<<0, 1L<<0, 1L<<0,
  1L<<0, 1L<<0, 1L<<4, 1L<<3, 1L<<0, 1L<<4, 1L<<4, 1L<<3,
  1L<<9, 1L<<9, 1L<<9, 1L<<9, 1L<<9, 1L<<9, 1L<<9, 1L<<9,
  1L<<10, 1L<<10, 1L<<4, 1L<<0, 1L<<0, 1L<<2, 1L<<0, 1L<<0,
  1L<<0, 1L<<5, 1L<<5, 1L<<5, 1L<<5, 1L<<5, 1L<<5, 1L<<7,
  1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7,
  1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7, 1L<<7,
  1L<<7, 1L<<7, 1L<<7, 1L<<0, 1L<<13, 1L<<0, 1L<<0, 1L<<4,
  1L<<0, 1L<<6, 1L<<6, 1L<<6, 1L<<6, 1L<<6, 1L<<6, 1L<<8,
  1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8,
  1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8, 1L<<8,
  1L<<8, 1L<<8, 1L<<8, 1L<<0, 1L<<0, 1L<<0, 1L<<0, 1L<<14,
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14, 1L<<14,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1,
  1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1, 1L<<1
};
#else /* !CHAR_CLASSES_TABLE */
#define CHAR_international (1L<<1)
#define CHAR_token (1L<<2 | 1L<<3 | 1L<<4 | 1L<<5 | 1L<<6 | 1L<<7 | 1L<<8 | 1L<<9 | 1L<<10)
#define CHAR_token_start (1L<<2 | 1L<<3 | 1L<<4 | 1L<<5 | 1L<<6 | 1L<<7 | 1L<<8)
#define CHAR_punctuation (1L<<2 | 1L<<3 | 1L<<4)
#define CHAR_escapable (1L<<11 | 1L<<12 | 1L<<13)
#define CHAR_control (1L<<11 | 1L<<12 | 1L<<14)
#define CHAR_base64_space (1L<<2 | 1L<<11 | 1L<<15)
#define CHAR_base64 (1L<<2 | 1L<<3 | 1L<<5 | 1L<<6 | 1L<<7 | 1L<<8 | 1L<<9 | 1L<<10)
#define CHAR_hex (1L<<5 | 1L<<6 | 1L<<9 | 1L<<10)
#define CHAR_octal (1L<<9)
#define CHAR_digit (1L<<9 | 1L<<10)
#define CHAR_space (1L<<11 | 1L<<15)
#define CHAR_alpha (1L<<5 | 1L<<6 | 1L<<7 | 1L<<8)
#define CHAR_upper (1L<<5 | 1L<<7)
#define CHAR_lower (1L<<6 | 1L<<8)
#define CHAR_other 1
#endif /* !CHAR_CLASSES_TABLE */
