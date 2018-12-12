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

#ifndef _VIEW_CPP_
#define _VIEW_CPP_

#include <View.h>

#include <OS.h>

#include <handler.h>
#include <view.h>
#include <beobj.h>

// definition of callback function in BView
typedef void (*BView_AllAttached_hook) (TPasObject PasObject);
typedef void (*BView_AllDetached_hook) (TPasObject PasObject);
typedef void (*BView_AttachedToWindow_hook) (TPasObject PasObject);
typedef void (*BView_DetachedFromWindow_hook) (TPasObject PasObject);
typedef void (*BView_Draw_hook) (TPasObject PasObject, TCPlusObject updateRect);
typedef void (*BView_DrawAfterChildren_hook) (TPasObject PasObject, TCPlusObject updateRect);
typedef void (*BView_FrameMoved_hook) (TPasObject PasObject, TCPlusObject parentPoint);
typedef void (*BView_FrameResized_hook) (TPasObject PasObject, float width, float height);
typedef void (*BView_GetPreferredSize_hook) (TPasObject PasObject, float *width, float *height);
typedef void (*BView_ResizeToPreferred_hook) (TPasObject PasObject);
typedef void (*BView_KeyDown_hook) (TPasObject PasObject, const char *bytes, int32 numBytes);
typedef void (*BView_KeyUp_hook) (TPasObject PasObject, const char *bytes, int32 numBytes);
typedef void (*BView_MouseDown_hook) (TPasObject PasObject, TCPlusObject point);
typedef void (*BView_MouseMoved_hook) (TPasObject PasObject, TCPlusObject point, uint32 transit, TCPlusObject message);
typedef void (*BView_MouseUp_hook) (TPasObject PasObject, TCPlusObject point);
typedef void (*BView_Pulse_hook) (TPasObject PasObject);
typedef void (*BView_TargetedByScrollView_hook) (TPasObject PasObject, TCPlusObject scroller);
typedef void (*BView_WindowActivated_hook) (TPasObject PasObject, bool active);

#if defined(__cplusplus)
extern "C" {
#endif

uint32 _B_FOLLOW_NONE = B_FOLLOW_NONE;
uint32 _B_FOLLOW_ALL_SIDES = B_FOLLOW_ALL_SIDES;
uint32 _B_FOLLOW_ALL = B_FOLLOW_ALL;

uint32 _B_FOLLOW_LEFT = B_FOLLOW_LEFT;
uint32 _B_FOLLOW_RIGHT = B_FOLLOW_RIGHT;
uint32 _B_FOLLOW_LEFT_RIGHT = B_FOLLOW_LEFT_RIGHT;
uint32 _B_FOLLOW_H_CENTER = B_FOLLOW_H_CENTER;

uint32 _B_FOLLOW_TOP = B_FOLLOW_TOP;
uint32 _B_FOLLOW_BOTTOM = B_FOLLOW_BOTTOM;
uint32 _B_FOLLOW_TOP_BOTTOM = B_FOLLOW_TOP_BOTTOM;
uint32 _B_FOLLOW_V_CENTER = B_FOLLOW_V_CENTER;

BView_AllAttached_hook View_AllAttached_hook;
BView_AllDetached_hook View_AllDetached_hook;
BView_AttachedToWindow_hook View_AttachedToWindow_hook;
BView_DetachedFromWindow_hook View_DetachedFromWindow_hook;
BView_Draw_hook View_Draw_hook;
BView_DrawAfterChildren_hook View_DrawAfterChildren_hook;
BView_FrameMoved_hook View_FrameMoved_hook;
BView_FrameResized_hook View_FrameResized_hook;
BView_GetPreferredSize_hook View_GetPreferredSize_hook;
BView_ResizeToPreferred_hook View_ResizeToPreferred_hook;
BView_KeyDown_hook View_KeyDown_hook;
BView_KeyUp_hook View_KeyUp_hook;
BView_MouseDown_hook View_MouseDown_hook;
BView_MouseMoved_hook View_MouseMoved_hook;
BView_MouseUp_hook View_MouseUp_hook;
BView_Pulse_hook View_Pulse_hook;
BView_TargetedByScrollView_hook View_TargetedByScrollView_hook;
BView_WindowActivated_hook View_WindowActivated_hook;
  
#if defined(__cplusplus)
}
#endif

BPView::BPView(TPasObject PasObject, 
			   BRect frame,
			   const char *name,
			   uint32 resizingMode,
			   uint32 flags)
			   : BView(frame, name, resizingMode, flags),
               BPHandler(PasObject)
//            BPasObject(PasObject)
{
}

BPView::BPView(TPasObject PasObject, BMessage *archive)
				: BView(archive),
                  BPHandler(PasObject)				
//	              BPasObject(PasObject)
{
}
void BPView::MessageReceived(BMessage *message)
{
	BPHandler::MessageReceived_hookCall(message);
	BView::MessageReceived(message);
}

void BPView::AllAttached(void)
{
	AllAttached_hookCall();
}

void BPView::AllAttached_hookCall(void)
{
	View_AllAttached_hook(GetPasObject());
}

void BPView::AttachedToWindow(void)
{
	BView::AttachedToWindow();
	AttachedToWindow_hookCall();	
}

void BPView::AttachedToWindow_hookCall(void)
{
	View_AttachedToWindow_hook(GetPasObject());
}

void BPView::AllDetached(void)
{
	AllDetached_hookCall();
}

void BPView::AllDetached_hookCall(void)
{
	View_AllDetached_hook(GetPasObject());
}

void BPView::DetachedFromWindow(void)
{
	DetachedFromWindow_hookCall();
}

void BPView::DetachedFromWindow_hookCall(void)
{
	View_DetachedFromWindow_hook(GetPasObject());
}

void BPView::Draw(BRect updateRect)
{
	BView::Draw(updateRect);
	Draw_hookCall(updateRect);	
}

