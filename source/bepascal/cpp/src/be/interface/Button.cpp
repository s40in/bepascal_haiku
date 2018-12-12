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

#ifndef _BUTTON_CPP_
#define _BUTTON_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Button.cpp
 *   DATE: Tue Dec  3 00:28:35 2002
 *  DESCR: 
 ***********************************************************************/
#include "Button.h"

#include "control.h"
#include <beobj.h>

typedef void (*BButton_MakeDefault_hook) (TPasObject PasObject, bool flag);

#if defined(__cplusplus)
extern "C" {
#endif

BButton_MakeDefault_hook Button_MakeDefault_hook;

#if defined(__cplusplus)
}
#endif

class BPButton : public BButton, public BPControl												 
{
	public:
		// <BView_Constructor>
		BPButton(TPasObject PasObject, 
		          BRect frame,			
		          const char *name,
		          const char *label,
		          BMessage *message,
		          uint32 resizeMask,
		          uint32 flags);
		BPButton(TPasObject PasObject, BMessage *archive);
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

BPButton::BPButton(TPasObject PasObject, BRect frame, 
		  const char *name,
		  const char *label,
          BMessage *message,
          uint32 resizeMask,
          uint32 flags)
          : 
          BButton(frame, name, label, message,
          resizeMask, flags), 
          BPControl(PasObject, frame, name, label, message,
          resizeMask, flags), 
//        BPView(PasObject, frame, name, resizeMask, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPButton::BPButton(TPasObject PasObject, BMessage *archive)
          :BButton(archive),
          BPControl(PasObject, archive),
//        BPView(PasObject, archive),
          BPHandler(PasObject, archive)
//       BPasObject(PasObject)
{

}

void BPButton::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BButton::MessageReceived(message);
}

void BPButton::Draw(BRect updateRect)
{
	BButton::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPButton::AttachedToWindow(void)
{
	BButton::AttachedToWindow();
	AttachedToWindow_hookCall();
}

void BPButton::MakeDefault(bool flag)
{
//	Button_MakeDefault_hook(GetPasObject(), flag);
}

void BPButton::WindowActivated(bool active)
{
	BButton::WindowActivated(active);
}

void BPButton::AllAttached(void)
{
	BButton::AllAttached();
}

void BPButton::AllDetached(void)
{
	BButton::AllDetached();
}

void BPButton::DetachedFromWindow(void)
{
	BButton::DetachedFromWindow();
}

void BPButton::DrawAfterChildren(BRect updateRect)
{
	BButton::DrawAfterChildren(updateRect);
}

void BPButton::FrameMoved(BPoint parentPoint)
{
	BButton::FrameMoved(parentPoint);
}

void BPButton::FrameResized(float width, float height)
{
	BButton::FrameResized(width, height);
}

void BPButton::GetPreferredSize(float *width, float *height)
{
	BButton::GetPreferredSize(width, height);
}

void BPButton::ResizeToPreferred(void)
{
	BButton::ResizeToPreferred();
}

void BPButton::KeyDown(const char *bytes, int32 numBytes)
{
	BButton::KeyDown(bytes, numBytes);
}

void BPButton::KeyUp(const char *bytes, int32 numBytes)
{
	BButton::KeyUp(bytes, numBytes);
}

void BPButton::MouseDown(BPoint point)
{
	BButton::MouseDown(point);
}

void BPButton::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BButton::MouseMoved(point, transit, message);
}

void BPButton::MouseUp(BPoint point)
{
	BButton::MouseUp(point);
}

void BPButton::Pulse(void)
{
	BButton::Pulse();
}

//void BPButton::TargetedByScrollView(BScrollView *scroller)
//{
//	BButton::TargetedByScrollView(scroller);
//}

void BPButton::SetEnabled(bool enabled)
{
	BButton::SetEnabled(enabled);
}

void BPButton::SetValue(int32 value)
{
	BButton::SetValue(value);
}

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BButton::~BButton
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BButton_Free(BButton *Button)
{
   delete Button;
}


