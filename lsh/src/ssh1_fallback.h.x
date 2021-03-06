/*
CLASS:ssh1_fallback:
*/
#ifndef GABA_DEFINE
struct ssh1_fallback
{
  struct lsh_object super;
  void (*(fallback))(struct ssh1_fallback *self,int fd,UINT32 length,const UINT8 *line,struct exception_handler *e);
};
extern struct lsh_class ssh1_fallback_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class ssh1_fallback_class =
{
  STATIC_HEADER,
  NULL,
  "ssh1_fallback",
  sizeof(struct ssh1_fallback),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