void BPView::Draw_hookCall(BRect updateRect)
{
	View_Draw_hook(GetPasObject(), &updateRect);
}

void BPView::DrawAfterChildren(BRect updateRect)
{
	DrawAfterChildren_hookCall(updateRect);
}

void BPView::DrawAfterChildren_hookCall(BRect updateRect)
{
	View_DrawAfterChildren_hook(GetPasObject(), &updateRect);
}

void BPView::FrameMoved(BPoint parentPoint)
{
	FrameMoved_hookCall(parentPoint);
}

void BPView::FrameMoved_hookCall(BPoint parentPoint)
{
	View_FrameMoved_hook(GetPasObject(), &parentPoint);
}

void BPView::FrameResized(float width, float height)
{
	FrameResized_hookCall(width, height);
}

void BPView::FrameResized_hookCall(float width, float height)
{
	View_FrameResized_hook(GetPasObject(), width, height);
}

void BPView::GetPreferredSize(float *width, float *height)
{
	GetPreferredSize_hookCall(width, height);
}

void BPView::GetPreferredSize_hookCall(float *width, float *height)
{
	View_GetPreferredSize_hook(GetPasObject(), width, height);
}

void BPView::ResizeToPreferred(void)
{
	ResizeToPreferred_hookCall();
}

void BPView::ResizeToPreferred_hookCall(void)
{
	View_ResizeToPreferred_hook(GetPasObject());
}

void BPView::KeyDown(const char *bytes, int32 numBytes)
{
	KeyDown_hookCall(bytes, numBytes);
}

void BPView::KeyDown_hookCall(const char *bytes, int32 numBytes)
{
	View_KeyDown_hook(GetPasObject(), bytes, numBytes);
}

void BPView::KeyUp(const char *bytes, int32 numBytes)
{
	KeyUp_hookCall(bytes, numBytes);
}

void BPView::KeyUp_hookCall(const char *bytes, int32 numBytes)
{
	View_KeyUp_hook(GetPasObject(), bytes, numBytes);
}

void BPView::MouseDown(BPoint point)
{
	MouseDown_hookCall(point);
}

void BPView::MouseDown_hookCall(BPoint point)
{
	View_MouseDown_hook(GetPasObject(), &point);
}

void BPView::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	MouseMoved_hookCall(point, transit, message);
}

void BPView::MouseMoved_hookCall(BPoint point, uint32 transit, const BMessage *message)
{
	View_MouseMoved_hook(GetPasObject(), &point, transit, &message);
}

void BPView::MouseUp(BPoint point)
{
	MouseUp_hookCall(point);
}

void BPView::MouseUp_hookCall(BPoint point)
{
	View_MouseUp_hook(GetPasObject(), &point);
}

void BPView::Pulse(void)
{
	Pulse_hookCall();
}

void BPView::Pulse_hookCall(void)
{
	View_Pulse_hook(GetPasObject());
}

//void BPView::TargetedByScrollView(BScrollView *scroller)
//{
//	View_TargetedByScrollView(GetPasObject(), scroller);
//}

void BPView::WindowActivated(bool active)
{
	WindowActivated_hookCall(active);
}

