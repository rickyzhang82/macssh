/*
CLASS:sshd1:ssh1_fallback
*/
#ifndef GABA_DEFINE
struct sshd1
{
  struct ssh1_fallback super;
  char * sshd1;
};
extern struct lsh_class sshd1_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class sshd1_class =
{
  STATIC_HEADER,
  &(ssh1_fallback_class),
  "sshd1",
  sizeof(struct sshd1),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

