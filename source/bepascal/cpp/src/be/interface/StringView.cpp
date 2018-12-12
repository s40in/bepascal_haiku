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

#ifndef _STRINGVIEW_CPP_
#define _STRINGVIEW_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include "StringView.h"
#include "view.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__cplusplus)
}
#endif

class BPStringView : public BStringView, public BPView
{

public:
		BPStringView(TPasObject PasObject,
		  			BRect bounds,
					const char *name, 
					const char *text,
					uint32 resizeFlags, 
					uint32 flags);
		BPStringView(TPasObject PasObject, BMessage *archive);

		virtual	void		AttachedToWindow(void);
		virtual	void		Draw(BRect updateRect);
		virtual void		MessageReceived(BMessage *message);
		virtual	void		MouseDown(BPoint point);
		virtual	void		MouseUp(BPoint point);
		virtual void 		MouseMoved(BPoint point, uint32 transit, const BMessage *message);
		virtual void 		FrameMoved(BPoint parentPoint);
		virtual void 		FrameResized(float width, float height);
		virtual void		AllAttached(void);
		virtual void		AllDetached(void);
	private:
};

BPStringView::BPStringView(TPasObject PasObject,
		  			BRect bounds,
					const char *name, 
					const char *text,
					uint32 resizeFlags, 
					uint32 flags)
          : 
          BStringView( bounds,
					name, 
					text,
					 resizeFlags, 
					 flags), 
          BPView(PasObject, BRect(0,0,0,0), name, 0, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPStringView::BPStringView(TPasObject PasObject, BMessage *data)
          :BStringView(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}

void BPStringView::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BStringView::MessageReceived(message);
}

void BPStringView::Draw(BRect updateRect)
{
	BStringView::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPStringView::AttachedToWindow(void)
{
	BStringView::AttachedToWindow();
	AttachedToWindow_hookCall();
}



void BPStringView::AllAttached(void)
{
	BStringView::AllAttached();
}

void BPStringView::AllDetached(void)
{
	BStringView::AllDetached();
}



void BPStringView::FrameMoved(BPoint parentPoint)
{
	BStringView::FrameMoved(parentPoint);
}

void BPStringView::FrameResized(float width, float height)
{
	BStringView::FrameResized(width, height);
}




void BPStringView::MouseDown(BPoint point)
{
	BStringView::MouseDown(point);
}

void BPStringView::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BStringView::MouseMoved(point, transit, message);
}

void BPStringView::MouseUp(BPoint point)
{
	BStringView::MouseUp(point);
}







#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BStringView_Create(TPasObject PasObject,
		  			BRect bounds,
					const char *name, 
					const char *text,
					uint32 resizeFlags, 
					uint32 flags)
{
	return new BPStringView(PasObject,bounds,
					name, 
					text,
					 resizeFlags, 
					 flags);
}
/***********************************************************************
 *  Method: BStringView::BStringView
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BStringView_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPStringView(PasObject, data);
}


/***********************************************************************
 *  Method: BStringView::~BStringView
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BStringView_Free(BStringView *StringView)
{
   delete StringView;
}


/***********************************************************************
 *  Method: BStringView::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BStringView_Instantiate(BStringView *StringView, BMessage *data)
{
   return StringView->Instantiate(data);
}


/***********************************************************************
 *  Method: BStringView::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStringView_Archive(BStringView *StringView, BMessage *data, bool deep) 
{
   return StringView->Archive(data, deep);
}


/***********************************************************************
 *  Method: BStringView::SetText
 *  Params: const char *text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_SetText(BStringView *StringView, const char *text)
{
   StringView->SetText(text);
}


/***********************************************************************
 *  Method: BStringView::Text
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStringView_Text(BStringView *StringView) 
{
   return StringView->Text();
}


/***********************************************************************
 *  Method: BStringView::SetAlignment
 *  Params: alignment flag
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_SetAlignment(BStringView *StringView, alignment flag)
{
   StringView->SetAlignment(flag);
}


/***********************************************************************
 *  Method: BStringView::Alignment
 *  Params: 
 * Returns: alignment
 * Effects: 
 ***********************************************************************/
alignment
BStringView_Alignment(BStringView *StringView) 
{
   return StringView->Alignment();
}


/***********************************************************************
 *  Method: BStringView::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_AttachedToWindow(BStringView *StringView)
{
   StringView->AttachedToWindow();
}


/***********************************************************************
 *  Method: BStringView::Draw
 *  Params: BRect bounds
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_Draw(BStringView *StringView, BRect bounds)
{
   StringView->Draw(bounds);
}


/***********************************************************************
 *  Method: BStringView::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_MessageReceived(BStringView *StringView, BMessage *msg)
{
   StringView->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BStringView::MouseDown
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_MouseDown(BStringView *StringView, BPoint pt)
{
   StringView->MouseDown(pt);
}


/***********************************************************************
 *  Method: BStringView::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_MouseUp(BStringView *StringView, BPoint pt)
{
   StringView->MouseUp(pt);
}


/***********************************************************************
 *  Method: BStringView::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_MouseMoved(BStringView *StringView, BPoint pt, uint32 code, const BMessage *msg)
{
   StringView->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BStringView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_DetachedFromWindow(BStringView *StringView)
{
   StringView->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BStringView::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_FrameMoved(BStringView *StringView, BPoint new_position)
{
   StringView->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BStringView::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_FrameResized(BStringView *StringView, float new_width, float new_height)
{
   StringView->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BStringView::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BStringView_ResolveSpecifier(BStringView *StringView, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return StringView->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BStringView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_ResizeToPreferred(BStringView *StringView)
{
   StringView->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BStringView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_GetPreferredSize(BStringView *StringView, float *width, float *height)
{
   StringView->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BStringView::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_MakeFocus(BStringView *StringView, bool state)
{
   StringView->MakeFocus(state);
}


/***********************************************************************
 *  Method: BStringView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_AllAttached(BStringView *StringView)
{
   StringView->AllAttached();
}


/***********************************************************************
 *  Method: BStringView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringView_AllDetached(BStringView *StringView)
{
   StringView->AllDetached();
}


/***********************************************************************
 *  Method: BStringView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStringView_GetSupportedSuites(BStringView *StringView, BMessage *data)
{
   return StringView->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BStringView::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
#ifndef __HAIKU__
status_t
BStringView_Perform(BStringView *StringView, perform_code d, void *arg)
{
   return StringView->Perform(d, arg);
}
#endif

/***********************************************************************
 *  Method: BStringView::_ReservedStringView1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BStringView__ReservedStringView1(BStringView *StringView)
{
   StringView->_ReservedStringView1();
}

*/
/***********************************************************************
 *  Method: BStringView::_ReservedStringView2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BStringView__ReservedStringView2(BStringView *StringView)
{
   StringView->_ReservedStringView2();
}
*/

/***********************************************************************
 *  Method: BStringView::_ReservedStringView3
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BStringView__ReservedStringView3(BStringView *StringView)
{
   StringView->_ReservedStringView3();
}

*/
/***********************************************************************
 *  Method: BStringView::operator=
 *  Params: const BStringView &
 * Returns: BStringView &
 * Effects: 
 ***********************************************************************/
/*BStringView &
BStringView_operator=(BStringView *StringView, const BStringView &)
{
   return StringView->operator=();
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _STRINGVIEW_CPP_ */

