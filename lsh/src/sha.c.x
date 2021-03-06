/*
CLASS:sha_instance:hash_instance
*/
#ifndef GABA_DEFINE
struct sha_instance
{
  struct hash_instance super;
  struct sha1_ctx ctx;
};
extern struct lsh_class sha_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class sha_instance_class =
{
  STATIC_HEADER,
  &(hash_instance_class),
  "sha_instance",
  sizeof(struct sha_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

