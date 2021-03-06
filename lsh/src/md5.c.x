/*
CLASS:md5_instance:hash_instance
*/
#ifndef GABA_DEFINE
struct md5_instance
{
  struct hash_instance super;
  struct md5_ctx ctx;
};
extern struct lsh_class md5_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class md5_instance_class =
{
  STATIC_HEADER,
  &(hash_instance_class),
  "md5_instance",
  sizeof(struct md5_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

