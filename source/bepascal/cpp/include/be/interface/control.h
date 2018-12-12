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

#ifndef _CONTROL_H_
#define _CONTROL_H_

#include <beobj.h>

#include "view.h"

typedef void (*BControl_SetEnabled_hook) (TPasObject PasObject, bool enabled);
typedef void (*BControl_SetValue_hook) (TPasObject PasObject, int32 value);

class BPControl : public BControl, public BPView
{
	public:
		// <BView_Constructor>
		BPControl(TPasObject PasObject, 
		          BRect frame,			
		          const char *name,
		          const char *label,
		          BMessage *message,
		          uint32 resizeMask,
		          uint32 flags);
		BPControl(TPasObject PasObject, BMessage *message);
		virtual void MessageReceived(BMessage *message);
		virtual void Draw(BRect updateRect);
		virtual void AttachedToWindow(void);
		virtual void SetEnabled(bool enabled);
		virtual void SetValue(int32 value);
		virtual void SetEnabled_hookCall(bool enabled);
		virtual void SetValue_hookCall(int32 value);
	private:
};

#endif /* _CONTROL_H_ */
