// BetterTelnet
// copyright 1997, 1998, 1999 Rolf Braun

// This is free software under the GNU General Public License (GPL). See the file COPYING
// which comes with the source code and documentation distributions for details.

// based on NCSA Telnet 2.7b5

// #pragma profile on

/*
 *
 *      Virtual Screen Kernel Macintosh Real Screen Interface
 *                          (rsmac.c)
 *
 *   National Center for Supercomputing Applications
 *      by Gaige B. Paulsen
 *
 *    This file contains the macintosh real screen calls for the NCSA
 *  Virtual Screen Kernel.
 *
 *      RSbell(w)                   - Ring window w's bell
 *      RScursoff(w)                - Turn the cursor off in w
 *      RScurson(w,x,y)             - Turn the cursor on in w at x,y
 *      RSdraw(w,x,y,a,len,ptr)     - Draw @x,y in w string@ptr for length len
 *      RSdelchars(w,x,y,n)         - Delete n chars in w from x,y
 *      RSdellines(w,t,b,n)         - Delete n lines in region t->b in w
 *      RSerase(w,x1,y1,x2,y2)      - Erase from x1,y1 to x2,y2 in w
 *      RSinitall()                 - Initialize the world if necessary
 *      RSinslines(w,t,b,n)         - Insert n lines in region t->b in w
 *      RSinsstring(w,x,y,a,len,ptr)- Insert len chars @x,y in w attrib a
 *      RSsendstring(w,ptr,len)     - Send string @ptr length len from window w
 *		RSbufinfo( w, total,current)- Tells you the total/current lines in buffer
 *		RSmargininfo( w, total, current)	- Tells you total/current columns in VS
 *
 *
 *  Macintosh only Routines:
 *	NI	RSregnconv( *)				- Convert region to rect coords
 *  NI  RSsetwind(w)                - Set the port and vars to window w
 *  NI  RSsetattr(a)                - Set font/text style to a
 *	NI	RSsetConst(w)
 *	ML	RSattach(w,wind)			- Attach the RS (w) to window wind
 *	ML	RSdetach(w)				- Ready window for go-away
 *	ML	RSselect(w,pt,shift)		- Handle selection RS (w) point (pt) and (shift) if held down
 *	ML	RSzoom(window,code,shifted)	- Zoom Box handling
 *	ML	RSsize( window, where)		- Resize handling
 *	IN	RSgetwindow(w)				- Get the WindowPtr for RS (w)
 *	IN	RSfindvwind(wind)			- Find the (RS/VS) # of wind
 *	IN	RSfindscroll( control, n)	- Find which VS the control is in and which control it is
 *  	RSupdate(wind)				- Handle updates on WIND, return 0 if not an RS
 *		RSactivate(w)				- Handle activate events 
 *		RSdeactivate(w)				- Handle deactivate events 
 *		RSGetTextSel(w,table)		- Returns handle to text selection of window w, table->tabs
 *		RSnewwindow( wDims, sb, wid, lines
 *			name,wrap,fnum,fsiz,
 *			showit, goaway)			- Returns VS # of newly created text window -
 *									  wDims (dimension),sb(scrollback),wid(width 80/132),
 *                                    lines (# of lines, 24 <> 66),
 *									  name(window), wrap(0/1),fnum,fsiz, showit(vis),goaway(0,1)
 *		RSkillwindow( w)			- Destroys, deallocates, kills window (w)
 *		RSclick(window, eventRecord)- Handle clicks in window (returns false if not RS window)
 *		RShide(w)					- Hide RS (w)
 *		RSshow(w)					- Show RS (w)
 *		RScprompt(w, FilterProc)	- Prompt for colors...FilterProc is for Modal Dialog
 *		RSsetcolor(w,n,r,g,b)		- Set one of the 4 colors of RS (w) to R,G,B
 *		RSgetcolor(w,n,r,g,b)		- Get one of the 4 colors of RS (w) into R,G,B
 *		RSmouseintext(w,myPoint)	- Returns true if Mouse is in text part of current RS window
 *		RSskip(w,on)				- Activate/deactivate drawing in an RS
 *		
 *		IN - Informational
 *		ML - Mid Level
 *		NI - Necessary Internal
 *		   - Suggested calls
 *
 *      Version Date    Notes
 *      ------- ------  ---------------------------------------------------
 *      0.01    861102  Initial coding -GBP
 *      0.25    861106  Added code from screen.c -GBP
 *      0.50    861113  First compiled edition -GBP
 *		2.1		871130	NCSA Telnet 2.1 -GBP
 *		2.2 	880715	NCSA Telnet 2.2 -GBP
 *		2.6		7/92	put globals into struct, cursors into array, and cleaned up 
 *						some of the font typedefs			Scott Bulmahn
 *		2.6b4	12/92	Cleaned up the code, and added double clicking -- Scott Bulmahn
 *
 */

#define __ALLNU__

