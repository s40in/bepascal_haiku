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

#ifndef _TABVIEW_CPP_
#define _TABVIEW_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: TabView.cpp
 *   DATE: Wed Feb 12 20:21:37 2003
 *  DESCR: 
 ***********************************************************************/
#include "TabView.h"
#include <view.h>
#include <beobj.h>

typedef void (*BTabView_AddTab_hook) (TPasObject PasObject, TCPlusObject  target, TCPlusObject  tab);
typedef void (*BTabView_Draw_hook) (TPasObject PasObject, TCPlusObject updateRect);
typedef void (*BTabView_DrawBox_hook) (TPasObject PasObject, TCPlusObject selfTabRect);
typedef BRect (*BTabView_DrawTabs_hook) (TPasObject PasObject);
typedef void (*BTabView_MakeFocus_hook) (TPasObject PasObject, bool focused);
typedef BTab * (*BTabView_RemoveTab_hook) (TPasObject PasObject, int32 tab_index);
typedef void (*BTabView_Select_hook) (TPasObject PasObject, int32 tab);
typedef void (*BTabView_SetFocusTab_hook) (TPasObject PasObject, int32 tab, bool focused);
typedef void (*BTabView_SetTabHeight_hook) (TPasObject PasObject, float height);
typedef void (*BTabView_SetTabWidth_hook) (TPasObject PasObject, button_width width);
typedef BTab * (*BTabView_TabAt_hook) (TPasObject PasObject, int32 tab_index);
typedef BRect (*BTabView_TabFrame_hook) (TPasObject PasObject, int32 tab_index);



#if defined(__cplusplus)
extern "C" {
#endif

BTabView_AddTab_hook TabView_AddTab_hook;
BTabView_Draw_hook TabView_Draw_hook;
BTabView_DrawBox_hook TabView_DrawBox_hook;
BTabView_DrawTabs_hook TabView_DrawTabs_hook;
BTabView_MakeFocus_hook TabView_MakeFocus_hook;
BTabView_RemoveTab_hook TabView_RemoveTab_hook;
BTabView_Select_hook TabView_Select_hook;
BTabView_SetFocusTab_hook TabView_SetFocusTab_hook;
BTabView_SetTabHeight_hook TabView_SetTabHeight_hook;
BTabView_SetTabWidth_hook TabView_SetTabWidth_hook;
BTabView_TabAt_hook TabView_TabAt_hook;
BTabView_TabFrame_hook TabView_TabFrame_hook;


#if defined(__cplusplus)
}
#endif

class BPTab :public BTab, public BPasObject {
public:
						BPTab(TPasObject PasObject,BView* contents=NULL);
						BPTab(TPasObject PasObject,BMessage* data);
virtual void 			DrawLabel(BView* owner, BRect tabFrame);
virtual void 			DrawTab(BView* owner, BRect tabFrame, tab_position,bool full=true);
};

BPTab::BPTab(TPasObject PasObject,BView* contents)
	: BTab(contents),
	BPasObject(PasObject)
{
}


BPTab::BPTab(TPasObject PasObject,BMessage* data)
	: BTab(data),
	BPasObject(PasObject)
{
}

void BPTab::DrawLabel(BView* owner, BRect tabFrame)
{
	BTab::DrawLabel(owner, tabFrame);
}

void BPTab::DrawTab(BView* owner, BRect tabFrame, tab_position value, bool full)
{
	BTab::DrawTab(owner, tabFrame, value, full);
}



class BPTabView : public BTabView, public BPView {
public:
						BPTabView(TPasObject PasObject,BRect frame, const char *name,
							button_width width=B_WIDTH_AS_USUAL,
							uint32 resizingMode = B_FOLLOW_ALL,
							uint32 flags = B_FULL_UPDATE_ON_RESIZE |
								B_WILL_DRAW | B_NAVIGABLE_JUMP |
								B_FRAME_EVENTS | B_NAVIGABLE);
						
