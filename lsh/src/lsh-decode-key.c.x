/*
CLASS:lsh_decode_key_options:
*/
#ifndef GABA_DEFINE
struct lsh_decode_key_options
{
  struct lsh_object super;
  char * file;
  int base64;
  sexp_argp_state style;
};
extern struct lsh_class lsh_decode_key_options_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class lsh_decode_key_options_class =
{
  STATIC_HEADER,
  NULL,
  "lsh_decode_key_options",
  sizeof(struct lsh_decode_key_options),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:decode_key:abstract_write
*/
#ifndef GABA_DEFINE
struct decode_key
{
  struct abstract_write super;
  struct command_continuation *c;
  struct exception_handler *e;
};
extern struct lsh_class decode_key_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_decode_key_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct decode_key *i = (struct decode_key *) o;
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
}
struct lsh_class decode_key_class =
{
  STATIC_HEADER,
  &(abstract_write_class),
  "decode_key",
  sizeof(struct decode_key),
  do_decode_key_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

