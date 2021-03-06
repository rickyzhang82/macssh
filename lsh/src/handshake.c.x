/*
CLASS:connection_line_handler:line_handler
*/
#ifndef GABA_DEFINE
struct connection_line_handler
{
  struct line_handler super;
  struct ssh_connection *connection;
  int fd;
  struct ssh1_fallback *fallback;
};
extern struct lsh_class connection_line_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_connection_line_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct connection_line_handler *i = (struct connection_line_handler *) o;
  mark((struct lsh_object *) i->connection);
  mark((struct lsh_object *) i->fallback);
}
struct lsh_class connection_line_handler_class =
{
  STATIC_HEADER,
  &(line_handler_class),
  "connection_line_handler",
  sizeof(struct connection_line_handler),
  do_connection_line_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:handshake_command_2:command
*/
#ifndef GABA_DEFINE
struct handshake_command_2
{
  struct command super;
  struct handshake_info *info;
  struct make_kexinit *init;
  struct lsh_object *extra;
};
extern struct lsh_class handshake_command_2_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_handshake_command_2_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct handshake_command_2 *i = (struct handshake_command_2 *) o;
  mark((struct lsh_object *) i->info);
  mark((struct lsh_object *) i->init);
  mark((struct lsh_object *) i->extra);
}
struct lsh_class handshake_command_2_class =
{
  STATIC_HEADER,
  &(command_class),
  "handshake_command_2",
  sizeof(struct handshake_command_2),
  do_handshake_command_2_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

