#include "aes.h"

BEGIN_TEST

struct aes_ctx ctx;

uint8_t msg[AES_BLOCK_SIZE];
uint8_t cipher[AES_BLOCK_SIZE];
uint8_t clear[AES_BLOCK_SIZE];

/* 128 bit keys */
H(msg, "506812A45F08C889 B97F5980038B8359");

aes_set_key(&ctx, 16,  H("0001020305060708 0A0B0C0D0F101112"));
aes_encrypt(&ctx, AES_BLOCK_SIZE, cipher, msg);
if (!MEMEQ(16, cipher, H("D8F532538289EF7D 06B506A4FD5BE9C9")))
  FAIL;

aes_decrypt(&ctx, AES_BLOCK_SIZE, clear, cipher);
if (!MEMEQ(16, msg, clear))
  FAIL;

H(msg, "5C6D71CA30DE8B8B 00549984D2EC7D4B");

aes_set_key(&ctx, 16,  H("14151617191A1B1C 1E1F202123242526"));
aes_encrypt(&ctx, AES_BLOCK_SIZE, cipher, msg);
if (!MEMEQ(16, cipher, H("59AB30F4D4EE6E4F F9907EF65B1FB68C")))
  FAIL;

aes_decrypt(&ctx, AES_BLOCK_SIZE, clear, cipher);
if (!MEMEQ(16, msg, clear))
  FAIL;

H(msg, "53F3F4C64F8616E4 E7C56199F48F21F6");

aes_set_key(&ctx, 16,  H("28292A2B2D2E2F30 323334353738393A"));
aes_encrypt(&ctx, AES_BLOCK_SIZE, cipher, msg);
if (!MEMEQ(16, cipher, H("BF1ED2FCB2AF3FD4 1443B56D85025CB1")))
  FAIL;

aes_decrypt(&ctx, AES_BLOCK_SIZE, clear, cipher);
if (!MEMEQ(16, msg, clear))
  FAIL;

H(msg, "F5F4F7F684878689 A6A7A0A1D2CDCCCF");

aes_set_key(&ctx, 16,  H("A0A1A2A3A5A6A7A8 AAABACADAFB0B1B2"));
aes_encrypt(&ctx, AES_BLOCK_SIZE, cipher, msg);
if (!MEMEQ(16, cipher, H("CE52AF650D088CA5 59425223F4D32694")))
  FAIL;

aes_decrypt(&ctx, AES_BLOCK_SIZE, clear, cipher);
if (!MEMEQ(16, msg, clear))
  FAIL;

/* 192 bit keys */
H(msg, "2D33EEF2C0430A8A 9EBF45E809C40BB6");

aes_set_key(&ctx, 24,  H("0001020305060708 0A0B0C0D0F101112"
			 "14151617191A1B1C"));
aes_encrypt(&ctx, AES_BLOCK_SIZE, cipher, msg);
if (!MEMEQ(16, cipher, H("DFF4945E0336DF4C 1C56BC700EFF837F")))
  FAIL;

aes_decrypt(&ctx, AES_BLOCK_SIZE, clear, cipher);
if (!MEMEQ(16, msg, clear))
  FAIL;

/* 256 bit keys */
H(msg, "834EADFCCAC7E1B30664B1ABA44815AB");

aes_set_key(&ctx, 32,  H("0001020305060708 0A0B0C0D0F101112"
			 "14151617191A1B1C 1E1F202123242526"));
aes_encrypt(&ctx, AES_BLOCK_SIZE, cipher, msg);
if (!MEMEQ(16, cipher, H("1946DABF6A03A2A2 C3D0B05080AED6FC")))
  FAIL;

aes_decrypt(&ctx, AES_BLOCK_SIZE, clear, cipher);
if (!MEMEQ(16, msg, clear))
  FAIL;
