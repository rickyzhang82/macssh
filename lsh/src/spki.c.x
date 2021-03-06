/*
CLASS:spki_tag_atom:spki_tag
*/
#ifndef GABA_DEFINE
struct spki_tag_atom
{
  struct spki_tag super;
  struct sexp *resource;
};
extern struct lsh_class spki_tag_atom_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_tag_atom_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_tag_atom *i = (struct spki_tag_atom *) o;
  mark((struct lsh_object *) i->resource);
}
struct lsh_class spki_tag_atom_class =
{
  STATIC_HEADER,
  &(spki_tag_class),
  "spki_tag_atom",
  sizeof(struct spki_tag_atom),
  do_spki_tag_atom_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_tag_list:spki_tag
*/
#ifndef GABA_DEFINE
struct spki_tag_list
{
  struct spki_tag super;
  struct object_list *list;
};
extern struct lsh_class spki_tag_list_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_tag_list_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_tag_list *i = (struct spki_tag_list *) o;
  mark((struct lsh_object *) i->list);
}
struct lsh_class spki_tag_list_class =
{
  STATIC_HEADER,
  &(spki_tag_class),
  "spki_tag_list",
  sizeof(struct spki_tag_list),
  do_spki_tag_list_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_tag_set:spki_tag
*/
#ifndef GABA_DEFINE
struct spki_tag_set
{
  struct spki_tag super;
  struct object_list *set;
};
extern struct lsh_class spki_tag_set_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_tag_set_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_tag_set *i = (struct spki_tag_set *) o;
  mark((struct lsh_object *) i->set);
}
struct lsh_class spki_tag_set_class =
{
  STATIC_HEADER,
  &(spki_tag_class),
  "spki_tag_set",
  sizeof(struct spki_tag_set),
  do_spki_tag_set_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_tag_prefix:spki_tag
*/
#ifndef GABA_DEFINE
struct spki_tag_prefix
{
  struct spki_tag super;
  struct sexp *prefix;
};
extern struct lsh_class spki_tag_prefix_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_tag_prefix_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_tag_prefix *i = (struct spki_tag_prefix *) o;
  mark((struct lsh_object *) i->prefix);
}
struct lsh_class spki_tag_prefix_class =
{
  STATIC_HEADER,
  &(spki_tag_class),
  "spki_tag_prefix",
  sizeof(struct spki_tag_prefix),
  do_spki_tag_prefix_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_state:spki_context
*/
#ifndef GABA_DEFINE
struct spki_state
{
  struct spki_context super;
  struct alist *algorithms;
  struct object_queue keys;
  struct object_queue db;
};
extern struct lsh_class spki_state_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_state_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_state *i = (struct spki_state *) o;
  mark((struct lsh_object *) i->algorithms);
  object_queue_mark(&(i->keys),
    mark);
  object_queue_mark(&(i->db),
    mark);
}
static void
do_spki_state_free(struct lsh_object *o)
{
  struct spki_state *i = (struct spki_state *) o;
  object_queue_free(&(i->keys));
  object_queue_free(&(i->db));
}
struct lsh_class spki_state_class =
{
  STATIC_HEADER,
  &(spki_context_class),
  "spki_state",
  sizeof(struct spki_state),
  do_spki_state_mark,
  do_spki_state_free,
};
#endif /* !GABA_DECLARE */

