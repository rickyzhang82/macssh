/*
CLASS:rijndael_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct rijndael_instance
{
  struct crypto_instance super;
  struct aes_ctx ctx;
};
extern struct lsh_class rijndael_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class rijndael_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "rijndael_instance",
  sizeof(struct rijndael_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

