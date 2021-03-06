/* mpf_swap (U, V) -- Swap U and V.

Copyright (C) 1997, 1998, 2000 Free Software Foundation, Inc.

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or (at your
option) any later version.

The GNU MP Library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
License for more details.

You should have received a copy of the GNU Lesser General Public License
along with the GNU MP Library; see the file COPYING.LIB.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
MA 02111-1307, USA. */

#include "gmp.h"
#include "gmp-impl.h"

void
#if __STDC__
mpf_swap (mpf_ptr u, mpf_ptr v)
#else
mpf_swap (u, v)
     mpf_ptr u;
     mpf_ptr v;
#endif
{
  mp_ptr up, vp;
  mp_size_t usize, vsize;
  mp_size_t uprec, vprec;
  mp_exp_t  uexp, vexp;

  uprec = u->_mp_prec;
  vprec = v->_mp_prec;
  v->_mp_prec = uprec;
  u->_mp_prec = vprec;

  usize = u->_mp_size;
  vsize = v->_mp_size;
  v->_mp_size = usize;
  u->_mp_size = vsize;

  uexp = u->_mp_exp;
  vexp = v->_mp_exp;
  v->_mp_exp = uexp;
  u->_mp_exp = vexp;

  up = u->_mp_d;
  vp = v->_mp_d;
  v->_mp_d = up;
  u->_mp_d = vp;
}