#include "DlogUtils.proto.h"
#include "configure.proto.h"	// For colorboxmodalproc and colorboxproc
#include "maclook.proto.h"
#include "network.proto.h"
#include "menuseg.proto.h"
#include "vskeys.h"
#include "vsdata.h"
#include "vsinterf.proto.h"
#include "vsintern.proto.h"
#include "wind.h"
#include "rsdefs.h"
#include "parse.proto.h"		// For SendNAWSinfo proto
#include "wdefpatch.proto.h"	/* 931112, ragge, NADA, KTH */
#include "drag.proto.h"
#include "rsinterf.proto.h"
#include "event.proto.h" //notify user proto

#define NFDEF {0,0,0}
#define NBDEF {65535,65535,65535}
#define BFDEF {0,61183,11060}
#define BBDEF {61183,2079,4938}
#define UFDEF {1,0,0}
#define UBDEF {0,0,0}

extern short gBlink;
extern WindRec *screens;

#include "rsmac.proto.h"

short MaxRS;

RSdata *RSlocal, *RScurrent;
Rect	noConst,
		RScur;				/* cursor rectangle */

RgnHandle RSuRgn;            /* update region */

short RSw=-1,         /* last window used */
    RSa=0;          /* last attrib used */
extern long RScolors[];

// initializes handling of terminal windows
void RSinitall(short max) //max windows to allow
{
	short i;
	MaxRS = max;
	RSlocal = (RSdata *) myNewPtr(MaxRS * sizeof(RSdata));
	for (i = 0; i < MaxRS; RSlocal[i++].window = 0L)
	{
		RScurrent = RSlocal + i;
		RScurrent->id = 'RSDA';
		RScurrent->cursor.top = 0;
		RScurrent->cursor.bottom = 0;
		RScurrent->cursor.left = 0;
		RScurrent->cursor.right = 0;
	}
	RSuRgn = NewRgn();
	RScur.left = 0;
	RScur.top = 0;
	RScur.bottom = 0;
	RScur.right = 0;
	if (!TelInfo->haveColorQuickDraw)
		DisposeHandle((Handle)TelInfo->AnsiColors);
		

} // RSinitall


void RSsetConst
  (
	short w
  )
  /* sets "noConst" global to a zero-based rectangle equal in size
	to the specified terminal window. */
  {
  noConst.left = 0;
  noConst.top = 0;
  noConst.right = RSlocal[w].width;
  noConst.bottom = RSlocal[w].height;
  } /* RSsetConst */

/****************************************************************************/
/*  Given a window record number, do a SetPort() to the window associated with
*   that window record.
*/
short RSsetwind
  (
	short w
  )
  {
	if ((w < 0) || (w > MaxRS))
		return(-3);
    if (RSw != w)								/* if last window used is different */
	  {
        if (RSlocal[w].window == 0L)
			return(-4);
		RScurrent = RSlocal + w;
        RSw = w;
		RSa = -1; /* attributes will need setting */
		SetPort(RScurrent->window);
		return(1);
	  }
    SetPort(RScurrent->window);
	return(0);
  } /* RSsetwind */

void RSvalidateRect(short w)
{
	ValidRect(&((RSlocal[w].window)->portRect));
}
void RSbell
  (
	short w
  )
  /* gives an audible signal associated with the specified window. */
  {
    RSsetwind(w);
	if (FrontWindow() != RScurrent->window)
	  {
	  /* beep and temporarily invert the window contents, so
		the user sees which window is beeping */
	    InvertRect(&RScurrent->window->portRect);
	    SysBeep(8);
	    InvertRect(&RScurrent->window->portRect);
	  }
	else
	  /* window is frontmost--just beep */
		SysBeep(8);
     NotifyUser();

  } /* RSbell */


void RScursoff
  (
	short w
  )
  /* hides the text cursor for the specified window. Assumes it
	is currently being shown. */
  {
	if (RSlocal[w].skip || !RSlocal[w].cursorstate)		/* BYU 2.4.11 */
		return;
    RSsetwind(w);
    RScurrent->cursorstate = 0;							/* BYU 2.4.11 */
	InvertRect(&RScurrent->cursor);
  } /* RScursoff */

