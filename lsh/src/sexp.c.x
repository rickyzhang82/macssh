/*
CLASS:sexp_string:sexp
*/
#ifndef GABA_DEFINE
struct sexp_string
{
  struct sexp super;
  const struct lsh_string *display;
  const struct lsh_string *contents;
};
extern struct lsh_class sexp_string_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_sexp_string_free(struct lsh_object *o)
{
  struct sexp_string *i = (struct sexp_string *) o;
  lsh_string_free(i->display);
  lsh_string_free(i->contents);
}
struct lsh_class sexp_string_class =
{
  STATIC_HEADER,
  &(sexp_class),
  "sexp_string",
  sizeof(struct sexp_string),
  NULL,
  do_sexp_string_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:sexp_vector:sexp
*/
#ifndef GABA_DEFINE
struct sexp_vector
{
  struct sexp super;
  struct object_list *elements;
};
extern struct lsh_class sexp_vector_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_sexp_vector_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct sexp_vector *i = (struct sexp_vector *) o;
  mark((struct lsh_object *) i->elements);
}
struct lsh_class sexp_vector_class =
{
  STATIC_HEADER,
  &(sexp_class),
  "sexp_vector",
  sizeof(struct sexp_vector),
  do_sexp_vector_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:sexp_iter_vector:sexp_iterator
*/
#ifndef GABA_DEFINE
struct sexp_iter_vector
{
  struct sexp_iterator super;
  struct object_list *l;
  unsigned i;
};
extern struct lsh_class sexp_iter_vector_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_sexp_iter_vector_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct sexp_iter_vector *i = (struct sexp_iter_vector *) o;
  mark((struct lsh_object *) i->l);
}
struct lsh_class sexp_iter_vector_class =
{
  STATIC_HEADER,
  &(sexp_iterator_class),
  "sexp_iter_vector",
  sizeof(struct sexp_iter_vector),
  do_sexp_iter_vector_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

