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

#ifndef _LISTVIEW_CPP_
#define _LISTVIEW_CPP_

#include "ListView.h"
#include "view.h"
#include <beobj.h>
#include <listview.h>


typedef void (*BListItem_SelectionChanged_hook) (TPasObject PasObject);
typedef void (*BListString_InitiateDrag_hook) (TPasObject PasObject, TCPlusObject pt, int32 itemIndex, bool initialySelected );


#if defined(__cplusplus)
extern "C" {
#endif

BListItem_SelectionChanged_hook ListItem_SelectionChanged_hook;
BListString_InitiateDrag_hook ListString_InitiateDrag_hook;
#if defined(__cplusplus)
}
#endif


BPListView::BPListView(TPasObject PasObject,BMessage *data)
					:BListView(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}

BPListView::BPListView(TPasObject PasObject,BRect frame,
								const char *name,
								list_view_type type,
								uint32 resizeMask,
								uint32 flags)
					:BListView(frame,name,type,resizeMask,flags),
          BPView(PasObject, BRect(0,0,0,0), name, 0, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{
}


void BPListView::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BListView::MessageReceived(message);
}

void BPListView::Draw(BRect updateRect)
{
	BListView::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPListView::AttachedToWindow(void)
{
	//BTextView::AttachedToWindow();
	AttachedToWindow_hookCall();
}



void BPListView::AllAttached(void)
{
  	//AllAttached_hookCall();
	BListView::AllAttached();
}

void BPListView::AllDetached(void)
{
	//AllDetached_hookCall();
	BListView::AllDetached();
}


void BPListView::WindowActivated(bool active)
{
	BListView::WindowActivated(active);
}

void BPListView::KeyDown(const char *bytes, int32 numBytes)
{
	BListView::KeyDown(bytes, numBytes);
}


void BPListView::FrameResized(float width, float height)
{
    FrameResized_hookCall(width, height);
	BListView::FrameResized(width, height);
}

void BPListView::DetachedFromWindow(void)
{
	BListView::DetachedFromWindow();
}



void BPListView::MouseDown(BPoint point)
{
	BListView::MouseDown(point);
}

void BPListView::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BListView::MouseMoved(point, transit, message);
}

void BPListView::MouseUp(BPoint point)
{
	BListView::MouseUp(point);
}

bool BPListView::InitiateDrag(BPoint pt, int32 itemIndex,bool initialySelected)
{
    ListString_InitiateDrag_hook(GetPasObject(), &pt, itemIndex, initialySelected);
}

void BPListView::SelectionChanged()
{
	BListView::SelectionChanged();
 	ListItem_SelectionChanged_hook(GetPasObject());
}




#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BListView_Create(TPasObject PasObject,BRect frame,
								const char *name,
								list_view_type type = B_SINGLE_SELECTION_LIST,
								uint32 resizeMask = B_FOLLOW_LEFT |
													B_FOLLOW_TOP,
								uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS |
													B_NAVIGABLE)
{
	return new BPListView(PasObject,frame,name,type,resizeMask,flags);
}													

