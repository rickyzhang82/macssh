/*
CLASS:proxy_user:
*/
#ifndef GABA_DEFINE
struct proxy_user
{
  struct lsh_object super;
  struct lsh_string *name;
};
extern struct lsh_class proxy_user_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_user_free(struct lsh_object *o)
{
  struct proxy_user *i = (struct proxy_user *) o;
  lsh_string_free(i->name);
}
struct lsh_class proxy_user_class =
{
  STATIC_HEADER,
  NULL,
  "proxy_user",
  sizeof(struct proxy_user),
  NULL,
  do_proxy_user_free,
};
#endif /* !GABA_DECLARE */

