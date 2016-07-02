/*
CLASS:packet_encrypt:abstract_write_pipe
*/
#ifndef GABA_DEFINE
struct packet_encrypt
{
  struct abstract_write_pipe super;
  UINT32 sequence_number;
  struct ssh_connection *connection;
};
extern struct lsh_class packet_encrypt_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_packet_encrypt_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct packet_encrypt *i = (struct packet_encrypt *) o;
  mark((struct lsh_object *) i->connection);
}
struct lsh_class packet_encrypt_class =
{
  STATIC_HEADER,
  &(abstract_write_pipe_class),
  "packet_encrypt",
  sizeof(struct packet_encrypt),
  do_packet_encrypt_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

