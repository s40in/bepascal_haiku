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

#ifndef _WINDOW_CPP_
#define _WINDOW_CPP_

#include <Window.h>

#include <OS.h>

#include <handler.h>
#include <window.h>
#include <beobj.h>

// definition of callback function in BWindow
#include <Button.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__cplusplus)
}
#endif

BPWindow::BPWindow(TPasObject PasObject, 
				 BRect frame,
				 const char *title,
				 window_type type,
				 uint32 flags,
				 uint32 workspaces)
				 : BWindow(frame, title, type, flags, workspaces),
                 BPLooper(PasObject)
//              BPHandler(PasObject, title),
//              BPasObject(PasObject)
{
}

void BPWindow::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BWindow::MessageReceived(message);
//	message->PrintToStream();
}

void BPWindow::DispatchMessage(BMessage *message, BHandler *target)
{
	DispatchMessage_hookCall(message, target);
	BWindow::DispatchMessage(message, target);
}

bool BPWindow::QuitRequested(void)
{
	return QuitRequested_hookCall();
}

void BPWindow::WindowActivated(bool active)
{
	BWindow::WindowActivated(active);
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BWindow_Create_1(TPasObject PasObject, 
							BRect frame,
							const char *title,
							window_type type,
							uint32 flags,
							uint32 workspaces)
{
	return new BPWindow(PasObject, frame, title, type, flags, workspaces);
}

void BWindow_Free(TCPlusObject Window)
{
	delete reinterpret_cast<BWindow*>(Window);
}

void BWindow_Show(TCPlusObject Window)
{
	reinterpret_cast<BWindow*>(Window)->Show();
}

void BWindow_Hide(TCPlusObject Window)
{
	reinterpret_cast<BWindow*>(Window)->Hide();
}

void BWindow_AddChild(BWindow* Window, BView* aView, BView* sibling)
{
	Window->AddChild(aView, sibling);
}

bool BWindow_RemoveChild(BWindow* Window, BView* aView)
{
	return Window->RemoveChild(aView);
}

BView* BWindow_ChildAt(BWindow* Window, int32 index)
{
	return Window->ChildAt(index);
}

int32 BWindow_CountChildren(BWindow* Window)
{
	return Window->CountChildren();
}

//*********************************

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
/***********************************************************************
 *  Method: BWindow::BWindow
 *  Params: BRect frame, const char *title, window_type type, uint32 flags, uint32 workspace
 * Effects: 
 ***********************************************************************/
TCPlusObject BWindow_Create(TPasObject PasObject, BRect frame, const char *title, window_type type, uint32 flags, uint32 workspace)
{
	return new BPWindow(PasObject, frame, title, type, flags, workspace);
}


/***********************************************************************
 *  Method: BWindow::BWindow
 *  Params: BRect frame, const char *title, window_look look, window_feel feel, uint32 flags, uint32 workspace
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BWindow_Create_1
(TPasObject PasObject, BRect frame, const char *title, window_look look, window_feel feel, uint32 flags, uint32 workspace)
{
	return new BPWindow(PasObject, frame, title, look, feel, flags, workspace);
}
*/

/***********************************************************************
 *  Method: BWindow::BWindow
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BWindow_Create_2(TPasObject PasObject, BMessage *data)
{
//	return new BPWindow(PasObject, data);
}


/***********************************************************************
 *  Method: BWindow::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BWindow_Instantiate(BWindow *Window, BMessage *data)
{
   return Window->Instantiate(data);
}


/***********************************************************************
 *  Method: BWindow::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_Archive(BWindow *Window, BMessage *data, bool deep)
{
   return Window->Archive(data, deep);
}


/***********************************************************************
 *  Method: BWindow::Quit
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Quit(BWindow *Window)
{
   Window->Quit();
}


/***********************************************************************
 *  Method: BWindow::AddChild
 *  Params: BView *child, BView *before
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_AddChild(BWindow *Window, BView *child, BView *before)
{
   Window->AddChild(child, before);
}
*/

/***********************************************************************
 *  Method: BWindow::RemoveChild
 *  Params: BView *child
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BWindow_RemoveChild(BWindow *Window, BView *child)
{
   return Window->RemoveChild(child);
}
*/


/***********************************************************************
 *  Method: BWindow::CountChildren
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
/*int32
BWindow_CountChildren(BWindow *Window)
{
   return Window->CountChildren();
}
*/


/***********************************************************************
 *  Method: BWindow::ChildAt
 *  Params: int32 index
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
/*BView *
BWindow_ChildAt(BWindow *Window, int32 index)
{
   return Window->ChildAt(index);
}
*/

/***********************************************************************
 *  Method: BWindow::DispatchMessage
 *  Params: BMessage *message, BHandler *handler
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_DispatchMessage(BWindow *Window, BMessage *message, BHandler *handler)
{
   Window->DispatchMessage(message, handler);
}


/***********************************************************************
 *  Method: BWindow::MessageReceived
 *  Params: BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_MessageReceived(BWindow *Window, BMessage *message)
{
   Window->MessageReceived(message);
}


/***********************************************************************
 *  Method: BWindow::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_FrameMoved(BWindow *Window, BPoint new_position)
{
   Window->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BWindow::WorkspacesChanged
 *  Params: uint32 old_ws, uint32 new_ws
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_WorkspacesChanged(BWindow *Window, uint32 old_ws, uint32 new_ws)
{
   Window->WorkspacesChanged(old_ws, new_ws);
}


/***********************************************************************
 *  Method: BWindow::WorkspaceActivated
 *  Params: int32 ws, bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_WorkspaceActivated(BWindow *Window, int32 ws, bool state)
{
   Window->WorkspaceActivated(ws, state);
}


/***********************************************************************
 *  Method: BWindow::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_FrameResized(BWindow *Window, float new_width, float new_height)
{
   Window->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BWindow::Minimize
 *  Params: bool minimize
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Minimize(BWindow *Window, bool minimize)
{
   Window->Minimize(minimize);
}


/***********************************************************************
 *  Method: BWindow::Zoom
 *  Params: BPoint rec_position, float rec_width, float rec_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Zoom(BWindow *Window, BPoint rec_position, float rec_width, float rec_height)
{
   Window->Zoom(rec_position, rec_width, rec_height);
}


/***********************************************************************
 *  Method: BWindow::Zoom
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Zoom_1
(BWindow *Window)
{
   Window->Zoom();
}


/***********************************************************************
 *  Method: BWindow::SetZoomLimits
 *  Params: float max_h, float max_v
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetZoomLimits(BWindow *Window, float max_h, float max_v)
{
   Window->SetZoomLimits(max_h, max_v);
}


/***********************************************************************
 *  Method: BWindow::ScreenChanged
 *  Params: BRect screen_size, color_space depth
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ScreenChanged(BWindow *Window, BRect screen_size, color_space depth)
{
   Window->ScreenChanged(screen_size, depth);
}


/***********************************************************************
 *  Method: BWindow::SetPulseRate
 *  Params: bigtime_t rate
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetPulseRate(BWindow *Window, bigtime_t rate)
{
   Window->SetPulseRate(rate);
}


/***********************************************************************
 *  Method: BWindow::PulseRate
 *  Params: 
 * Returns: bigtime_t
 * Effects: 
 ***********************************************************************/
bigtime_t
BWindow_PulseRate(BWindow *Window) 
{
   return Window->PulseRate();
}


/***********************************************************************
 *  Method: BWindow::AddShortcut
 *  Params: uint32 key, uint32 modifiers, BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_AddShortcut(BWindow *Window, uint32 key, uint32 modifiers, BMessage *msg)
{
   Window->AddShortcut(key, modifiers, msg);
}


/***********************************************************************
 *  Method: BWindow::AddShortcut
 *  Params: uint32 key, uint32 modifiers, BMessage *msg, BHandler *target
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_AddShortcut_1
(BWindow *Window, uint32 key, uint32 modifiers, BMessage *msg, BHandler *target)
{
   Window->AddShortcut(key, modifiers, msg, target);
}


/***********************************************************************
 *  Method: BWindow::RemoveShortcut
 *  Params: uint32 key, uint32 modifiers
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_RemoveShortcut(BWindow *Window, uint32 key, uint32 modifiers)
{
   Window->RemoveShortcut(key, modifiers);
}


/***********************************************************************
 *  Method: BWindow::SetDefaultButton
 *  Params: BButton *button
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetDefaultButton(BWindow *Window, BButton *button)
{
   Window->SetDefaultButton(button);
}


/***********************************************************************
 *  Method: BWindow::DefaultButton
 *  Params: 
 * Returns: BButton *
 * Effects: 
 ***********************************************************************/
BButton *
BWindow_DefaultButton(BWindow *Window) 
{
   return Window->DefaultButton();
}


/***********************************************************************
 *  Method: BWindow::MenusBeginning
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_MenusBeginning(BWindow *Window)
{
   Window->MenusBeginning();
}


/***********************************************************************
 *  Method: BWindow::MenusEnded
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_MenusEnded(BWindow *Window)
{
   Window->MenusEnded();
}


/***********************************************************************
 *  Method: BWindow::NeedsUpdate
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_NeedsUpdate(BWindow *Window) 
{
   return Window->NeedsUpdate();
}


/***********************************************************************
 *  Method: BWindow::UpdateIfNeeded
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_UpdateIfNeeded(BWindow *Window)
{
   Window->UpdateIfNeeded();
}


/***********************************************************************
 *  Method: BWindow::FindView
 *  Params: const char *view_name
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BWindow_FindView(BWindow *Window, const char *view_name) 
{
   return Window->FindView(view_name);
}


/***********************************************************************
 *  Method: BWindow::FindView
 *  Params: BPoint
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BWindow_FindView_1
(BWindow *Window, BPoint aPoint) 
{
   return Window->FindView(aPoint);
}


/***********************************************************************
 *  Method: BWindow::CurrentFocus
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BWindow_CurrentFocus(BWindow *Window) 
{
   return Window->CurrentFocus();
}


/***********************************************************************
 *  Method: BWindow::Activate
 *  Params: bool
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Activate(BWindow *Window, bool)
{
   Window->Activate();
}


/***********************************************************************
 *  Method: BWindow::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_WindowActivated(BWindow *Window, bool state)
{
   Window->WindowActivated(state);
}


/***********************************************************************
 *  Method: BWindow::ConvertToScreen
 *  Params: BPoint *pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ConvertToScreen_3(BWindow *Window, BPoint *pt) 
{
   Window->ConvertToScreen(pt);
}


/***********************************************************************
 *  Method: BWindow::ConvertToScreen
 *  Params: BPoint pt
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BWindow_ConvertToScreen_1
(BWindow *Window, BPoint pt) 
{
   return Window->ConvertToScreen(pt);
}


/***********************************************************************
 *  Method: BWindow::ConvertFromScreen
 *  Params: BPoint *pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ConvertFromScreen(BWindow *Window, BPoint *pt) 
{
   Window->ConvertFromScreen(pt);
}


/***********************************************************************
 *  Method: BWindow::ConvertFromScreen
 *  Params: BPoint pt
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BWindow_ConvertFromScreen_1
(BWindow *Window, BPoint pt) 
{
   return Window->ConvertFromScreen(pt);
}


/***********************************************************************
 *  Method: BWindow::ConvertToScreen
 *  Params: BRect *rect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ConvertToScreen_2(BWindow *Window, BRect *rect) 
{
   Window->ConvertToScreen(rect);
}


/***********************************************************************
 *  Method: BWindow::ConvertToScreen
 *  Params: BRect rect
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BWindow_ConvertToScreen_5
(BWindow *Window, BRect rect) 
{
   return Window->ConvertToScreen(rect);
}


/***********************************************************************
 *  Method: BWindow::ConvertFromScreen
 *  Params: BRect *rect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ConvertFromScreen_6(BWindow *Window, BRect *rect) 
{
   Window->ConvertFromScreen(rect);
}


/***********************************************************************
 *  Method: BWindow::ConvertFromScreen
 *  Params: BRect rect
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BWindow_ConvertFromScreen_7
(BWindow *Window, BRect rect) 
{
   return Window->ConvertFromScreen(rect);
}


/***********************************************************************
 *  Method: BWindow::MoveBy
 *  Params: float dx, float dy
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_MoveBy(BWindow *Window, float dx, float dy)
{
   Window->MoveBy(dx, dy);
}


/***********************************************************************
 *  Method: BWindow::MoveTo
 *  Params: BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_MoveTo(BWindow *Window, BPoint aPoint)
{
   Window->MoveTo(aPoint);
}


/***********************************************************************
 *  Method: BWindow::MoveTo
 *  Params: float x, float y
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_MoveTo_1
(BWindow *Window, float x, float y)
{
   Window->MoveTo(x, y);
}


/***********************************************************************
 *  Method: BWindow::ResizeBy
 *  Params: float dx, float dy
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ResizeBy(BWindow *Window, float dx, float dy)
{
   Window->ResizeBy(dx, dy);
}


/***********************************************************************
 *  Method: BWindow::ResizeTo
 *  Params: float width, float height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_ResizeTo(BWindow *Window, float width, float height)
{
   Window->ResizeTo(width, height);
}


/***********************************************************************
 *  Method: BWindow::Show
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_Show(BWindow *Window)
{
   Window->Show();
}
*/

/***********************************************************************
 *  Method: BWindow::Hide
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_Hide(BWindow *Window)
{
   Window->Hide();
}
*/


/***********************************************************************
 *  Method: BWindow::IsHidden
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_IsHidden(BWindow *Window) 
{
   return Window->IsHidden();
}


/***********************************************************************
 *  Method: BWindow::IsMinimized
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_IsMinimized(BWindow *Window) 
{
   return Window->IsMinimized();
}


/***********************************************************************
 *  Method: BWindow::Flush
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Flush(BWindow *Window)
{
   Window->Flush();
}


/***********************************************************************
 *  Method: BWindow::Sync
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_Sync(BWindow *Window) 
{
   Window->Sync();
}


/***********************************************************************
 *  Method: BWindow::SendBehind
 *  Params: const BWindow *window
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_SendBehind(BWindow *Window, const BWindow *window)
{
   return Window->SendBehind(window);
}


/***********************************************************************
 *  Method: BWindow::DisableUpdates
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_DisableUpdates(BWindow *Window)
{
   Window->DisableUpdates();
}


/***********************************************************************
 *  Method: BWindow::EnableUpdates
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_EnableUpdates(BWindow *Window)
{
   Window->EnableUpdates();
}


/***********************************************************************
 *  Method: BWindow::BeginViewTransaction
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_BeginViewTransaction(BWindow *Window)
{
   Window->BeginViewTransaction();
}


/***********************************************************************
 *  Method: BWindow::EndViewTransaction
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_EndViewTransaction(BWindow *Window)
{
   Window->EndViewTransaction();
}


/***********************************************************************
 *  Method: BWindow::Bounds
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BWindow_Bounds(BWindow *Window) 
{
   return Window->Bounds();
}


/***********************************************************************
 *  Method: BWindow::Frame
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BWindow_Frame(BWindow *Window) 
{
   return Window->Frame();
}


/***********************************************************************
 *  Method: BWindow::Title
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BWindow_Title(BWindow *Window) 
{
   return Window->Title();
}


/***********************************************************************
 *  Method: BWindow::SetTitle
 *  Params: const char *title
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetTitle(BWindow *Window, const char *title)
{
   Window->SetTitle(title);
}


/***********************************************************************
 *  Method: BWindow::IsFront
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_IsFront(BWindow *Window) 
{
   return Window->IsFront();
}


/***********************************************************************
 *  Method: BWindow::IsActive
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_IsActive(BWindow *Window) 
{
   return Window->IsActive();
}


/***********************************************************************
 *  Method: BWindow::SetKeyMenuBar
 *  Params: BMenuBar *bar
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetKeyMenuBar(BWindow *Window, BMenuBar *bar)
{
   Window->SetKeyMenuBar(bar);
}


/***********************************************************************
 *  Method: BWindow::KeyMenuBar
 *  Params: 
 * Returns: BMenuBar *
 * Effects: 
 ***********************************************************************/
BMenuBar *
BWindow_KeyMenuBar(BWindow *Window) 
{
   return Window->KeyMenuBar();
}


/***********************************************************************
 *  Method: BWindow::SetSizeLimits
 *  Params: float min_h, float max_h, float min_v, float max_v
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetSizeLimits(BWindow *Window, float min_h, float max_h, float min_v, float max_v)
{
   Window->SetSizeLimits(min_h, max_h, min_v, max_v);
}


/***********************************************************************
 *  Method: BWindow::GetSizeLimits
 *  Params: float *min_h, float *max_h, float *min_v, float *max_v
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_GetSizeLimits(BWindow *Window, float *min_h, float *max_h, float *min_v, float *max_v)
{
   Window->GetSizeLimits(min_h, max_h, min_v, max_v);
}


/***********************************************************************
 *  Method: BWindow::Workspaces
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BWindow_Workspaces(BWindow *Window) 
{
   return Window->Workspaces();
}


/***********************************************************************
 *  Method: BWindow::SetWorkspaces
 *  Params: uint32
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BWindow_SetWorkspaces(BWindow *Window, uint32 index)
{
   Window->SetWorkspaces(index);
}


/***********************************************************************
 *  Method: BWindow::LastMouseMovedView
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BWindow_LastMouseMovedView(BWindow *Window) 
{
   return Window->LastMouseMovedView();
}


/***********************************************************************
 *  Method: BWindow::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BWindow_ResolveSpecifier(BWindow *Window, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return Window->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BWindow::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_GetSupportedSuites(BWindow *Window, BMessage *data)
{
   return Window->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BWindow::AddToSubset
 *  Params: BWindow *window
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_AddToSubset(BWindow *Window, BWindow *window)
{
   return Window->AddToSubset(window);
}


/***********************************************************************
 *  Method: BWindow::RemoveFromSubset
 *  Params: BWindow *window
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_RemoveFromSubset(BWindow *Window, BWindow *window)
{
   return Window->RemoveFromSubset(window);
}


/***********************************************************************
 *  Method: BWindow::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_Perform(BWindow *Window, perform_code d, void *arg)
{
   return Window->Perform(d, arg);
}


/***********************************************************************
 *  Method: BWindow::SetType
 *  Params: window_type type
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_SetType(BWindow *Window, window_type type)
{
   return Window->SetType(type);
}


/***********************************************************************
 *  Method: BWindow::Type
 *  Params: 
 * Returns: window_type
 * Effects: 
 ***********************************************************************/
window_type
BWindow_Type(BWindow *Window) 
{
   return Window->Type();
}


/***********************************************************************
 *  Method: BWindow::SetLook
 *  Params: window_look look
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_SetLook(BWindow *Window, window_look look)
{
   return Window->SetLook(look);
}


/***********************************************************************
 *  Method: BWindow::Look
 *  Params: 
 * Returns: window_look
 * Effects: 
 ***********************************************************************/
window_look
BWindow_Look(BWindow *Window) 
{
   return Window->Look();
}


/***********************************************************************
 *  Method: BWindow::SetFeel
 *  Params: window_feel feel
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_SetFeel(BWindow *Window, window_feel feel)
{
   return Window->SetFeel(feel);
}


/***********************************************************************
 *  Method: BWindow::Feel
 *  Params: 
 * Returns: window_feel
 * Effects: 
 ***********************************************************************/
window_feel
BWindow_Feel(BWindow *Window) 
{
   return Window->Feel();
}


/***********************************************************************
 *  Method: BWindow::SetFlags
 *  Params: uint32
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_SetFlags(BWindow *Window, uint32 Flags)
{
   return Window->SetFlags(Flags);
}


/***********************************************************************
 *  Method: BWindow::Flags
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BWindow_Flags(BWindow *Window) 
{
   return Window->Flags();
}


/***********************************************************************
 *  Method: BWindow::IsModal
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_IsModal(BWindow *Window) 
{
   return Window->IsModal();
}


/***********************************************************************
 *  Method: BWindow::IsFloating
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_IsFloating(BWindow *Window) 
{
   return Window->IsFloating();
}


/***********************************************************************
 *  Method: BWindow::SetWindowAlignment
 *  Params: window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_SetWindowAlignment(BWindow *Window, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset)
{
   return Window->SetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
}


/***********************************************************************
 *  Method: BWindow::GetWindowAlignment
 *  Params: window_alignment *mode, int32 *h, int32 *hOffset, int32 *width, int32 *widthOffset, int32 *v, int32 *vOffset, int32 *height, int32 *heightOffset
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BWindow_GetWindowAlignment(BWindow *Window, window_alignment *mode, int32 *h, int32 *hOffset, int32 *width, int32 *widthOffset, int32 *v, int32 *vOffset, int32 *height, int32 *heightOffset) 
{
   return Window->GetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
}


/***********************************************************************
 *  Method: BWindow::QuitRequested
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BWindow_QuitRequested(BWindow *Window)
{
   return Window->QuitRequested();
}


/***********************************************************************
 *  Method: BWindow::Run
 *  Params: 
 * Returns: thread_id
 * Effects: 
 ***********************************************************************/
thread_id
BWindow_Run(BWindow *Window)
{
   return Window->Run();
}


/***********************************************************************
 *  Method: BWindow::_ReservedWindow1
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow1(BWindow *Window)
{
   Window->_ReservedWindow1();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow2
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow2(BWindow *Window)
{
   Window->_ReservedWindow2();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow3
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow3(BWindow *Window)
{
   Window->_ReservedWindow3();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow4
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow4(BWindow *Window)
{
   Window->_ReservedWindow4();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow5
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow5(BWindow *Window)
{
   Window->_ReservedWindow5();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow6
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow6(BWindow *Window)
{
   Window->_ReservedWindow6();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow7
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow7(BWindow *Window)
{
   Window->_ReservedWindow7();
}
*/

/***********************************************************************
 *  Method: BWindow::_ReservedWindow8
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow__ReservedWindow8(BWindow *Window)
{
   Window->_ReservedWindow8();
}
*/

/***********************************************************************
 *  Method: BWindow::BWindow
 *  Params: 
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BWindow_Create(TPasObject PasObject)
{
	return new BPWindow(PasObject);
}
*/

/***********************************************************************
 *  Method: BWindow::BWindow
 *  Params: BWindow &
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BWindow_Create_1
(TPasObject PasObject, BWindow &)
{
	return new BPWindow(PasObject, );
}
*/

/***********************************************************************
 *  Method: BWindow::operator=
 *  Params: BWindow &
 * Returns: BWindow &
 * Effects: 
 ***********************************************************************/
/*BWindow &
BWindow_operator=(BWindow *Window, BWindow &)
{
   return Window->operator=();
}
*/

/***********************************************************************
 *  Method: BWindow::BWindow
 *  Params: BRect frame, color_space depth, uint32 bitmapFlags, int32 rowBytes
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BWindow_Create(TPasObject PasObject, BRect frame, color_space depth, uint32 bitmapFlags, int32 rowBytes)
{
	return new BPWindow(PasObject, frame, depth, bitmapFlags, rowBytes);
}
*/

/***********************************************************************
 *  Method: BWindow::InitData
 *  Params: BRect frame, const char *title, window_look look, window_feel feel, uint32 flags, uint32 workspace
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_InitData(BWindow *Window, BRect frame, const char *title, window_look look, window_feel feel, uint32 flags, uint32 workspace)
{
   Window->InitData(frame, title, look, feel, flags, workspace);
}
*/

/***********************************************************************
 *  Method: BWindow::ArchiveChildren
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BWindow_ArchiveChildren(BWindow *Window, BMessage *data, bool deep) 
{
   return Window->ArchiveChildren(data, deep);
}
*/

/***********************************************************************
 *  Method: BWindow::UnarchiveChildren
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BWindow_UnarchiveChildren(BWindow *Window, BMessage *data)
{
   return Window->UnarchiveChildren(data);
}
*/

/***********************************************************************
 *  Method: BWindow::BitmapClose
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_BitmapClose(BWindow *Window)
{
   Window->BitmapClose();
}
*/

/***********************************************************************
 *  Method: BWindow::task_looper
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_task_looper(BWindow *Window)
{
   Window->task_looper();
}
*/

/***********************************************************************
 *  Method: BWindow::start_drag
 *  Params: BMessage *msg, int32 token, BPoint offset, BRect track_rect, BHandler *reply_to
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_start_drag(BWindow *Window, BMessage *msg, int32 token, BPoint offset, BRect track_rect, BHandler *reply_to)
{
   Window->start_drag(msg, token, offset, track_rect, reply_to);
}
*/

/***********************************************************************
 *  Method: BWindow::start_drag
 *  Params: BMessage *msg, int32 token, BPoint offset, int32 bitmap_token, drawing_mode dragMode, BHandler *reply_to
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_start_drag_1
(BWindow *Window, BMessage *msg, int32 token, BPoint offset, int32 bitmap_token, drawing_mode dragMode, BHandler *reply_to)
{
   Window->start_drag(msg, token, offset, bitmap_token, dragMode, reply_to);
}
*/

/***********************************************************************
 *  Method: BWindow::view_builder
 *  Params: BView *a_view
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_view_builder(BWindow *Window, BView *a_view)
{
   Window->view_builder(a_view);
}
*/

/***********************************************************************
 *  Method: BWindow::attach_builder
 *  Params: BView *a_view
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_attach_builder(BWindow *Window, BView *a_view)
{
   Window->attach_builder(a_view);
}
*/

/***********************************************************************
 *  Method: BWindow::detach_builder
 *  Params: BView *a_view
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_detach_builder(BWindow *Window, BView *a_view)
{
   Window->detach_builder(a_view);
}
*/

/***********************************************************************
 *  Method: BWindow::get_server_token
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
/*int32
BWindow_get_server_token(BWindow *Window) const
{
   return Window->get_server_token();
}
*/

/***********************************************************************
 *  Method: BWindow::extract_drop
 *  Params: BMessage *an_event, BHandler **target
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
/*BMessage *
BWindow_extract_drop(BWindow *Window, BMessage *an_event, BHandler **target)
{
   return Window->extract_drop(an_event, target);
}
*/

/***********************************************************************
 *  Method: BWindow::movesize
 *  Params: uint32 opcode, float h, float v
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_movesize(BWindow *Window, uint32 opcode, float h, float v)
{
   Window->movesize(opcode, h, v);
}
*/

/***********************************************************************
 *  Method: BWindow::ReadMessageFromPort
 *  Params: bigtime_t tout
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
/*BMessage *
BWindow_ReadMessageFromPort(BWindow *Window, bigtime_t tout)
{
   return Window->ReadMessageFromPort(tout);
}
*/

/***********************************************************************
 *  Method: BWindow::MessagesWaiting
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
/*int32
BWindow_MessagesWaiting(BWindow *Window)
{
   return Window->MessagesWaiting();
}
*/

/***********************************************************************
 *  Method: BWindow::handle_activate
 *  Params: BMessage *an_event
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_handle_activate(BWindow *Window, BMessage *an_event)
{
   Window->handle_activate(an_event);
}
*/

/***********************************************************************
 *  Method: BWindow::do_view_frame
 *  Params: BMessage *an_event
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_view_frame(BWindow *Window, BMessage *an_event)
{
   Window->do_view_frame(an_event);
}
*/

/***********************************************************************
 *  Method: BWindow::do_value_change
 *  Params: BMessage *an_event, BHandler *handler
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_value_change(BWindow *Window, BMessage *an_event, BHandler *handler)
{
   Window->do_value_change(an_event, handler);
}
*/

/***********************************************************************
 *  Method: BWindow::do_mouse_down
 *  Params: BMessage *an_event, BView *target
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_mouse_down(BWindow *Window, BMessage *an_event, BView *target)
{
   Window->do_mouse_down(an_event, target);
}
*/

/***********************************************************************
 *  Method: BWindow::do_mouse_moved
 *  Params: BMessage *an_event, BView *target
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_mouse_moved(BWindow *Window, BMessage *an_event, BView *target)
{
   Window->do_mouse_moved(an_event, target);
}
*/

/***********************************************************************
 *  Method: BWindow::do_key_down
 *  Params: BMessage *an_event, BHandler *handler
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_key_down(BWindow *Window, BMessage *an_event, BHandler *handler)
{
   Window->do_key_down(an_event, handler);
}
*/

/***********************************************************************
 *  Method: BWindow::do_key_up
 *  Params: BMessage *an_event, BHandler *handler
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_key_up(BWindow *Window, BMessage *an_event, BHandler *handler)
{
   Window->do_key_up(an_event, handler);
}
*/

/***********************************************************************
 *  Method: BWindow::do_menu_event
 *  Params: BMessage *an_event
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_menu_event(BWindow *Window, BMessage *an_event)
{
   Window->do_menu_event(an_event);
}
*/

/***********************************************************************
 *  Method: BWindow::do_draw_views
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_do_draw_views(BWindow *Window)
{
   Window->do_draw_views();
}
*/

/***********************************************************************
 *  Method: BWindow::ConvertToMessage
 *  Params: void *raw, int32 code
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
/*BMessage *
BWindow_ConvertToMessage(BWindow *Window, void *raw, int32 code)
{
   return Window->ConvertToMessage(raw, code);
}
*/

/***********************************************************************
 *  Method: BWindow::allocShortcut
 *  Params: uint32 key, uint32 modifiers
 * Returns: _cmd_key_ *
 * Effects: 
 ***********************************************************************/
/*_cmd_key_ *
BWindow_allocShortcut(BWindow *Window, uint32 key, uint32 modifiers)
{
   return Window->allocShortcut(key, modifiers);
}
*/

/***********************************************************************
 *  Method: BWindow::FindShortcut
 *  Params: uint32 key, uint32 modifiers
 * Returns: _cmd_key_ *
 * Effects: 
 ***********************************************************************/
/*_cmd_key_ *
BWindow_FindShortcut(BWindow *Window, uint32 key, uint32 modifiers)
{
   return Window->FindShortcut(key, modifiers);
}
*/

/***********************************************************************
 *  Method: BWindow::AddShortcut
 *  Params: uint32 key, uint32 modifiers, BMenuItem *item
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_AddShortcut(BWindow *Window, uint32 key, uint32 modifiers, BMenuItem *item)
{
   Window->AddShortcut(key, modifiers, item);
}
*/

/***********************************************************************
 *  Method: BWindow::post_message
 *  Params: BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_post_message(BWindow *Window, BMessage *message)
{
   Window->post_message(message);
}
*/

/***********************************************************************
 *  Method: BWindow::SetLocalTitle
 *  Params: const char *new_title
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_SetLocalTitle(BWindow *Window, const char *new_title)
{
   Window->SetLocalTitle(new_title);
}
*/

/***********************************************************************
 *  Method: BWindow::enable_pulsing
 *  Params: bool enable
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_enable_pulsing(BWindow *Window, bool enable)
{
   Window->enable_pulsing(enable);
}
*/

/***********************************************************************
 *  Method: BWindow::determine_target
 *  Params: BMessage *msg, BHandler *target, bool pref
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
/*BHandler *
BWindow_determine_target(BWindow *Window, BMessage *msg, BHandler *target, bool pref)
{
   return Window->determine_target(msg, target, pref);
}
*/

/***********************************************************************
 *  Method: BWindow::kb_navigate
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_kb_navigate(BWindow *Window)
{
   Window->kb_navigate();
}
*/

/***********************************************************************
 *  Method: BWindow::navigate_to_next
 *  Params: int32 direction, bool group
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_navigate_to_next(BWindow *Window, int32 direction, bool group)
{
   Window->navigate_to_next(direction, group);
}
*/

/***********************************************************************
 *  Method: BWindow::set_focus
 *  Params: BView *focus, bool notify_input_server
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_set_focus(BWindow *Window, BView *focus, bool notify_input_server)
{
   Window->set_focus(focus, notify_input_server);
}
*/

/***********************************************************************
 *  Method: BWindow::InUpdate
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BWindow_InUpdate(BWindow *Window)
{
   return Window->InUpdate();
}
*/

/***********************************************************************
 *  Method: BWindow::DequeueAll
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_DequeueAll(BWindow *Window)
{
   Window->DequeueAll();
}
*/

/***********************************************************************
 *  Method: BWindow::find_token_and_handler
 *  Params: BMessage *msg, int32 *token, BHandler **handler
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BWindow_find_token_and_handler(BWindow *Window, BMessage *msg, int32 *token, BHandler **handler)
{
   return Window->find_token_and_handler(msg, token, handler);
}
*/

/***********************************************************************
 *  Method: BWindow::compose_type
 *  Params: window_look look, window_feel feel
 * Returns: window_type
 * Effects: 
 ***********************************************************************/
/*window_type
BWindow_compose_type(BWindow *Window, window_look look, window_feel feel) const
{
   return Window->compose_type(look, feel);
}
*/

/***********************************************************************
 *  Method: BWindow::decompose_type
 *  Params: window_type type, window_look *look, window_feel *feel
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_decompose_type(BWindow *Window, window_type type, window_look *look, window_feel *feel) const
{
   Window->decompose_type(type, look, feel);
}
*/

/***********************************************************************
 *  Method: BWindow::SetIsFilePanel
 *  Params: bool panel
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_SetIsFilePanel(BWindow *Window, bool panel)
{
   Window->SetIsFilePanel(panel);
}
*/

/***********************************************************************
 *  Method: BWindow::IsFilePanel
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BWindow_IsFilePanel(BWindow *Window) const
{
   return Window->IsFilePanel();
}
*/

/***********************************************************************
 *  Method: BWindow::AddFloater
 *  Params: BWindow *a_floating_window
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_AddFloater(BWindow *Window, BWindow *a_floating_window)
{
   Window->AddFloater(a_floating_window);
}
*/

/***********************************************************************
 *  Method: BWindow::RemoveFloater
 *  Params: BWindow *a_floating_window
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BWindow_RemoveFloater(BWindow *Window, BWindow *a_floating_window)
{
   Window->RemoveFloater(a_floating_window);
}
*/

/***********************************************************************
 *  Method: BWindow::WindowType
 *  Params: 
 * Returns: window_type
 * Effects: 
 ***********************************************************************/
/*window_type
BWindow_WindowType(BWindow *Window) const
{
   return Window->WindowType();
}
*/
//*********************************

#if defined(__cplusplus)
}
#endif

#endif /* _WINDOW_CPP_ */
