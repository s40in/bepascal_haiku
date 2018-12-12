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

#ifndef _STATUSBAR_CPP_
#define _STATUSBAR_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include "StatusBar.h"
#include "view.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__cplusplus)
}
#endif

class BPStatusBar : public BStatusBar, public BPView 
{

public:
					BPStatusBar(TPasObject PasObject,
						BRect frame,
								const char *name,
								const char *label = NULL,
								const char *trailing_label = NULL);
					BPStatusBar(TPasObject PasObject,BMessage *data);
					
//static	BArchivable	*Instantiate(BMessage *data);
//virtual	status_t	Archive(BMessage *data, bool deep = true) const;

virtual	void		AttachedToWindow();
virtual	void		MessageReceived(BMessage *msg);
virtual	void		Draw(BRect updateRect);
virtual	void		MouseDown(BPoint pt);
virtual	void		MouseUp(BPoint pt);
//virtual	void		WindowActivated(bool state);
virtual	void		MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
//virtual	void		DetachedFromWindow();
virtual	void		FrameMoved(BPoint new_position);
virtual	void		FrameResized(float new_width, float new_height);

virtual void		AllAttached();
virtual void		AllDetached();

private:
};

BPStatusBar::BPStatusBar(TPasObject PasObject,
						BRect frame,
								const char *name,
								const char *label,
								const char *trailing_label)
			:BStatusBar(
						 frame,
								name,
								label ,
								trailing_label ),
		  BPView(PasObject, BRect(0,0,0,0), name, 0, 0),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)		
{
}
          							
BPStatusBar::BPStatusBar(TPasObject PasObject,BMessage *data)
          :BStatusBar(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}

void BPStatusBar::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BStatusBar::MessageReceived(message);
}

void BPStatusBar::Draw(BRect updateRect)
{
	BStatusBar::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPStatusBar::AttachedToWindow(void)
{
	BStatusBar::AttachedToWindow();
	AttachedToWindow_hookCall();
}



void BPStatusBar::AllAttached(void)
{
	BStatusBar::AllAttached();
}

void BPStatusBar::AllDetached(void)
{
	BStatusBar::AllDetached();
}



void BPStatusBar::FrameMoved(BPoint parentPoint)
{
	BStatusBar::FrameMoved(parentPoint);
}

void BPStatusBar::FrameResized(float width, float height)
{
	BStatusBar::FrameResized(width, height);
}




void BPStatusBar::MouseDown(BPoint point)
{
	BStatusBar::MouseDown(point);
}

void BPStatusBar::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BStatusBar::MouseMoved(point, transit, message);
}

void BPStatusBar::MouseUp(BPoint point)
{
	BStatusBar::MouseUp(point);
}

