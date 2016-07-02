/*
CLASS:twofish_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct twofish_instance
{
  struct crypto_instance super;
  struct twofish_ctx ctx;
};
extern struct lsh_class twofish_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class twofish_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "twofish_instance",
  sizeof(struct twofish_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

