/*
CLASS:sexp_print_command:command_2
*/
#ifndef GABA_DEFINE
struct sexp_print_command
{
  struct command_2 super;
  int format;
};
extern struct lsh_class sexp_print_command_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class sexp_print_command_class =
{
  STATIC_HEADER,
  &(command_2_class),
  "sexp_print_command",
  sizeof(struct sexp_print_command),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:read_sexp_command:command
*/
#ifndef GABA_DEFINE
struct read_sexp_command
{
  struct command super;
  int format;
  int goon;
  UINT32 max_size;
};
extern struct lsh_class read_sexp_command_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class read_sexp_command_class =
{
  STATIC_HEADER,
  &(command_class),
  "read_sexp_command",
  sizeof(struct read_sexp_command),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

