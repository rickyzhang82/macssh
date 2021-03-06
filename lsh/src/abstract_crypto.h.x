/*
CLASS:crypto_instance:
*/
#ifndef GABA_DEFINE
struct crypto_instance
{
  struct lsh_object super;
  UINT32 block_size;
  void (*(crypt))(struct crypto_instance *self,UINT32 length,const UINT8 *src,UINT8 *dst);
};
extern struct lsh_class crypto_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class crypto_instance_class =
{
  STATIC_HEADER,
  NULL,
  "crypto_instance",
  sizeof(struct crypto_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:crypto_algorithm:
*/
#ifndef GABA_DEFINE
struct crypto_algorithm
{
  struct lsh_object super;
  UINT32 block_size;
  UINT32 key_size;
  UINT32 iv_size;
  struct crypto_instance *(*(make_crypt))(struct crypto_algorithm *self,int mode,const UINT8 *key,const UINT8 *iv);
};
extern struct lsh_class crypto_algorithm_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class crypto_algorithm_class =
{
  STATIC_HEADER,
  NULL,
  "crypto_algorithm",
  sizeof(struct crypto_algorithm),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:hash_instance:
*/
#ifndef GABA_DEFINE
struct hash_instance
{
  struct lsh_object super;
  UINT32 hash_size;
  void (*(update))(struct hash_instance *self,UINT32 length,const UINT8 *data);
  void (*(digest))(struct hash_instance *self,UINT8 *result);
  struct hash_instance *(*(copy))(struct hash_instance *self);
};
extern struct lsh_class hash_instance_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class hash_instance_class =
{
  STATIC_HEADER,
  NULL,
  "hash_instance",
  sizeof(struct hash_instance),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:hash_algorithm:
*/
#ifndef GABA_DEFINE
struct hash_algorithm
{
  struct lsh_object super;
  UINT32 block_size;
  UINT32 hash_size;
  struct hash_instance *(*(make_hash))(struct hash_algorithm *self);
};
extern struct lsh_class hash_algorithm_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class hash_algorithm_class =
{
  STATIC_HEADER,
  NULL,
  "hash_algorithm",
  sizeof(struct hash_algorithm),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:mac_algorithm:
*/
#ifndef GABA_DEFINE
struct mac_algorithm
{
  struct lsh_object super;
  UINT32 hash_size;
  UINT32 key_size;
  struct mac_instance *(*(make_mac))(struct mac_algorithm *self,UINT32 length,const UINT8 *key);
};
extern struct lsh_class mac_algorithm_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class mac_algorithm_class =
{
  STATIC_HEADER,
  NULL,
  "mac_algorithm",
  sizeof(struct mac_algorithm),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:verifier:
*/
#ifndef GABA_DEFINE
struct verifier
{
  struct lsh_object super;
  int (*(verify))(struct verifier *self,int algorithm,UINT32 length,const UINT8 *data,UINT32 signature_length,const UINT8 *signature_data);
  int (*(verify_spki))(struct verifier *self,UINT32 length,const UINT8 *data,struct sexp *e);
  struct lsh_string *(*(public_key))(struct verifier *self);
  struct sexp *(*(public_spki_key))(struct verifier *self);
};
extern struct lsh_class verifier_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class verifier_class =
{
  STATIC_HEADER,
  NULL,
  "verifier",
  sizeof(struct verifier),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:signer:
*/
#ifndef GABA_DEFINE
struct signer
{
  struct lsh_object super;
  struct lsh_string *(*(sign))(struct signer *self,int algorithm,UINT32 length,const UINT8 *data);
  struct sexp *(*(sign_spki))(struct signer *self,UINT32 length,const UINT8 *data);
  struct verifier *(*(get_verifier))(struct signer *self);
};
extern struct lsh_class signer_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class signer_class =
{
  STATIC_HEADER,
  NULL,
  "signer",
  sizeof(struct signer),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

/*
CLASS:signature_algorithm:
*/
#ifndef GABA_DEFINE
struct signature_algorithm
{
  struct lsh_object super;
  struct signer *(*(make_signer))(struct signature_algorithm *self,struct sexp_iterator *i);
  struct verifier *(*(make_verifier))(struct signature_algorithm *self,struct sexp_iterator *i);
};
extern struct lsh_class signature_algorithm_class;
#endif /* !GABA_DEFINE */

#ifndef GABA_DECLARE
struct lsh_class signature_algorithm_class =
{
  STATIC_HEADER,
  NULL,
  "signature_algorithm",
  sizeof(struct signature_algorithm),
  NULL,
  NULL,
};
#endif /* !GABA_DECLARE */