/***********************************************************************
 *  Method: BButton::BButton
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BButton_Create(TPasObject PasObject, BRect frame,			
				          const char *name,
				          const char *label,
				          BMessage *message,
				          uint32 resizeMask,
				          uint32 flags)
{
	return new BPButton(PasObject, frame, name, label, message, resizeMask, flags);
}

/***********************************************************************
 *  Method: BButton::BButton
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BButton_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPButton(PasObject, data);
}

/***********************************************************************
 *  Method: BButton::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BButton_Instantiate(BButton *Button, BMessage *data)
{
   return Button->Instantiate(data);
}


/***********************************************************************
 *  Method: BButton::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BButton_Archive(BButton *Button, BMessage *data, bool deep)
{
   return Button->Archive(data, deep);
}


/***********************************************************************
 *  Method: BButton::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_Draw(BButton *Button, BRect updateRect)
{
   Button->Draw(updateRect);
}


/***********************************************************************
 *  Method: BButton::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_MouseDown(BButton *Button, BPoint where)
{
   Button->MouseDown(where);
}


/***********************************************************************
 *  Method: BButton::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_AttachedToWindow(BButton *Button)
{
   Button->AttachedToWindow();
}


/***********************************************************************
 *  Method: BButton::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_KeyDown(BButton *Button, const char *bytes, int32 numBytes)
{
   Button->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BButton::MakeDefault
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_MakeDefault(BButton *Button, bool state)
{
   Button->MakeDefault(state);
}


/***********************************************************************
 *  Method: BButton::SetLabel
 *  Params: const char *text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_SetLabel(BButton *Button, const char *text)
{
   Button->SetLabel(text);
}


/***********************************************************************
 *  Method: BButton::IsDefault
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BButton_IsDefault(BButton *Button)
{
   return Button->IsDefault();
}


/***********************************************************************
 *  Method: BButton::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_MessageReceived(BButton *Button, BMessage *msg)
{
   Button->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BButton::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_WindowActivated(BButton *Button, bool state)
{
   Button->WindowActivated(state);
}


/***********************************************************************
 *  Method: BButton::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_MouseUp(BButton *Button, BPoint pt)
{
   Button->MouseUp(pt);
}


/***********************************************************************
 *  Method: BButton::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_MouseMoved(BButton *Button, BPoint pt, uint32 code, const BMessage *msg)
{
   Button->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BButton::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_DetachedFromWindow(BButton *Button)
{
   Button->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BButton::SetValue
 *  Params: int32 value
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_SetValue(BButton *Button, int32 value)
{
   Button->SetValue(value);
}


/***********************************************************************
 *  Method: BButton::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_GetPreferredSize(BButton *Button, float *width, float *height)
{
   Button->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BButton::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_ResizeToPreferred(BButton *Button)
{
   Button->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BButton::Invoke
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BButton_Invoke(BButton *Button, BMessage *msg)
{
   return Button->Invoke(msg);
}


/***********************************************************************
 *  Method: BButton::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_FrameMoved(BButton *Button, BPoint new_position)
{
   Button->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BButton::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_FrameResized(BButton *Button, float new_width, float new_height)
{
   Button->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BButton::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_MakeFocus(BButton *Button, bool state)
{
   Button->MakeFocus(state);
}


/***********************************************************************
 *  Method: BButton::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_AllAttached(BButton *Button)
{
   Button->AllAttached();
}


/***********************************************************************
 *  Method: BButton::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BButton_AllDetached(BButton *Button)
{
   Button->AllDetached();
}


/***********************************************************************
 *  Method: BButton::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BButton_ResolveSpecifier(BButton *Button, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return Button->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BButton::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BButton_GetSupportedSuites(BButton *Button, BMessage *data)
{
   return Button->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BButton::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BButton_Perform(BButton *Button, perform_code d, void *arg)
{
   return Button->Perform(d, arg);
}


/***********************************************************************
 *  Method: BButton::_ReservedButton1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BButton__ReservedButton1(BButton *Button)
{
   Button->_ReservedButton1();
}
*/


/***********************************************************************
 *  Method: BButton::_ReservedButton2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BButton__ReservedButton2(BButton *Button)
{
   Button->_ReservedButton2();
}
*/

/***********************************************************************
 *  Method: BButton::_ReservedButton3
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BButton__ReservedButton3(BButton *Button)
{
   Button->_ReservedButton3();
}
*/

/***********************************************************************
 *  Method: BButton::operator=
 *  Params: const BButton &
 * Returns: BButton &
 * Effects: 
 ***********************************************************************/
/*BButton &
BButton_operator=(BButton *Button, const BButton &)
{
   return Button->operator=();
}
*/


/***********************************************************************
 *  Method: BButton::DrawDefault
 *  Params: BRect bounds, bool enabled
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
/*BRect
BButton_DrawDefault(BButton *Button, BRect bounds, bool enabled)
{
   return Button->DrawDefault(bounds, enabled);
}
*/

/***********************************************************************
 *  Method: BButton::Execute
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BButton_Execute(BButton *Button)
{
   return Button->Execute();
}
*/

#if defined(__cplusplus)
}
#endif

#endif /* _BUTTON_CPP_ */
