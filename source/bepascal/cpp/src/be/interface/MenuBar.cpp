#ifndef _MENUBAR_CPP_
#define _MENUBAR_CPP_

#include "MenuBar.h"
#include "menubar.h"
#include <beobj.h>

BPMenuBar::BPMenuBar(TPasObject PasObject, BRect frame, const char *name, 
		uint32 resizingMode,
		menu_layout layout, bool resizeToFit)
		:BMenuBar(frame, name, resizingMode, layout, resizeToFit),
		  BPMenu(PasObject, name, layout),
//       BPView(PasObject, BRect(0, 0, 0, 0), "", 0, 0),
          BPHandler(PasObject)
//       BPasObject(PasObject)
{
}

BPMenuBar::BPMenuBar(TPasObject PasObject, BMessage *archive)
		:BMenuBar(archive),
		  BPMenu(PasObject, archive),
//       BPView(PasObject, BRect(0, 0, 0, 0), "", 0, 0),
          BPHandler(PasObject)
//       BPasObject(PasObject)
{
}

void BPMenuBar::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BMenuBar::MessageReceived(message);
}

void BPMenuBar::AllAttached(void)
{
	BMenuBar::AllAttached();
//	AllAttached_hookCall(message);
}

void BPMenuBar::AttachedToWindow(void)
{
	BMenuBar::AttachedToWindow();
	AttachedToWindow_hookCall();	
}

void BPMenuBar::AllDetached(void)
{
	BMenuBar::AllDetached();
//	View_AllDetached_hook(GetPasObject());
}

void BPMenuBar::DetachedFromWindow(void)
{
	BMenuBar::DetachedFromWindow();
//	View_DetachedFromWindow_hook(GetPasObject());
}

void BPMenuBar::Draw(BRect updateRect)
{
	BMenuBar::Draw(updateRect);
	Draw_hookCall(updateRect);	
}

void BPMenuBar::DrawAfterChildren(BRect updateRect)
{
	BMenuBar::DrawAfterChildren(updateRect);
//	View_DrawAfterChildren_hook(GetPasObject(), &updateRect);
}

void BPMenuBar::FrameMoved(BPoint parentPoint)
{
	BMenuBar::FrameMoved(parentPoint);
//	View_FrameMoved_hook(GetPasObject(), &parentPoint);
}

void BPMenuBar::FrameResized(float width, float height)
{
	BMenuBar::FrameResized(width, height);
//	View_FrameResized_hook(GetPasObject(), width, height);
}

void BPMenuBar::GetPreferredSize(float *width, float *height)
{
	BMenuBar::GetPreferredSize(width, height);
//	View_GetPreferredSize_hook(GetPasObject(), width, height);
}

void BPMenuBar::ResizeToPreferred(void)
{
	BMenuBar::ResizeToPreferred();
//	View_ResizeToPreferred_hook(GetPasObject());
}

void BPMenuBar::KeyDown(const char *bytes, int32 numBytes)
{
	BMenuBar::KeyDown(bytes, numBytes);
//	View_KeyDown_hook(GetPasObject(), bytes, numBytes);
}

void BPMenuBar::KeyUp(const char *bytes, int32 numBytes)
{
	BMenuBar::KeyUp(bytes, numBytes);
//	View_KeyUp_hook(GetPasObject(), bytes, numBytes);
}

void BPMenuBar::MouseDown(BPoint point)
{
	BMenuBar::MouseDown(point);
//	View_MouseDown_hook(GetPasObject(), &point);
}

void BPMenuBar::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BMenuBar::MouseMoved(point, transit, message);
//	View_MouseMoved_hook(GetPasObject(), &point, transit, &message);
}

void BPMenuBar::MouseUp(BPoint point)
{
	BMenuBar::MouseUp(point);
//	View_MouseUp_hook(GetPasObject(), &point);
}

void BPMenuBar::Pulse(void)
{
	BMenuBar::Pulse();
//	View_Pulse_hook(GetPasObject());
}

//void BPMenu::TargetedByScrollView(BScrollView *scroller)
//{
//	View_TargetedByScrollView(GetPasObject(), scroller);
//}

