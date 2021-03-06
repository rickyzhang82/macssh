/*
CLASS:rsa_algorithm:signature_algorithm
*/
#ifndef GABA_DEFINE
struct rsa_algorithm
{
  struct signature_algorithm super;
  struct hash_algorithm *hash;
  int name;
  UINT32 prefix_length;
  const UINT8 * prefix;
};
extern struct lsh_class rsa_algorithm_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_rsa_algorithm_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct rsa_algorithm *i = (struct rsa_algorithm *) o;
  mark((struct lsh_object *) i->hash);
}
struct lsh_class rsa_algorithm_class =
{
  STATIC_HEADER,
  &(signature_algorithm_class),
  "rsa_algorithm",
  sizeof(struct rsa_algorithm),
  do_rsa_algorithm_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

