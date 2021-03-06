/*
CLASS:rsa_verifier:verifier
*/
#ifndef GABA_DEFINE
struct rsa_verifier
{
  struct verifier super;
  struct rsa_algorithm *params;
  unsigned size;
  mpz_t n;
  mpz_t e;
};
extern struct lsh_class rsa_verifier_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_rsa_verifier_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct rsa_verifier *i = (struct rsa_verifier *) o;
  mark((struct lsh_object *) i->params);
}
static void
do_rsa_verifier_free(struct lsh_object *o)
{
  struct rsa_verifier *i = (struct rsa_verifier *) o;
  mpz_clear(i->n);
  mpz_clear(i->e);
}
struct lsh_class rsa_verifier_class =
{
  STATIC_HEADER,
  &(verifier_class),
  "rsa_verifier",
  sizeof(struct rsa_verifier),
  do_rsa_verifier_mark,
  do_rsa_verifier_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:rsa_signer:signer
*/
#ifndef GABA_DEFINE
struct rsa_signer
{
  struct signer super;
  struct rsa_verifier *verifier;
  mpz_t d;
  mpz_t p;
  mpz_t q;
  mpz_t a;
  mpz_t b;
  mpz_t c;
};
extern struct lsh_class rsa_signer_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_rsa_signer_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct rsa_signer *i = (struct rsa_signer *) o;
  mark((struct lsh_object *) i->verifier);
}
static void
do_rsa_signer_free(struct lsh_object *o)
{
  struct rsa_signer *i = (struct rsa_signer *) o;
  mpz_clear(i->d);
  mpz_clear(i->p);
  mpz_clear(i->q);
  mpz_clear(i->a);
  mpz_clear(i->b);
  mpz_clear(i->c);
}
struct lsh_class rsa_signer_class =
{
  STATIC_HEADER,
  &(signer_class),
  "rsa_signer",
  sizeof(struct rsa_signer),
  do_rsa_signer_mark,
  do_rsa_signer_free,
};
#endif /* !GABA_DECLARE */

