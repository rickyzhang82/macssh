/*
CLASS:logout_cleanup:exit_callback
*/
#ifndef GABA_DEFINE
struct logout_cleanup
{
  struct exit_callback super;
  struct resource *process;
  struct utmp (*(log));
  struct exit_callback *c;
};
extern struct lsh_class logout_cleanup_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_logout_cleanup_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct logout_cleanup *i = (struct logout_cleanup *) o;
  mark((struct lsh_object *) i->process);
  mark((struct lsh_object *) i->c);
}
static void
do_logout_cleanup_free(struct lsh_object *o)
{
  struct logout_cleanup *i = (struct logout_cleanup *) o;
  lsh_space_free(i->log);
}
struct lsh_class logout_cleanup_class =
{
  STATIC_HEADER,
  &(exit_callback_class),
  "logout_cleanup",
  sizeof(struct logout_cleanup),
  do_logout_cleanup_mark,
  do_logout_cleanup_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:process_resource:lsh_process
*/
#ifndef GABA_DEFINE
struct process_resource
{
  struct lsh_process super;
  pid_t pid;
  int signal;
};
extern struct lsh_class process_resource_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class process_resource_class =
{
  STATIC_HEADER,
  &(lsh_process_class),
  "process_resource",
  sizeof(struct process_resource),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:unix_user:lsh_user
*/
#ifndef GABA_DEFINE
struct unix_user
{
  struct lsh_user super;
  gid_t gid;
  struct unix_user_db *ctx;
  struct lsh_string *passwd;
  struct lsh_string *home;
  struct lsh_string *shell;
};
extern struct lsh_class unix_user_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_unix_user_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct unix_user *i = (struct unix_user *) o;
  mark((struct lsh_object *) i->ctx);
}
static void
do_unix_user_free(struct lsh_object *o)
{
  struct unix_user *i = (struct unix_user *) o;
  lsh_string_free(i->passwd);
  lsh_string_free(i->home);
  lsh_string_free(i->shell);
}
struct lsh_class unix_user_class =
{
  STATIC_HEADER,
  &(lsh_user_class),
  "unix_user",
  sizeof(struct unix_user),
  do_unix_user_mark,
  do_unix_user_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:pwhelper_callback:exit_callback
*/
#ifndef GABA_DEFINE
struct pwhelper_callback
{
  struct exit_callback super;
  struct unix_user *user;
  struct command_continuation *c;
  struct exception_handler *e;
};
extern struct lsh_class pwhelper_callback_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_pwhelper_callback_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct pwhelper_callback *i = (struct pwhelper_callback *) o;
  mark((struct lsh_object *) i->user);
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
}
struct lsh_class pwhelper_callback_class =
{
  STATIC_HEADER,
  &(exit_callback_class),
  "pwhelper_callback",
  sizeof(struct pwhelper_callback),
  do_pwhelper_callback_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:unix_user_db:user_db
*/
#ifndef GABA_DEFINE
struct unix_user_db
{
  struct user_db super;
  struct io_backend *backend;
  struct reap *reaper;
  const char * pw_helper;
  const char * login_shell;
  int allow_root;
};
extern struct lsh_class unix_user_db_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_unix_user_db_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct unix_user_db *i = (struct unix_user_db *) o;
  mark((struct lsh_object *) i->backend);
  mark((struct lsh_object *) i->reaper);
}
struct lsh_class unix_user_db_class =
{
  STATIC_HEADER,
  &(user_db_class),
  "unix_user_db",
  sizeof(struct unix_user_db),
  do_unix_user_db_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

