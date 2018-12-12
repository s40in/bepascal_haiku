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

#ifndef _SCROLLBAR_CPP_
#define _SCROLLBAR_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include "ScrollBar.h"
#include "view.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__cplusplus)
}
#endif

class BPScrollBar : public BScrollBar, public BPView {

public:
					BPScrollBar(TPasObject PasObject,
					  			BRect frame,
								const char *name,
								BView *target,
								float min,
								float max,
								orientation direction);
					BPScrollBar(TPasObject PasObject,BMessage *data);
					
//static	BArchivable	*Instantiate(BMessage *data);
//virtual	status_t	Archive(BMessage *data, bool deep = true) const;
			
virtual	void		AttachedToWindow();

virtual void		MessageReceived(BMessage *msg);
virtual	void		MouseDown(BPoint pt);
virtual	void		MouseUp(BPoint pt);
virtual	void		MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
virtual	void		Draw(BRect updateRect);
virtual	void		FrameMoved(BPoint new_position);
virtual	void		FrameResized(float new_width, float new_height);

virtual void		AllAttached();
virtual void		AllDetached();

private:

};

BPScrollBar::BPScrollBar(TPasObject PasObject,
		  			BRect frame,
								const char *name,
								BView *target,
								float min,
								float max,
								orientation direction)
          : 
          BScrollBar( frame,
								name,
								target,
								min,
								max,
								direction), 
          BPView(PasObject, BRect(0,0,0,0), name, 0, 0),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPScrollBar::BPScrollBar(TPasObject PasObject, BMessage *data)
          :BScrollBar(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}

void BPScrollBar::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BScrollBar::MessageReceived(message);
}

void BPScrollBar::Draw(BRect updateRect)
{
	BScrollBar::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPScrollBar::AttachedToWindow(void)
{
	BScrollBar::AttachedToWindow();
	AttachedToWindow_hookCall();
}



void BPScrollBar::AllAttached(void)
{
	BScrollBar::AllAttached();
}

void BPScrollBar::AllDetached(void)
{
	BScrollBar::AllDetached();
}



void BPScrollBar::FrameMoved(BPoint parentPoint)
{
	BScrollBar::FrameMoved(parentPoint);
}

void BPScrollBar::FrameResized(float width, float height)
{
	BScrollBar::FrameResized(width, height);
}




void BPScrollBar::MouseDown(BPoint point)
{
	BScrollBar::MouseDown(point);
}

void BPScrollBar::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BScrollBar::MouseMoved(point, transit, message);
}

void BPScrollBar::MouseUp(BPoint point)
{
	BScrollBar::MouseUp(point);
}





#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: ScrollBar.cpp
 *   DATE: Sun Feb  2 15:49:13 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BScrollBar::BScrollBar
 *  Params: BRect frame, const char *name, BView *target, float min, float max, orientation direction
 * Effects: 
 ***********************************************************************/
TCPlusObject BScrollBar_Create(TPasObject PasObject, BRect frame, const char *name, BView *target, float min, float max, orientation direction)
{
	return new BPScrollBar(PasObject, frame, name, target, min, max, direction);
}


