/*
CLASS:group_zn:abstract_group
*/
#ifndef GABA_DEFINE
struct group_zn
{
  struct abstract_group super;
  mpz_t modulo;
};
extern struct lsh_class group_zn_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_group_zn_free(struct lsh_object *o)
{
  struct group_zn *i = (struct group_zn *) o;
  mpz_clear(i->modulo);
}
struct lsh_class group_zn_class =
{
  STATIC_HEADER,
  &(abstract_group_class),
  "group_zn",
  sizeof(struct group_zn),
  NULL,
  do_group_zn_free,
};
#endif /* !GABA_DECLARE */

