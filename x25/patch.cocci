//
//  Add missing x25_neigh_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* E = x25_get_neigh(...);
  if (E == NULL) S
  ... when != x25_neigh_put(...,(T1)E,...)
      when != if (E != NULL) { ... x25_neigh_put(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != x25_neigh_put(...,(T2)E,...)
        when != if (E != NULL) { ... x25_neigh_put(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }

@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* if ((E = x25_get_neigh(...)) == NULL)
  S
  ... when != x25_neigh_put(...,(T1)E,...)
      when != if (E != NULL) { ... x25_neigh_put(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != x25_neigh_put(...,(T2)E,...)
        when != if (E != NULL) { ... x25_neigh_put(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }
