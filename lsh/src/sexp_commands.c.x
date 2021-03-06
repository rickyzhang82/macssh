/*
CLASS:sexp_parser:abstract_write
*/
#ifndef GABA_DEFINE
struct sexp_parser
{
  struct abstract_write super;
  int style;
  struct command_continuation *c;
  struct exception_handler *e;
};
extern struct lsh_class sexp_parser_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_sexp_parser_mark(struct lsh_object *o,
  void (*mark)(struct lsh_object *o))
{
  struct sexp_parser *i = (struct sexp_parser *) o;
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
}
struct lsh_class sexp_parser_class =
{
  STATIC_HEADER,
  &(abstract_write_class),
  "sexp_parser",
  sizeof(struct sexp_parser),
  do_sexp_parser_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
for_sexp(struct command *handler)
  /* (B (catch_sexp handler) (C B read_sexp)) */
#define A GABA_APPLY
#define I GABA_VALUE_I
#define K GABA_VALUE_K
#define K1 GABA_APPLY_K_1
#define S GABA_VALUE_S
#define S1 GABA_APPLY_S_1
#define S2 GABA_APPLY_S_2
#define B GABA_VALUE_B
#define B1 GABA_APPLY_B_1
#define B2 GABA_APPLY_B_2
#define C GABA_VALUE_C
#define C1 GABA_APPLY_C_1
#define C2 GABA_APPLY_C_2
#define Sp GABA_VALUE_Sp
#define Sp1 GABA_APPLY_Sp_1
#define Sp2 GABA_APPLY_Sp_2
#define Sp3 GABA_APPLY_Sp_3
#define Bp GABA_VALUE_Bp
#define Bp1 GABA_APPLY_Bp_1
#define Bp2 GABA_APPLY_Bp_2
#define Bp3 GABA_APPLY_Bp_3
#define Cp GABA_VALUE_Cp
#define Cp1 GABA_APPLY_Cp_1
#define Cp2 GABA_APPLY_Cp_2
#define Cp3 GABA_APPLY_Cp_3
{
  return MAKE_TRACE("for_sexp", 
    B2(A(CATCH_SEXP,
        ((struct lsh_object *) handler)),
      C2(B,
        READ_SEXP)));
}
#undef A
#undef I
#undef K
#undef K1
#undef S
#undef S1
#undef S2
#undef B
#undef B1
#undef B2
#undef C
#undef C1
#undef C2
#undef Sp
#undef Sp1
#undef Sp2
#undef Sp3
#undef Bp
#undef Bp1
#undef Bp2
#undef Bp3
#undef Cp
#undef Cp1
#undef Cp2
#undef Cp3
