/*
CLASS:crypto_inverted:crypto_algorithm
*/
#ifndef GABA_DEFINE
struct crypto_inverted
{
  struct crypto_algorithm super;
  struct crypto_algorithm *inner;
};
extern struct lsh_class crypto_inverted_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_crypto_inverted_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct crypto_inverted *i = (struct crypto_inverted *) o;
  mark((struct lsh_object *) i->inner);
}
struct lsh_class crypto_inverted_class =
{
  STATIC_HEADER,
  &(crypto_algorithm_class),
  "crypto_inverted",
  sizeof(struct crypto_inverted),
  do_crypto_inverted_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