void RScurson
  (
	short w,
	short x,
	short y
  )
  /* displays the text cursor for the specified window, at the
	specified position. Assumes it isn't currently being shown. */
  {
	if (RSlocal[w].skip || RSlocal[w].cursorstate)		/* BYU 2.4.11 */
		return;
    RSsetwind(w);

    RScurrent->cursor.left = x * RScurrent->fwidth;			/* BYU 2.4.11 */
    RScurrent->cursor.top  = y * RScurrent->fheight;		/* BYU 2.4.11 */

	switch (gApplicationPrefs->CursorType) {											/* BYU 2.4.11 */
		case UNDERSCORECURSOR:										/* BYU 2.4.11 */
    		RScurrent->cursor.top  += RScurrent->fheight;			/* BYU 2.4.11 */
    		RScurrent->cursor.right  = RScurrent->cursor.left + RScurrent->fwidth;	/* BYU 2.4.11 */
    		RScurrent->cursor.bottom = RScurrent->cursor.top + 1;	/* BYU 2.4.11 */
			break;
		case VERTICALCURSOR:										/* BYU 2.4.11 */
    		RScurrent->cursor.left += 2;							/* BYU 2.4.11 */
    		RScurrent->cursor.right  = RScurrent->cursor.left + 1;	/* BYU 2.4.11 */
    		RScurrent->cursor.bottom = RScurrent->cursor.top + RScurrent->fheight;	/* BYU 2.4.11 */
			break;
		case BLOCKCURSOR:											/* BYU 2.4.11 */
		default:													/* BYU 2.4.11 */
    		RScurrent->cursor.right  = RScurrent->cursor.left + RScurrent->fwidth;	/* BYU 2.4.11 */
    		RScurrent->cursor.bottom = RScurrent->cursor.top + RScurrent->fheight;	/* BYU 2.4.11 */
			break;
    }

	if (!gApplicationPrefs->BlinkCursor) {									/* BYU 2.4.11 */
    	RScurrent->cursorstate = 1;						/* BYU 2.4.11 */
    	InvertRect(&RScurrent->cursor);					/* BYU 2.4.11 */
	}													/* BYU 2.4.11 */
  } /* RScurson */


void RSsetattr(short a)
{
 	short fg, bg, tempFontID; // RAB BetterTelnet 1.0fc4
  	
 	static GrafPtr lastPort;	
	
	if (RSa!=-1 && RSa==a && qd.thePort==lastPort) return;			
	lastPort = qd.thePort;
	RSa = a;				

	if (VSisgrph(a)) {
		GetFNum("\p%NCSA VT", &tempFontID); // RAB BetterTelnet 1.0fc4
        TextFont(tempFontID); /* use "NCSA VT" (74) font for special graphics */
    }
	else
		RSTextFont(RScurrent->fnum,RScurrent->fsiz,((a & bold) && RScurrent->allowBold)); 	/* BYU - use user-selected text font */

	TextSize(RScurrent->fsiz);

/* BYU - bold system fonts don't work (they overwrite the scroll bars), 
         but NCSA's 9 point Monaco bold works okay. */

	if (VSisbold(a) && RScurrent->realbold)
		TextFace(((a & outline) >> 1) + 1);
    else TextFace((a & outline) >> 1); 	/* BYU - do outline as underline setting */

	if (VSisansifg(a)) {
		fg = 4 +((a>>8)&0x7);
		if (RScurrent->colorBold && VSisbold(a)) fg += 8;
    }
	else
		if (RScurrent->colorBold && VSisbold(a)) fg = gApplicationPrefs->defaultBoldColor + 4;
		else fg = 0;
	
	if (VSisansibg(a))
		bg = 4+ ((a>>12)&0x7);
	else
		bg = 1;
  
  	// set up text modes 

	if (TelInfo->haveColorQuickDraw)
	{
		if (VSisrev(a) || ((a & bold) && RScurrent->bfstyle))
			TextMode(notSrcCopy);
		else
			TextMode(srcCopy);
	}
	else
	{
		if (VSisrev(a) || ((a & bold) && RScurrent->bfstyle))
		{
        	BackPat(PATTERN(qd.black));	/* Reverses current attributes regard */
        	PenPat(PATTERN(qd.white));	/* less of the color, etc.... */
        }
		else
		{
        	BackPat(PATTERN(qd.white));	/* Reverses current attributes regard */
        	PenPat(PATTERN(qd.black));	/* less of the color, etc.... */
        } 
	}
	
	//set up colors
	if (TelInfo->haveColorQuickDraw) 
	{
		if (VSisblnk(a) && (!gBlink || !VSIgetblinkflag()))
		{
			PmForeColor(2);				//use colors for blink
			PmBackColor(3);
		}
		else
		{
			PmForeColor(fg);
			PmBackColor(bg);
		}
	}
	else 
	{
		if (VSisblnk(a))
		{
			ForeColor(RScolors[7]);	//use colors for blink
			BackColor(RScolors[0]);	
		}
		else
		{
			ForeColor(RScolors[0]);
			BackColor(RScolors[7]);
		}
	}
	
} /* RSsetattr */


void RSTextFont(short myfnum, short myfsiz, short myface) 				/* BYU */
{										/* BYU */
short tempFontID;						// RAB BetterTelnet 1.0fc4

// RAB BetterTelnet 1.0fc4: For one thing, we use font *names* now. Also, we use NCSA VT Bold
// when the user wants, not when it's Monaco 9.

	if (// (myfnum == monaco) && 			/* BYU - If Monaco, size 9, and bold, then */
//		(myfsiz == 9) &&				/* BYU */
		
		(myface & bold))	{			/* BYU */
//		GetFNum("\p%NCSA VT Bold", &tempFontID);
//		TextFont(tempFontID);			/* BYU - use NCSA's Monaco. (75) */
		TextFont(RScurrent->bfnum);		// RAB BetterTelnet 1.0fc9
	} else {							/* BYU */
		TextFont(myfnum);				/* BYU */
	}									/* BYU */
}										/* BYU */


