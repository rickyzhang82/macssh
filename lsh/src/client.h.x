/*
CLASS:request_service:command
*/
#ifndef GABA_DEFINE
struct request_service
{
  struct command super;
  int service;
};
extern struct lsh_class request_service_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class request_service_class =
{
  STATIC_HEADER,
  &(command_class),
  "request_service",
  sizeof(struct request_service),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:escape_info:
*/
#ifndef GABA_DEFINE
struct escape_info
{
  struct lsh_object super;
  UINT8 escape;
  struct lsh_callback *((dispatch)[0x100]);
};
extern struct lsh_class escape_info_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_escape_info_mark(struct lsh_object *o,
  void (*mark)(struct lsh_object *o))
{
  struct escape_info *i = (struct escape_info *) o;
  {
    unsigned k1;
    for(k1=0; k1<0x100; k1++)
      mark((struct lsh_object *) (i->dispatch)[k1]);
  };
}
struct lsh_class escape_info_class =
{
  STATIC_HEADER,
  NULL,
  "escape_info",
  sizeof(struct escape_info),
  do_escape_info_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:client_options:
*/
#ifndef GABA_DEFINE
struct client_options
{
  struct lsh_object super;
  struct io_backend *backend;
  struct randomness_with_poll *random;
  struct interact *tty;
  int escape;
  struct exception_handler *handler;
  int * exit_code;
  int not;
  char * port;
  struct address_info *remote;
  char * local_user;
  char * user;
  int with_remote_peers;
  int with_pty;
  int with_x11;
  const char * stdin_file;
  const char * stdout_file;
  const char * stderr_file;
  int stdin_fork;
  int stdout_fork;
  int stderr_fork;
  int used_stdin;
  int used_pty;
  int used_x11;
  int start_shell;
  int remote_forward;
  struct object_queue actions;
};
extern struct lsh_class client_options_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_client_options_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct client_options *i = (struct client_options *) o;
  mark((struct lsh_object *) i->backend);
  mark((struct lsh_object *) i->random);
  mark((struct lsh_object *) i->tty);
  mark((struct lsh_object *) i->handler);
  mark((struct lsh_object *) i->remote);
  object_queue_mark(&(i->actions),
    mark);
}
static void
do_client_options_free(struct lsh_object *o)
{
  struct client_options *i = (struct client_options *) o;
  object_queue_free(&(i->actions));
}
struct lsh_class client_options_class =
{
  STATIC_HEADER,
  NULL,
  "client_options",
  sizeof(struct client_options),
  do_client_options_mark,
  do_client_options_free,
};
#endif /* !GABA_DECLARE */

