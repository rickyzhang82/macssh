/*
CLASS:lsh_signal_handler:resource
*/
#ifndef GABA_DEFINE
struct lsh_signal_handler
{
  struct resource super;
  struct lsh_signal_handler *next;
  volatile sig_atomic_t * flag;
  struct lsh_callback *action;
};
extern struct lsh_class lsh_signal_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_lsh_signal_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct lsh_signal_handler *i = (struct lsh_signal_handler *) o;
  mark((struct lsh_object *) i->next);
  mark((struct lsh_object *) i->action);
}
struct lsh_class lsh_signal_handler_class =
{
  STATIC_HEADER,
  &(resource_class),
  "lsh_signal_handler",
  sizeof(struct lsh_signal_handler),
  do_lsh_signal_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:lsh_callout:resource
*/
#ifndef GABA_DEFINE
struct lsh_callout
{
  struct resource super;
  struct lsh_callout *next;
  struct lsh_callback *action;
};
extern struct lsh_class lsh_callout_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_lsh_callout_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct lsh_callout *i = (struct lsh_callout *) o;
  mark((struct lsh_object *) i->next);
  mark((struct lsh_object *) i->action);
}
struct lsh_class lsh_callout_class =
{
  STATIC_HEADER,
  &(resource_class),
  "lsh_callout",
  sizeof(struct lsh_callout),
  do_lsh_callout_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:io_backend:resource
*/
#ifndef GABA_DEFINE
struct io_backend
{
  struct resource super;
  struct lsh_fd *files;
  struct lsh_signal_handler *signals;
  struct lsh_callout *callouts;
};
extern struct lsh_class io_backend_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_io_backend_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct io_backend *i = (struct io_backend *) o;
  mark((struct lsh_object *) i->files);
  mark((struct lsh_object *) i->signals);
  mark((struct lsh_object *) i->callouts);
}
struct lsh_class io_backend_class =
{
  STATIC_HEADER,
  &(resource_class),
  "io_backend",
  sizeof(struct io_backend),
  do_io_backend_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:io_listen_callback:io_callback
*/
#ifndef GABA_DEFINE
struct io_listen_callback
{
  struct io_callback super;
  struct io_backend *backend;
  struct command_continuation *c;
  struct exception_handler *e;
};
extern struct lsh_class io_listen_callback_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_io_listen_callback_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct io_listen_callback *i = (struct io_listen_callback *) o;
  mark((struct lsh_object *) i->backend);
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
}
struct lsh_class io_listen_callback_class =
{
  STATIC_HEADER,
  &(io_callback_class),
  "io_listen_callback",
  sizeof(struct io_listen_callback),
  do_io_listen_callback_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:io_connect_callback:io_callback
*/
#ifndef GABA_DEFINE
struct io_connect_callback
{
  struct io_callback super;
  struct command_continuation *c;
};
extern struct lsh_class io_connect_callback_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_io_connect_callback_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct io_connect_callback *i = (struct io_connect_callback *) o;
  mark((struct lsh_object *) i->c);
}
struct lsh_class io_connect_callback_class =
{
  STATIC_HEADER,
  &(io_callback_class),
  "io_connect_callback",
  sizeof(struct io_connect_callback),
  do_io_connect_callback_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:exc_finish_read_handler:exception_handler
*/
#ifndef GABA_DEFINE
struct exc_finish_read_handler
{
  struct exception_handler super;
  struct lsh_fd *fd;
};
extern struct lsh_class exc_finish_read_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_exc_finish_read_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct exc_finish_read_handler *i = (struct exc_finish_read_handler *) o;
  mark((struct lsh_object *) i->fd);
}
struct lsh_class exc_finish_read_handler_class =
{
  STATIC_HEADER,
  &(exception_handler_class),
  "exc_finish_read_handler",
  sizeof(struct exc_finish_read_handler),
  do_exc_finish_read_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