#ifdef	NO_UNIVERSAL
#define LMGetHiliteMode() (* (unsigned char *) 0x0938)
#define LMSetHiliteMode(HiliteModeValue) ((* (unsigned char *) 0x0938) = (HiliteModeValue))
#endif

void DoHiliteMode(void)		/* BYU LSC */
  /* enables use of highlighting in place of simple color inversion
	for next QuickDraw operation. */
  {
  	
  	LMSetHiliteMode(LMGetHiliteMode() & 0x7F);
//	char *p = (char *) 0x938; /* pointer to HiliteMode low-memory global */
//	*p = *p & 0x7f; /* clear the HiliteBit */
  } /* HiliteMode */

void RSinvText
  (
	short w, 
	Point curr,
	Point last,
	RectPtr constrain /* don't highlight anything outside this rectangle */
  )
  /* highlights the text from curr to last inclusive. */
  {
	Rect temp, temp2;
	Point lb, ub;

	RSsetwind(w);
  /* normalize coordinates with respect to visible area of virtual screen */
	curr.v -= RScurrent->topline;
	curr.h -= RScurrent->leftmarg;
	last.v -= RScurrent->topline;
	last.h -= RScurrent->leftmarg;

	if (curr.v == last.v)
	  {
	  /* highlighted text all on one line */
		if (curr.h < last.h) /* get bounds the right way round */
		  {
			ub = curr;
			lb = last;
		  }
		else
		  {
			ub = last;
			lb = curr;
		  } /* if */
		MYSETRECT /* set up rectangle bounding area to be highlighted */
		  (
			temp,
			(ub.h + 1) * RScurrent->fwidth,
			ub.v * RScurrent->fheight,
			(lb.h + 1) * RScurrent->fwidth,
			(lb.v + 1) * RScurrent->fheight
		  );
		SectRect(&temp, constrain, &temp2); /* clip to constraint rectangle */
		DoHiliteMode();						/* BYU LSC */
		InvertRect(&temp2);
	  }
	else
	  {
	  /* highlighting across more than one line */
		if (curr.v < last.v)
			ub = curr;
		else
			ub = last;
		if (curr.v > last.v)
			lb = curr;
		else
			lb = last;
		MYSETRECT /* bounds of first (possibly partial) line to be highlighted */
		  (
			temp,
			(ub.h + 1) * RScurrent->fwidth,
			ub.v * RScurrent->fheight,
			RScurrent->width,
			(ub.v + 1) * RScurrent->fheight
		  );
		SectRect(&temp, constrain, &temp2); /* clip to constraint rectangle */
		DoHiliteMode();						/* BYU LSC */
		InvertRect(&temp2);
		MYSETRECT /* bounds of last (possibly partial) line to be highlighted */
		  (
			temp,
			0,
			lb.v * RScurrent->fheight,
			(lb.h + 1) * RScurrent->fwidth,
			(lb.v + 1) * RScurrent->fheight
		  );
		SectRect(&temp, constrain, &temp2); /* clip to constraint rectangle */
		DoHiliteMode();						/* BYU LSC */
		InvertRect(&temp2);

		if (lb.v - ub.v > 1) /* highlight extends across more than two lines */
		  {
		  /* highlight complete in-between lines */
			SetRect
			  (
				&temp,
				0,
				(ub.v + 1) * RScurrent->fheight,
				RScurrent->width,
				lb.v * RScurrent->fheight
			  );
			SectRect(&temp, constrain, &temp2); /* clip to constraint rectangle */
			DoHiliteMode();						/* BYU LSC */
			InvertRect(&temp2);

		  } /* if */
	  } /* if */
  } /* RSinvText */

void RSdraw
  (
	short w, /* window number */
	short x, /* starting column */
	short y, /* line on which to draw */
	short a, /* text attributes */
	short len, /* length of text to draw */
	char *ptr /* pointer to text */
  )
  /* draws a piece of text (assumed to fit on a single line) in a window,
	using the specified attributes. If any part of the text falls
	within the current selection, it will be highlighted. */
  {
    Rect rect;
	short ys;
	RgnHandle oldClip;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
//    RSsetattr(0);		JMB 2.6.1d4

	ys = y * RScurrent->fheight;
    MYSETRECT /* set up rectangle bounding text being drawn */
	  (
		rect,
		x * RScurrent->fwidth,
		ys,
		(x + len) * RScurrent->fwidth,
		ys + RScurrent->fheight
	  );

	RSsetattr(a);

	if (x <= 0)			/* BYU 2.4.12 - Without this, 1 pixel column of reverse */
	  rect.left = -3;	/* BYU 2.4.12 - video text does not clear at left margin */
 
	if (rect.bottom == RScurrent->rheight)
		rect.bottom += 1; //CCP take care of updating problems while scrolling

/* NONO */
	oldClip = NewRgn();
	if (oldClip) {
		GetClip(oldClip);
 		ClipRect(&rect);
 	}
/* NONO */

	EraseRect(&rect);

	if (x <= 0)			/* BYU 2.4.12 - Okay, just putting it back the way it was */
	  rect.left = 0;	/* BYU 2.4.12 */

	MoveTo(x * RScurrent->fwidth, ys + RScurrent->fascent);
	
	DrawText(ptr, 0, len);

	if (RScurrent->selected)
		RSinvText(w, *(Point *) &RScurrent->anchor,
			*(Point *) &RScurrent->last, &rect);
	ValidRect(&rect);

/* NONO */
	if (oldClip) {
		SetClip(oldClip);
		DisposeRgn(oldClip);
	}
/* NONO */

  } /* RSdraw */

