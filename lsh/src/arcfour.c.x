/*
CLASS:arcfour_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct arcfour_instance
{
  struct crypto_instance super;
  struct arcfour_ctx ctx;
};
extern struct lsh_class arcfour_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class arcfour_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "arcfour_instance",
  sizeof(struct arcfour_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

