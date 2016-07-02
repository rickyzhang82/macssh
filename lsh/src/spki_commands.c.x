/*
CLASS:spki_hash:command
*/
#ifndef GABA_DEFINE
struct spki_hash
{
  struct command super;
  int name;
  struct hash_algorithm *algorithm;
};
extern struct lsh_class spki_hash_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_hash_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_hash *i = (struct spki_hash *) o;
  mark((struct lsh_object *) i->algorithm);
}
struct lsh_class spki_hash_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_hash",
  sizeof(struct spki_hash),
  do_spki_hash_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_parse_key:command
*/
#ifndef GABA_DEFINE
struct spki_parse_key
{
  struct command super;
  struct alist *algorithms;
};
extern struct lsh_class spki_parse_key_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_parse_key_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_parse_key *i = (struct spki_parse_key *) o;
  mark((struct lsh_object *) i->algorithms);
}
struct lsh_class spki_parse_key_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_parse_key",
  sizeof(struct spki_parse_key),
  do_spki_parse_key_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_command:command
*/
#ifndef GABA_DEFINE
struct spki_command
{
  struct command super;
  struct spki_context *ctx;
};
extern struct lsh_class spki_command_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_command_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_command *i = (struct spki_command *) o;
  mark((struct lsh_object *) i->ctx);
}
struct lsh_class spki_command_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_command",
  sizeof(struct spki_command),
  do_spki_command_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
spki_read_acl(struct alist *algorithms)
  /* (S (C (S (B for_sexp K) spki_add_acl)) (B spki_make_context (prog1 algorithms))) */
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
  return MAKE_TRACE("spki_read_acl", 
    S2(C1(S2(B2(FOR_SEXP,
            K),
          SPKI_ADD_ACL)),
      B2(SPKI_MAKE_CONTEXT,
        A(PROG1,
          ((struct lsh_object *) algorithms)))));
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
/*
CLASS:spki_read_hostkey_context:command
*/
#ifndef GABA_DEFINE
struct spki_read_hostkey_context
{
  struct command super;
  struct alist *keys;
};
extern struct lsh_class spki_read_hostkey_context_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_read_hostkey_context_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_read_hostkey_context *i = (struct spki_read_hostkey_context *) o;
  mark((struct lsh_object *) i->keys);
}
struct lsh_class spki_read_hostkey_context_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_read_hostkey_context",
  sizeof(struct spki_read_hostkey_context),
  do_spki_read_hostkey_context_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
spki_read_hostkeys(struct alist *algorithms)
  /* (S (C (S (B* for_sexp (B return_hostkeys) prog1) (C B (sexp2keypair algorithms)))) spki_add_hostkey) */
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
  return MAKE_TRACE("spki_read_hostkeys", 
    S2(C1(S2(Bp3(FOR_SEXP,
            B1(RETURN_HOSTKEYS),
            PROG1),
          C2(B,
            A(SEXP2KEYPAIR,
              ((struct lsh_object *) algorithms))))),
      SPKI_ADD_HOSTKEY));
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
/*
CLASS:spki_read_userkey_context:command
*/
#ifndef GABA_DEFINE
struct spki_read_userkey_context
{
  struct command super;
  struct object_queue keys;
};
extern struct lsh_class spki_read_userkey_context_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_read_userkey_context_mark(struct lsh_object *o,
  void (*mark)(struct lsh_object *o))
{
  struct spki_read_userkey_context *i = (struct spki_read_userkey_context *) o;
  object_queue_mark(&(i->keys),
    mark);
}
static void
do_spki_read_userkey_context_free(struct lsh_object *o)
{
  struct spki_read_userkey_context *i = (struct spki_read_userkey_context *) o;
  object_queue_free(&(i->keys));
}
struct lsh_class spki_read_userkey_context_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_read_userkey_context",
  sizeof(struct spki_read_userkey_context),
  do_spki_read_userkey_context_mark,
  do_spki_read_userkey_context_free,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
spki_read_userkeys(struct alist *algorithms,
  struct command *decrypt)
  /* (S (C (S (B* for_sexp (B return_userkeys) prog1) (C (C B* (sexp2keypair algorithms)) decrypt))) spki_add_userkey) */
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
  return MAKE_TRACE("spki_read_userkeys", 
    S2(C1(S2(Bp3(FOR_SEXP,
            B1(RETURN_USERKEYS),
            PROG1),
          C2(C2(Bp,
              A(SEXP2KEYPAIR,
                ((struct lsh_object *) algorithms))),
            ((struct lsh_object *) decrypt)))),
      SPKI_ADD_USERKEY));
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
/*
CLASS:spki_password_encrypt:command
*/
#ifndef GABA_DEFINE
struct spki_password_encrypt
{
  struct command super;
  struct lsh_string *label;
  struct sexp *method;
  int algorithm_name;
  struct crypto_algorithm *algorithm;
  struct randomness *r;
  struct lsh_string *key;
};
extern struct lsh_class spki_password_encrypt_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_password_encrypt_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_password_encrypt *i = (struct spki_password_encrypt *) o;
  mark((struct lsh_object *) i->method);
  mark((struct lsh_object *) i->algorithm);
  mark((struct lsh_object *) i->r);
}
static void
do_spki_password_encrypt_free(struct lsh_object *o)
{
  struct spki_password_encrypt *i = (struct spki_password_encrypt *) o;
  lsh_string_free(i->label);
  lsh_string_free(i->key);
}
struct lsh_class spki_password_encrypt_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_password_encrypt",
  sizeof(struct spki_password_encrypt),
  do_spki_password_encrypt_mark,
  do_spki_password_encrypt_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:spki_password_decrypt:command
*/
#ifndef GABA_DEFINE
struct spki_password_decrypt
{
  struct command super;
  struct alist *mac_algorithms;
  struct alist *crypto_algorithms;
  struct interact *tty;
};
extern struct lsh_class spki_password_decrypt_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_spki_password_decrypt_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct spki_password_decrypt *i = (struct spki_password_decrypt *) o;
  mark((struct lsh_object *) i->mac_algorithms);
  mark((struct lsh_object *) i->crypto_algorithms);
  mark((struct lsh_object *) i->tty);
}
struct lsh_class spki_password_decrypt_class =
{
  STATIC_HEADER,
  &(command_class),
  "spki_password_decrypt",
  sizeof(struct spki_password_decrypt),
  do_spki_password_decrypt_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