void RSdelcols
  (
	short w,
	short n /* number of columns to scroll */
  )
  /* scrolls the entire visible display of a virtual screen the
	specified number of columns to the left, blanking out
	the newly-revealed area. */
  {
    Rect rect;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
    MYSETRECT /* bounds of entire text area, for scrolling */
	  (
		rect,
		0,
		0,
		RScurrent->width,
		RScurrent->height
	  );
    ScrollRect(&rect, -n * RScurrent->fwidth, 0, RSuRgn);
    InvalRgn(RSuRgn);
    ValidRect(&rect); /* any necessary redrawing in newly-revealed area will be done by caller */
    MYSETRECT /* bounds of newly-revealed area */
	  (
		rect,
		RScurrent->width - (n * RScurrent->fwidth),
		0,
		RScurrent->width,
		RScurrent->height
	  );
	if (RScurrent->selected)
	  /* highlight any newly-revealed part of the current selection */
		RSinvText(w, *(Point *) &RScurrent->anchor,
			*(Point *) &RScurrent->last, &rect);
  } /* RSdelcols */

void RSdelchars
  (
	short w, /* affected window */
	short x, /* column to delete from */
	short y, /* line on which to do deletion */
	short n /* number of characters to delete */
  )
  /* deletes the specified number of characters from the specified
	position to the right, moving the remainder of the line to the
	left. */
  {
    Rect rect;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
    RSsetattr(0); /* avoid funny pen modes */
    MYSETRECT /* bounds of area from starting column to end of line */
	  (
		rect,
		x * RScurrent->fwidth,
		y * RScurrent->fheight,
		RScurrent->width,
		(y + 1) * RScurrent->fheight
	  );
	if ((x + n) * RScurrent->fwidth > RScurrent->width)
	  /* deleting to end of line */
		EraseRect(&rect);
	else
	  {
	  /* scroll remainder of line to the left */
    	ScrollRect(&rect, - RScurrent->fwidth * n, 0, RSuRgn);
    	InvalRgn(RSuRgn);
   		ValidRect(&rect); /* leave newly-revealed area blank */
		if (RScurrent->selected)
		  {
		  /* highlight any part of selection which lies in newly-blanked area */
			HLock((Handle) RSuRgn);
			RSinvText(w, *(Point *) &RScurrent->anchor, *(Point *) &RScurrent->last, &((*RSuRgn)->rgnBBox));
			HUnlock((Handle) RSuRgn);
		  } /* if */
	  } /* if */
  } /* RSdelchars */

void RSdellines
  (
	short w, /* affected window */
	short t, /* top line of affected region */
	short b, /* bottom line of affected region */
	short n, /* number of lines to delete */
	short scrolled
	  /*
		-ve => cancel current selection, if any;
		+ve => selection has moved up one line;
		0 => don't touch selection
	  */
  )
  /* deletes lines at the top of the specified region of a window,
	inserting new blank lines at the bottom, and scrolling up the
	stuff in between. */
  {
    Rect	rect;
	short	RSfheightTimesn, RSfheightTimesbplus1;

	if (RSlocal[w].skip)
		return;

    RSsetwind(w);
	RSsetConst(w);
    RSsetattr(0); /* avoid funny pen modes */

	if (scrolled)
	  {
		if (RScurrent->selected && scrolled < 0)
		  {
		  /* unhighlight and cancel current selection */
			RSinvText(w, *(Point *) &RScurrent->anchor, *(Point *) &RScurrent->last, &noConst);
			RScurrent->selected = 0;
		  }
		else
		  {
			RScurrent->last.v -= 1;		/* Subtract one from each of the */
			RScurrent->anchor.v -= 1;	/* vertical Selection components */
		  } /* if */
	  } /* if */

    rect.left = -1;							/* BYU 2.4.12 - necessary */
    rect.right = RScurrent->width;
    rect.top = t * RScurrent->fheight;
    RSfheightTimesbplus1 = (b + 1) * RScurrent->fheight;
	rect.bottom = RSfheightTimesbplus1;
  /* adjust the update region to track the scrolled window contents */
  	RSfheightTimesn = RScurrent->fheight * n;
	OffsetRgn(((WindowPeek) RScurrent->window)->updateRgn,
		0, -RSfheightTimesn);
    ScrollRect(&rect, 0, -RSfheightTimesn, RSuRgn);
    RSsetattr(VSIw->attrib); /* restore mode for text drawing */
    InvalRgn(RSuRgn);

  /* validate the area containing the newly-inserted blank lines. */
  /* any necessary redrawing in newly-revealed area will be done by caller */
	MYSETRECT
	  (
		rect,
		0,
		(b - n + 1) * RScurrent->fheight - 1,
		RScurrent->width,
		RSfheightTimesbplus1 + 1
	  );
  	ValidRect(&rect);
  } /* RSdellines */

