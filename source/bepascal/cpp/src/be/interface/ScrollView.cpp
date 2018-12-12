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

#ifndef _SCROLLVIEW_CPP_
#define _SCROLLVIEW_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include "ScrollView.h"
#include "view.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__cplusplus)
}
#endif

class BPScrollView : public BScrollView, public BPView {

public:
						BPScrollView(
           						TPasObject PasObject,
						        const char *name,
								BView *target,
								uint32 resizeMask = B_FOLLOW_LEFT |
													B_FOLLOW_TOP,
								uint32 flags = 0,
								bool horizontal = false,
								bool vertical = false, 
								border_style border = B_FANCY_BORDER);
						BPScrollView(TPasObject PasObject,BMessage *data);
//virtual					~BScrollView();
static	BArchivable		*Instantiate(BMessage *data);
//virtual	status_t		Archive(BMessage *data, bool deep = true) const;

virtual	void			Draw(BRect updateRect);
virtual	void			AttachedToWindow();


virtual void			MessageReceived(BMessage *msg);
virtual	void			MouseDown(BPoint pt);
virtual void			WindowActivated(bool state);
virtual	void			MouseUp(BPoint pt);
virtual	void			MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
virtual	void			DetachedFromWindow();
virtual	void			AllAttached();
virtual	void			AllDetached();
//virtual	void			FrameMoved(BPoint new_position);
virtual	void			FrameResized(float new_width, float new_height);


//virtual void			ResizeToPreferred();
//virtual void			GetPreferredSize(float *width, float *height);
//virtual void			MakeFocus(bool state = true);

/*----- Private or reserved -----------------------------------------*/

private:
};

BPScrollView::BPScrollView(TPasObject PasObject,
						        const char *name,
								BView *target,
								uint32 resizeMask,
								uint32 flags,
								bool horizontal,
								bool vertical, 
								border_style border)
          : 
          BScrollView(name,
          		      target,		
					 resizeMask, 
					 flags,
					 horizontal,
					 vertical,
					 border), 
          BPView(PasObject, BRect(0,0,0,0), name, 0, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}



BPScrollView::BPScrollView(TPasObject PasObject, BMessage *data)
          :BScrollView(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}




void BPScrollView::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BScrollView::MessageReceived(message);
}

void BPScrollView::Draw(BRect updateRect)
{
	BScrollView::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPScrollView::AttachedToWindow(void)
{
	//BTextView::AttachedToWindow();
	AttachedToWindow_hookCall();
}



void BPScrollView::AllAttached(void)
{
	BScrollView::AllAttached();
}

void BPScrollView::AllDetached(void)
{
	BScrollView::AllDetached();
}


void BPScrollView::WindowActivated(bool active)
{
	BScrollView::WindowActivated(active);
}



void BPScrollView::FrameResized(float width, float height)
{
	BScrollView::FrameResized(width, height);
}

void BPScrollView::DetachedFromWindow(void)
{
	BScrollView::DetachedFromWindow();
}



void BPScrollView::MouseDown(BPoint point)
{
	BScrollView::MouseDown(point);
}

void BPScrollView::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BScrollView::MouseMoved(point, transit, message);
}

void BPScrollView::MouseUp(BPoint point)
{
	BScrollView::MouseUp(point);
}


#if defined(__cplusplus)
extern "C" {
#endif


/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: ScrollView.cpp
 *   DATE: Sun Feb  2 20:53:19 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BScrollView::BScrollView
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BScrollView_Create(TPasObject PasObject,
						        const char *name,
								BView *target,
								uint32 resizeMask = B_FOLLOW_LEFT |
													B_FOLLOW_TOP,
								uint32 flags = 0,
								bool horizontal = false,
								bool vertical = false, 
								border_style border = B_FANCY_BORDER)
{
	return new BPScrollView(PasObject, name,target,resizeMask,flags,horizontal,vertical,border);
}								

TCPlusObject BScrollView_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPScrollView(PasObject, data);
}


