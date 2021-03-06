/*
CLASS:resource:
*/
#ifndef GABA_DEFINE
struct resource
{
  struct lsh_object super;
  int alive;
  void (*(kill))(struct resource *self);
};
extern struct lsh_class resource_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_resource_free(struct lsh_object *o)
{
  struct resource *i = (struct resource *) o;
  dont_free_live_resource(i->alive);
}
struct lsh_class resource_class =
{
  STATIC_HEADER,
  NULL,
  "resource",
  sizeof(struct resource),
  NULL,
  do_resource_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:resource_list:resource
*/
#ifndef GABA_DEFINE
struct resource_list
{
  struct resource super;
  void (*(remember))(struct resource_list *self,struct resource *r);
};
extern struct lsh_class resource_list_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class resource_list_class =
{
  STATIC_HEADER,
  &(resource_class),
  "resource_list",
  sizeof(struct resource_list),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