void RSerase
  (
	short w, /* affected window */
	short x1, /* left column */
	short y1, /* top line */
	short x2, /* right column */
	short y2 /* bottom line */
  )
  /* erases a rectangular portion of the screen display, preserving
	the selection highlight. */
  {
    Rect rect;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
    RSsetattr(0); /* avoid funny pen modes */
    SetRect
	  (
		&rect,
		x1 * RScurrent->fwidth ,
		y1 * RScurrent->fheight,
		(x2 + 1) * RScurrent->fwidth - 1,
		(y2 + 1) * RScurrent->fheight + 1
	  );
	if (rect.left <= 0)						/* little buffer strip on left */
		rect.left = CHO;
	if (rect.right >= RScurrent->width - 1)
		rect.right = RScurrent->rwidth - 2;	/* clear to edge of window, including edge strip */
	if (rect.bottom >= RScurrent->height - 2)
		rect.bottom = RScurrent->rheight + 1;	/* clear to bottom edge also */
    EraseRect(&rect);
	if (RScurrent->selected)
	  /* highlight any part of the selection within the cleared area */
		RSinvText(w, *(Point *) &RScurrent->anchor, *(Point *) &RScurrent->last, &rect);
  } /* RSerase */

void RSinslines
  (
	short w, /* affected window */
	short t, /* where to insert blank lines */
	short b, /* bottom of area to scroll */
	short n, /* number of lines to insert */
	short scrolled /* -ve <=> cancel current selection, if any */
  )
  /* inserts blank lines at the top of the given area of the display,
	scrolling the rest of it down. */
  {
    Rect rect;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
	RSsetConst(w);
    RSsetattr(0); /* avoid funny pen modes */
	if (RScurrent->selected && (scrolled < 0))
	  {
	  /* unhighlight and cancel selection */
		RSinvText(w, *(Point *) &RScurrent->anchor,
			*(Point *) &RScurrent->last, &noConst);
		RScurrent->selected = 0;
	  } /* if */
	rect.left = -1;						/* BYU 2.4.12 - necessary */
    rect.right = RScurrent->width;
    rect.top = t * RScurrent->fheight;
    rect.bottom = (b + 1) * RScurrent->fheight;
  /* adjust the update region to track the scrolled window contents */
	OffsetRgn(((WindowPeek) RScurrent->window)->updateRgn,
		0, RScurrent->fheight * n);
    ScrollRect(&rect, 0, RScurrent->fheight * n, RSuRgn);
    InvalRgn(RSuRgn);
  /* newly-inserted area is already blank -- validate it to avoid redrawing. */
  /* any necessary redrawing will be done by caller */
	SetRect(&rect, 0, t * RScurrent->fheight - 1,
		RScurrent->width, (t + n) * RScurrent->fheight + 1);
    ValidRect(&rect);
  } /* RSinslines */

void RSinscols
  (
	short w,
	short n /* number of columns to insert */
  )
  /* inserts blank columns at the left side of the text display in
	the specified window, scrolling its current contents to the right.
	Maintains the selection highlight, but doesn't move the selection.
	Doesn't even unhighlight text which moves out of the selection area. */
  {
    Rect rect;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
    SetRect /* bounds of entire text area */
	  (
		&rect,
		0,
		0,
		RScurrent->width,
		RScurrent->height
	  );
    ScrollRect(&rect, n * RScurrent->fwidth, 0, RSuRgn);
    InvalRgn(RSuRgn);
    ValidRect(&rect); /* any necessary redrawing in newly-revealed area will be done by caller */
    SetRect /* bounds of newly-inserted blank area */
	  (
		&rect,
		0,
		0,
		(n + 1) * RScurrent->fwidth - 1,
		RScurrent->height
	  );
	if (RScurrent->selected)
	  /* highlight any part of the selection in the newly-blanked area */
		RSinvText(w, *(Point *) &RScurrent->anchor, *(Point *) &RScurrent->last, &rect);
  } /* RSinscols */