void BPMenuBar::WindowActivated(bool active)
{
	BMenuBar::WindowActivated(active);
//	View_WindowActivated_hook(GetPasObject(), active);
}

void BPMenuBar::SetEnabled(bool enabled)
{
	BMenuBar::SetEnabled(enabled);
}

void BPMenuBar::SetValue(int32 value)
{

}

void BPMenuBar::MakeDefault(bool flag)
{

}

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: MenuBar.cpp
 *   DATE: Sun Jan 12 01:25:37 2003
 *  DESCR: 
 ***********************************************************************/

TCPlusObject BMenuBar_Create(TPasObject PasObject, BRect frame, const char *name, 
		uint32 resizingMode = B_FOLLOW_LEFT_RIGHT | B_FOLLOW_TOP,
		menu_layout layout = B_ITEMS_IN_COLUMN, bool resizeToFit = true)
{
	return new BPMenuBar(PasObject, frame, name, resizingMode, layout, resizeToFit);
}

/***********************************************************************
 *  Method: BMenuBar::BMenuBar
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenuBar_Create_2(TPasObject PasObject, BMessage *data)
{
	return new BPMenuBar(PasObject, data);
}


/***********************************************************************
 *  Method: BMenuBar::~BMenuBar
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BMenuBar_Free(BMenuBar *MenuBar)
{
   delete MenuBar;
}


/***********************************************************************
 *  Method: BMenuBar::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BMenuBar_Instantiate(BMenuBar *MenuBar, BMessage *data)
{
   return MenuBar->Instantiate(data);
}


/***********************************************************************
 *  Method: BMenuBar::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenuBar_Archive(BMenuBar *MenuBar, BMessage *data, bool deep) 
{
   return MenuBar->Archive(data, deep);
}


/***********************************************************************
 *  Method: BMenuBar::SetBorder
 *  Params: menu_bar_border border
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_SetBorder(BMenuBar *MenuBar, menu_bar_border border)
{
   MenuBar->SetBorder(border);
}


/***********************************************************************
 *  Method: BMenuBar::Border
 *  Params: 
 * Returns: menu_bar_border
 * Effects: 
 ***********************************************************************/
menu_bar_border
BMenuBar_Border(BMenuBar *MenuBar) 
{
   return MenuBar->Border();
}


/***********************************************************************
 *  Method: BMenuBar::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_Draw(BMenuBar *MenuBar, BRect updateRect)
{
   MenuBar->Draw(updateRect);
}


/***********************************************************************
 *  Method: BMenuBar::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_AttachedToWindow(BMenuBar *MenuBar)
{
   MenuBar->AttachedToWindow();
}


/***********************************************************************
 *  Method: BMenuBar::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_DetachedFromWindow(BMenuBar *MenuBar)
{
   MenuBar->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BMenuBar::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_MessageReceived(BMenuBar *MenuBar, BMessage *msg)
{
   MenuBar->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BMenuBar::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_MouseDown(BMenuBar *MenuBar, BPoint where)
{
   MenuBar->MouseDown(where);
}


/***********************************************************************
 *  Method: BMenuBar::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_WindowActivated(BMenuBar *MenuBar, bool state)
{
   MenuBar->WindowActivated(state);
}


/***********************************************************************
 *  Method: BMenuBar::MouseUp
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_MouseUp(BMenuBar *MenuBar, BPoint where)
{
   MenuBar->MouseUp(where);
}


/***********************************************************************
 *  Method: BMenuBar::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_FrameMoved(BMenuBar *MenuBar, BPoint new_position)
{
   MenuBar->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BMenuBar::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_FrameResized(BMenuBar *MenuBar, float new_width, float new_height)
{
   MenuBar->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BMenuBar::Show
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_Show(BMenuBar *MenuBar)
{
   MenuBar->Show();
}


/***********************************************************************
 *  Method: BMenuBar::Hide
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_Hide(BMenuBar *MenuBar)
{
   MenuBar->Hide();
}


/***********************************************************************
 *  Method: BMenuBar::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BMenuBar_ResolveSpecifier(BMenuBar *MenuBar, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return MenuBar->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BMenuBar::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenuBar_GetSupportedSuites(BMenuBar *MenuBar, BMessage *data)
{
   return MenuBar->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BMenuBar::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_ResizeToPreferred(BMenuBar *MenuBar)
{
   MenuBar->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BMenuBar::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_GetPreferredSize(BMenuBar *MenuBar, float *width, float *height)
{
   MenuBar->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BMenuBar::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_MakeFocus(BMenuBar *MenuBar, bool state)
{
   MenuBar->MakeFocus(state);
}


/***********************************************************************
 *  Method: BMenuBar::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_AllAttached(BMenuBar *MenuBar)
{
   MenuBar->AllAttached();
}


/***********************************************************************
 *  Method: BMenuBar::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuBar_AllDetached(BMenuBar *MenuBar)
{
   MenuBar->AllDetached();
}


/***********************************************************************
 *  Method: BMenuBar::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenuBar_Perform(BMenuBar *MenuBar, perform_code d, void *arg)
{
   return MenuBar->Perform(d, arg);
}


/***********************************************************************
 *  Method: BMenuBar::_ReservedMenuBar1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar__ReservedMenuBar1(BMenuBar *MenuBar)
{
   MenuBar->_ReservedMenuBar1();
}
*/

