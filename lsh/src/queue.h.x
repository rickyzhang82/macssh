#ifndef GABA_DEFINE
struct object_queue
{
  UINT32 length;
  struct lsh_queue q;
};
extern void object_queue_mark(struct object_queue *i, 
    void (*mark)(struct lsh_object *o));
extern void object_queue_free(struct object_queue *i);
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
void object_queue_mark(struct object_queue *i, 
    void (*mark)(struct lsh_object *o))
{
  (void) mark; (void) i;
  do_object_queue_mark(&(i->q),
    mark);
}
void object_queue_free(struct object_queue *i)
{
  (void) i;
  do_object_queue_free(&(i->q));
}
#endif /* !GABA_DECLARE */

#ifndef GABA_DEFINE
struct string_queue
{
  UINT32 length;
  struct lsh_queue q;
};
extern void string_queue_mark(struct string_queue *i, 
    void (*mark)(struct lsh_object *o));
extern void string_queue_free(struct string_queue *i);
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
void string_queue_mark(struct string_queue *i, 
    void (*mark)(struct lsh_object *o))
{
  (void) mark; (void) i;
}
void string_queue_free(struct string_queue *i)
{
  (void) i;
  do_string_queue_free(&(i->q));
}
#endif /* !GABA_DECLARE */

