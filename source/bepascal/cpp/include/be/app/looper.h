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

#ifndef _LOOPER_H_
#define _LOOPER_H_

#include <Looper.h>
#include <Message.h>

#include <OS.h>

#include <beobj.h>

#include <handler.h>

class BPLooper : public BLooper, public BPHandler
{
	public:
		BPLooper(TPasObject PasObject, const char *name = NULL,
				 int32 priority = B_NORMAL_PRIORITY,
				 int32 portCapacity = B_LOOPER_PORT_DEFAULT_CAPACITY);
		virtual ~BPLooper();
		virtual void DispatchMessage(BMessage *message, BHandler *target);
		virtual bool QuitRequested(void);
		virtual void MessageReceived(BMessage *message);
		virtual void DispatchMessage_hookCall(BMessage *message, BHandler *target);
		virtual bool QuitRequested_hookCall(void);		
	private:	
};

#endif /* _LOOPER_H_ */
