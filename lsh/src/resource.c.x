/*
CLASS:concrete_resource_list:resource_list
*/
#ifndef GABA_DEFINE
struct concrete_resource_list
{
  struct resource_list super;
  struct resource_node * q;
};
extern struct lsh_class concrete_resource_list_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_concrete_resource_list_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct concrete_resource_list *i = (struct concrete_resource_list *) o;
  do_mark_resources(&(i->q),
    mark);
}
static void
do_concrete_resource_list_free(struct lsh_object *o)
{
  struct concrete_resource_list *i = (struct concrete_resource_list *) o;
  do_free_resources(&(i->q));
}
struct lsh_class concrete_resource_list_class =
{
  STATIC_HEADER,
  &(resource_list_class),
  "concrete_resource_list",
  sizeof(struct concrete_resource_list),
  do_concrete_resource_list_mark,
  do_concrete_resource_list_free,
};
#endif /* !GABA_DECLARE */

