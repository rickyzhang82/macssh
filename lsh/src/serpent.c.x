/*
CLASS:serpent_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct serpent_instance
{
  struct crypto_instance super;
  struct serpent_ctx ctx;
};
extern struct lsh_class serpent_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class serpent_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "serpent_instance",
  sizeof(struct serpent_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

