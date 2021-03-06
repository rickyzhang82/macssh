/*
CLASS:unix_random:random_poll
*/
#ifndef GABA_DEFINE
struct unix_random
{
  struct random_poll super;
  struct reap *reaper;
  uid_t poll_uid;
  pid_t pid;
  enum poll_status status;
  int fd;
  time_t previous_time;
  unsigned time_count;
};
extern struct lsh_class unix_random_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_unix_random_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct unix_random *i = (struct unix_random *) o;
  mark((struct lsh_object *) i->reaper);
}
struct lsh_class unix_random_class =
{
  STATIC_HEADER,
  &(random_poll_class),
  "unix_random",
  sizeof(struct unix_random),
  do_unix_random_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:unix_random_callback:exit_callback
*/
#ifndef GABA_DEFINE
struct unix_random_callback
{
  struct exit_callback super;
  struct unix_random *ctx;
};
extern struct lsh_class unix_random_callback_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_unix_random_callback_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct unix_random_callback *i = (struct unix_random_callback *) o;
  mark((struct lsh_object *) i->ctx);
}
struct lsh_class unix_random_callback_class =
{
  STATIC_HEADER,
  &(exit_callback_class),
  "unix_random_callback",
  sizeof(struct unix_random_callback),
  do_unix_random_callback_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

