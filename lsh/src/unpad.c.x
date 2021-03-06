/*
CLASS:packet_unpad:abstract_write_pipe
*/
#ifndef GABA_DEFINE
struct packet_unpad
{
  struct abstract_write_pipe super;
  struct ssh_connection *connection;
};
extern struct lsh_class packet_unpad_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_packet_unpad_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct packet_unpad *i = (struct packet_unpad *) o;
  mark((struct lsh_object *) i->connection);
}
struct lsh_class packet_unpad_class =
{
  STATIC_HEADER,
  &(abstract_write_pipe_class),
  "packet_unpad",
  sizeof(struct packet_unpad),
  do_packet_unpad_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

