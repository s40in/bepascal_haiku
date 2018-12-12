#ifndef _MENUBAR_H_
#define _MENUBAR_H_

#include "MenuBar.h"
#include "menu.h"
#include <beobj.h>

class BPMenuBar : public BMenuBar, public BPMenu
{
	public:
		BPMenuBar(TPasObject PasObject, BRect frame, const char *name, 
		uint32 resizingMode = B_FOLLOW_LEFT_RIGHT | B_FOLLOW_TOP,
		menu_layout layout = B_ITEMS_IN_COLUMN, bool resizeToFit = true); 
		BPMenuBar(TPasObject PasObject, const char *name, float width, float height);
		BPMenuBar(TPasObject PasObject, BMessage *archive);
		BPMenuBar(TPasObject PasObject, BRect frame, const char *name, uint32 resizingMode, uint32 flags, menu_layout layout, bool resizeToFit);
		virtual void MessageReceived(BMessage *message);
		virtual void Draw(BRect updateRect);
		virtual void AttachedToWindow(void);
		virtual void MakeDefault(bool flag);
		virtual void WindowActivated(bool active);	

		virtual void AllAttached(void);
		virtual void AllDetached(void);
		virtual void DetachedFromWindow(void);
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
		virtual void SetEnabled(bool enabled);
		virtual void SetValue(int32 value);
	private:
};

#endif /* _MENU_H_ */