						BPTabView(TPasObject PasObject,BMessage*);							
static	BArchivable*	Instantiate(BMessage*);
//virtual	status_t		Archive(BMessage*, bool deep=true) const;
//virtual status_t		Perform(perform_code d, void *arg);

virtual void 			WindowActivated(bool state);
virtual void 			AttachedToWindow();		
virtual	void			AllAttached();
virtual	void			AllDetached();
virtual	void			DetachedFromWindow();

virtual void 			MessageReceived(BMessage *msg);
virtual void			FrameResized(float w,float h);
virtual void 			KeyDown(const char * bytes, int32 n);
virtual void			MouseDown(BPoint point);
virtual void			MouseUp(BPoint point);
virtual void 			MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
virtual	void			Pulse();

/*		int32			FocusTab() const;
		
		virtual void BPTabView::AddTab(BView *target, BTab *tab);
		virtual void Draw(BRect updateRect);
		virtual void DrawBox(BRect selfTabRect);
		virtual BRect DrawTabs(void);
		virtual void MakeFocus(bool focused);
		virtual BTab * RemoveTab(int32 tab_index);
		virtual void Select(int32 tab);
		virtual void SetFocusTab(int32 tab, bool focused);
		virtual void SetTabHeight(float height);
		virtual void SetTabWidth(button_width width);
		virtual BTab * TabAt(int32 tab_index);
		virtual BRect TabFrame(int32 tab_index);
*/			

/*----- Private or reserved -----------------------------------------*/
private:
};

BPTabView::BPTabView(TPasObject PasObject,BRect frame, const char *name,
							button_width width,
							uint32 resizingMode,
							uint32 flags)
					:BTabView(frame, name,
							 width,
							resizingMode,
							flags),
          BPView(PasObject, frame, name, resizingMode, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{
}							
								
						
BPTabView::BPTabView(TPasObject PasObject, BMessage *data)
          :BTabView(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}
/*
void BPTabView::AddTab(BView *target, BTab *tab)
{
	BTabView::AddTab(target,tab);
	//TabView_AddTab_hook(GetPasObject(), target, tab);
}

void BPTabView::Draw(BRect updateRect)
{
	BTabView::Draw(updateRect);
	TabView_Draw_hook(GetPasObject(), &updateRect);
}

void BPTabView::DrawBox(BRect selfTabRect)
{
	BTabView::DrawBox(selfTabRect);
	//TabView_DrawBox_hook(GetPasObject(), &selfTabRect);
}

BRect BPTabView::DrawTabs(void)
{
	BTabView::DrawTabs();
	return TabView_DrawTabs_hook(GetPasObject());
}

void BPTabView::MakeFocus(bool focused)
{
	BTabView::MakeFocus(focused);
	TabView_MakeFocus_hook(GetPasObject(), focused);
}

BTab * BPTabView::RemoveTab(int32 tab_index)
{
	TabView_RemoveTab_hook(GetPasObject(), tab_index);
	return BTabView::RemoveTab(tab_index);
}

void BPTabView::Select(int32 tab)
{
	TabView_Select_hook(GetPasObject(), tab);
	BTabView::Select(tab);
}

void BPTabView::SetFocusTab(int32 tab, bool focused)
{
	TabView_SetFocusTab_hook(GetPasObject(), tab, focused);
}

void BPTabView::SetTabHeight(float height)
{
	TabView_SetTabHeight_hook(GetPasObject(), height);
}

void BPTabView::SetTabWidth(button_width width)
{
	TabView_SetTabWidth_hook(GetPasObject(), width);
}

BTab * BPTabView::TabAt(int32 tab_index)
{
	return TabView_TabAt_hook(GetPasObject(), tab_index);
}

BRect BPTabView::TabFrame(int32 tab_index)
{
	return TabView_TabFrame_hook(GetPasObject(), tab_index);
}
*/




void BPTabView::Pulse(void)
{
	Pulse_hookCall();

	BTabView::Pulse();
}



void BPTabView::MessageReceived(BMessage *message)
{
//	MessageReceived_hookCall(message);
	BTabView::MessageReceived(message);
}


void BPTabView::AttachedToWindow(void)
{
	BTabView::AttachedToWindow();
//	AttachedToWindow_hookCall();
}



void BPTabView::AllAttached(void)
{
  	//AllAttached_hookCall();
	BTabView::AllAttached();
}

void BPTabView::AllDetached(void)
{
	//AllDetached_hookCall();
	BTabView::AllDetached();
}


void BPTabView::WindowActivated(bool active)
{
	BTabView::WindowActivated(active);
}

void BPTabView::KeyDown(const char *bytes, int32 numBytes)
{
	BTabView::KeyDown(bytes, numBytes);
}


void BPTabView::FrameResized(float width, float height)
{
//    FrameResized_hookCall(width, height);
	BTabView::FrameResized(width, height);
}

void BPTabView::DetachedFromWindow(void)
{
	BTabView::DetachedFromWindow();
}



void BPTabView::MouseDown(BPoint point)
{
	BTabView::MouseDown(point);
}

void BPTabView::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BTabView::MouseMoved(point, transit, message);
}

