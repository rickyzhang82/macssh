/*
CLASS:blowfish_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct blowfish_instance
{
  struct crypto_instance super;
  struct blowfish_ctx ctx;
};
extern struct lsh_class blowfish_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class blowfish_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "blowfish_instance",
  sizeof(struct blowfish_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

