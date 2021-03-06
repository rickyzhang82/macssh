/*
CLASS:proxy_userauth:
*/
#ifndef GABA_DEFINE
struct proxy_userauth
{
  struct lsh_object super;
  void (*(proxy_auth))(struct proxy_userauth *self,struct ssh_connection *,struct lsh_string *username,UINT32 service,struct simple_buffer *args);
};
extern struct lsh_class proxy_userauth_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class proxy_userauth_class =
{
  STATIC_HEADER,
  NULL,
  "proxy_userauth",
  sizeof(struct proxy_userauth),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_userauth_success:packet_handler
*/
#ifndef GABA_DEFINE
struct proxy_userauth_success
{
  struct packet_handler super;
  struct lsh_string *name;
  struct command_continuation *c;
};
extern struct lsh_class proxy_userauth_success_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_userauth_success_mark(struct lsh_object *o,
  void (*mark)(struct lsh_object *o))
{
  struct proxy_userauth_success *i = (struct proxy_userauth_success *) o;
  mark((struct lsh_object *) i->c);
}
static void
do_proxy_userauth_success_free(struct lsh_object *o)
{
  struct proxy_userauth_success *i = (struct proxy_userauth_success *) o;
  lsh_string_free(i->name);
}
struct lsh_class proxy_userauth_success_class =
{
  STATIC_HEADER,
  &(packet_handler_class),
  "proxy_userauth_success",
  sizeof(struct proxy_userauth_success),
  do_proxy_userauth_success_mark,
  do_proxy_userauth_success_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_userauth_failure:packet_handler
*/
#ifndef GABA_DEFINE
struct proxy_userauth_failure
{
  struct packet_handler super;
  struct exception_handler *e;
};
extern struct lsh_class proxy_userauth_failure_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_userauth_failure_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_userauth_failure *i = (struct proxy_userauth_failure *) o;
  mark((struct lsh_object *) i->e);
}
struct lsh_class proxy_userauth_failure_class =
{
  STATIC_HEADER,
  &(packet_handler_class),
  "proxy_userauth_failure",
  sizeof(struct proxy_userauth_failure),
  do_proxy_userauth_failure_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_userauth_handler:packet_handler
*/
#ifndef GABA_DEFINE
struct proxy_userauth_handler
{
  struct packet_handler super;
  struct command_continuation *c;
  struct exception_handler *e;
  struct alist *methods;
  struct alist *services;
};
extern struct lsh_class proxy_userauth_handler_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_userauth_handler_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_userauth_handler *i = (struct proxy_userauth_handler *) o;
  mark((struct lsh_object *) i->c);
  mark((struct lsh_object *) i->e);
  mark((struct lsh_object *) i->methods);
  mark((struct lsh_object *) i->services);
}
struct lsh_class proxy_userauth_handler_class =
{
  STATIC_HEADER,
  &(packet_handler_class),
  "proxy_userauth_handler",
  sizeof(struct proxy_userauth_handler),
  do_proxy_userauth_handler_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:proxy_userauth_continuation:command_frame
*/
#ifndef GABA_DEFINE
struct proxy_userauth_continuation
{
  struct command_frame super;
  struct ssh_connection *connection;
};
extern struct lsh_class proxy_userauth_continuation_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_userauth_continuation_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_userauth_continuation *i = (struct proxy_userauth_continuation *) o;
  mark((struct lsh_object *) i->connection);
}
struct lsh_class proxy_userauth_continuation_class =
{
  STATIC_HEADER,
  &(command_frame_class),
  "proxy_userauth_continuation",
  sizeof(struct proxy_userauth_continuation),
  do_proxy_userauth_continuation_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

