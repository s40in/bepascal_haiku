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
    Foundation, Inc., s59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifndef _WINDOW_H_
#define _WINDOW_H_

#include <Window.h>

#include <OS.h>

#include <looper.h>
#include <window.h>
#include <beobj.h>

class BPWindow : public BWindow, public BPLooper
{
	public:
		BPWindow(TPasObject PasObject, 
				 BRect frame,
				 const char *title,
				 window_type type,
				 uint32 flags,
				 uint32 workspaces = B_CURRENT_WORKSPACE);
		virtual void MessageReceived(BMessage *message);						 
		virtual void DispatchMessage(BMessage *message, BHandler *target);
		virtual bool QuitRequested(void);
		virtual void WindowActivated(bool active);
	private:	
};

#endif /* _WINDOW_H_ */
