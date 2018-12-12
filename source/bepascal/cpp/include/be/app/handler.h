/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere

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

#ifndef _HANDLER_H_
#define _HANDLER_H_

#include <Handler.h>

#include <beobj.h>

// definition of callback function in BHandler

typedef void (*BHandler_MessageReceived_hook) (TPasObject PasObject, TCPlusObject message);

class BPHandler : public BHandler, public BPasObject
{
	public:
		BPHandler(TPasObject PasObject, const char *name = NULL);
		BPHandler(TPasObject PasObject, BMessage *archive);
		virtual ~BPHandler(void);
		virtual void MessageReceived(BMessage *message);		
		virtual void MessageReceived_hookCall(BMessage *message);				
	private:
};

#endif /* _HANDLER_H_ */
