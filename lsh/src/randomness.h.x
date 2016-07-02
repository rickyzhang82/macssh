/*
CLASS:randomness:
*/
#ifndef GABA_DEFINE
struct randomness
{
  struct lsh_object super;
  int quality;
  void (*(random))(struct randomness *self,UINT32 length,UINT8 *dst);
};
extern struct lsh_class randomness_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class randomness_class =
{
  STATIC_HEADER,
  NULL,
  "randomness",
  sizeof(struct randomness),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:random_poll:
*/
#ifndef GABA_DEFINE
struct random_poll
{
  struct lsh_object super;
  unsigned (*(slow))(struct random_poll *self,struct hash_instance *);
  unsigned (*(fast))(struct random_poll *self,struct hash_instance *);
  void (*(background))(struct random_poll *self);
};
extern struct lsh_class random_poll_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class random_poll_class =
{
  STATIC_HEADER,
  NULL,
  "random_poll",
  sizeof(struct random_poll),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:randomness_with_poll:randomness
*/
#ifndef GABA_DEFINE
struct randomness_with_poll
{
  struct randomness super;
  struct random_poll *poller;
};
extern struct lsh_class randomness_with_poll_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_randomness_with_poll_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct randomness_with_poll *i = (struct randomness_with_poll *) o;
  mark((struct lsh_object *) i->poller);
}
struct lsh_class randomness_with_poll_class =
{
  STATIC_HEADER,
  &(randomness_class),
  "randomness_with_poll",
  sizeof(struct randomness_with_poll),
  do_randomness_with_poll_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

