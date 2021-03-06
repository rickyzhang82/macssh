/*
CLASS:exc_connection_handler:exception_handler
*/
#ifndef GABA_DEFINE
struct exc_connection_handler
{
  struct exception_handler super;
  struct io_backend *backend;
  struct ssh_connection *connection;
};
extern struct lsh_class exc_connection_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_exc_connection_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct exc_connection_handler *i = (struct exc_connection_handler *) o;
  mark((struct lsh_object *) i->backend);
  mark((struct lsh_object *) i->connection);
}
struct lsh_class exc_connection_handler_class =
{
  STATIC_HEADER,
  &(exception_handler_class),
  "exc_connection_handler",
  sizeof(struct exc_connection_handler),
  do_exc_connection_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:connection_close_handler:lsh_callback
*/
#ifndef GABA_DEFINE
struct connection_close_handler
{
  struct lsh_callback super;
  struct ssh_connection *connection;
};
extern struct lsh_class connection_close_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_connection_close_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct connection_close_handler *i = (struct connection_close_handler *) o;
  mark((struct lsh_object *) i->connection);
}
struct lsh_class connection_close_handler_class =
{
  STATIC_HEADER,
  &(lsh_callback_class),
  "connection_close_handler",
  sizeof(struct connection_close_handler),
  do_connection_close_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

