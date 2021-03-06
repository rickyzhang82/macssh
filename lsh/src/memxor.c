/* memxor.c
 *
 * $Id$
 */

/* XOR LEN bytes starting at SRCADDR onto DESTADDR.  Result undefined
   if the source overlaps with the destination.
   Return DESTADDR. */

#include "memxor.h"

UINT8 *memxor(UINT8 *dst, const UINT8 *src, size_t n)
{
  size_t i;
  for (i = 0; i<n; i++)
    dst[i] ^= src[i];

  return dst;
}