/***********************************************************************
 *  Method: BListView::BListView
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BListView_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPListView(PasObject, data);
}


/***********************************************************************
 *  Method: BListView::~BListView
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BListView_Free(BListView *ListView)
{
   delete ListView;
}


/***********************************************************************
 *  Method: BListView::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BListView_Instantiate(BListView *ListView, BMessage *data)
{
   return ListView->Instantiate(data);
}


/***********************************************************************
 *  Method: BListView::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BListView_Archive(BListView *ListView, BMessage *data, bool deep) 
{
   return ListView->Archive(data, deep);
}


/***********************************************************************
 *  Method: BListView::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_Draw(BListView *ListView, BRect updateRect)
{
   ListView->Draw(updateRect);
}


/***********************************************************************
 *  Method: BListView::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_MessageReceived(BListView *ListView, BMessage *msg)
{
   ListView->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BListView::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_MouseDown(BListView *ListView, BPoint where)
{
   ListView->MouseDown(where);
}


/***********************************************************************
 *  Method: BListView::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_KeyDown(BListView *ListView, const char *bytes, int32 numBytes)
{
   ListView->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BListView::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_MakeFocus(BListView *ListView, bool state)
{
   ListView->MakeFocus(state);
}


/***********************************************************************
 *  Method: BListView::FrameResized
 *  Params: float newWidth, float newHeight
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_FrameResized(BListView *ListView, float newWidth, float newHeight)
{
   ListView->FrameResized(newWidth, newHeight);
}


/***********************************************************************
 *  Method: BListView::TargetedByScrollView
 *  Params: BScrollView *scroller
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_TargetedByScrollView(BListView *ListView, BScrollView *scroller)
{
   ListView->TargetedByScrollView(scroller);
}


/***********************************************************************
 *  Method: BListView::ScrollTo
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_ScrollTo(BListView *ListView, BPoint where)
{
   ListView->ScrollTo(where);
}


/***********************************************************************
 *  Method: BListView::AddItem
 *  Params: BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_AddItem(BListView *ListView, BListItem *item)
{
   return ListView->AddItem(item);
}


/***********************************************************************
 *  Method: BListView::AddItem
 *  Params: BListItem *item, int32 atIndex
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_AddItem_1
(BListView *ListView, BListItem *item, int32 atIndex)
{
   return ListView->AddItem(item, atIndex);
}


/***********************************************************************
 *  Method: BListView::AddList
 *  Params: BList *newItems
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_AddList(BListView *ListView, BList *newItems)
{
   return ListView->AddList(newItems);
}


/***********************************************************************
 *  Method: BListView::AddList
 *  Params: BList *newItems, int32 atIndex
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_AddList_1
(BListView *ListView, BList *newItems, int32 atIndex)
{
   return ListView->AddList(newItems, atIndex);
}


/***********************************************************************
 *  Method: BListView::RemoveItem
 *  Params: BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_RemoveItem(BListView *ListView, BListItem *item)
{
   return ListView->RemoveItem(item);
}


/***********************************************************************
 *  Method: BListView::RemoveItem
 *  Params: int32 index
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BListView_RemoveItem_1
(BListView *ListView, int32 index)
{
   return ListView->RemoveItem(index);
}


/***********************************************************************
 *  Method: BListView::RemoveItems
 *  Params: int32 index, int32 count
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_RemoveItems_2
(BListView *ListView, int32 index, int32 count)
{
   return ListView->RemoveItems(index, count);
}


/***********************************************************************
 *  Method: BListView::SetSelectionMessage
 *  Params: BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_SetSelectionMessage(BListView *ListView, BMessage *message)
{
   ListView->SetSelectionMessage(message);
}


/***********************************************************************
 *  Method: BListView::SetInvocationMessage
 *  Params: BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_SetInvocationMessage(BListView *ListView, BMessage *message)
{
   ListView->SetInvocationMessage(message);
}


/***********************************************************************
 *  Method: BListView::SelectionMessage
 *  Params: 
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
BMessage *
BListView_SelectionMessage(BListView *ListView) 
{
   return ListView->SelectionMessage();
}


/***********************************************************************
 *  Method: BListView::SelectionCommand
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BListView_SelectionCommand(BListView *ListView) 
{
   return ListView->SelectionCommand();
}


/***********************************************************************
 *  Method: BListView::InvocationMessage
 *  Params: 
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
BMessage *
BListView_InvocationMessage(BListView *ListView) 
{
   return ListView->InvocationMessage();
}


/***********************************************************************
 *  Method: BListView::InvocationCommand
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BListView_InvocationCommand(BListView *ListView) 
{
   return ListView->InvocationCommand();
}


/***********************************************************************
 *  Method: BListView::SetListType
 *  Params: list_view_type type
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_SetListType(BListView *ListView, list_view_type type)
{
   ListView->SetListType(type);
}


/***********************************************************************
 *  Method: BListView::ListType
 *  Params: 
 * Returns: list_view_type
 * Effects: 
 ***********************************************************************/
list_view_type
BListView_ListType(BListView *ListView) 
{
   return ListView->ListType();
}


/***********************************************************************
 *  Method: BListView::ItemAt
 *  Params: int32 index
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BListView_ItemAt(BListView *ListView, int32 index) 
{
   return ListView->ItemAt(index);
}


/***********************************************************************
 *  Method: BListView::IndexOf
 *  Params: BPoint point
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BListView_IndexOf(BListView *ListView, BPoint point) 
{
   return ListView->IndexOf(point);
}


/***********************************************************************
 *  Method: BListView::IndexOf
 *  Params: BListItem *item
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BListView_IndexOf_1
(BListView *ListView, BListItem *item) 
{
   return ListView->IndexOf(item);
}


/***********************************************************************
 *  Method: BListView::FirstItem
 *  Params: 
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BListView_FirstItem(BListView *ListView) 
{
   return ListView->FirstItem();
}


/***********************************************************************
 *  Method: BListView::LastItem
 *  Params: 
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BListView_LastItem(BListView *ListView) 
{
   return ListView->LastItem();
}


/***********************************************************************
 *  Method: BListView::HasItem
 *  Params: BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_HasItem(BListView *ListView, BListItem *item) 
{
   return ListView->HasItem(item);
}


/***********************************************************************
 *  Method: BListView::CountItems
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BListView_CountItems(BListView *ListView) 
{
   return ListView->CountItems();
}


/***********************************************************************
 *  Method: BListView::MakeEmpty
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_MakeEmpty(BListView *ListView)
{
   ListView->MakeEmpty();
}


/***********************************************************************
 *  Method: BListView::IsEmpty
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_IsEmpty(BListView *ListView) 
{
   return ListView->IsEmpty();
}


/***********************************************************************
 *  Method: BListView::Items
 *  Params: 
 * Returns: const BListItem **
 * Effects: 
 ***********************************************************************/
const BListItem **
BListView_Items(BListView *ListView) 
{
   return ListView->Items();
}


