/*
CLASS:exit_callback:
*/
#ifndef GABA_DEFINE
struct exit_callback
{
  struct lsh_object super;
  void (*(exit))(struct exit_callback *self,int signaled,int core,int value);
};
extern struct lsh_class exit_callback_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class exit_callback_class =
{
  STATIC_HEADER,
  NULL,
  "exit_callback",
  sizeof(struct exit_callback),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:reap:
*/
#ifndef GABA_DEFINE
struct reap
{
  struct lsh_object super;
  void (*(reap))(struct reap *self,pid_t pid,struct exit_callback *callback);
};
extern struct lsh_class reap_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class reap_class =
{
  STATIC_HEADER,
  NULL,
  "reap",
  sizeof(struct reap),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

