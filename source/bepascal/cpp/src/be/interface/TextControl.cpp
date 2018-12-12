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

#ifndef _TEXTCONTROL_CPP_
#define _TEXTCONTROL_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Button.cpp
 *   DATE: Tue Dec  3 00:28:35 2002
 *  DESCR: 
 ***********************************************************************/
#include "TextControl.h"

#include "control.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif


#if defined(__cplusplus)
}
#endif

class BPTextControl : public BTextControl, public BPControl {

public:
		BPTextControl(TPasObject PasObject, 
		   		      BRect frame,
					  const char *name,
					  const char *label, 
					  const char *initial_text, 
					  BMessage *message,
					  uint32 rmask = B_FOLLOW_LEFT | B_FOLLOW_TOP,
					  uint32 flags = B_WILL_DRAW | B_NAVIGABLE); 
//virtual	~BPTextControl();

		BPTextControl(TPasObject PasObject,BMessage *data);

static	BArchivable		*Instantiate(BMessage *data);
//virtual	status_t		Archive(BMessage *data, bool deep = true) const;

//virtual	void			SetText(const char *text);
		const char		*Text() const;

virtual	void			SetValue(int32 value);
//virtual	status_t		Invoke(BMessage *msg = NULL);

		BTextView		*TextView() const;

//virtual	void			SetModificationMessage(BMessage *message);
		BMessage		*ModificationMessage() const;

//virtual	void			SetAlignment(alignment label, alignment text);
		void			GetAlignment(alignment *label, alignment *text) const;
//virtual	void			SetDivider(float dividing_line);
		float			Divider() const;

virtual	void			Draw(BRect updateRect);
virtual	void			MouseDown(BPoint where);
virtual	void			AttachedToWindow();
//virtual	void			MakeFocus(bool focusState = true);
virtual	void			SetEnabled(bool state);
virtual	void			FrameMoved(BPoint new_position);
virtual	void			FrameResized(float new_width, float new_height);
virtual	void			WindowActivated(bool active);
	
virtual	void			GetPreferredSize(float *width, float *height);
virtual	void			ResizeToPreferred();

virtual void			MessageReceived(BMessage *msg);
/*virtual BHandler		*ResolveSpecifier(BMessage *msg,
										int32 index,
										BMessage *specifier,
										int32 form,
										const char *property);
*/
virtual	void			MouseUp(BPoint pt);
virtual	void			MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
virtual	void			DetachedFromWindow();

virtual void			AllAttached();
virtual void			AllDetached();
//virtual status_t		GetSupportedSuites(BMessage *data);
//virtual void			SetFlags(uint32 flags);


/*----- Private or reserved -----------------------------------------*/
//virtual status_t		Perform(perform_code d, void *arg);

private:
};



BPTextControl::BPTextControl(TPasObject PasObject, 
		   		      BRect frame,
					  const char *name,
					  const char *label, 
					  const char *initial_text, 
					  BMessage *message,
					  uint32 rmask,
					  uint32 flags)
					  :
					  BTextControl(frame,name,label,initial_text,
					  message,rmask,flags),
          BPControl(PasObject, frame, name, label, message,
          rmask, flags), 
//       BPView(PasObject, frame, name, rmask, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPTextControl::BPTextControl(TPasObject PasObject, BMessage *archive)
          :BTextControl(archive),
          BPControl(PasObject, archive),
//       BPView(PasObject, archive),
          BPHandler(PasObject, archive)
//       BPasObject(PasObject)
{

}

void BPTextControl::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BTextControl::MessageReceived(message);
}

void BPTextControl::Draw(BRect updateRect)
{
	BTextControl::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPTextControl::AttachedToWindow(void)
{
	BTextControl::AttachedToWindow();
	AttachedToWindow_hookCall();
}


void BPTextControl::WindowActivated(bool active)
{
	BTextControl::WindowActivated(active);
}

void BPTextControl::AllAttached(void)
{
	BTextControl::AllAttached();
}

void BPTextControl::AllDetached(void)
{
	BTextControl::AllDetached();
}

void BPTextControl::DetachedFromWindow(void)
{
	BTextControl::DetachedFromWindow();
}


void BPTextControl::FrameMoved(BPoint parentPoint)
{
	BTextControl::FrameMoved(parentPoint);
}

void BPTextControl::FrameResized(float width, float height)
{
	BTextControl::FrameResized(width, height);
}

void BPTextControl::GetPreferredSize(float *width, float *height)
{
	BTextControl::GetPreferredSize(width, height);
}

void BPTextControl::ResizeToPreferred(void)
{
	BTextControl::ResizeToPreferred();
}



void BPTextControl::MouseDown(BPoint point)
{
	BTextControl::MouseDown(point);
}

void BPTextControl::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BTextControl::MouseMoved(point, transit, message);
}

