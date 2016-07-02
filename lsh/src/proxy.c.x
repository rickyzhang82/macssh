/*
CLASS:exc_chain_connections_handler:exception_handler
*/
#ifndef GABA_DEFINE
struct exc_chain_connections_handler
{
  struct exception_handler super;
  struct ssh_connection *connection;
};
extern struct lsh_class exc_chain_connections_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_exc_chain_connections_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct exc_chain_connections_handler *i = (struct exc_chain_connections_handler *) o;
  mark((struct lsh_object *) i->connection);
}
struct lsh_class exc_chain_connections_handler_class =
{
  STATIC_HEADER,
  &(exception_handler_class),
  "exc_chain_connections_handler",
  sizeof(struct exc_chain_connections_handler),
  do_exc_chain_connections_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:chain_connections_continuation:command_continuation
*/
#ifndef GABA_DEFINE
struct chain_connections_continuation
{
  struct command_continuation super;
  struct ssh_connection *connection;
  struct command_continuation *up;
};
extern struct lsh_class chain_connections_continuation_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_chain_connections_continuation_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct chain_connections_continuation *i = (struct chain_connections_continuation *) o;
  mark((struct lsh_object *) i->connection);
  mark((struct lsh_object *) i->up);
}
struct lsh_class chain_connections_continuation_class =
{
  STATIC_HEADER,
  &(command_continuation_class),
  "chain_connections_continuation",
  sizeof(struct chain_connections_continuation),
  do_chain_connections_continuation_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:chain_connections_client:command_frame
*/
#ifndef GABA_DEFINE
struct chain_connections_client
{
  struct command_frame super;
  struct listen_value *client_addr;
  struct command *client_callback;
};
extern struct lsh_class chain_connections_client_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_chain_connections_client_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct chain_connections_client *i = (struct chain_connections_client *) o;
  mark((struct lsh_object *) i->client_addr);
  mark((struct lsh_object *) i->client_callback);
}
struct lsh_class chain_connections_client_class =
{
  STATIC_HEADER,
  &(command_frame_class),
  "chain_connections_client",
  sizeof(struct chain_connections_client),
  do_chain_connections_client_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_connection_service:command
*/
#ifndef GABA_DEFINE
struct proxy_connection_service
{
  struct command super;
  struct object_list *server_hooks;
  struct object_list *client_hooks;
};
extern struct lsh_class proxy_connection_service_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_connection_service_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_connection_service *i = (struct proxy_connection_service *) o;
  mark((struct lsh_object *) i->server_hooks);
  mark((struct lsh_object *) i->client_hooks);
}
struct lsh_class proxy_connection_service_class =
{
  STATIC_HEADER,
  &(command_class),
  "proxy_connection_service",
  sizeof(struct proxy_connection_service),
  do_proxy_connection_service_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

static struct lsh_object *
make_call_hooks(struct object_list *server_hooks,
  struct object_list *client_hooks)
  /* (B* (progn client_hooks) chained_connection (progn server_hooks)) */
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
  return MAKE_TRACE("make_call_hooks", 
    Bp3(A(PROGN,
        ((struct lsh_object *) client_hooks)),
      CHAINED_CONNECTION,
      A(PROGN,
        ((struct lsh_object *) server_hooks))));
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
CLASS:proxy_accept_service_handler:packet_handler
*/
#ifndef GABA_DEFINE
struct proxy_accept_service_handler
{
  struct packet_handler super;
  int name;
  struct command *service;
  struct command_continuation *c;
  struct exception_handler *e;
};
extern struct lsh_class proxy_accept_service_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_accept_service_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_accept_service_handler *i = (struct proxy_accept_service_handler *) o;
  mark((struct lsh_object *) i->service);
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
}
struct lsh_class proxy_accept_service_handler_class =
{
  STATIC_HEADER,
  &(packet_handler_class),
  "proxy_accept_service_handler",
  sizeof(struct proxy_accept_service_handler),
  do_proxy_accept_service_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_service_handler:packet_handler
*/
#ifndef GABA_DEFINE
struct proxy_service_handler
{
  struct packet_handler super;
  struct alist *services;
  struct command_continuation *c;
  struct exception_handler *e;
};
extern struct lsh_class proxy_service_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_service_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_service_handler *i = (struct proxy_service_handler *) o;
  mark((struct lsh_object *) i->services);
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
}
struct lsh_class proxy_service_handler_class =
{
  STATIC_HEADER,
  &(packet_handler_class),
  "proxy_service_handler",
  sizeof(struct proxy_service_handler),
  do_proxy_service_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_offer_service:command
*/
#ifndef GABA_DEFINE
struct proxy_offer_service
{
  struct command super;
  struct alist *services;
};
extern struct lsh_class proxy_offer_service_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_offer_service_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_offer_service *i = (struct proxy_offer_service *) o;
  mark((struct lsh_object *) i->services);
}
struct lsh_class proxy_offer_service_class =
{
  STATIC_HEADER,
  &(command_class),
  "proxy_offer_service",
  sizeof(struct proxy_offer_service),
  do_proxy_offer_service_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

