/*
CLASS:cbc_algorithm:crypto_algorithm
*/
#ifndef GABA_DEFINE
struct cbc_algorithm
{
  struct crypto_algorithm super;
  struct crypto_algorithm *inner;
};
extern struct lsh_class cbc_algorithm_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_cbc_algorithm_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct cbc_algorithm *i = (struct cbc_algorithm *) o;
  mark((struct lsh_object *) i->inner);
}
struct lsh_class cbc_algorithm_class =
{
  STATIC_HEADER,
  &(crypto_algorithm_class),
  "cbc_algorithm",
  sizeof(struct cbc_algorithm),
  do_cbc_algorithm_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:cbc_instance:crypto_instance
*/
#ifndef GABA_DEFINE
struct cbc_instance
{
  struct crypto_instance super;
  struct crypto_instance *inner;
  UINT8 (*(iv));
};
extern struct lsh_class cbc_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_cbc_instance_mark(struct lsh_object *o,
  void (*mark)(struct lsh_object *o))
{
  struct cbc_instance *i = (struct cbc_instance *) o;
  mark((struct lsh_object *) i->inner);
}
static void
do_cbc_instance_free(struct lsh_object *o)
{
  struct cbc_instance *i = (struct cbc_instance *) o;
  lsh_space_free(i->iv);
}
struct lsh_class cbc_instance_class =
{
  STATIC_HEADER,
  &(crypto_instance_class),
  "cbc_instance",
  sizeof(struct cbc_instance),
  do_cbc_instance_mark,
  do_cbc_instance_free,
};
#endif /* !GABA_DECLARE */