/***********************************************************************
 *  Method: BScrollBar::BScrollBar
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BScrollBar_Create_1
(TPasObject PasObject, BMessage *data)
{
	return new BPScrollBar(PasObject, data);
}


/***********************************************************************
 *  Method: BScrollBar::~BScrollBar
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BScrollBar_Free(BScrollBar *ScrollBar)
{
   delete ScrollBar;
}


/***********************************************************************
 *  Method: BScrollBar::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BScrollBar_Instantiate(BScrollBar *ScrollBar, BMessage *data)
{
   return ScrollBar->Instantiate(data);
}


/***********************************************************************
 *  Method: BScrollBar::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollBar_Archive(BScrollBar *ScrollBar, BMessage *data, bool deep) 
{
   return ScrollBar->Archive(data, deep);
}


/***********************************************************************
 *  Method: BScrollBar::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_AttachedToWindow(BScrollBar *ScrollBar)
{
   ScrollBar->AttachedToWindow();
}


/***********************************************************************
 *  Method: BScrollBar::SetValue
 *  Params: float value
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_SetValue(BScrollBar *ScrollBar, float value)
{
   ScrollBar->SetValue(value);
}


/***********************************************************************
 *  Method: BScrollBar::Value
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BScrollBar_Value(BScrollBar *ScrollBar) 
{
   return ScrollBar->Value();
}


/***********************************************************************
 *  Method: BScrollBar::SetProportion
 *  Params: float
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_SetProportion(BScrollBar *ScrollBar, float value)
{
   ScrollBar->SetProportion(value);
}


/***********************************************************************
 *  Method: BScrollBar::Proportion
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BScrollBar_Proportion(BScrollBar *ScrollBar) 
{
   return ScrollBar->Proportion();
}


/***********************************************************************
 *  Method: BScrollBar::ValueChanged
 *  Params: float newValue
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_ValueChanged(BScrollBar *ScrollBar, float newValue)
{
   ScrollBar->ValueChanged(newValue);
}


/***********************************************************************
 *  Method: BScrollBar::SetRange
 *  Params: float min, float max
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_SetRange(BScrollBar *ScrollBar, float min, float max)
{
   ScrollBar->SetRange(min, max);
}


/***********************************************************************
 *  Method: BScrollBar::GetRange
 *  Params: float *min, float *max
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_GetRange(BScrollBar *ScrollBar, float *min, float *max) 
{
   ScrollBar->GetRange(min, max);
}


/***********************************************************************
 *  Method: BScrollBar::SetSteps
 *  Params: float smallStep, float largeStep
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_SetSteps(BScrollBar *ScrollBar, float smallStep, float largeStep)
{
   ScrollBar->SetSteps(smallStep, largeStep);
}


/***********************************************************************
 *  Method: BScrollBar::GetSteps
 *  Params: float *smallStep, float *largeStep
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_GetSteps(BScrollBar *ScrollBar, float *smallStep, float *largeStep) 
{
   ScrollBar->GetSteps(smallStep, largeStep);
}


/***********************************************************************
 *  Method: BScrollBar::SetTarget
 *  Params: BView *target
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_SetTarget(BScrollBar *ScrollBar, BView *target)
{
   ScrollBar->SetTarget(target);
}


/***********************************************************************
 *  Method: BScrollBar::SetTarget
 *  Params: const char *targetName
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_SetTarget_1
(BScrollBar *ScrollBar, const char *targetName)
{
   ScrollBar->SetTarget(targetName);
}


/***********************************************************************
 *  Method: BScrollBar::Target
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BScrollBar_Target(BScrollBar *ScrollBar) 
{
   return ScrollBar->Target();
}


/***********************************************************************
 *  Method: BScrollBar::Orientation
 *  Params: 
 * Returns: orientation
 * Effects: 
 ***********************************************************************/
orientation
BScrollBar_Orientation(BScrollBar *ScrollBar) 
{
   return ScrollBar->Orientation();
}


/***********************************************************************
 *  Method: BScrollBar::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_MessageReceived(BScrollBar *ScrollBar, BMessage *msg)
{
   ScrollBar->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BScrollBar::MouseDown
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_MouseDown(BScrollBar *ScrollBar, BPoint pt)
{
   ScrollBar->MouseDown(pt);
}


/***********************************************************************
 *  Method: BScrollBar::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_MouseUp(BScrollBar *ScrollBar, BPoint pt)
{
   ScrollBar->MouseUp(pt);
}


/***********************************************************************
 *  Method: BScrollBar::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_MouseMoved(BScrollBar *ScrollBar, BPoint pt, uint32 code, const BMessage *msg)
{
   ScrollBar->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BScrollBar::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_DetachedFromWindow(BScrollBar *ScrollBar)
{
   ScrollBar->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BScrollBar::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_Draw(BScrollBar *ScrollBar, BRect updateRect)
{
   ScrollBar->Draw(updateRect);
}


/***********************************************************************
 *  Method: BScrollBar::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_FrameMoved(BScrollBar *ScrollBar, BPoint new_position)
{
   ScrollBar->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BScrollBar::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_FrameResized(BScrollBar *ScrollBar, float new_width, float new_height)
{
   ScrollBar->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BScrollBar::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BScrollBar_ResolveSpecifier(BScrollBar *ScrollBar, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return ScrollBar->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BScrollBar::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_ResizeToPreferred(BScrollBar *ScrollBar)
{
   ScrollBar->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BScrollBar::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_GetPreferredSize(BScrollBar *ScrollBar, float *width, float *height)
{
   ScrollBar->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BScrollBar::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_MakeFocus(BScrollBar *ScrollBar, bool state)
{
   ScrollBar->MakeFocus(state);
}


/***********************************************************************
 *  Method: BScrollBar::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_AllAttached(BScrollBar *ScrollBar)
{
   ScrollBar->AllAttached();
}


/***********************************************************************
 *  Method: BScrollBar::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollBar_AllDetached(BScrollBar *ScrollBar)
{
   ScrollBar->AllDetached();
}


/***********************************************************************
 *  Method: BScrollBar::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollBar_GetSupportedSuites(BScrollBar *ScrollBar, BMessage *data)
{
   return ScrollBar->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BScrollBar::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollBar_Perform(BScrollBar *ScrollBar, perform_code d, void *arg)
{
   return ScrollBar->Perform(d, arg);
}




#if defined(__cplusplus)
}
#endif

#endif /* SCROLLBAR_CPP */

