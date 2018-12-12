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

#ifndef _CHECKBOX_CPP_
#define _CHECKBOX_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Button.cpp
 *   DATE: Tue Dec  3 00:28:35 2002
 *  DESCR: 
 ***********************************************************************/
#include "CheckBox.h"

#include "control.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif


#if defined(__cplusplus)
}
#endif

class BPCheckBox : public BCheckBox, public BPControl {

public:
					BPCheckBox(TPasObject PasObject, BRect frame,
							const char *name,
							const char *label,
							BMessage *message,
							uint32 resizeMask = B_FOLLOW_LEFT | B_FOLLOW_TOP, 
							uint32 flags = B_WILL_DRAW | B_NAVIGABLE); 
//virtual				~BCheckBox();

/* Archiving */
					BPCheckBox(TPasObject PasObject, BMessage *data);
//static	BArchivable	*Instantiate(BMessage *data);
//virtual	status_t	Archive(BMessage *data, bool deep = true) const;

virtual	void		Draw(BRect updateRect);
virtual	void		AttachedToWindow();
virtual	void		MouseDown(BPoint where);

virtual void		MessageReceived(BMessage *msg);
virtual void		WindowActivated(bool state);
virtual	void		KeyDown(const char *bytes, int32 numBytes);
virtual	void		MouseUp(BPoint pt);
virtual	void		MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
virtual	void		DetachedFromWindow();
virtual	void		SetValue(int32 value);
virtual void		GetPreferredSize(float *width, float *height);
virtual void		ResizeToPreferred();
//virtual	status_t	Invoke(BMessage *msg = NULL);
virtual	void		FrameMoved(BPoint new_position);
virtual	void		FrameResized(float new_width, float new_height);

/*virtual BHandler	*ResolveSpecifier(BMessage *msg,
									int32 index,
									BMessage *specifier,
									int32 form,
									const char *property);
*/
//virtual status_t	GetSupportedSuites(BMessage *data);

//virtual void		MakeFocus(bool state = true);
virtual void		AllAttached();
virtual void		AllDetached();


/*----- Private or reserved -----------------------------------------*/
//virtual status_t	Perform(perform_code d, void *arg);

private:
};

BPCheckBox::BPCheckBox(TPasObject PasObject, 
		   		      BRect frame,
					  const char *name,
					  const char *label, 
					  BMessage *message,
					  uint32 rmask,
					  uint32 flags)
					  :
					  BCheckBox(frame,name,label,
					  message,rmask,flags),
          BPControl(PasObject, frame, name, label, message,
          rmask, flags), 
//       BPView(PasObject, frame, name, rmask, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPCheckBox::BPCheckBox(TPasObject PasObject, BMessage *archive)
          :BCheckBox(archive),
          BPControl(PasObject, archive),
//       BPView(PasObject, archive),
          BPHandler(PasObject, archive)
//       BPasObject(PasObject)
{

}

void BPCheckBox::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BCheckBox::MessageReceived(message);
}

void BPCheckBox::Draw(BRect updateRect)
{
	BCheckBox::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPCheckBox::AttachedToWindow(void)
{
	BCheckBox::AttachedToWindow();
	AttachedToWindow_hookCall();
}


void BPCheckBox::WindowActivated(bool active)
{
	BCheckBox::WindowActivated(active);
}

void BPCheckBox::KeyDown(const char *bytes, int32 numBytes)
{
	BCheckBox::KeyDown(bytes, numBytes);
}


void BPCheckBox::AllAttached(void)
{
	BCheckBox::AllAttached();
}

void BPCheckBox::AllDetached(void)
{
	BCheckBox::AllDetached();
}

void BPCheckBox::DetachedFromWindow(void)
{
	BCheckBox::DetachedFromWindow();
}


void BPCheckBox::FrameMoved(BPoint parentPoint)
{
	BCheckBox::FrameMoved(parentPoint);
}

void BPCheckBox::FrameResized(float width, float height)
{
	BCheckBox::FrameResized(width, height);
}

void BPCheckBox::GetPreferredSize(float *width, float *height)
{
	BCheckBox::GetPreferredSize(width, height);
}

void BPCheckBox::ResizeToPreferred(void)
{
	BCheckBox::ResizeToPreferred();
}



void BPCheckBox::MouseDown(BPoint point)
{
	BCheckBox::MouseDown(point);
}

void BPCheckBox::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BCheckBox::MouseMoved(point, transit, message);
}

void BPCheckBox::MouseUp(BPoint point)
{
	BCheckBox::MouseUp(point);
}


//void BPButton::TargetedByScrollView(BScrollView *scroller)
//{
//	BButton::TargetedByScrollView(scroller);
//}


void BPCheckBox::SetValue(int32 value)
{
	BCheckBox::SetValue(value);
}



