/*
CLASS:des_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct des_instance
{
  struct crypto_instance super;
  struct des_ctx ctx;
};
extern struct lsh_class des_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class des_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "des_instance",
  sizeof(struct des_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

