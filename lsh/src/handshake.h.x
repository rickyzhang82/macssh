/*
CLASS:handshake_info:
*/
#ifndef GABA_DEFINE
struct handshake_info
{
  struct lsh_object super;
  UINT32 flags;
  UINT32 block_size;
  const char * id_comment;
  const char * debug_comment;
  struct randomness *random;
  struct alist *algorithms;
  struct ssh1_fallback *fallback;
};
extern struct lsh_class handshake_info_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_handshake_info_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct handshake_info *i = (struct handshake_info *) o;
  mark((struct lsh_object *) i->random);
  mark((struct lsh_object *) i->algorithms);
  mark((struct lsh_object *) i->fallback);
}
struct lsh_class handshake_info_class =
{
  STATIC_HEADER,
  NULL,
  "handshake_info",
  sizeof(struct handshake_info),
  do_handshake_info_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