#if defined(__cplusplus)
extern "C" {
#endif



/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: CheckBox.cpp
 *   DATE: Thu Jan 16 20:29:31 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BCheckBox::~BCheckBox
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BCheckBox_FREE(BCheckBox *CheckBox)
{
   delete CheckBox;
}

TCPlusObject BCheckBox_Create(TPasObject PasObject, BRect frame,
							const char *name,
							const char *label,
							BMessage *message,
							uint32 resizeMask , 
							uint32 flags )
{
	return new BPCheckBox( PasObject,  frame,
							name,
							label,
							message,
							 resizeMask , 
							 flags );
}							 


/***********************************************************************
 *  Method: BCheckBox::BCheckBox
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BCheckBox_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPCheckBox(PasObject, data);
}


/***********************************************************************
 *  Method: BCheckBox::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BCheckBox_Instantiate(BCheckBox *CheckBox, BMessage *data)
{
   return CheckBox->Instantiate(data);
}


/***********************************************************************
 *  Method: BCheckBox::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BCheckBox_Archive(BCheckBox *CheckBox, BMessage *data, bool deep) 
{
   return CheckBox->Archive(data, deep);
}


/***********************************************************************
 *  Method: BCheckBox::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_Draw(BCheckBox *CheckBox, BRect updateRect)
{
   CheckBox->Draw(updateRect);
}


/***********************************************************************
 *  Method: BCheckBox::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_AttachedToWindow(BCheckBox *CheckBox)
{
   CheckBox->AttachedToWindow();
}


/***********************************************************************
 *  Method: BCheckBox::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_MouseDown(BCheckBox *CheckBox, BPoint where)
{
   CheckBox->MouseDown(where);
}


/***********************************************************************
 *  Method: BCheckBox::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_MessageReceived(BCheckBox *CheckBox, BMessage *msg)
{
   CheckBox->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BCheckBox::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_WindowActivated(BCheckBox *CheckBox, bool state)
{
   CheckBox->WindowActivated(state);
}


/***********************************************************************
 *  Method: BCheckBox::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_KeyDown(BCheckBox *CheckBox, const char *bytes, int32 numBytes)
{
   CheckBox->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BCheckBox::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_MouseUp(BCheckBox *CheckBox, BPoint pt)
{
   CheckBox->MouseUp(pt);
}


/***********************************************************************
 *  Method: BCheckBox::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_MouseMoved(BCheckBox *CheckBox, BPoint pt, uint32 code, const BMessage *msg)
{
   CheckBox->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BCheckBox::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_DetachedFromWindow(BCheckBox *CheckBox)
{
   CheckBox->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BCheckBox::SetValue
 *  Params: int32 value
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_SetValue(BCheckBox *CheckBox, int32 value)
{
   CheckBox->SetValue(value);
}


/***********************************************************************
 *  Method: BCheckBox::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_GetPreferredSize(BCheckBox *CheckBox, float *width, float *height)
{
   CheckBox->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BCheckBox::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_ResizeToPreferred(BCheckBox *CheckBox)
{
   CheckBox->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BCheckBox::Invoke
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BCheckBox_Invoke(BCheckBox *CheckBox, BMessage *msg)
{
   return CheckBox->Invoke(msg);
}


/***********************************************************************
 *  Method: BCheckBox::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_FrameMoved(BCheckBox *CheckBox, BPoint new_position)
{
   CheckBox->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BCheckBox::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_FrameResized(BCheckBox *CheckBox, float new_width, float new_height)
{
   CheckBox->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BCheckBox::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BCheckBox_ResolveSpecifier(BCheckBox *CheckBox, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return CheckBox->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BCheckBox::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BCheckBox_GetSupportedSuites(BCheckBox *CheckBox, BMessage *data)
{
   return CheckBox->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BCheckBox::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_MakeFocus(BCheckBox *CheckBox, bool state)
{
   CheckBox->MakeFocus(state);
}


/***********************************************************************
 *  Method: BCheckBox::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_AllAttached(BCheckBox *CheckBox)
{
   CheckBox->AllAttached();
}


/***********************************************************************
 *  Method: BCheckBox::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BCheckBox_AllDetached(BCheckBox *CheckBox)
{
   CheckBox->AllDetached();
}


/***********************************************************************
 *  Method: BCheckBox::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BCheckBox_Perform(BCheckBox *CheckBox, perform_code d, void *arg)
{
   return CheckBox->Perform(d, arg);
}


/***********************************************************************
 *  Method: BCheckBox::_ReservedCheckBox1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BCheckBox__ReservedCheckBox1(BCheckBox *CheckBox)
{
   CheckBox->_ReservedCheckBox1();
}
*/

/***********************************************************************
 *  Method: BCheckBox::_ReservedCheckBox2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BCheckBox__ReservedCheckBox2(BCheckBox *CheckBox)
{
   CheckBox->_ReservedCheckBox2();
}

*/
/***********************************************************************
 *  Method: BCheckBox::_ReservedCheckBox3
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BCheckBox__ReservedCheckBox3(BCheckBox *CheckBox)
{
   CheckBox->_ReservedCheckBox3();
}
*/

/***********************************************************************
 *  Method: BCheckBox::operator=
 *  Params: const BCheckBox &
 * Returns: BCheckBox &
 * Effects: 
 ***********************************************************************/
/*BCheckBox &
BCheckBox_operator=(BCheckBox *CheckBox, const BCheckBox &)
{
   return CheckBox->operator=();
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _CHECKBOX_CPP_ */

