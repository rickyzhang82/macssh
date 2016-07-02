/*
CLASS:poor_random:randomness
*/
#ifndef GABA_DEFINE
struct poor_random
{
  struct randomness super;
  struct hash_instance *hash;
  UINT32 pos;
  UINT8 (*(buffer));
};
extern struct lsh_class poor_random_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_poor_random_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct poor_random *i = (struct poor_random *) o;
  mark((struct lsh_object *) i->hash);
}
static void
do_poor_random_free(struct lsh_object *o)
{
  struct poor_random *i = (struct poor_random *) o;
  lsh_space_free(i->buffer);
}
struct lsh_class poor_random_class =
{
  STATIC_HEADER,
  &(randomness_class),
  "poor_random",
  sizeof(struct poor_random),
  do_poor_random_mark,
  do_poor_random_free,
};
#endif /* !GABA_DECLARE */

/*
CLASS:device_random:randomness
*/
#ifndef GABA_DEFINE
struct device_random
{
  struct randomness super;
  int fd;
};
extern struct lsh_class device_random_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class device_random_class =
{
  STATIC_HEADER,
  &(randomness_class),
  "device_random",
  sizeof(struct device_random),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:arcfour_random:randomness_with_poll
*/
#ifndef GABA_DEFINE
struct arcfour_random
{
  struct randomness_with_poll super;
  struct exception_handler *e;
  struct arcfour_ctx pool;
  struct hash_instance *staging_area;
  unsigned staging_count;
};
extern struct lsh_class arcfour_random_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
static void
do_arcfour_random_mark(struct lsh_object *o,
void (*mark)(struct lsh_object *o))
{
  struct arcfour_random *i = (struct arcfour_random *) o;
  mark((struct lsh_object *) i->e);
  mark((struct lsh_object *) i->staging_area);
}
struct lsh_class arcfour_random_class =
{
  STATIC_HEADER,
  &(randomness_with_poll_class),
  "arcfour_random",
  sizeof(struct arcfour_random),
  do_arcfour_random_mark,
  NULL,
};
#endif /* !GABA_DECLARE */

