#ifndef	__VSDATA__
#include "vsdata.h"
#endif

short VSIclip(short *x1, short *y1, short *x2, short *y2, short *n, short *offset);
short VSIcdellines(short w, short top, short bottom, short n, short scrolled);
short VSIcinslines(short w, short top, short bottom, short n, short scrolled);
void VSIcurson(short w, short x, short y, short ForceMove);
void VSIcuroff(short w);
short VSIcursorenabled( void );
short VSIcursorvisible(void);
void VScursblink(short w);
void VScursblinkon(short w);
void VScursblinkoff(short w);

VSlineArray VSInewlinearray(short nrlines);
VSlinePtr VSInewlines(short nlines);
VSlinePtr VSOnewlines(short, short);
void VSIlistndx(register VSlinePtr ts);
void VSOlistndx(register VSlinePtr ts, register VSattrlinePtr as);
void VSIscroff(void);
void VSOscroff(void);
void VSIelo(short s);
void VSIes(void);
void VSItabclear(void);
void VSItabinit(void);
void VSIreset(void);
void VSIlistmove(VSlinePtr TD, VSlinePtr BD, VSlinePtr TI, VSlinePtr BI);
void VSIdellines(short n, short s);
void VSIinslines(short n, short s);
void VSOdellines(short n, short s);
void VSOinslines(short n, short s);
void VSIscroll(void);
void VSOscroll(void);
void VSIindex(void);
void VSIwrapnow(short *xp, short *yp);
void VSIeeol(void);
void VSIdelchars(short x);
void VSIfreelinelist(VSlinePtr listhead);
void VSIfreelines(void);
void VSIrindex(void);
void VSIebol(void);
void VSIel(short s);
void VSIeeos(void);
void VSIebos(void);
void VSIrange(void);
void VTsendpos(void);
void VTsendprintstat(void);
void VTsendudkstat(void);
void VTsendstat(void);
void VTsendident(void);
void VTsendsecondaryident(void);
void VTalign(void);
void VSIapclear(void);
void VSIsetoption(short toggle);
void VSItab(void);
void VSIinschar(short x, short clear);
void VSIinsstring(short len, char *start);
void VSIsave(void);
void VSIrestore(void);
void VSIdraw(short VSIwn, short x, short y, short la, VSAttrib a, short len, char *c);
void VSIflush(void);
void VSIcursdisable();
void VSIcursenable();
short VSIgetblinkflag();