/***********************************************************************
 *  Method: BScrollView::~BScrollView
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BScrollView_Free(BScrollView *ScrollView)
{
   delete ScrollView;
}


/***********************************************************************
 *  Method: BScrollView::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BScrollView_Instantiate(BScrollView *ScrollView, BMessage *data)
{
   return ScrollView->Instantiate(data);
}


/***********************************************************************
 *  Method: BScrollView::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollView_Archive(BScrollView *ScrollView, BMessage *data, bool deep) 
{
   return ScrollView->Archive(data, deep);
}


/***********************************************************************
 *  Method: BScrollView::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_Draw(BScrollView *ScrollView, BRect updateRect)
{
   ScrollView->Draw(updateRect);
}


/***********************************************************************
 *  Method: BScrollView::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_AttachedToWindow(BScrollView *ScrollView)
{
   ScrollView->AttachedToWindow();
}


/***********************************************************************
 *  Method: BScrollView::ScrollBar
 *  Params: orientation flag
 * Returns: BScrollBar *
 * Effects: 
 ***********************************************************************/
BScrollBar *
BScrollView_ScrollBar(BScrollView *ScrollView, orientation flag) 
{
   return ScrollView->ScrollBar(flag);
}


/***********************************************************************
 *  Method: BScrollView::SetBorder
 *  Params: border_style border
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_SetBorder(BScrollView *ScrollView, border_style border)
{
   ScrollView->SetBorder(border);
}


/***********************************************************************
 *  Method: BScrollView::Border
 *  Params: 
 * Returns: border_style
 * Effects: 
 ***********************************************************************/
border_style
BScrollView_Border(BScrollView *ScrollView) 
{
   return ScrollView->Border();
}


/***********************************************************************
 *  Method: BScrollView::SetBorderHighlighted
 *  Params: bool state
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollView_SetBorderHighlighted(BScrollView *ScrollView, bool state)
{
   return ScrollView->SetBorderHighlighted(state);
}


/***********************************************************************
 *  Method: BScrollView::IsBorderHighlighted
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BScrollView_IsBorderHighlighted(BScrollView *ScrollView) 
{
   return ScrollView->IsBorderHighlighted();
}


/***********************************************************************
 *  Method: BScrollView::SetTarget
 *  Params: BView *new_target
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_SetTarget(BScrollView *ScrollView, BView *new_target)
{
   ScrollView->SetTarget(new_target);
}


/***********************************************************************
 *  Method: BScrollView::Target
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BScrollView_Target(BScrollView *ScrollView) 
{
   return ScrollView->Target();
}


/***********************************************************************
 *  Method: BScrollView::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_MessageReceived(BScrollView *ScrollView, BMessage *msg)
{
   ScrollView->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BScrollView::MouseDown
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_MouseDown(BScrollView *ScrollView, BPoint pt)
{
   ScrollView->MouseDown(pt);
}


/***********************************************************************
 *  Method: BScrollView::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_WindowActivated(BScrollView *ScrollView, bool state)
{
   ScrollView->WindowActivated(state);
}


/***********************************************************************
 *  Method: BScrollView::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_MouseUp(BScrollView *ScrollView, BPoint pt)
{
   ScrollView->MouseUp(pt);
}


/***********************************************************************
 *  Method: BScrollView::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_MouseMoved(BScrollView *ScrollView, BPoint pt, uint32 code, const BMessage *msg)
{
   ScrollView->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BScrollView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_DetachedFromWindow(BScrollView *ScrollView)
{
   ScrollView->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BScrollView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_AllAttached(BScrollView *ScrollView)
{
   ScrollView->AllAttached();
}


/***********************************************************************
 *  Method: BScrollView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_AllDetached(BScrollView *ScrollView)
{
   ScrollView->AllDetached();
}


/***********************************************************************
 *  Method: BScrollView::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_FrameMoved(BScrollView *ScrollView, BPoint new_position)
{
   ScrollView->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BScrollView::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_FrameResized(BScrollView *ScrollView, float new_width, float new_height)
{
   ScrollView->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BScrollView::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BScrollView_ResolveSpecifier(BScrollView *ScrollView, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return ScrollView->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BScrollView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_ResizeToPreferred(BScrollView *ScrollView)
{
   ScrollView->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BScrollView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_GetPreferredSize(BScrollView *ScrollView, float *width, float *height)
{
   ScrollView->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BScrollView::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScrollView_MakeFocus(BScrollView *ScrollView, bool state)
{
   ScrollView->MakeFocus(state);
}


/***********************************************************************
 *  Method: BScrollView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollView_GetSupportedSuites(BScrollView *ScrollView, BMessage *data)
{
   return ScrollView->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BScrollView::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScrollView_Perform(BScrollView *ScrollView, perform_code d, void *arg)
{
   return ScrollView->Perform(d, arg);
}




#if defined(__cplusplus)
}
#endif

#endif /* _SSCROLLVIEW_CPP_ */

