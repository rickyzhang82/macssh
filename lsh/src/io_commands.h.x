/*
CLASS:io_write_file_info:
*/
#ifndef GABA_DEFINE
struct io_write_file_info
{
  struct lsh_object super;
  const char * name;
  int flags;
  int mode;
  UINT32 block_size;
};
extern struct lsh_class io_write_file_info_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class io_write_file_info_class =
{
  STATIC_HEADER,
  NULL,
  "io_write_file_info",
  sizeof(struct io_write_file_info),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:io_read_fd:command
*/
#ifndef GABA_DEFINE
struct io_read_fd
{
  struct command super;
  int fd;
};
extern struct lsh_class io_read_fd_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class io_read_fd_class =
{
  STATIC_HEADER,
  &(command_class),
  "io_read_fd",
  sizeof(struct io_read_fd),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

