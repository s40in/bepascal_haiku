/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003	Olivier Coursiere
						Eric Jourde 
						Oscar Lesta

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

#ifndef _RADIOBUTTON_CPP_
#define _RADIOBUTTON_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: RadioButton.cpp
 *   DATE: Mon Jan 20 02:30:54 2003
 *  DESCR: 
 ***********************************************************************/
#include "RadioButton.h"

#include "control.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif


#if defined(__cplusplus)
}
#endif

class BPRadioButton : public BRadioButton, public BPControl {

public:
	BPRadioButton(TPasObject PasObject,
					BRect frame,
					const char *name,
					const char *label,
					BMessage *message,
					uint32 resizMask = B_FOLLOW_LEFT | B_FOLLOW_TOP,
					uint32 flags = B_WILL_DRAW | B_NAVIGABLE); 
	//virtual		~BRadioButton();

/* Archiving */
				BPRadioButton(TPasObject PasObject, BMessage *data);

	//static	BArchivable		*Instantiate(BMessage *data);
	//virtual	status_t		Archive(BMessage *data, bool deep = true) const;
	virtual	void	Draw(BRect updateRect);
	virtual	void	MouseDown(BPoint where);
	virtual	void	AttachedToWindow();
	virtual	void	KeyDown(const char *bytes, int32 numBytes);
	virtual	void	SetValue(int32 value);
	virtual	void	GetPreferredSize(float *width, float *height);
	virtual void	ResizeToPreferred();
	//virtual	status_t		Invoke(BMessage *msg = NULL);

	virtual void	MessageReceived(BMessage *msg);
	virtual void	WindowActivated(bool state);
	virtual	void	MouseUp(BPoint pt);
	virtual	void	MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
	virtual	void	DetachedFromWindow();
	virtual	void	FrameMoved(BPoint new_position);
	virtual	void	FrameResized(float new_width, float new_height);
/*
	virtual BHandler	*ResolveSpecifier(BMessage *msg,
										int32 index,
										BMessage *specifier,
										int32 form,
										const char *property);
*/
	//virtual void		MakeFocus(bool state = true);
	virtual void		AllAttached();
//	virtual void		AllDetached();
//	virtual status_t	GetSupportedSuites(BMessage *data);


/*----- Private or reserved -----------------------------------------*/
//virtual status_t		Perform(perform_code d, void *arg);

private:
	/*friend	status_t		_init_interface_kit_();

	virtual	void	_ReservedRadioButton1();
	virtual	void	_ReservedRadioButton2();

	BRadioButton	&operator=(const BRadioButton &);
	static	BBitmap	*sBitmaps[2][3];

	bool	fOutlined;
	uint32	_reserved[2];*/
};

BPRadioButton::BPRadioButton(TPasObject PasObject, 
		   		      BRect frame,
					  const char *name,
					  const char *label, 
					  BMessage *message,
					  uint32 rmask,
					  uint32 flags)
					  :
					  BRadioButton(frame,name,label,
					  message,rmask,flags),
          BPControl(PasObject, frame, name, label, message,
          rmask, flags), 
//       BPView(PasObject, frame, name, rmask, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}


BPRadioButton::BPRadioButton(TPasObject PasObject, BMessage *archive)
          :BRadioButton(archive),
          BPControl(PasObject, archive),
//       BPView(PasObject, archive),
          BPHandler(PasObject, archive)
//       BPasObject(PasObject)
{

}


void BPRadioButton::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BRadioButton::MessageReceived(message);
}

void BPRadioButton::Draw(BRect updateRect)
{
	BRadioButton::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPRadioButton::AttachedToWindow(void)
{
	BRadioButton::AttachedToWindow();
	AttachedToWindow_hookCall();
}


void BPRadioButton::WindowActivated(bool active)
{
	BRadioButton::WindowActivated(active);
}

void BPRadioButton::KeyDown(const char *bytes, int32 numBytes)
{
	BRadioButton::KeyDown(bytes, numBytes);
}


void BPRadioButton::AllAttached(void)
{
	BRadioButton::AllAttached();
}
/*
void BPRadioButton::AllDetached(void)
{
	BRadioButton::AllDetached();
}
*/
void BPRadioButton::DetachedFromWindow(void)
{
	BRadioButton::DetachedFromWindow();
}


void BPRadioButton::FrameMoved(BPoint parentPoint)
{
	BRadioButton::FrameMoved(parentPoint);
}

void BPRadioButton::FrameResized(float width, float height)
{
	BRadioButton::FrameResized(width, height);
}

void BPRadioButton::GetPreferredSize(float *width, float *height)
{
	BRadioButton::GetPreferredSize(width, height);
}

void BPRadioButton::ResizeToPreferred(void)
{
	BRadioButton::ResizeToPreferred();
}


void BPRadioButton::MouseDown(BPoint point)
{
	BRadioButton::MouseDown(point);
}

void BPRadioButton::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BRadioButton::MouseMoved(point, transit, message);
}

void BPRadioButton::MouseUp(BPoint point)
{
	BRadioButton::MouseUp(point);
}


//void BPButton::TargetedByScrollView(BScrollView *scroller)
//{
//	BButton::TargetedByScrollView(scroller);
//}


void BPRadioButton::SetValue(int32 value)
{
	BRadioButton::SetValue(value);
}