#if defined(__cplusplus)
extern "C" {
#endif




/***********************************************************************
 *  Method: BStatusBar::BStatusBar
 *  Params: BRect frame, const char *name, const char *label, const char *trailing_label
 * Effects: 
 ***********************************************************************/
TCPlusObject BStatusBar_Create(TPasObject PasObject, BRect frame, const char *name, const char *label, const char *trailing_label)
{
	return new BPStatusBar(PasObject, frame, name, label, trailing_label);
}


/***********************************************************************
 *  Method: BStatusBar::BStatusBar
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BStatusBar_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPStatusBar(PasObject, data);
}


/***********************************************************************
 *  Method: BStatusBar::~BStatusBar
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BStatusBar_Free(BStatusBar *StatusBar)
{
   delete StatusBar;
}


/***********************************************************************
 *  Method: BStatusBar::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BStatusBar_Instantiate(BStatusBar *StatusBar, BMessage *data)
{
   return StatusBar->Instantiate(data);
}


/***********************************************************************
 *  Method: BStatusBar::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStatusBar_Archive(BStatusBar *StatusBar, BMessage *data, bool deep) 
{
   return StatusBar->Archive(data, deep);
}


/***********************************************************************
 *  Method: BStatusBar::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_AttachedToWindow(BStatusBar *StatusBar)
{
   StatusBar->AttachedToWindow();
}


/***********************************************************************
 *  Method: BStatusBar::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_MessageReceived(BStatusBar *StatusBar, BMessage *msg)
{
   StatusBar->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BStatusBar::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_Draw(BStatusBar *StatusBar, BRect updateRect)
{
   StatusBar->Draw(updateRect);
}


/***********************************************************************
 *  Method: BStatusBar::SetBarColor
 *  Params: rgb_color color
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_SetBarColor(BStatusBar *StatusBar, rgb_color color)
{
   StatusBar->SetBarColor(color);
}


/***********************************************************************
 *  Method: BStatusBar::SetBarHeight
 *  Params: float height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_SetBarHeight(BStatusBar *StatusBar, float height)
{
   StatusBar->SetBarHeight(height);
}


/***********************************************************************
 *  Method: BStatusBar::SetText
 *  Params: const char *str
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_SetText(BStatusBar *StatusBar, const char *str)
{
   StatusBar->SetText(str);
}


/***********************************************************************
 *  Method: BStatusBar::SetTrailingText
 *  Params: const char *str
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_SetTrailingText(BStatusBar *StatusBar, const char *str)
{
   StatusBar->SetTrailingText(str);
}


/***********************************************************************
 *  Method: BStatusBar::SetMaxValue
 *  Params: float max
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_SetMaxValue(BStatusBar *StatusBar, float max)
{
   StatusBar->SetMaxValue(max);
}


/***********************************************************************
 *  Method: BStatusBar::Update
 *  Params: float delta, const char *main_text, const char *trailing_text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_Update(BStatusBar *StatusBar, float delta, const char *main_text, const char *trailing_text)
{
   StatusBar->Update(delta, main_text, trailing_text);
}


/***********************************************************************
 *  Method: BStatusBar::Reset
 *  Params: const char *label, const char *trailing_label
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_Reset(BStatusBar *StatusBar, const char *label, const char *trailing_label)
{
   StatusBar->Reset(label, trailing_label);
}


/***********************************************************************
 *  Method: BStatusBar::CurrentValue
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BStatusBar_CurrentValue(BStatusBar *StatusBar) 
{
   return StatusBar->CurrentValue();
}


/***********************************************************************
 *  Method: BStatusBar::MaxValue
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BStatusBar_MaxValue(BStatusBar *StatusBar) 
{
   return StatusBar->MaxValue();
}


/***********************************************************************
 *  Method: BStatusBar::BarColor
 *  Params: 
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BStatusBar_BarColor(BStatusBar *StatusBar) 
{
   return StatusBar->BarColor();
}


/***********************************************************************
 *  Method: BStatusBar::BarHeight
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BStatusBar_BarHeight(BStatusBar *StatusBar) 
{
   return StatusBar->BarHeight();
}


/***********************************************************************
 *  Method: BStatusBar::Text
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStatusBar_Text(BStatusBar *StatusBar) 
{
   return StatusBar->Text();
}


/***********************************************************************
 *  Method: BStatusBar::TrailingText
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStatusBar_TrailingText(BStatusBar *StatusBar) 
{
   return StatusBar->TrailingText();
}


/***********************************************************************
 *  Method: BStatusBar::Label
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStatusBar_Label(BStatusBar *StatusBar) 
{
   return StatusBar->Label();
}


/***********************************************************************
 *  Method: BStatusBar::TrailingLabel
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStatusBar_TrailingLabel(BStatusBar *StatusBar) 
{
   return StatusBar->TrailingLabel();
}


/***********************************************************************
 *  Method: BStatusBar::MouseDown
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_MouseDown(BStatusBar *StatusBar, BPoint pt)
{
   StatusBar->MouseDown(pt);
}


/***********************************************************************
 *  Method: BStatusBar::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_MouseUp(BStatusBar *StatusBar, BPoint pt)
{
   StatusBar->MouseUp(pt);
}


/***********************************************************************
 *  Method: BStatusBar::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_WindowActivated(BStatusBar *StatusBar, bool state)
{
   StatusBar->WindowActivated(state);
}


/***********************************************************************
 *  Method: BStatusBar::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_MouseMoved(BStatusBar *StatusBar, BPoint pt, uint32 code, const BMessage *msg)
{
   StatusBar->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BStatusBar::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_DetachedFromWindow(BStatusBar *StatusBar)
{
   StatusBar->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BStatusBar::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_FrameMoved(BStatusBar *StatusBar, BPoint new_position)
{
   StatusBar->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BStatusBar::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_FrameResized(BStatusBar *StatusBar, float new_width, float new_height)
{
   StatusBar->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BStatusBar::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BStatusBar_ResolveSpecifier(BStatusBar *StatusBar, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return StatusBar->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BStatusBar::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_ResizeToPreferred(BStatusBar *StatusBar)
{
   StatusBar->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BStatusBar::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_GetPreferredSize(BStatusBar *StatusBar, float *width, float *height)
{
   StatusBar->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BStatusBar::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_MakeFocus(BStatusBar *StatusBar, bool state)
{
   StatusBar->MakeFocus(state);
}


/***********************************************************************
 *  Method: BStatusBar::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_AllAttached(BStatusBar *StatusBar)
{
   StatusBar->AllAttached();
}


/***********************************************************************
 *  Method: BStatusBar::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStatusBar_AllDetached(BStatusBar *StatusBar)
{
   StatusBar->AllDetached();
}


/***********************************************************************
 *  Method: BStatusBar::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStatusBar_GetSupportedSuites(BStatusBar *StatusBar, BMessage *data)
{
   return StatusBar->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BStatusBar::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStatusBar_Perform(BStatusBar *StatusBar, perform_code d, void *arg)
{
   return StatusBar->Perform(d, arg);
}



#if defined(__cplusplus)
}
#endif

#endif /* _STATUSBAR_CPP_ */