/***********************************************************************
 *  Method: BMenuBar::_ReservedMenuBar2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar__ReservedMenuBar2(BMenuBar *MenuBar)
{
   MenuBar->_ReservedMenuBar2();
}
*/

/***********************************************************************
 *  Method: BMenuBar::_ReservedMenuBar3
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar__ReservedMenuBar3(BMenuBar *MenuBar)
{
   MenuBar->_ReservedMenuBar3();
}
*/

/***********************************************************************
 *  Method: BMenuBar::_ReservedMenuBar4
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar__ReservedMenuBar4(BMenuBar *MenuBar)
{
   MenuBar->_ReservedMenuBar4();
}
*/

/***********************************************************************
 *  Method: BMenuBar::operator=
 *  Params: const BMenuBar &
 * Returns: BMenuBar &
 * Effects: 
 ***********************************************************************/
/*BMenuBar &
BMenuBar_operator=(BMenuBar *MenuBar, const BMenuBar &)
{
   return MenuBar->operator=();
}
*/

/***********************************************************************
 *  Method: BMenuBar::StartMenuBar
 *  Params: int32 menuIndex, bool sticky, bool show_menu, BRect *special_rect
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar_StartMenuBar(BMenuBar *MenuBar, int32 menuIndex, bool sticky, bool show_menu, BRect *special_rect)
{
   MenuBar->StartMenuBar(menuIndex, sticky, show_menu, special_rect);
}
*/

/***********************************************************************
 *  Method: BMenuBar::TrackTask
 *  Params: void *arg
 * Returns: long
 * Effects: 
 ***********************************************************************/
/*long
BMenuBar_TrackTask(BMenuBar *MenuBar, void *arg)
{
   return MenuBar->TrackTask(arg);
}
*/

/***********************************************************************
 *  Method: BMenuBar::Track
 *  Params: int32 *action, int32 startIndex, bool showMenu
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
/*BMenuItem *
BMenuBar_Track(BMenuBar *MenuBar, int32 *action, int32 startIndex, bool showMenu)
{
   return MenuBar->Track(action, startIndex, showMenu);
}
*/

/***********************************************************************
 *  Method: BMenuBar::StealFocus
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar_StealFocus(BMenuBar *MenuBar)
{
   MenuBar->StealFocus();
}
*/

/***********************************************************************
 *  Method: BMenuBar::RestoreFocus
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar_RestoreFocus(BMenuBar *MenuBar)
{
   MenuBar->RestoreFocus();
}
*/

/***********************************************************************
 *  Method: BMenuBar::InitData
 *  Params: menu_layout layout
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BMenuBar_InitData(BMenuBar *MenuBar, menu_layout layout)
{
   MenuBar->InitData(layout);
}
*/

#if defined(__cplusplus)
}
#endif

#endif /* _MENUBAR_CPP_ */
