/*
CLASS:spki_exception:exception
*/
#ifndef GABA_DEFINE
struct spki_exception
{
  struct exception super;
  struct sexp *expr;
};
extern struct lsh_class spki_exception_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_exception_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_exception *i = (struct spki_exception *) o;
  mark((struct lsh_object *) i->expr);
}
struct lsh_class spki_exception_class =
{
  STATIC_HEADER,
  &(exception_class),
  "spki_exception",
  sizeof(struct spki_exception),
  do_spki_exception_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_subject:
*/
#ifndef GABA_DEFINE
struct spki_subject
{
  struct lsh_object super;
  struct sexp *key;
  struct verifier *verifier;
  struct lsh_string *sha1;
  struct lsh_string *md5;
};
extern struct lsh_class spki_subject_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_subject_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_subject *i = (struct spki_subject *) o;
  mark((struct lsh_object *) i->key);
  mark((struct lsh_object *) i->verifier);
}
static void
do_spki_subject_free(struct lsh_object *o)
{
  struct spki_subject *i = (struct spki_subject *) o;
  lsh_string_free(i->sha1);
  lsh_string_free(i->md5);
}
struct lsh_class spki_subject_class =
{
  STATIC_HEADER,
  NULL,
  "spki_subject",
  sizeof(struct spki_subject),
  do_spki_subject_mark,
  do_spki_subject_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_context:
*/
#ifndef GABA_DEFINE
struct spki_context
{
  struct lsh_object super;
  struct spki_subject *(*(lookup))(struct spki_context *self,struct sexp *e,struct verifier *v);
  void (*(add_tuple))(struct spki_context *self,struct spki_5_tuple *tuple);
  int (*(authorize))(struct spki_context *self,struct spki_subject *subject,struct sexp *access);
};
extern struct lsh_class spki_context_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class spki_context_class =
{
  STATIC_HEADER,
  NULL,
  "spki_context",
  sizeof(struct spki_context),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_tag:
*/
#ifndef GABA_DEFINE
struct spki_tag
{
  struct lsh_object super;
  int type;
  int (*(match))(struct spki_tag *self,struct sexp *);
};
extern struct lsh_class spki_tag_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class spki_tag_class =
{
  STATIC_HEADER,
  NULL,
  "spki_tag",
  sizeof(struct spki_tag),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_5_tuple:
*/
#ifndef GABA_DEFINE
struct spki_5_tuple
{
  struct lsh_object super;
  struct spki_subject *issuer;
  struct spki_subject *subject;
  int propagate;
  struct spki_tag *authorization;
  struct spki_validity validity;
};
extern struct lsh_class spki_5_tuple_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_5_tuple_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_5_tuple *i = (struct spki_5_tuple *) o;
  mark((struct lsh_object *) i->issuer);
  mark((struct lsh_object *) i->subject);
  mark((struct lsh_object *) i->authorization);
}
struct lsh_class spki_5_tuple_class =
{
  STATIC_HEADER,
  NULL,
  "spki_5_tuple",
  sizeof(struct spki_5_tuple),
  do_spki_5_tuple_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

