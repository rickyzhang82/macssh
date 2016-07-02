/*
CLASS:proxy_open_session:channel_open
*/
#ifndef GABA_DEFINE
struct proxy_open_session
{
  struct channel_open super;
  struct alist *server_requests;
  struct alist *client_requests;
};
extern struct lsh_class proxy_open_session_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_proxy_open_session_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct proxy_open_session *i = (struct proxy_open_session *) o;
  mark((struct lsh_object *) i->server_requests);
  mark((struct lsh_object *) i->client_requests);
}
struct lsh_class proxy_open_session_class =
{
  STATIC_HEADER,
  &(channel_open_class),
  "proxy_open_session",
  sizeof(struct proxy_open_session),
  do_proxy_open_session_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