void RSinsstring
  (
	short w, /* affected window */
	short x, /* starting column at which to insert */
	short y, /* line on which to insert */
	short a, /* attributes for inserted text */
	short len, /* length of inserted text */
	char *ptr /* pointer to inserted text */
  )
  /* inserts a string of characters at the specified position, scrolling
	the rest of the line to the right. Highlights any part of the newly-
	inserted text lying within the current selection. */
  {
    Rect rect;

	if (RSlocal[w].skip)
		return;
    RSsetwind(w);
    SetRect /* bounds of part of line from specified position to end of line */
	  (
		&rect,
		x * RScurrent->fwidth,
		y * RScurrent->fheight,
		RScurrent->width,
		(y + 1) * RScurrent->fheight
	  );
    ScrollRect(&rect, len * RScurrent->fwidth, 0, RSuRgn); /* scroll remainder of line to the right */
    if (RSa != a)
		RSsetattr(a);
    InvalRgn(RSuRgn);
    ValidRect(&rect); /* any necessary redrawing in newly-revealed area will be done by caller */
    SetRect /* bounds area to contain inserted string */
	  (
		&rect,
		x * RScurrent->fwidth,
		y * RScurrent->fheight,
		(x + len) * RScurrent->fwidth,
		(y + 1) * RScurrent->fheight
	  );
    EraseRect(&rect); /* erase area to appropriate background */
    MoveTo
	  (
		x * RScurrent->fwidth,
		y * RScurrent->fheight + RScurrent->fascent
	  );
    DrawText(ptr, 0, len);
	if (RScurrent->selected)
	  /* highlight any part of selection covering the newly-inserted text */
		RSinvText(w, *(Point *) &RScurrent->anchor,
			*(Point *) &RScurrent->last, &rect);
  } /* RSinsstring */


void RSmargininfo
  (
	short w,
	short total, /* number of invisible character positions (screen width less visible width) */
	short current /* leftmost visible character position */
  )
  /* updates the horizontal scroll bar and associated variables
	to reflect the current view of the virtual screen within the
	specified window. */
  {
	RSlocal[w].leftmarg = current;			/* Adjust local vars */
	if (RSlocal[w].lcurrent != current)
		SetControlValue(RSlocal[w].left, (RSlocal[w].lcurrent = current));
	if (RSlocal[w].lmax != total)
		SetControlMaximum(RSlocal[w].left, (RSlocal[w].lmax = total));
  } /* RSmargininfo */


void RSbufinfo
  (
	short w, /* affected window */
	short total, /* number of lines of scrollback */
	short current, /* current topmost visible line */
	short bottom /* current bottommost visible line */
  )
  /* readjusts the vertical scroll bar and associated variables
	to reflect the current view of the virtual screen within the
	specified window. */
  {
	RSdata *RSthis;
	short newmax;

	RSthis = RSlocal + w;

	newmax = (VSgetlines(w) - 1) - (bottom - current);

	RSthis->topline = current;			/* Adjust local vars */
	if (RSthis->min != -total)
	{
		if (RSthis->min == 0) //need to activate scrollbars
			SetControlMinimum(RSthis->scroll, (RSthis->min = -total));
		
		(**RSthis->scroll).contrlMin = (RSthis->min = -total);	// JMB 2.6.1d4
	} /* if */

	if (RSthis->current != current)
		SetControlValue(RSthis->scroll, (RSthis->current = current));

	if (RSthis->max != newmax)
		(**RSthis->scroll).contrlMax = (RSthis->max = newmax);	// JMB 2.6.1d4

  } /* RSbufinfo */




short RSfindscroll				/* Find screen index by control*/
  (
	ControlHandle control,
	short *n
  )
  /* finds the window to which the given scroll bar belongs.
	Returns the window number in *n if found, and a function
	result of 1 for a vertical scroll bar, 2 for a horizontal
	one, or -1 if the window wasn't found. */
  {
  /* look for a vertical scroll bar */
	*n = 0;
	while ((*n < MaxRS) && (control != RSlocal[*n].scroll))
		(*n)++;
	if (*n < MaxRS)
		return (1); /* found it */
  /* look for a horizontal scroll bar */
	*n = 0;
	while ((*n < MaxRS) && (control != RSlocal[*n].left))
		(*n)++;
	if (*n < MaxRS)
		return (2); /* found it */
	return(-1); /* not found */
  } /* RSfindscroll */

void RSregnconv
  (
	RgnHandle regn,
	short *x1, /* left (output) */
	short *y1, /* top (output) */
	short *x2, /* right (output) */
	short *y2, /* bottom (output) */
	short fh, /* font character height */
	short fw /* font character width */
  )
  /* converts the bounding box of the specified QuickDraw region
	into units of character positions (using the specified character
	height and width) and returns the results in *x1, *y1, *x2 and *y2. */
  {
    HLock((Handle) regn);
    *y1 = ((*regn)->rgnBBox.top) / fh;
    *y2 = (((*regn)->rgnBBox.bottom) + fh - 1) / fh;
    *x1 = ((*regn)->rgnBBox.left) / fw;
    *x2 = (((*regn)->rgnBBox.right) + fw - 1) / fw;
    HUnlock((Handle) regn);
	if (*x1 < 0)
		*x1 = 0;
	if (*y1 < 0)
		*y1 = 0;
	if (*x2 < 0)
		*x2 = 0;
	if (*y2 < 0)
		*y2 = 0;
  } /* RSregnconv */



#define	Fwidthhalf	(FWidth/2)

