/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere
                       Eric Jourde

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public
    License along with this library; if not, write to the Free
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifndef _CURSOR_CPP_
#define _CURSOR_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Screen.cpp
 *   DATE: Wed Sep 24 20:58:44 2003
 *  DESCR: 
 ***********************************************************************/
#include "Cursor.h"
#include <beobj.h>



class BPCursor : public BCursor, virtual public BPasObject
{
	public:
		BPCursor(TPasObject PasObject,const void *cursorData);
		BPCursor(TPasObject PasObject,BMessage *data);
	private:
};



BPCursor::BPCursor(TPasObject PasObject,const void *cursorData)
					:BCursor(cursorData),
					BPasObject(PasObject)
					
{
};
BPCursor::BPCursor(TPasObject PasObject,BMessage *data)
					:BCursor(data),
					BPasObject(PasObject)
					
{
};


#if defined(__cplusplus)
extern "C" {
#endif/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Cursor.cpp
 *   DATE: Sat Sep 27 21:25:18 2003
 *  DESCR: 
 ***********************************************************************/


/***********************************************************************
 *  Method: BCursor::BCursor
 *  Params: const void *cursorData
 * Effects: 
 ***********************************************************************/
TCPlusObject BCursor_Create(TPasObject PasObject, const void *cursorData)
{
	return new BPCursor(PasObject, cursorData);
}


/***********************************************************************
 *  Method: BCursor::BCursor
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BCursor_Create_1
(TPasObject PasObject, BMessage *data)
{
	return new BPCursor(PasObject, data);
}


/***********************************************************************
 *  Method: BCursor::~BCursor
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BCursor_Free(BCursor *Cursor)
{
   delete Cursor;
}


/***********************************************************************
 *  Method: BCursor::Archive
 *  Params: BMessage *into, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BCursor_Archive(BCursor *Cursor, BMessage *into, bool deep) 
{
   return Cursor->Archive(into, deep);
}


/***********************************************************************
 *  Method: BCursor::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BCursor_Instantiate(BCursor *Cursor, BMessage *data)
{
   return Cursor->Instantiate(data);
}


/***********************************************************************
 *  Method: BCursor::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
#ifndef __HAIKU__
status_t
BCursor_Perform(BCursor *Cursor, perform_code d, void *arg)
{
   return Cursor->Perform(d, arg);
}
#endif


#if defined(__cplusplus)
}
#endif

#endif /* _REGION_CPP_ */


