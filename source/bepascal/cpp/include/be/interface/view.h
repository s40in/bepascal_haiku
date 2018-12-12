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

#ifndef _VIEW_H_
#define _VIEW_H_

#include <View.h>

#include <OS.h>

#include <handler.h>
#include <beobj.h>

class BPView : public BView, public virtual BPHandler
{
	public:
		BPView(TPasObject PasObject, 
			   BRect frame,
			   const char *name,
			   uint32 resizingMode,
			   uint32 flags);
		BPView(TPasObject PasObject, BMessage *archive);
		virtual void MessageReceived(BMessage *message);
		virtual void AllAttached(void);
		virtual void AttachedToWindow(void);
		virtual void AllDetached(void);
		virtual void DetachedFromWindow(void);
		virtual void Draw(BRect updateRect);
		virtual void DrawAfterChildren(BRect updateRect);
		virtual void FrameMoved(BPoint parentPoint);
		virtual void FrameResized(float width, float height);
		virtual void GetPreferredSize(float *width, float *height);
		virtual void ResizeToPreferred(void);
		virtual void KeyDown(const char *bytes, int32 numBytes);
		virtual void KeyUp(const char *bytes, int32 numBytes);
		virtual void MouseDown(BPoint point);
		virtual void MouseMoved(BPoint point, uint32 transit, const BMessage *message);
		virtual void MouseUp(BPoint point);
		virtual void Pulse(void);
//		virtual void TargetedByScrollView(BScrollView *scroller);
		virtual void WindowActivated(bool active);
		virtual void Draw_hookCall(BRect updateRect);		
		virtual void AttachedToWindow_hookCall(void);		
		virtual void AllAttached_hookCall(void);
		virtual void AllDetached_hookCall(void);
		virtual void DetachedFromWindow_hookCall(void);
		virtual void DrawAfterChildren_hookCall(BRect updateRect);
		virtual void FrameMoved_hookCall(BPoint parentPoint);
		virtual void FrameResized_hookCall(float width, float height);
		virtual void GetPreferredSize_hookCall(float *width, float *height);
		virtual void ResizeToPreferred_hookCall(void);
		virtual void KeyDown_hookCall(const char *bytes, int32 numBytes);
		virtual void KeyUp_hookCall(const char *bytes, int32 numBytes);
		virtual void MouseDown_hookCall(BPoint point);
		virtual void MouseMoved_hookCall(BPoint point, uint32 transit, const BMessage *message);
		virtual void MouseUp_hookCall(BPoint point);
		virtual void Pulse_hookCall(void);
//		virtual void TargetedByScrollView_hookCall(BScrollView *scroller);
		virtual void WindowActivated_hookCall(bool active);		
	private:	
};

#endif /* _VIEW_H_ */
