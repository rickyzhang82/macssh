/*
CLASS:server_session:ssh_channel
*/
#ifndef GABA_DEFINE
struct server_session
{
  struct ssh_channel super;
  UINT32 initial_window;
  struct lsh_process *process;
  struct pty_info *pty;
  struct lsh_string *term;
  struct lsh_fd *in;
  struct lsh_fd *out;
  struct lsh_fd *err;
};
extern struct lsh_class server_session_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_server_session_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct server_session *i = (struct server_session *) o;
  mark((struct lsh_object *) i->process);
  mark((struct lsh_object *) i->pty);
  mark((struct lsh_object *) i->in);
  mark((struct lsh_object *) i->out);
  mark((struct lsh_object *) i->err);
}
static void
do_server_session_free(struct lsh_object *o)
{
  struct server_session *i = (struct server_session *) o;
  lsh_string_free(i->term);
}
struct lsh_class server_session_class =
{
  STATIC_HEADER,
  &(ssh_channel_class),
  "server_session",
  sizeof(struct server_session),
  do_server_session_mark,
  do_server_session_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:open_session:channel_open
*/
#ifndef GABA_DEFINE
struct open_session
{
  struct channel_open super;
  struct alist *session_requests;
};
extern struct lsh_class open_session_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_open_session_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct open_session *i = (struct open_session *) o;
  mark((struct lsh_object *) i->session_requests);
}
struct lsh_class open_session_class =
{
  STATIC_HEADER,
  &(channel_open_class),
  "open_session",
  sizeof(struct open_session),
  do_open_session_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:exit_shell:exit_callback
*/
#ifndef GABA_DEFINE
struct exit_shell
{
  struct exit_callback super;
  struct server_session *session;
};
extern struct lsh_class exit_shell_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_exit_shell_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct exit_shell *i = (struct exit_shell *) o;
  mark((struct lsh_object *) i->session);
}
struct lsh_class exit_shell_class =
{
  STATIC_HEADER,
  &(exit_callback_class),
  "exit_shell",
  sizeof(struct exit_shell),
  do_exit_shell_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:shell_request:channel_request
*/
#ifndef GABA_DEFINE
struct shell_request
{
  struct channel_request super;
  struct io_backend *backend;
};
extern struct lsh_class shell_request_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_shell_request_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct shell_request *i = (struct shell_request *) o;
  mark((struct lsh_object *) i->backend);
}
struct lsh_class shell_request_class =
{
  STATIC_HEADER,
  &(channel_request_class),
  "shell_request",
  sizeof(struct shell_request),
  do_shell_request_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:subsystem_request:shell_request
*/
#ifndef GABA_DEFINE
struct subsystem_request
{
  struct shell_request super;
  const char ** subsystems;
};
extern struct lsh_class subsystem_request_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class subsystem_request_class =
{
  STATIC_HEADER,
  &(shell_request_class),
  "subsystem_request",
  sizeof(struct subsystem_request),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

