/*
CLASS:cast_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct cast_instance
{
  struct crypto_instance super;
  struct cast128_ctx ctx;
};
extern struct lsh_class cast_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class cast_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "cast_instance",
  sizeof(struct cast_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