void BPTextControl::MouseUp(BPoint point)
{
	BTextControl::MouseUp(point);
}


//void BPButton::TargetedByScrollView(BScrollView *scroller)
//{
//	BButton::TargetedByScrollView(scroller);
//}

void BPTextControl::SetEnabled(bool enabled)
{
	BTextControl::SetEnabled(enabled);
}

void BPTextControl::SetValue(int32 value)
{
	BTextControl::SetValue(value);
}



#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: TextControl.cpp
 *   DATE: Tue Jan 14 21:35:44 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BTextControl::~BTextControl
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BTextControl_Free(BTextControl *TextControl)
{
   delete TextControl;
}

TCPlusObject BTextControl_Create(TPasObject PasObject, BRect frame,			
				          const char *name,
				          const char *label,
				          const char *initial_text,
				          BMessage *message,
				          uint32 resizeMask,
				          uint32 flags)
{
	return new BPTextControl(PasObject, frame, name, label,initial_text, message, resizeMask, flags);
}

/***********************************************************************
 *  Method: BTextControl::BTextControl
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BTextControl_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPTextControl(PasObject, data);
}


/***********************************************************************
 *  Method: BTextControl::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BTextControl_Instantiate(BTextControl *TextControl, BMessage *data)
{
   return TextControl->Instantiate(data);
}


/***********************************************************************
 *  Method: BTextControl::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTextControl_Archive(BTextControl *TextControl, BMessage *data, bool deep) 
{
   return TextControl->Archive(data, deep);
}


/***********************************************************************
 *  Method: BTextControl::SetText
 *  Params: const char *text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetText(BTextControl *TextControl, const char *text)
{
   TextControl->SetText(text);
}


/***********************************************************************
 *  Method: BTextControl::Text
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BTextControl_Text(BTextControl *TextControl) 
{
   return TextControl->Text();
}


/***********************************************************************
 *  Method: BTextControl::SetValue
 *  Params: int32 value
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetValue(BTextControl *TextControl, int32 value)
{
   TextControl->SetValue(value);
}


/***********************************************************************
 *  Method: BTextControl::Invoke
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTextControl_Invoke(BTextControl *TextControl, BMessage *msg)
{
   return TextControl->Invoke(msg);
}


/***********************************************************************
 *  Method: BTextControl::TextView
 *  Params: 
 * Returns: BTextView *
 * Effects: 
 ***********************************************************************/
BTextView *
BTextControl_TextView(BTextControl *TextControl) 
{
   return TextControl->TextView();
}


