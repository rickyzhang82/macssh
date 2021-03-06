/*
CLASS:lshd_options:algorithms_options
*/
#ifndef GABA_DEFINE
struct lshd_options
{
  struct algorithms_options super;
  struct io_backend *backend;
  struct exception_handler *e;
  struct reap *reaper;
  struct randomness_with_poll *random;
  struct alist *signature_algorithms;
  sexp_argp_state style;
  char * interface;
  char * port;
  char * hostkey;
  struct address_info *local;
  int with_srp_keyexchange;
  int with_dh_keyexchange;
  struct int_list *kex_algorithms;
  int with_publickey;
  int with_password;
  int allow_root;
  const char * pw_helper;
  const char * login_shell;
  int with_tcpip_forward;
  int with_pty;
  const char ** subsystems;
  struct int_list *userauth_methods;
  struct alist *userauth_algorithms;
  struct ssh1_fallback *sshd1;
  int daemonic;
  int no_syslog;
  int corefile;
  const char * pid_file;
  int use_pid_file;
};
extern struct lsh_class lshd_options_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_lshd_options_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct lshd_options *i = (struct lshd_options *) o;
  mark((struct lsh_object *) i->backend);
  mark((struct lsh_object *) i->e);
  mark((struct lsh_object *) i->reaper);
  mark((struct lsh_object *) i->random);
  mark((struct lsh_object *) i->signature_algorithms);
  mark((struct lsh_object *) i->local);
  mark((struct lsh_object *) i->kex_algorithms);
  mark((struct lsh_object *) i->userauth_methods);
  mark((struct lsh_object *) i->userauth_algorithms);
  mark((struct lsh_object *) i->sshd1);
}
struct lsh_class lshd_options_class =
{
  STATIC_HEADER,
  &(algorithms_options_class),
  "lshd_options",
  sizeof(struct lshd_options),
  do_lshd_options_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
make_lshd_listen(struct io_backend *backend,
  struct handshake_info *handshake,
  struct make_kexinit *init,
  struct command *services)
  /* (S (B (C (C* listen_callback (C* (B* services) (S (B (connection_handshake handshake) (kexinit_filter init)) I) log_peer) backend)) options2local) (S (B spki_read_hostkeys options2signature_algorithms) options2keyfile)) */
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
  return MAKE_TRACE("make_lshd_listen", 
    S2(B2(C1(Cp3(LISTEN_CALLBACK,
            Cp3(Bp1(((struct lsh_object *) services)),
              S2(B2(A(CONNECTION_HANDSHAKE,
                    ((struct lsh_object *) handshake)),
                  A(KEXINIT_FILTER,
                    ((struct lsh_object *) init))),
                I),
              LOG_PEER),
            ((struct lsh_object *) backend))),
        OPTIONS2LOCAL),
      S2(B2(SPKI_READ_HOSTKEYS,
          OPTIONS2SIGNATURE_ALGORITHMS),
        OPTIONS2KEYFILE)));
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
static struct lsh_object *
make_lshd_connection_service(struct object_list *hooks)
  /* (B* (progn hooks) init_connection_service connection_require_userauth) */
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
  return MAKE_TRACE("make_lshd_connection_service", 
    Bp3(A(PROGN,
        ((struct lsh_object *) hooks)),
      INIT_CONNECTION_SERVICE,
      CONNECTION_REQUIRE_USERAUTH));
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
