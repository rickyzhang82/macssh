/*
CLASS:read_line:read_handler
*/
#ifndef GABA_DEFINE
struct read_line
{
  struct read_handler super;
  struct line_handler *handler;
  struct exception_handler *e;
  UINT32 pos;
  UINT8 ((buffer)[MAX_LINE]);
};
extern struct lsh_class read_line_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_read_line_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct read_line *i = (struct read_line *) o;
  mark((struct lsh_object *) i->handler);
  mark((struct lsh_object *) i->e);
}
struct lsh_class read_line_class =
{
  STATIC_HEADER,
  &(read_handler_class),
  "read_line",
  sizeof(struct read_line),
  do_read_line_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

