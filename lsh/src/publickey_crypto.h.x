/*
CLASS:keypair:
*/
#ifndef GABA_DEFINE
struct keypair
{
  struct lsh_object super;
  int type;
  struct lsh_string *public;
  struct signer *private;
};
extern struct lsh_class keypair_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_keypair_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct keypair *i = (struct keypair *) o;
  mark((struct lsh_object *) i->private);
}
static void
do_keypair_free(struct lsh_object *o)
{
  struct keypair *i = (struct keypair *) o;
  lsh_string_free(i->public);
}
struct lsh_class keypair_class =
{
  STATIC_HEADER,
  NULL,
  "keypair",
  sizeof(struct keypair),
  do_keypair_mark,
  do_keypair_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:abstract_group:
*/
#ifndef GABA_DEFINE
struct abstract_group
{
  struct lsh_object super;
  mpz_t order;
  mpz_t generator;
  int (*(range))(struct abstract_group *self,mpz_t x);
  void (*(invert))(struct abstract_group *self,mpz_t res,mpz_t x);
  void (*(combine))(struct abstract_group *self,mpz_t res,mpz_t a,mpz_t b);
  int (*(add))(struct abstract_group *self,mpz_t res,mpz_t a,mpz_t b);
  int (*(subtract))(struct abstract_group *self,mpz_t res,mpz_t a,mpz_t b);
  void (*(power))(struct abstract_group *self,mpz_t res,mpz_t g,mpz_t e);
  void (*(small_power))(struct abstract_group *self,mpz_t res,mpz_t g,UINT32 e);
};
extern struct lsh_class abstract_group_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_abstract_group_free(struct lsh_object *o)
{
  struct abstract_group *i = (struct abstract_group *) o;
  mpz_clear(i->order);
  mpz_clear(i->generator);
}
struct lsh_class abstract_group_class =
{
  STATIC_HEADER,
  NULL,
  "abstract_group",
  sizeof(struct abstract_group),
  NULL,
  do_abstract_group_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:dh_method:
*/
#ifndef GABA_DEFINE
struct dh_method
{
  struct lsh_object super;
  struct abstract_group *G;
  struct hash_algorithm *H;
  struct randomness *random;
};
extern struct lsh_class dh_method_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_dh_method_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct dh_method *i = (struct dh_method *) o;
  mark((struct lsh_object *) i->G);
  mark((struct lsh_object *) i->H);
  mark((struct lsh_object *) i->random);
}
struct lsh_class dh_method_class =
{
  STATIC_HEADER,
  NULL,
  "dh_method",
  sizeof(struct dh_method),
  do_dh_method_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

#ifndef GABA_DEFINE
struct dh_instance
{
  struct dh_method *method;
  mpz_t e;
  mpz_t f;
  mpz_t secret;
  struct lsh_string *K;
  struct hash_instance *hash;
  struct lsh_string *exchange_hash;
};
extern void dh_instance_mark(struct dh_instance *i, 
    void (*mark)(struct lsh_object *o));
extern void dh_instance_free(struct dh_instance *i);
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
void dh_instance_mark(struct dh_instance *i, 
    void (*mark)(struct lsh_object *o))
{
  (void) mark; (void) i;
  mark((struct lsh_object *) i->method);
  mark((struct lsh_object *) i->hash);
}
void dh_instance_free(struct dh_instance *i)
{
  (void) i;
  mpz_clear(i->e);
  mpz_clear(i->f);
  mpz_clear(i->secret);
  lsh_string_free(i->K);
  lsh_string_free(i->exchange_hash);
}
#endif /* !GABA_DECLARE */

