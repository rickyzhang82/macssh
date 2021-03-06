/*
CLASS:lsh_proxy_options:algorithms_options
*/
#ifndef GABA_DEFINE
struct lsh_proxy_options
{
  struct algorithms_options super;
  struct io_backend *backend;
  struct randomness_with_poll *random;
  struct alist *signature_algorithms;
  sexp_argp_state style;
  char * interface;
  char * port;
  char * hostkey;
  struct address_info *local;
  struct address_info *destination;
  int with_tcpip_forward;
  int with_x11_forward;
  int with_agent_forward;
  int daemonic;
  int corefile;
  const char * pid_file;
  int use_pid_file;
};
extern struct lsh_class lsh_proxy_options_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_lsh_proxy_options_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct lsh_proxy_options *i = (struct lsh_proxy_options *) o;
  mark((struct lsh_object *) i->backend);
  mark((struct lsh_object *) i->random);
  mark((struct lsh_object *) i->signature_algorithms);
  mark((struct lsh_object *) i->local);
  mark((struct lsh_object *) i->destination);
}
struct lsh_class lsh_proxy_options_class =
{
  STATIC_HEADER,
  &(algorithms_options_class),
  "lsh_proxy_options",
  sizeof(struct lsh_proxy_options),
  do_lsh_proxy_options_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:fake_host_db:lookup_verifier
*/
#ifndef GABA_DEFINE
struct fake_host_db
{
  struct lookup_verifier super;
};
extern struct lsh_class fake_host_db_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class fake_host_db_class =
{
  STATIC_HEADER,
  &(lookup_verifier_class),
  "fake_host_db",
  sizeof(struct fake_host_db),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
lsh_proxy_listen(struct io_backend *backend,
  struct command *services,
  struct command *handshake_server,
  struct command *handshake_client)
  /* (S (C (B* listen_callback (B services) (S (B chain_connections handshake_server) handshake_client)) backend) options2local) */
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
  return MAKE_TRACE("lsh_proxy_listen", 
    S2(C2(Bp3(LISTEN_CALLBACK,
          B1(((struct lsh_object *) services)),
          S2(B2(CHAIN_CONNECTIONS,
              ((struct lsh_object *) handshake_server)),
            ((struct lsh_object *) handshake_client))),
        ((struct lsh_object *) backend)),
      OPTIONS2LOCAL));
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
lsh_proxy_handshake_client(struct handshake_info *handshake,
  struct make_kexinit *init)
  /* (C (B* B (connection_handshake handshake init) (S (B spki_read_hostkeys options2signature_algorithms) options2keyfile)) log_peer) */
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
  return MAKE_TRACE("lsh_proxy_handshake_client", 
    C2(Bp3(B,
        A(A(CONNECTION_HANDSHAKE,
            ((struct lsh_object *) handshake)),
          ((struct lsh_object *) init)),
        S2(B2(SPKI_READ_HOSTKEYS,
            OPTIONS2SIGNATURE_ALGORITHMS),
          OPTIONS2KEYFILE)),
      LOG_PEER));
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
lsh_proxy_handshake_server(struct command *connect,
  struct lookup_verifier *verifier,
  struct handshake_info *handshake,
  struct make_kexinit *init)
  /* (B* (B init_connection_service) (B* (connection_handshake handshake init verifier) connect) proxy_destination) */
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
  return MAKE_TRACE("lsh_proxy_handshake_server", 
    Bp3(B1(INIT_CONNECTION_SERVICE),
      Bp2(A(A(A(CONNECTION_HANDSHAKE,
              ((struct lsh_object *) handshake)),
            ((struct lsh_object *) init)),
          ((struct lsh_object *) verifier)),
        ((struct lsh_object *) connect)),
      PROXY_DESTINATION));
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
lsh_proxy_services(struct command *userauth)
  /* (S userauth I) */
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
  return MAKE_TRACE("lsh_proxy_services", 
    S2(((struct lsh_object *) userauth),
      I));
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
lsh_proxy_connection_service(struct command *login)
  /* (C* B login init_connection_service) */
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
  return MAKE_TRACE("lsh_proxy_connection_service", 
    Cp3(B,
      ((struct lsh_object *) login),
      INIT_CONNECTION_SERVICE));
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