/***********************************************************************
 *  Method: BTextControl::SetModificationMessage
 *  Params: BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetModificationMessage(BTextControl *TextControl, BMessage *message)
{
   TextControl->SetModificationMessage(message);
}


/***********************************************************************
 *  Method: BTextControl::ModificationMessage
 *  Params: 
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
BMessage *
BTextControl_ModificationMessage(BTextControl *TextControl) 
{
   return TextControl->ModificationMessage();
}


/***********************************************************************
 *  Method: BTextControl::SetAlignment
 *  Params: alignment label, alignment text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetAlignment(BTextControl *TextControl, alignment label, alignment text)
{
   TextControl->SetAlignment(label, text);
}


/***********************************************************************
 *  Method: BTextControl::GetAlignment
 *  Params: alignment *label, alignment *text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_GetAlignment(BTextControl *TextControl, alignment *label, alignment *text) 
{
   TextControl->GetAlignment(label, text);
}


/***********************************************************************
 *  Method: BTextControl::SetDivider
 *  Params: float dividing_line
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetDivider(BTextControl *TextControl, float dividing_line)
{
   TextControl->SetDivider(dividing_line);
}


/***********************************************************************
 *  Method: BTextControl::Divider
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BTextControl_Divider(BTextControl *TextControl) 
{
   return TextControl->Divider();
}


/***********************************************************************
 *  Method: BTextControl::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_Draw(BTextControl *TextControl, BRect updateRect)
{
   TextControl->Draw(updateRect);
}


/***********************************************************************
 *  Method: BTextControl::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_MouseDown(BTextControl *TextControl, BPoint where)
{
   TextControl->MouseDown(where);
}


/***********************************************************************
 *  Method: BTextControl::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_AttachedToWindow(BTextControl *TextControl)
{
   TextControl->AttachedToWindow();
}


/***********************************************************************
 *  Method: BTextControl::MakeFocus
 *  Params: bool focusState
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_MakeFocus(BTextControl *TextControl, bool focusState)
{
   TextControl->MakeFocus(focusState);
}


/***********************************************************************
 *  Method: BTextControl::SetEnabled
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetEnabled(BTextControl *TextControl, bool state)
{
   TextControl->SetEnabled(state);
}


/***********************************************************************
 *  Method: BTextControl::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_FrameMoved(BTextControl *TextControl, BPoint new_position)
{
   TextControl->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BTextControl::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_FrameResized(BTextControl *TextControl, float new_width, float new_height)
{
   TextControl->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BTextControl::WindowActivated
 *  Params: bool active
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_WindowActivated(BTextControl *TextControl, bool active)
{
   TextControl->WindowActivated(active);
}


/***********************************************************************
 *  Method: BTextControl::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_GetPreferredSize(BTextControl *TextControl, float *width, float *height)
{
   TextControl->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BTextControl::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_ResizeToPreferred(BTextControl *TextControl)
{
   TextControl->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BTextControl::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_MessageReceived(BTextControl *TextControl, BMessage *msg)
{
   TextControl->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BTextControl::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BTextControl_ResolveSpecifier(BTextControl *TextControl, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return TextControl->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BTextControl::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_MouseUp(BTextControl *TextControl, BPoint pt)
{
   TextControl->MouseUp(pt);
}


/***********************************************************************
 *  Method: BTextControl::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_MouseMoved(BTextControl *TextControl, BPoint pt, uint32 code, const BMessage *msg)
{
   TextControl->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BTextControl::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_DetachedFromWindow(BTextControl *TextControl)
{
   TextControl->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BTextControl::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_AllAttached(BTextControl *TextControl)
{
   TextControl->AllAttached();
}


/***********************************************************************
 *  Method: BTextControl::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_AllDetached(BTextControl *TextControl)
{
   TextControl->AllDetached();
}


/***********************************************************************
 *  Method: BTextControl::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTextControl_GetSupportedSuites(BTextControl *TextControl, BMessage *data)
{
   return TextControl->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BTextControl::SetFlags
 *  Params: uint32 flags
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextControl_SetFlags(BTextControl *TextControl, uint32 flags)
{
   TextControl->SetFlags(flags);
}


/***********************************************************************
 *  Method: BTextControl::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
#ifndef __HAIKU__
status_t
BTextControl_Perform(BTextControl *TextControl, perform_code d, void *arg)
{
   return TextControl->Perform(d, arg);
}
#endif

/***********************************************************************
 *  Method: BTextControl::_ReservedTextControl1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BTextControl__ReservedTextControl1(BTextControl *TextControl)
{
   TextControl->_ReservedTextControl1();
}
*/

/***********************************************************************
 *  Method: BTextControl::_ReservedTextControl2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BTextControl__ReservedTextControl2(BTextControl *TextControl)
{
   TextControl->_ReservedTextControl2();
}
*/

/***********************************************************************
 *  Method: BTextControl::_ReservedTextControl3
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BTextControl__ReservedTextControl3(BTextControl *TextControl)
{
   TextControl->_ReservedTextControl3();
}

*/
/***********************************************************************
 *  Method: BTextControl::_ReservedTextControl4
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BTextControl__ReservedTextControl4(BTextControl *TextControl)
{
   TextControl->_ReservedTextControl4();
}
*/

/***********************************************************************
 *  Method: BTextControl::operator=
 *  Params: const BTextControl &
 * Returns: BTextControl &
 * Effects: 
 ***********************************************************************/
/*BTextControl &
BTextControl_operator=(BTextControl *TextControl, const BTextControl &)
{
   return TextControl->operator=();
}
*/

/***********************************************************************
 *  Method: BTextControl::CommitValue
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BTextControl_CommitValue(BTextControl *TextControl)
{
   TextControl->CommitValue();
}
*/

/***********************************************************************
 *  Method: BTextControl::InitData
 *  Params: const char *label, const char *initial_text, BMessage *data
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BTextControl_InitData(BTextControl *TextControl, const char *label, const char *initial_text, BMessage *data)
{
   TextControl->InitData(label, initial_text, data);
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _TextControl_CPP_ */