/***********************************************************************
 *  Method: BListView::InvalidateItem
 *  Params: int32 index
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_InvalidateItem(BListView *ListView, int32 index)
{
   ListView->InvalidateItem(index);
}


/***********************************************************************
 *  Method: BListView::ScrollToSelection
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_ScrollToSelection(BListView *ListView)
{
   ListView->ScrollToSelection();
}


/***********************************************************************
 *  Method: BListView::Select
 *  Params: int32 index, bool extend
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_Select(BListView *ListView, int32 index, bool extend)
{
   ListView->Select(index, extend);
}


/***********************************************************************
 *  Method: BListView::Select
 *  Params: int32 from, int32 to, bool extend
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_Select_1
(BListView *ListView, int32 from, int32 to, bool extend)
{
   ListView->Select(from, to, extend);
}


/***********************************************************************
 *  Method: BListView::IsItemSelected
 *  Params: int32 index
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_IsItemSelected(BListView *ListView, int32 index) 
{
   return ListView->IsItemSelected(index);
}


/***********************************************************************
 *  Method: BListView::CurrentSelection
 *  Params: int32 index
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BListView_CurrentSelection(BListView *ListView, int32 index) 
{
   return ListView->CurrentSelection(index);
}


/***********************************************************************
 *  Method: BListView::Invoke
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BListView_Invoke(BListView *ListView, BMessage *msg)
{
   return ListView->Invoke(msg);
}


/***********************************************************************
 *  Method: BListView::DeselectAll
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_DeselectAll(BListView *ListView)
{
   ListView->DeselectAll();
}


/***********************************************************************
 *  Method: BListView::DeselectExcept
 *  Params: int32 except_from, int32 except_to
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_DeselectExcept(BListView *ListView, int32 except_from, int32 except_to)
{
   ListView->DeselectExcept(except_from, except_to);
}


/***********************************************************************
 *  Method: BListView::Deselect
 *  Params: int32 index
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_Deselect(BListView *ListView, int32 index)
{
   ListView->Deselect(index);
}


/***********************************************************************
 *  Method: BListView::SelectionChanged
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_SelectionChanged(BListView *ListView)
{
   ListView->SelectionChanged();
}


/***********************************************************************
 *  Method: BListView::SwapItems
 *  Params: int32 a, int32 b
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_SwapItems(BListView *ListView, int32 a, int32 b)
{
   return ListView->SwapItems(a, b);
}


/***********************************************************************
 *  Method: BListView::MoveItem
 *  Params: int32 from, int32 to
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_MoveItem(BListView *ListView, int32 from, int32 to)
{
   return ListView->MoveItem(from, to);
}


/***********************************************************************
 *  Method: BListView::ReplaceItem
 *  Params: int32 index, BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_ReplaceItem(BListView *ListView, int32 index, BListItem *item)
{
   return ListView->ReplaceItem(index, item);
}


/***********************************************************************
 *  Method: BListView::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_AttachedToWindow(BListView *ListView)
{
   ListView->AttachedToWindow();
}


/***********************************************************************
 *  Method: BListView::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_FrameMoved(BListView *ListView, BPoint new_position)
{
   ListView->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BListView::ItemFrame
 *  Params: int32 index
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BListView_ItemFrame(BListView *ListView, int32 index)
{
   return ListView->ItemFrame(index);
}


/***********************************************************************
 *  Method: BListView::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BListView_ResolveSpecifier(BListView *ListView, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return ListView->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BListView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BListView_GetSupportedSuites(BListView *ListView, BMessage *data)
{
   return ListView->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BListView::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BListView_Perform(BListView *ListView, perform_code d, void *arg)
{
   return ListView->Perform(d, arg);
}


/***********************************************************************
 *  Method: BListView::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_WindowActivated(BListView *ListView, bool state)
{
   ListView->WindowActivated(state);
}


/***********************************************************************
 *  Method: BListView::MouseUp
 *  Params: BPoint pt
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_MouseUp(BListView *ListView, BPoint pt)
{
   ListView->MouseUp(pt);
}


/***********************************************************************
 *  Method: BListView::MouseMoved
 *  Params: BPoint pt, uint32 code, const BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_MouseMoved(BListView *ListView, BPoint pt, uint32 code, const BMessage *msg)
{
   ListView->MouseMoved(pt, code, msg);
}


/***********************************************************************
 *  Method: BListView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_DetachedFromWindow(BListView *ListView)
{
   ListView->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BListView::InitiateDrag
 *  Params: BPoint pt, int32 itemIndex, bool initialySelected
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListView_InitiateDrag(BListView *ListView, BPoint pt, int32 itemIndex, bool initialySelected)
{
   return ListView->InitiateDrag(pt, itemIndex, initialySelected);
}


/***********************************************************************
 *  Method: BListView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_ResizeToPreferred(BListView *ListView)
{
   ListView->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BListView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_GetPreferredSize(BListView *ListView, float *width, float *height)
{
   ListView->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BListView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_AllAttached(BListView *ListView)
{
   ListView->AllAttached();
}


/***********************************************************************
 *  Method: BListView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListView_AllDetached(BListView *ListView)
{
   ListView->AllDetached();
}

#if defined(__cplusplus)
}
#endif

#endif /* _LISTVIEW_CPP_ */