void BPTabView::MouseUp(BPoint point)
{
	BTabView::MouseUp(point);
}




#if defined(__cplusplus)
extern "C" {
#endif




/***********************************************************************
 *  Method: BTab::BTab
 *  Params: BView *contents
 * Effects: 
 ***********************************************************************/
TCPlusObject BTab_Create(TPasObject PasObject, BView *contents)
{
	return new BPTab(PasObject, contents);
}


/***********************************************************************
 *  Method: BTab::~BTab
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BTab_Free(BTab *Tab)
{
   delete Tab;
}


/***********************************************************************
 *  Method: BTab::BTab
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BTab_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPTab(PasObject, data);
}


/***********************************************************************
 *  Method: BTab::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BTab_Instantiate(BTab *Tab, BMessage *data)
{
   return Tab->Instantiate(data);
}


/***********************************************************************
 *  Method: BTab::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTab_Archive(BTab *Tab, BMessage *data, bool deep) 
{
   return Tab->Archive(data, deep);
}


/***********************************************************************
 *  Method: BTab::Perform
 *  Params: uint32 d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTab_Perform(BTab *Tab, uint32 d, void *arg)
{
   return Tab->Perform(d, arg);
}


/***********************************************************************
 *  Method: BTab::Label
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BTab_Label(BTab *Tab) 
{
   return Tab->Label();
}


/***********************************************************************
 *  Method: BTab::SetLabel
 *  Params: const char *label
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_SetLabel(BTab *Tab, const char *label)
{
   Tab->SetLabel(label);
}


/***********************************************************************
 *  Method: BTab::IsSelected
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTab_IsSelected(BTab *Tab) 
{
   return Tab->IsSelected();
}


/***********************************************************************
 *  Method: BTab::Select
 *  Params: BView *owner
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_Select(BTab *Tab, BView *owner)
{
   Tab->Select(owner);
}


/***********************************************************************
 *  Method: BTab::Deselect
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_Deselect(BTab *Tab)
{
   Tab->Deselect();
}


/***********************************************************************
 *  Method: BTab::SetEnabled
 *  Params: bool on
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_SetEnabled(BTab *Tab, bool on)
{
   Tab->SetEnabled(on);
}


/***********************************************************************
 *  Method: BTab::IsEnabled
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTab_IsEnabled(BTab *Tab) 
{
   return Tab->IsEnabled();
}


/***********************************************************************
 *  Method: BTab::MakeFocus
 *  Params: bool infocus
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_MakeFocus(BTab *Tab, bool infocus)
{
   Tab->MakeFocus(infocus);
}


/***********************************************************************
 *  Method: BTab::IsFocus
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTab_IsFocus(BTab *Tab) 
{
   return Tab->IsFocus();
}


/***********************************************************************
 *  Method: BTab::SetView
 *  Params: BView *contents
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_SetView(BTab *Tab, BView *contents)
{
   Tab->SetView(contents);
}


/***********************************************************************
 *  Method: BTab::View
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BTab_View(BTab *Tab) 
{
   return Tab->View();
}


/***********************************************************************
 *  Method: BTab::DrawFocusMark
 *  Params: BView *owner, BRect tabFrame
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_DrawFocusMark(BTab *Tab, BView *owner, BRect tabFrame)
{
   Tab->DrawFocusMark(owner, tabFrame);
}


/***********************************************************************
 *  Method: BTab::DrawLabel
 *  Params: BView *owner, BRect tabFrame
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_DrawLabel(BTab *Tab, BView *owner, BRect tabFrame)
{
   Tab->DrawLabel(owner, tabFrame);
}


/***********************************************************************
 *  Method: BTab::DrawTab
 *  Params: BView *owner, BRect tabFrame, tab_position, bool full
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTab_DrawTab(BTab *Tab, BView *owner, BRect tabFrame, int tab_position, bool full)
{
   //Tab->DrawTab(owner, tabFrame,tab_position , full);
}



/***********************************************************************
 *  Method: BTabView::~BTabView
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BTabView_Free(BTabView *TabView)
{
   delete TabView;
}


/***********************************************************************
 *  Method: BTabView::BTabView
 *  Params: BMessage *
 * Effects: 
 ***********************************************************************/
TCPlusObject BTabView_Create_1(TPasObject PasObject, BMessage *msg)
{
	return new BPTabView(PasObject, msg);
}

TCPlusObject BTabView_Create(TPasObject PasObject,BRect frame, const char *name,
							button_width width=B_WIDTH_AS_USUAL,
							uint32 resizingMode = B_FOLLOW_ALL,
							uint32 flags = B_FULL_UPDATE_ON_RESIZE |
								B_WILL_DRAW | B_NAVIGABLE_JUMP |
								B_FRAME_EVENTS | B_NAVIGABLE)
{
	return new BPTabView( PasObject, frame, name,
							 width,
							 resizingMode,
							 flags );
}



/***********************************************************************
 *  Method: BTabView::Instantiate
 *  Params: BMessage *
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BTabView_Instantiate(BTabView *TabView, BMessage *msg)
{
   return TabView->Instantiate(msg);
}


/***********************************************************************
 *  Method: BTabView::Archive
 *  Params: BMessage *, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTabView_Archive(BTabView *TabView, BMessage *msg, bool deep) 
{
   return TabView->Archive(msg, deep);
}


/***********************************************************************
 *  Method: BTabView::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTabView_Perform(BTabView *TabView, perform_code d, void *arg)
{
   return TabView->Perform(d, arg);
}


/***********************************************************************
 *  Method: BTabView::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_WindowActivated(BTabView *TabView, bool state)
{
   TabView->WindowActivated(state);
}


/***********************************************************************
 *  Method: BTabView::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_AttachedToWindow(BTabView *TabView)
{
   TabView->AttachedToWindow();
}


/***********************************************************************
 *  Method: BTabView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_AllAttached(BTabView *TabView)
{
   TabView->AllAttached();
}


/***********************************************************************
 *  Method: BTabView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_AllDetached(BTabView *TabView)
{
   TabView->AllDetached();
}


/***********************************************************************
 *  Method: BTabView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_DetachedFromWindow(BTabView *TabView)
{
   TabView->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BTabView::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_MessageReceived(BTabView *TabView, BMessage *msg)
{
   TabView->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BTabView::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_FrameMoved(BTabView *TabView, BPoint new_position)
{
   TabView->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BTabView::FrameResized
 *  Params: float w, float h
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_FrameResized(BTabView *TabView, float w, float h)
{
   TabView->FrameResized(w, h);
}


/***********************************************************************
 *  Method: BTabView::KeyDown
 *  Params: const char *bytes, int32 n
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_KeyDown(BTabView *TabView, const char *bytes, int32 n)
{
   TabView->KeyDown(bytes, n);
}


/***********************************************************************
 *  Method: BTabView::MouseDown
 *  Params: BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_MouseDown(BTabView *TabView, BPoint point)
{
   TabView->MouseDown(point);
}


/***********************************************************************
 *  Method: BTabView::MouseUp
 *  Params: BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_MouseUp(BTabView *TabView, BPoint point)
{
   TabView->MouseUp(point);
}


/***********************************************************************
 *  Method: BTabView::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_MouseMoved(BTabView *TabView, BPoint pt, uint32 code, const BMessage *msg)
{
   TabView->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BTabView::Pulse
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_Pulse(BTabView *TabView)
{
   TabView->Pulse();
}


/***********************************************************************
 *  Method: BTabView::Select
 *  Params: int32 tabIndex
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_Select(BTabView *TabView, int32 tabIndex)
{
   TabView->Select(tabIndex);
}


/***********************************************************************
 *  Method: BTabView::Selection
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTabView_Selection_1
(BTabView *TabView) 
{
   return TabView->Selection();
}


/***********************************************************************
 *  Method: BTabView::MakeFocus
 *  Params: bool focusState
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_MakeFocus(BTabView *TabView, bool focusState)
{
   TabView->MakeFocus(focusState);
}


/***********************************************************************
 *  Method: BTabView::SetFocusTab
 *  Params: int32 tabIndex, bool focusState
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_SetFocusTab(BTabView *TabView, int32 tabIndex, bool focusState)
{
   TabView->SetFocusTab(tabIndex, focusState);
}


/***********************************************************************
 *  Method: BTabView::FocusTab
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTabView_FocusTab(BTabView *TabView) 
{
   return TabView->FocusTab();
}


/***********************************************************************
 *  Method: BTabView::Draw
 *  Params: BRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_Draw(BTabView *TabView, BRect point)
{
   TabView->Draw(point);
}


/***********************************************************************
 *  Method: BTabView::DrawTabs
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BTabView_DrawTabs_1
(BTabView *TabView)
{
   return TabView->DrawTabs();
}


/***********************************************************************
 *  Method: BTabView::DrawBox
 *  Params: BRect selectedTabFrame
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_DrawBox(BTabView *TabView, BRect selectedTabFrame)
{
   TabView->DrawBox(selectedTabFrame);
}


/***********************************************************************
 *  Method: BTabView::TabFrame
 *  Params: int32 tabIndex
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BTabView_TabFrame(BTabView *TabView, int32 tabIndex) 
{
   return TabView->TabFrame(tabIndex);
}


/***********************************************************************
 *  Method: BTabView::SetFlags
 *  Params: uint32 flags
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_SetFlags(BTabView *TabView, uint32 flags)
{
   TabView->SetFlags(flags);
}


/***********************************************************************
 *  Method: BTabView::SetResizingMode
 *  Params: uint32 mode
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_SetResizingMode(BTabView *TabView, uint32 mode)
{
   TabView->SetResizingMode(mode);
}


/***********************************************************************
 *  Method: BTabView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_GetPreferredSize(BTabView *TabView, float *width, float *height)
{
   TabView->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BTabView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_ResizeToPreferred(BTabView *TabView)
{
   TabView->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BTabView::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BTabView_ResolveSpecifier(BTabView *TabView, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return TabView->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BTabView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTabView_GetSupportedSuites(BTabView *TabView, BMessage *data)
{
   return TabView->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BTabView::AddTab
 *  Params: BView *tabContents, BTab *tab
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_AddTab(BTabView *TabView, BView *tabContents, BTab *tab)
{
   TabView->AddTab(tabContents, tab);
}


/***********************************************************************
 *  Method: BTabView::RemoveTab
 *  Params: int32 tabIndex
 * Returns: BTab *
 * Effects: 
 ***********************************************************************/
BTab *
BTabView_RemoveTab(BTabView *TabView, int32 tabIndex)
{
   return TabView->RemoveTab(tabIndex);
}


/***********************************************************************
 *  Method: BTabView::RemoveTab
 *  Params: int32 tabIndex
 * Returns: BTab *
 * Effects: 
 ***********************************************************************/
BTab *
BTabView_RemoveTab_1
(BTabView *TabView, int32 tabIndex) 
{
   return TabView->RemoveTab(tabIndex);
}


/***********************************************************************
 *  Method: BTabView::TabAt
 *  Params: int32 tabIndex
 * Returns: BTab *
 * Effects: 
 ***********************************************************************/
BTab *
BTabView_TabAt(BTabView *TabView, int32 tabIndex) 
{
   return TabView->TabAt(tabIndex);
}


/***********************************************************************
 *  Method: BTabView::SetTabWidth
 *  Params: button_width s
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_SetTabWidth(BTabView *TabView, button_width s)
{
   TabView->SetTabWidth(s);
}


/***********************************************************************
 *  Method: BTabView::TabWidth
 *  Params: 
 * Returns: button_width
 * Effects: 
 ***********************************************************************/
button_width
BTabView_TabWidth(BTabView *TabView) 
{
   return TabView->TabWidth();
}


/***********************************************************************
 *  Method: BTabView::SetTabHeight
 *  Params: float height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTabView_SetTabHeight(BTabView *TabView, float height)
{
   TabView->SetTabHeight(height);
}


/***********************************************************************
 *  Method: BTabView::TabHeight
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BTabView_TabHeight(BTabView *TabView) 
{
   return TabView->TabHeight();
}


/***********************************************************************
 *  Method: BTabView::ContainerView
 *  Params: 
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BTabView_ContainerView(BTabView *TabView) 
{
   return TabView->ContainerView();
}


/***********************************************************************
 *  Method: BTabView::CountTabs
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTabView_CountTabs(BTabView *TabView) 
{
   return TabView->CountTabs();
}


/***********************************************************************
 *  Method: BTabView::ViewForTab
 *  Params: int32 tabIndex
 * Returns: BView *
 * Effects: 
 ***********************************************************************/
BView *
BTabView_ViewForTab(BTabView *TabView, int32 tabIndex) 
{
   return TabView->ViewForTab(tabIndex);
}




#if defined(__cplusplus)
}
#endif

#endif /* _TABVIEW_CPP_ */