#if defined(__cplusplus)
extern "C" {
#endif


/***********************************************************************
 *  Method: BRadioButton::~BRadioButton
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BRadioButton_FREE(BRadioButton *RadioButton)
{
   delete RadioButton;
}

TCPlusObject BRadioButton_Create(TPasObject PasObject, BRect frame,
							const char *name,
							const char *label,
							BMessage *message,
							uint32 resizeMask , 
							uint32 flags )
{
	return new BPRadioButton( PasObject,  frame,
							name,
							label,
							message,
							 resizeMask , 
							 flags );
}							 


/***********************************************************************
 *  Method: BRadioButton::BRadioButton
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BRadioButton_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPRadioButton(PasObject, data);
}


/***********************************************************************
 *  Method: BRadioButton::~BRadioButton
 *  Params: 
 * Effects: 
 ***********************************************************************/
/*BRadioButton_~BRadioButton(BRadioButton *RadioButton)
{
   return RadioButton->~BRadioButton();
}
*/

/***********************************************************************
 *  Method: BRadioButton::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BRadioButton_Instantiate(BRadioButton *RadioButton, BMessage *data)
{
   return RadioButton->Instantiate(data);
}


/***********************************************************************
 *  Method: BRadioButton::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRadioButton_Archive(BRadioButton *RadioButton, BMessage *data, bool deep)
{
   return RadioButton->Archive(data, deep);
}


/***********************************************************************
 *  Method: BRadioButton::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_Draw(BRadioButton *RadioButton, BRect updateRect)
{
   RadioButton->Draw(updateRect);
}


/***********************************************************************
 *  Method: BRadioButton::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_MouseDown(BRadioButton *RadioButton, BPoint where)
{
   RadioButton->MouseDown(where);
}


/***********************************************************************
 *  Method: BRadioButton::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_AttachedToWindow(BRadioButton *RadioButton)
{
   RadioButton->AttachedToWindow();
}


/***********************************************************************
 *  Method: BRadioButton::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_KeyDown(BRadioButton *RadioButton, const char *bytes, int32 numBytes)
{
   RadioButton->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BRadioButton::SetValue
 *  Params: int32 value
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_SetValue(BRadioButton *RadioButton, int32 value)
{
   RadioButton->SetValue(value);
}


/***********************************************************************
 *  Method: BRadioButton::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_GetPreferredSize(BRadioButton *RadioButton, float *width, float *height)
{
   RadioButton->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BRadioButton::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_ResizeToPreferred(BRadioButton *RadioButton)
{
   RadioButton->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BRadioButton::Invoke
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRadioButton_Invoke(BRadioButton *RadioButton, BMessage *msg)
{
   return RadioButton->Invoke(msg);
}


/***********************************************************************
 *  Method: BRadioButton::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_MessageReceived(BRadioButton *RadioButton, BMessage *msg)
{
   RadioButton->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BRadioButton::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_WindowActivated(BRadioButton *RadioButton, bool state)
{
   RadioButton->WindowActivated(state);
}


/***********************************************************************
 *  Method: BRadioButton::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_MouseUp(BRadioButton *RadioButton, BPoint pt)
{
   RadioButton->MouseUp(pt);
}


/***********************************************************************
 *  Method: BRadioButton::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_MouseMoved(BRadioButton *RadioButton, BPoint pt, uint32 code, const BMessage *msg)
{
   RadioButton->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BRadioButton::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_DetachedFromWindow(BRadioButton *RadioButton)
{
   RadioButton->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BRadioButton::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_FrameMoved(BRadioButton *RadioButton, BPoint new_position)
{
   RadioButton->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BRadioButton::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_FrameResized(BRadioButton *RadioButton, float new_width, float new_height)
{
   RadioButton->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BRadioButton::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BRadioButton_ResolveSpecifier(BRadioButton *RadioButton, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return RadioButton->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BRadioButton::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_MakeFocus(BRadioButton *RadioButton, bool state)
{
   RadioButton->MakeFocus(state);
}


/***********************************************************************
 *  Method: BRadioButton::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_AllAttached(BRadioButton *RadioButton)
{
   RadioButton->AllAttached();
}


/***********************************************************************
 *  Method: BRadioButton::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRadioButton_AllDetached(BRadioButton *RadioButton)
{
   RadioButton->AllDetached();
}


/***********************************************************************
 *  Method: BRadioButton::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRadioButton_GetSupportedSuites(BRadioButton *RadioButton, BMessage *data)
{
   return RadioButton->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BRadioButton::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRadioButton_Perform(BRadioButton *RadioButton, perform_code d, void *arg)
{
   return RadioButton->Perform(d, arg);
}


/***********************************************************************
 *  Method: BRadioButton::_ReservedRadioButton1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRadioButton__ReservedRadioButton1(BRadioButton *RadioButton)
{
   RadioButton->_ReservedRadioButton1();
}
*/

/***********************************************************************
 *  Method: BRadioButton::_ReservedRadioButton2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRadioButton__ReservedRadioButton2(BRadioButton *RadioButton)
{
   RadioButton->_ReservedRadioButton2();
}
*/

/***********************************************************************
 *  Method: BRadioButton::operator=
 *  Params: const BRadioButton &
 * Returns: BRadioButton &
 * Effects: 
 ***********************************************************************/
/*BRadioButton &
BRadioButton_operator=(BRadioButton *RadioButton, const BRadioButton &)
{
   return RadioButton->operator=();
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _RADIOBUTTON_CPP_ */
