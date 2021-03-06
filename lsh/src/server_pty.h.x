/*
CLASS:pty_info:resource
*/
#ifndef GABA_DEFINE
struct pty_info
{
  struct resource super;
  int master;
  int slave;
  struct lsh_string *tty_name;
};
extern struct lsh_class pty_info_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_pty_info_free(struct lsh_object *o)
{
  struct pty_info *i = (struct pty_info *) o;
  lsh_string_free(i->tty_name);
}
struct lsh_class pty_info_class =
{
  STATIC_HEADER,
  &(resource_class),
  "pty_info",
  sizeof(struct pty_info),
  NULL,
  do_pty_info_free,
};
#endif /* !GABA_DECLARE */

