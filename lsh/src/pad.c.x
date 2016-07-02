/*
CLASS:packet_pad:abstract_write_pipe
*/
#ifndef GABA_DEFINE
struct packet_pad
{
  struct abstract_write_pipe super;
  struct ssh_connection *connection;
  struct randomness *random;
};
extern struct lsh_class packet_pad_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_packet_pad_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct packet_pad *i = (struct packet_pad *) o;
  mark((struct lsh_object *) i->connection);
  mark((struct lsh_object *) i->random);
}
struct lsh_class packet_pad_class =
{
  STATIC_HEADER,
  &(abstract_write_pipe_class),
  "packet_pad",
  sizeof(struct packet_pad),
  do_packet_pad_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