void BPView::WindowActivated_hookCall(bool active)
{
	View_WindowActivated_hook(GetPasObject(), active);
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BView_Create_1(TPasObject PasObject, 
							BRect frame,
							const char *name,
							uint32 resizingMode,
							uint32 flags)
{
	return new BPView(PasObject, frame, name, resizingMode, flags);
}

void BView_Free(TCPlusObject View)
{
	delete reinterpret_cast<BView*>(View);
}

/***********************************************************************
 *  Method: BView::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BView_Instantiate(BView *View, BMessage *data)
{
   return View->Instantiate(data);
}


/***********************************************************************
 *  Method: BView::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BView_Archive(BView *View, BMessage *data,
               bool deep) 
{
   return View->Archive(data,
               deep);
}

// TODO : implement hook functions
/***********************************************************************
 *  Method: BView::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_AttachedToWindow(BView *View)
{
   View->AttachedToWindow();
}


/***********************************************************************
 *  Method: BView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_AllAttached(BView *View)
{
   View->AllAttached();
}


/***********************************************************************
 *  Method: BView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DetachedFromWindow(BView *View)
{
   View->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_AllDetached(BView *View)
{
   View->AllDetached();
}

// END TODO implement hook functions

/***********************************************************************
 *  Method: BView::AddChild
 *  Params: BView *child, BView *before
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_AddChild(BView *View, BView *child,
                BView *before)
{
   View->AddChild(child,
                before);
}


/***********************************************************************
 *  Method: BView::RemoveChild
 *  Params: BView *child
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BView_RemoveChild(BView *View, BView *child)
{
   return View->RemoveChild(child);
}


/***********************************************************************
 *  Method: BView::CountChildren
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BView_CountChildren(BView *View)
{
   return View->CountChildren();
}


/***********************************************************************
 *  Method: BView::ChildAt
 *  Params: int32 index
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BView_ChildAt(BView *View, int32 index)
{
   return View->ChildAt(index);
}


/***********************************************************************
 *  Method: BView::NextSibling
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BView_NextSibling(BView *View)
{
   return View->NextSibling();
}


/***********************************************************************
 *  Method: BView::PreviousSibling
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BView_PreviousSibling(BView *View)
{
   return View->PreviousSibling();
}


/***********************************************************************
 *  Method: BView::RemoveSelf
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BView_RemoveSelf(BView *View)
{
   return View->RemoveSelf();
}


/***********************************************************************
 *  Method: BView::Window
 *  Params: 
 * Returns: BWindow *
 * Effects: 
 ***********************************************************************/
BWindow *
BView_Window(BView *View) 
{
   return View->Window();
}


// TODO : implement hook function 

/***********************************************************************
 *  Method: BView::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Draw(BView *View, BRect updateRect)
{
   View->Draw(updateRect);
}

// END TODO implement hook function

/***********************************************************************
 *  Method: BView::SetViewColor
 *  Params: rgb_color c
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetViewColor(BView *View, rgb_color c)
{
   View->SetViewColor(c);
}


/***********************************************************************
 *  Method: BView::ViewColor
 *  Params: 
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BView_ViewColor(BView *View)
{
   return View->ViewColor();
}

/***********************************************************************
 *  Method: BView::Show
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Show(BView *View)
{
   View->Show();
}


/***********************************************************************
 *  Method: BView::Hide
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Hide(BView *View)
{
   View->Hide();
}


/***********************************************************************
 *  Method: BView::IsHidden
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BView_IsHidden(BView *View) 
{
   return View->IsHidden();
}

/***********************************************************************
 *  Method: BView::ConvertToScreen
 *  Params: BPoint *pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertToScreen(BView *View, BPoint *pt) 
{
   View->ConvertToScreen(pt);
}


/***********************************************************************
 *  Method: BView::ConvertToScreen
 *  Params: BPoint pt
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_ConvertToScreen_1
(BView *View, BPoint pt) 
{
   return View->ConvertToScreen(pt);
}


/***********************************************************************
 *  Method: BView::ConvertFromScreen
 *  Params: BPoint *pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertFromScreen(BView *View, BPoint *pt) 
{
   View->ConvertFromScreen(pt);
}


/***********************************************************************
 *  Method: BView::ConvertFromScreen
 *  Params: BPoint pt
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_ConvertFromScreen_1
(BView *View, BPoint pt) 
{
   return View->ConvertFromScreen(pt);
}


/***********************************************************************
 *  Method: BView::ConvertToScreen
 *  Params: BRect *r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertToScreen_r(BView *View, BRect *r) 
{
   View->ConvertToScreen(r);
}


/***********************************************************************
 *  Method: BView::ConvertToScreen
 *  Params: BRect r
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BView_ConvertToScreen_r_1
(BView *View, BRect r) 
{
   return View->ConvertToScreen(r);
}


/***********************************************************************
 *  Method: BView::ConvertFromScreen
 *  Params: BRect *r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertFromScreen_r(BView *View, BRect *r)
{
   View->ConvertFromScreen(r);
}


/***********************************************************************
 *  Method: BView::ConvertFromScreen
 *  Params: BRect r
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BView_ConvertFromScreen_r_1
(BView *View, BRect r) 
{
   return View->ConvertFromScreen(r);
}


/***********************************************************************
 *  Method: BView::ConvertToParent
 *  Params: BPoint *pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertToParent(BView *View, BPoint *pt)
{
   View->ConvertToParent(pt);
}


/***********************************************************************
 *  Method: BView::ConvertToParent
 *  Params: BPoint pt
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_ConvertToParent_1
(BView *View, BPoint pt) 
{
   return View->ConvertToParent(pt);
}


/***********************************************************************
 *  Method: BView::ConvertFromParent
 *  Params: BPoint *pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertFromParent(BView *View, BPoint *pt)
{
   View->ConvertFromParent(pt);
}


/***********************************************************************
 *  Method: BView::ConvertFromParent
 *  Params: BPoint pt
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_ConvertFromParent_1
(BView *View, BPoint pt) 
{
   return View->ConvertFromParent(pt);
}


/***********************************************************************
 *  Method: BView::ConvertToParent
 *  Params: BRect *r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertToParent_r(BView *View, BRect *r)
{
   View->ConvertToParent(r);
}


/***********************************************************************
 *  Method: BView::ConvertToParent
 *  Params: BRect r
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BView_ConvertToParent_r_1
(BView *View, BRect r) 
{
   return View->ConvertToParent(r);
}


/***********************************************************************
 *  Method: BView::ConvertFromParent
 *  Params: BRect *r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ConvertFromParent_r(BView *View, BRect *r) 
{
   View->ConvertFromParent(r);
}


/***********************************************************************
 *  Method: BView::ConvertFromParent
 *  Params: BRect r
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BView_ConvertFromParent_r_1
(BView *View, BRect r) 
{
   return View->ConvertFromParent(r);
}


/***********************************************************************
 *  Method: BView::LeftTop
 *  Params: 
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_LeftTop(BView *View)
{
   return View->LeftTop();
}

void
BView_ConstrainClippingRegion(BView *View, BRegion *region)
{
   View->ConstrainClippingRegion(region);
}


/***********************************************************************
 *  Method: BView::BeginRectTracking
 *  Params: BRect startRect, uint32 style
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_BeginRectTracking(BView *View, BRect startRect, uint32 style)
{
   View->BeginRectTracking(startRect, style);
}


/***********************************************************************
 *  Method: BView::EndRectTracking
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_EndRectTracking(BView *View)
{
   View->EndRectTracking();
}


/***********************************************************************
 *  Method: BView::GetMouse
 *  Params: BPoint *location, uint32 *buttons, bool checkMessageQueue
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetMouse(BView *View, BPoint *location, uint32 *buttons, bool checkMessageQueue)
{
   View->GetMouse(location, buttons, checkMessageQueue);
}


/***********************************************************************
 *  Method: BView::DragMessage
 *  Params: BMessage *aMessage, BRect dragRect, BHandler *reply_to
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DragMessage(BView *View, BMessage *aMessage, BRect dragRect, BHandler *reply_to)
{
   View->DragMessage(aMessage, dragRect, reply_to);
}


/***********************************************************************
 *  Method: BView::DragMessage
 *  Params: BMessage *aMessage, BBitmap *anImage, BPoint offset, BHandler *reply_to
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DragMessage_1
(BView *View, BMessage *aMessage, BBitmap *anImage, BPoint offset, BHandler *reply_to)
{
   View->DragMessage(aMessage, anImage, offset, reply_to);
}


/***********************************************************************
 *  Method: BView::DragMessage
 *  Params: BMessage *aMessage, BBitmap *anImage, drawing_mode dragMode, BPoint offset, BHandler *reply_to
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DragMessage_2
(BView *View, BMessage *aMessage, BBitmap *anImage, drawing_mode dragMode, BPoint offset, BHandler *reply_to)
{
   View->DragMessage(aMessage, anImage, dragMode, offset, reply_to);
}


/***********************************************************************
 *  Method: BView::FindView
 *  Params: const char *name
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BView_FindView(BView *View, const char *name) 
{
   return View->FindView(name);
}


/***********************************************************************
 *  Method: BView::Parent
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BView_Parent(BView *View) 
{
   return View->Parent();
}


/***********************************************************************
 *  Method: BView::Bounds
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BView_Bounds(BView *View) 
{
   return View->Bounds();
}


/***********************************************************************
 *  Method: BView::Frame
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BView_Frame(BView *View) 
{
   return View->Frame();
}




/***********************************************************************
 *  Method: BView::GetClippingRegion
 *  Params: BRegion *region
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetClippingRegion(BView *View, BRegion *region) 
{
   View->GetClippingRegion(region);
}



/***********************************************************************
 *  Method: BView::ClipToPicture
 *  Params: BPicture *picture, BPoint where, bool sync
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ClipToPicture(BView *View, BPicture *picture, BPoint where, bool sync)
{
   View->ClipToPicture(picture, where, sync);
}


/***********************************************************************
 *  Method: BView::ClipToInversePicture
 *  Params: BPicture *picture, BPoint where, bool sync
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ClipToInversePicture(BView *View, BPicture *picture, BPoint where, bool sync)
{
   View->ClipToInversePicture(picture, where, sync);
}


/***********************************************************************
 *  Method: BView::SetDrawingMode
 *  Params: drawing_mode mode
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetDrawingMode(BView *View, drawing_mode mode)
{
   View->SetDrawingMode(mode);
}


/***********************************************************************
 *  Method: BView::DrawingMode
 *  Params: 
 * Returns: drawing_mode
 * Effects: 
 ***********************************************************************/
drawing_mode
BView_DrawingMode(BView *View) 
{
   return View->DrawingMode();
}


/***********************************************************************
 *  Method: BView::SetBlendingMode
 *  Params: source_alpha srcAlpha, alpha_function alphaFunc
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetBlendingMode(BView *View, source_alpha srcAlpha, alpha_function alphaFunc)
{
   View->SetBlendingMode(srcAlpha, alphaFunc);
}


/***********************************************************************
 *  Method: BView::GetBlendingMode
 *  Params: source_alpha *srcAlpha, alpha_function *alphaFunc
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetBlendingMode(BView *View, source_alpha *srcAlpha, alpha_function *alphaFunc) 
{
   View->GetBlendingMode(srcAlpha, alphaFunc);
}


/***********************************************************************
 *  Method: BView::SetPenSize
 *  Params: float size
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetPenSize(BView *View, float size)
{
   View->SetPenSize(size);
}


/***********************************************************************
 *  Method: BView::PenSize
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BView_PenSize(BView *View) 
{
   return View->PenSize();
}


/***********************************************************************
 *  Method: BView::SetViewCursor
 *  Params: const BCursor *cursor, bool sync
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetViewCursor(BView *View, const BCursor *cursor, bool sync)
{
   View->SetViewCursor(cursor, sync);
}







/***********************************************************************
 *  Method: BView::ClearViewBitmap
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ClearViewBitmap(BView *View)
{
   View->ClearViewBitmap();
}


/***********************************************************************
 *  Method: BView::ClearViewOverlay
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ClearViewOverlay(BView *View)
{
   View->ClearViewOverlay();
}


/***********************************************************************
 *  Method: BView::SetHighColor
 *  Params: rgb_color a_color
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetHighColor(BView *View, rgb_color a_color)
{
   View->SetHighColor(a_color);
}


/***********************************************************************
 *  Method: BView::HighColor
 *  Params: 
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BView_HighColor(BView *View) 
{
   return View->HighColor();
}


/***********************************************************************
 *  Method: BView::SetLowColor
 *  Params: rgb_color a_color
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetLowColor(BView *View, rgb_color a_color)
{
   View->SetLowColor(a_color);
}


/***********************************************************************
 *  Method: BView::LowColor
 *  Params: 
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BView_LowColor(BView *View) 
{
   return View->LowColor();
}


/***********************************************************************
 *  Method: BView::SetLineMode
 *  Params: cap_mode lineCap, join_mode lineJoin, float miterLimit
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetLineMode(BView *View, cap_mode lineCap, join_mode lineJoin, float miterLimit)
{
   View->SetLineMode(lineCap, lineJoin, miterLimit);
}


/***********************************************************************
 *  Method: BView::LineJoinMode
 *  Params: 
 * Returns: join_mode
 * Effects: 
 ***********************************************************************/
join_mode
BView_LineJoinMode(BView *View) 
{
   return View->LineJoinMode();
}


/***********************************************************************
 *  Method: BView::LineCapMode
 *  Params: 
 * Returns: cap_mode
 * Effects: 
 ***********************************************************************/
cap_mode
BView_LineCapMode(BView *View) 
{
   return View->LineCapMode();
}


/***********************************************************************
 *  Method: BView::LineMiterLimit
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BView_LineMiterLimit(BView *View) 
{
   return View->LineMiterLimit();
}


/***********************************************************************
 *  Method: BView::SetOrigin
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetOrigin(BView *View, BPoint pt)
{
   View->SetOrigin(pt);
}


/***********************************************************************
 *  Method: BView::SetOrigin
 *  Params: float x, float y
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetOrigin_1
(BView *View, float x, float y)
{
   View->SetOrigin(x, y);
}


/***********************************************************************
 *  Method: BView::Origin
 *  Params: 
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_Origin(BView *View) 
{
   return View->Origin();
}


/***********************************************************************
 *  Method: BView::PushState
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_PushState(BView *View)
{
   View->PushState();
}


/***********************************************************************
 *  Method: BView::PopState
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_PopState(BView *View)
{
   View->PopState();
}


/***********************************************************************
 *  Method: BView::MovePenTo
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MovePenTo(BView *View, BPoint pt)
{
   View->MovePenTo(pt);
}


/***********************************************************************
 *  Method: BView::MovePenTo
 *  Params: float x, float y
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MovePenTo_1
(BView *View, float x, float y)
{
   View->MovePenTo(x, y);
}


/***********************************************************************
 *  Method: BView::MovePenBy
 *  Params: float x, float y
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MovePenBy(BView *View, float x, float y)
{
   View->MovePenBy(x, y);
}


/***********************************************************************
 *  Method: BView::PenLocation
 *  Params: 
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BView_PenLocation(BView *View) 
{
   return View->PenLocation();
}


/***********************************************************************
 *  Method: BView::StrokeLine
 *  Params: BPoint toPt, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeLine(BView *View, BPoint toPt, pattern p)
{
   View->StrokeLine(toPt, p);
}


/***********************************************************************
 *  Method: BView::StrokeLine
 *  Params: BPoint pt0, BPoint pt1, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeLine_1
(BView *View, BPoint pt0, BPoint pt1, pattern p)
{
   View->StrokeLine(pt0, pt1, p);
}


/***********************************************************************
 *  Method: BView::BeginLineArray
 *  Params: int32 count
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_BeginLineArray(BView *View, int32 count)
{
   View->BeginLineArray(count);
}


/***********************************************************************
 *  Method: BView::AddLine
 *  Params: BPoint pt0, BPoint pt1, rgb_color col
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_AddLine(BView *View, BPoint pt0, BPoint pt1, rgb_color col)
{
   View->AddLine(pt0, pt1, col);
}


/***********************************************************************
 *  Method: BView::EndLineArray
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_EndLineArray(BView *View)
{
   View->EndLineArray();
}


/***********************************************************************
 *  Method: BView::StrokePolygon
 *  Params: const BPolygon *aPolygon, bool closed, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokePolygon(BView *View, const BPolygon *aPolygon, bool closed, pattern p)
{
   View->StrokePolygon(aPolygon, closed, p);
}


/***********************************************************************
 *  Method: BView::StrokePolygon
 *  Params: const BPoint *ptArray, int32 numPts, bool closed, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokePolygon_1
(BView *View, const BPoint *ptArray, int32 numPts, bool closed, pattern p)
{
   View->StrokePolygon(ptArray, numPts, closed, p);
}


/***********************************************************************
 *  Method: BView::StrokePolygon
 *  Params: const BPoint *ptArray, int32 numPts, BRect bounds, bool closed, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokePolygon_2
(BView *View, const BPoint *ptArray, int32 numPts, BRect bounds, bool closed, pattern p)
{
   View->StrokePolygon(ptArray, numPts, bounds, closed, p);
}


/***********************************************************************
 *  Method: BView::FillPolygon
 *  Params: const BPolygon *aPolygon, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillPolygon(BView *View, const BPolygon *aPolygon, pattern p)
{
   View->FillPolygon(aPolygon, p);
}


/***********************************************************************
 *  Method: BView::FillPolygon
 *  Params: const BPoint *ptArray, int32 numPts, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillPolygon_1
(BView *View, const BPoint *ptArray, int32 numPts, pattern p)
{
   View->FillPolygon(ptArray, numPts, p);
}


/***********************************************************************
 *  Method: BView::FillPolygon
 *  Params: const BPoint *ptArray, int32 numPts, BRect bounds, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillPolygon_2
(BView *View, const BPoint *ptArray, int32 numPts, BRect bounds, pattern p)
{
   View->FillPolygon(ptArray, numPts, bounds, p);
}


/***********************************************************************
 *  Method: BView::StrokeTriangle
 *  Params: BPoint pt1, BPoint pt2, BPoint pt3, BRect bounds, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeTriangle(BView *View, BPoint pt1, BPoint pt2, BPoint pt3, BRect bounds, pattern p)
{
   View->StrokeTriangle(pt1, pt2, pt3, bounds, p);
}


/***********************************************************************
 *  Method: BView::StrokeTriangle
 *  Params: BPoint pt1, BPoint pt2, BPoint pt3, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeTriangle_1
(BView *View, BPoint pt1, BPoint pt2, BPoint pt3, pattern p)
{
   View->StrokeTriangle(pt1, pt2, pt3, p);
}


/***********************************************************************
 *  Method: BView::FillTriangle
 *  Params: BPoint pt1, BPoint pt2, BPoint pt3, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillTriangle(BView *View, BPoint pt1, BPoint pt2, BPoint pt3, pattern p)
{
   View->FillTriangle(pt1, pt2, pt3, p);
}


/***********************************************************************
 *  Method: BView::FillTriangle
 *  Params: BPoint pt1, BPoint pt2, BPoint pt3, BRect bounds, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillTriangle_1
(BView *View, BPoint pt1, BPoint pt2, BPoint pt3, BRect bounds, pattern p)
{
   View->FillTriangle(pt1, pt2, pt3, bounds, p);
}


/***********************************************************************
 *  Method: BView::StrokeRect
 *  Params: BRect r, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeRect(BView *View, BRect r, pattern p)
{
   View->StrokeRect(r, p);
}


/***********************************************************************
 *  Method: BView::FillRect
 *  Params: BRect r, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillRect(BView *View, BRect r, pattern p)
{
   View->FillRect(r, p);
}


/***********************************************************************
 *  Method: BView::FillRegion
 *  Params: BRegion *a_region, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillRegion(BView *View, BRegion *a_region, pattern p)
{
   View->FillRegion(a_region, p);
}


/***********************************************************************
 *  Method: BView::InvertRect
 *  Params: BRect r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_InvertRect(BView *View, BRect r)
{
   View->InvertRect(r);
}


/***********************************************************************
 *  Method: BView::StrokeRoundRect
 *  Params: BRect r, float xRadius, float yRadius, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeRoundRect(BView *View, BRect r, float xRadius, float yRadius, pattern p)
{
   View->StrokeRoundRect(r, xRadius, yRadius, p);
}


/***********************************************************************
 *  Method: BView::FillRoundRect
 *  Params: BRect r, float xRadius, float yRadius, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillRoundRect(BView *View, BRect r, float xRadius, float yRadius, pattern p)
{
   View->FillRoundRect(r, xRadius, yRadius, p);
}


/***********************************************************************
 *  Method: BView::StrokeEllipse
 *  Params: BPoint center, float xRadius, float yRadius, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeEllipse(BView *View, BPoint center, float xRadius, float yRadius, pattern p)
{
   View->StrokeEllipse(center, xRadius, yRadius, p);
}


/***********************************************************************
 *  Method: BView::StrokeEllipse
 *  Params: BRect r, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeEllipse_1
(BView *View, BRect r, pattern p)
{
   View->StrokeEllipse(r, p);
}


/***********************************************************************
 *  Method: BView::FillEllipse
 *  Params: BPoint center, float xRadius, float yRadius, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillEllipse(BView *View, BPoint center, float xRadius, float yRadius, pattern p)
{
   View->FillEllipse(center, xRadius, yRadius, p);
}


/***********************************************************************
 *  Method: BView::FillEllipse
 *  Params: BRect r, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillEllipse_1
(BView *View, BRect r, pattern p)
{
   View->FillEllipse(r, p);
}


/***********************************************************************
 *  Method: BView::StrokeArc
 *  Params: BPoint center, float xRadius, float yRadius, float start_angle, float arc_angle, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeArc(BView *View, BPoint center, float xRadius, float yRadius, float start_angle, float arc_angle, pattern p)
{
   View->StrokeArc(center, xRadius, yRadius, start_angle, arc_angle, p);
}


/***********************************************************************
 *  Method: BView::StrokeArc
 *  Params: BRect r, float start_angle, float arc_angle, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeArc_1
(BView *View, BRect r, float start_angle, float arc_angle, pattern p)
{
   View->StrokeArc(r, start_angle, arc_angle, p);
}


/***********************************************************************
 *  Method: BView::FillArc
 *  Params: BPoint center, float xRadius, float yRadius, float start_angle, float arc_angle, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillArc(BView *View, BPoint center, float xRadius, float yRadius, float start_angle, float arc_angle, pattern p)
{
   View->FillArc(center, xRadius, yRadius, start_angle, arc_angle, p);
}


/***********************************************************************
 *  Method: BView::FillArc
 *  Params: BRect r, float start_angle, float arc_angle, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillArc_1
(BView *View, BRect r, float start_angle, float arc_angle, pattern p)
{
   View->FillArc(r, start_angle, arc_angle, p);
}


/***********************************************************************
 *  Method: BView::StrokeBezier
 *  Params: BPoint *controlPoints, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeBezier(BView *View, BPoint *controlPoints, pattern p)
{
   View->StrokeBezier(controlPoints, p);
}


/***********************************************************************
 *  Method: BView::FillBezier
 *  Params: BPoint *controlPoints, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillBezier(BView *View, BPoint *controlPoints, pattern p)
{
   View->FillBezier(controlPoints, p);
}


/***********************************************************************
 *  Method: BView::StrokeShape
 *  Params: BShape *shape, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_StrokeShape(BView *View, BShape *shape, pattern p)
{
   View->StrokeShape(shape, p);
}


/***********************************************************************
 *  Method: BView::FillShape
 *  Params: BShape *shape, pattern p
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_FillShape(BView *View, BShape *shape, pattern p)
{
   View->FillShape(shape, p);
}


/***********************************************************************
 *  Method: BView::CopyBits
 *  Params: BRect src, BRect dst
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_CopyBits(BView *View, BRect src, BRect dst)
{
   View->CopyBits(src, dst);
}


/***********************************************************************
 *  Method: BView::DrawBitmapAsync
 *  Params: const BBitmap *aBitmap, BRect srcRect, BRect dstRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmapAsync(BView *View, const BBitmap *aBitmap, BRect srcRect, BRect dstRect)
{
   View->DrawBitmapAsync(aBitmap, srcRect, dstRect);
}


/***********************************************************************
 *  Method: BView::DrawBitmapAsync
 *  Params: const BBitmap *aBitmap
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmapAsync_1
(BView *View, const BBitmap *aBitmap)
{
   View->DrawBitmapAsync(aBitmap);
}


/***********************************************************************
 *  Method: BView::DrawBitmapAsync
 *  Params: const BBitmap *aBitmap, BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmapAsync_2
(BView *View, const BBitmap *aBitmap, BPoint where)
{
   View->DrawBitmapAsync(aBitmap, where);
}


/***********************************************************************
 *  Method: BView::DrawBitmapAsync
 *  Params: const BBitmap *aBitmap, BRect dstRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmapAsync_3
(BView *View, const BBitmap *aBitmap, BRect dstRect)
{
   View->DrawBitmapAsync(aBitmap, dstRect);
}


/***********************************************************************
 *  Method: BView::DrawBitmap
 *  Params: const BBitmap *aBitmap, BRect srcRect, BRect dstRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmap(BView *View, const BBitmap *aBitmap, BRect srcRect, BRect dstRect)
{
   View->DrawBitmap(aBitmap, srcRect, dstRect);
}


/***********************************************************************
 *  Method: BView::DrawBitmap
 *  Params: const BBitmap *aBitmap
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmap_1
(BView *View, const BBitmap *aBitmap)
{
   View->DrawBitmap(aBitmap);
}


/***********************************************************************
 *  Method: BView::DrawBitmap
 *  Params: const BBitmap *aBitmap, BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmap_2
(BView *View, const BBitmap *aBitmap, BPoint where)
{
   View->DrawBitmap(aBitmap, where);
}


/***********************************************************************
 *  Method: BView::DrawBitmap
 *  Params: const BBitmap *aBitmap, BRect dstRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawBitmap_3
(BView *View, const BBitmap *aBitmap, BRect dstRect)
{
   View->DrawBitmap(aBitmap, dstRect);
}


/***********************************************************************
 *  Method: BView::DrawChar
 *  Params: char aChar
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawChar(BView *View, char aChar)
{
   View->DrawChar(aChar);
}


/***********************************************************************
 *  Method: BView::DrawChar
 *  Params: char aChar, BPoint location
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawChar_1
(BView *View, char aChar, BPoint location)
{
   View->DrawChar(aChar, location);
}


/***********************************************************************
 *  Method: BView::DrawString
 *  Params: const char *aString, escapement_delta *delta
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawString(BView *View, const char *aString, escapement_delta *delta)
{
   View->DrawString(aString, delta);
}


/***********************************************************************
 *  Method: BView::DrawString
 *  Params: const char *aString, BPoint location, escapement_delta *delta
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawString_1
(BView *View, const char *aString, BPoint location, escapement_delta *delta)
{
   View->DrawString(aString, location, delta);
}


/***********************************************************************
 *  Method: BView::DrawString
 *  Params: const char *aString, int32 length, escapement_delta *delta
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawString_2
(BView *View, const char *aString, int32 length, escapement_delta *delta)
{
   View->DrawString(aString, length, delta);
}


/***********************************************************************
 *  Method: BView::DrawString
 *  Params: const char *aString, int32 length, BPoint location, escapement_delta *delta
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawString_3
(BView *View, const char *aString, int32 length, BPoint location, escapement_delta *delta)
{
   View->DrawString(aString, length, location, delta);
}


/***********************************************************************
 *  Method: BView::SetFont
 *  Params: const BFont *font, uint32 mask
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetFont(BView *View, const BFont *font, uint32 mask)
{
   View->SetFont(font, mask);
}


/***********************************************************************
 *  Method: BView::GetFont
 *  Params: BFont *font
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetFont(BView *View, BFont *font) 
{
   View->GetFont(font);
}


/***********************************************************************
 *  Method: BView::GetFont
 *  Params: BFont *font
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetFont_1
(BView *View, BFont *font)
{
   View->GetFont(font);
}


/***********************************************************************
 *  Method: BView::TruncateString
 *  Params: BString *in_out, uint32 mode, float width
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_TruncateString(BView *View, BString *in_out, uint32 mode, float width) 
{
   View->TruncateString(in_out, mode, width);
}


/***********************************************************************
 *  Method: BView::StringWidth
 *  Params: const char *string
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BView_StringWidth(BView *View, const char *string) 
{
   return View->StringWidth(string);
}


/***********************************************************************
 *  Method: BView::StringWidth
 *  Params: const char *string, int32 length
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BView_StringWidth_1
(BView *View, const char *string, int32 length) 
{
   return View->StringWidth(string, length);
}


/***********************************************************************
 *  Method: BView::GetStringWidths
 *  Params: char *stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetStringWidths(BView *View, char *stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]) 
{
   View->GetStringWidths(stringArray, lengthArray, numStrings, widthArray);
}


/***********************************************************************
 *  Method: BView::SetFontSize
 *  Params: float size
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetFontSize(BView *View, float size)
{
   View->SetFontSize(size);
}


/***********************************************************************
 *  Method: BView::ForceFontAliasing
 *  Params: bool enable
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ForceFontAliasing(BView *View, bool enable)
{
   View->ForceFontAliasing(enable);
}


/***********************************************************************
 *  Method: BView::GetFontHeight
 *  Params: font_height *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetFontHeight(BView *View, font_height *height) 
{
   View->GetFontHeight(height);
}


/***********************************************************************
 *  Method: BView::Invalidate
 *  Params: BRect invalRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Invalidate(BView *View, BRect invalRect)
{
   View->Invalidate(invalRect);
}


/***********************************************************************
 *  Method: BView::Invalidate
 *  Params: const BRegion *invalRegion
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Invalidate_1
(BView *View, const BRegion *invalRegion)
{
   View->Invalidate(invalRegion);
}


/***********************************************************************
 *  Method: BView::Invalidate
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Invalidate_2
(BView *View)
{
   View->Invalidate();
}


/***********************************************************************
 *  Method: BView::SetDiskMode
 *  Params: char *filename, long offset
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetDiskMode(BView *View, char *filename, long offset)
{
   View->SetDiskMode(filename, offset);
}


/***********************************************************************
 *  Method: BView::BeginPicture
 *  Params: BPicture *a_picture
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_BeginPicture(BView *View, BPicture *a_picture)
{
   View->BeginPicture(a_picture);
}


/***********************************************************************
 *  Method: BView::AppendToPicture
 *  Params: BPicture *a_picture
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_AppendToPicture(BView *View, BPicture *a_picture)
{
   View->AppendToPicture(a_picture);
}


/***********************************************************************
 *  Method: BView::EndPicture
 *  Params: 
 * Returns: BPicture *
 * Effects: 
 ***********************************************************************/
BPicture *
BView_EndPicture(BView *View)
{
   return View->EndPicture();
}


/***********************************************************************
 *  Method: BView::DrawPicture
 *  Params: const BPicture *a_picture
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawPicture(BView *View, const BPicture *a_picture)
{
   View->DrawPicture(a_picture);
}


/***********************************************************************
 *  Method: BView::DrawPicture
 *  Params: const BPicture *a_picture, BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawPicture_1
(BView *View, const BPicture *a_picture, BPoint where)
{
   View->DrawPicture(a_picture, where);
}


/***********************************************************************
 *  Method: BView::DrawPicture
 *  Params: const char *filename, long offset, BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawPicture_2
(BView *View, const char *filename, long offset, BPoint where)
{
   View->DrawPicture(filename, offset, where);
}


/***********************************************************************
 *  Method: BView::DrawPictureAsync
 *  Params: const BPicture *a_picture
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawPictureAsync_3
(BView *View, const BPicture *a_picture)
{
   View->DrawPictureAsync(a_picture);
}


/***********************************************************************
 *  Method: BView::DrawPictureAsync
 *  Params: const BPicture *a_picture, BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawPictureAsync_4
(BView *View, const BPicture *a_picture, BPoint where)
{
   View->DrawPictureAsync(a_picture, where);
}


/***********************************************************************
 *  Method: BView::DrawPictureAsync
 *  Params: const char *filename, long offset, BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_DrawPictureAsync_5
(BView *View, const char *filename, long offset, BPoint where)
{
   View->DrawPictureAsync(filename, offset, where);
}


/***********************************************************************
 *  Method: BView::SetEventMask
 *  Params: uint32 mask, uint32 options
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BView_SetEventMask(BView *View, uint32 mask, uint32 options)
{
   return View->SetEventMask(mask, options);
}


/***********************************************************************
 *  Method: BView::EventMask
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BView_EventMask(BView *View)
{
   return View->EventMask();
}


/***********************************************************************
 *  Method: BView::SetMouseEventMask
 *  Params: uint32 mask, uint32 options
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BView_SetMouseEventMask(BView *View, uint32 mask, uint32 options)
{
   return View->SetMouseEventMask(mask, options);
}


/***********************************************************************
 *  Method: BView::SetFlags
 *  Params: uint32 flags
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetFlags(BView *View, uint32 flags)
{
   View->SetFlags(flags);
}


/***********************************************************************
 *  Method: BView::Flags
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BView_Flags(BView *View) 
{
   return View->Flags();
}


/***********************************************************************
 *  Method: BView::SetResizingMode
 *  Params: uint32 mode
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetResizingMode(BView *View, uint32 mode)
{
   View->SetResizingMode(mode);
}


/***********************************************************************
 *  Method: BView::ResizingMode
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BView_ResizingMode(BView *View) 
{
   return View->ResizingMode();
}


/***********************************************************************
 *  Method: BView::MoveBy
 *  Params: float dh, float dv
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MoveBy(BView *View, float dh, float dv)
{
   View->MoveBy(dh, dv);
}


/***********************************************************************
 *  Method: BView::MoveTo
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MoveTo(BView *View, BPoint where)
{
   View->MoveTo(where);
}


/***********************************************************************
 *  Method: BView::MoveTo
 *  Params: float x, float y
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MoveTo_1
(BView *View, float x, float y)
{
   View->MoveTo(x, y);
}


/***********************************************************************
 *  Method: BView::ResizeBy
 *  Params: float dh, float dv
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ResizeBy(BView *View, float dh, float dv)
{
   View->ResizeBy(dh, dv);
}


/***********************************************************************
 *  Method: BView::ResizeTo
 *  Params: float width, float height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ResizeTo(BView *View, float width, float height)
{
   View->ResizeTo(width, height);
}


/***********************************************************************
 *  Method: BView::ScrollBy
 *  Params: float dh, float dv
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ScrollBy(BView *View, float dh, float dv)
{
   View->ScrollBy(dh, dv);
}


/***********************************************************************
 *  Method: BView::ScrollTo
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ScrollTo(BView *View, BPoint where)
{
   View->ScrollTo(where);
}


/***********************************************************************
 *  Method: BView::MakeFocus
 *  Params: bool focusState
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_MakeFocus(BView *View, bool focusState)
{
   View->MakeFocus(focusState);
}


/***********************************************************************
 *  Method: BView::IsFocus
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BView_IsFocus(BView *View) 
{
   return View->IsFocus();
}





/***********************************************************************
 *  Method: BView::IsHidden
 *  Params: const BView *looking_from
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BView_IsHidden_1
(BView *View, const BView *looking_from) 
{
   return View->IsHidden(looking_from);
}


/***********************************************************************
 *  Method: BView::Flush
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Flush(BView *View) 
{
   View->Flush();
}


/***********************************************************************
 *  Method: BView::Sync
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_Sync(BView *View) 
{
   View->Sync();
}


/***********************************************************************
 *  Method: BView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_GetPreferredSize(BView *View, float *width, float *height)
{
   View->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_ResizeToPreferred(BView *View)
{
   View->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BView::ScrollBar
 *  Params: orientation posture
 * Returns: BScrollBar *
 * Effects: 
 ***********************************************************************/
BScrollBar *
BView_ScrollBar(BView *View, orientation posture) 
{
   return View->ScrollBar(posture);
}


/***********************************************************************
 *  Method: BView::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BView_ResolveSpecifier(BView *View, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return View->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BView_GetSupportedSuites(BView *View, BMessage *data)
{
   return View->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BView::IsPrinting
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BView_IsPrinting(BView *View) 
{
   return View->IsPrinting();
}


/***********************************************************************
 *  Method: BView::SetScale
 *  Params: float scale
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BView_SetScale(BView *View, float scale) 
{
   View->SetScale(scale);
}



#if defined(__cplusplus)
}
#endif

#endif /* _VIEW_CPP_ */