Point normalize(Point in, short w, Boolean autoScroll)
  /* converts in from a pixel position in local coordinates to
	a character cell position within the virtual screen corresponding
	to the specified window. Constrains the position to lie within
	the currently-visible region of the screen, autoscrolling the
	screen if necessary (and if autoScroll = TRUE). */
  {

	if (in.v <0)
	  {
		in.v = 0;
		if (autoScroll)
			VSscrolback(w, 1);
	  } /* if */
	if (in.v > RSlocal[w].height)
	  {
		in.v = RSlocal[w].height;
		if (autoScroll)
			VSscrolforward(w, 1);
	  } /* if */
	in.v = in.v / FHeight;

	if (in.h < 0)
	  {
		in.h = -1;
		if (autoScroll)
			VSscrolleft(w, 1);
	  } /* if */
	if (in.h > RSlocal[w].width)
	  {
		in.h = RSlocal[w].width;
		if (autoScroll)
			VSscrolright(w, 1);
	  } /* if */
  /* in.h = (in.h + Fwidthhalf) / FWidth - 1; */
  /* the MPW C 3.0 compiler has a bug in its register allocation */
  /* which keeps the above line from working. So, replace it with this: */
	in.h = in.h + Fwidthhalf;
	in.h = in.h / FWidth - 1;
  /* note the bug has been fixed in the 3.1 compiler. */
  /* convert to virtual screen coordinates */
	in.v += RSlocal[w].topline;
	in.h += RSlocal[w].leftmarg;
	return(in);
  } /* normalize */

	

void	RSsortAnchors(short w)
{
	Point	temp;
	
	if (RSlocal[w].anchor.v > RSlocal[w].last.v) {
		temp = RSlocal[w].anchor;
		RSlocal[w].anchor = RSlocal[w].last;
		RSlocal[w].last = temp;
		}
		
	if ((RSlocal[w].anchor.v == RSlocal[w].last.v) && (RSlocal[w].anchor.h > RSlocal[w].last.h)) {
		temp = RSlocal[w].anchor;
		RSlocal[w].anchor = RSlocal[w].last;
		RSlocal[w].last = temp;
		}
}	

void	RSsetsize( short w, short v, short h)
/*	saves the new size settings for a window, and repositions
	the scroll bars accordingly. */
{
	RSlocal[w].height = ((v - 16 + CVO) / FHeight) * FHeight;
	RSlocal[w].width = ((h - 16 + CHO) / FWidth) * FWidth;
	RSlocal[w].rheight = v - 16;
	RSlocal[w].rwidth = h - 16;

/*
*  Get rid of the scroll bars which were in the old size.
*  Hiding them causes the region to be updated later.
*/
	if (RSlocal[w].scroll != NULL )
		HideControl(RSlocal[w].scroll);
	if (RSlocal[w].left != NULL ) 
		HideControl(RSlocal[w].left);

	 DrawGrowIcon(RSlocal[w].window);			/* Draw in the necessary bugger */

/*	move the scroll bars to their new positions and sizes, and redisplay them */	

	SetControlValue(RSlocal[w].scroll, RSlocal[w].current); //because we dont always have this
	if (RSlocal[w].scroll != NULL ) {
		SizeControl(RSlocal[w].scroll, 16, (v - 13));
		MoveControl(RSlocal[w].scroll, (h - 15) + CHO, -1 + CVO);
		ShowControl(RSlocal[w].scroll);
		}
	if (RSlocal[w].left != NULL ) {
		SizeControl(RSlocal[w].left, (h - 13), 16);
		MoveControl(RSlocal[w].left, -1 + CHO,  (v - 15) + CVO);
		ShowControl(RSlocal[w].left);
		}
		
	SetRect(&RSlocal[w].textrect, 0, 0, RSlocal[w].rwidth, RSlocal[w].rheight);
} /* RSsetsize */



/*--------------------------------------------------------------------------*/
/* NCSA: SB - RSbackground													*/
/*	This procedure allows Telnet to switch from dark background to light	*/
/*	background.  Save the current state into the RSdata struct, so that		*/
/* 	we know our background state next time we want to do anything.			*/
/*	Make sure the screen contents (and palette) is updated NOW.				*/
/*--------------------------------------------------------------------------*/
void RSbackground(short w, short value)
{
	RGBColor temp1,temp2;
	
	RSsetwind(w);
	if ((value && !RSlocal[w].flipped) || (!value && RSlocal[w].flipped))
	{	
		RSlocal[w].flipped = !RSlocal[w].flipped;

		if (TelInfo->haveColorQuickDraw) //flip the background and foreground color positions
		{
			GetEntryColor(RSlocal[w].pal,0,&temp1);
			GetEntryColor(RSlocal[w].pal,1,&temp2);
			SetEntryColor(RSlocal[w].pal,0,&temp2);
			SetEntryColor(RSlocal[w].pal,1,&temp1);
		}
		SetPort(RSlocal[w].window);
		InvalRect(&RSlocal[w].window->portRect);
		
	}
}
void RScheckmaxwind(Rect *origRect,short origW, 
			short origH, short *endW, short *endH)
{
	Rect *grayRect;
	*endW = origW;
	*endH = origH;
	
	grayRect = &((*TelInfo->greyRegion)->rgnBBox);

	if (origW > (grayRect->right - origRect->left))
		*endW = grayRect->right - origRect->left;

	if (origH > (grayRect->bottom - origRect->top -15 ))
		*endH = grayRect->bottom - origRect->top;
}