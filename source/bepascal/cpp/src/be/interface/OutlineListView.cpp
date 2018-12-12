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

#ifndef _OUTLINELISTVIEW_CPP_
#define _OUTLINELISTVIEW_CPP_

#include "OutlineListView.h"
#include "view.h"
#include <beobj.h>
#include "listview.h"




#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__cplusplus)
}
#endif

class BPOutlineListView : public BOutlineListView, public BPListView 
{
public:
					BPOutlineListView(TPasObject PasObject,BRect frame,
							const char * name,
							list_view_type type = B_SINGLE_SELECTION_LIST,
							uint32 resizeMask = B_FOLLOW_LEFT | B_FOLLOW_TOP,
							uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS 
								| B_NAVIGABLE);
					BPOutlineListView(TPasObject PasObject,BMessage *data);

static	BArchivable *Instantiate(BMessage *data);
//virtual	status_t	Archive(BMessage *data, bool deep = true) const;

virtual	void 		MouseDown(BPoint where);
virtual	void 		KeyDown(const char *bytes, int32 numBytes);
//virtual	void		FrameMoved(BPoint new_position);
virtual	void		FrameResized(float new_width, float new_height);
virtual	void 		MouseUp(BPoint where);
	

//virtual void		ResizeToPreferred();
//virtual void		GetPreferredSize(float *width, float *height);
//virtual void		MakeFocus(bool state = true);
virtual void		AllAttached();
virtual void		AllDetached();
virtual void		DetachedFromWindow();



//virtual	bool		DoMiscellaneous(MiscCode code, MiscData * data);
virtual void		MessageReceived(BMessage *);
};


BPOutlineListView::BPOutlineListView(TPasObject PasObject,BMessage *data)
					:BOutlineListView(data),
          BPListView(PasObject, data),
//       BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}

BPOutlineListView::BPOutlineListView(TPasObject PasObject,BRect frame,
							const char * name,
							list_view_type type,
							uint32 resizeMask,
							uint32 flags)
					:BOutlineListView(frame,name,type,resizeMask,flags),
          BPListView(PasObject, frame,name,type,resizeMask,flags),
//       BPView(PasObject, frame,name,resizeMask,flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{
}


void BPOutlineListView::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BOutlineListView::MessageReceived(message);
}




void BPOutlineListView::AllAttached(void)
{
  	//AllAttached_hookCall();
	BOutlineListView::AllAttached();
}

void BPOutlineListView::AllDetached(void)
{
	//AllDetached_hookCall();
	BOutlineListView::AllDetached();
}



void BPOutlineListView::KeyDown(const char *bytes, int32 numBytes)
{
	BOutlineListView::KeyDown(bytes, numBytes);
}


void BPOutlineListView::FrameResized(float width, float height)
{
    FrameResized_hookCall(width, height);
	BOutlineListView::FrameResized(width, height);
}

void BPOutlineListView::DetachedFromWindow(void)
{
	BOutlineListView::DetachedFromWindow();
}



void BPOutlineListView::MouseDown(BPoint point)
{
	BOutlineListView::MouseDown(point);
}


void BPOutlineListView::MouseUp(BPoint point)
{
	BOutlineListView::MouseUp(point);
}




#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: OutlineListView.cpp
 *   DATE: Tue Mar  4 20:12:11 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BOutlineListView::BOutlineListView
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BOutlineListView_Create(TPasObject PasObject,BRect frame,
							const char * name,
							list_view_type type = B_SINGLE_SELECTION_LIST,
							uint32 resizeMask = B_FOLLOW_LEFT | B_FOLLOW_TOP,
							uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS 
								| B_NAVIGABLE)
{
	return new BPOutlineListView(PasObject, frame,name,type,resizeMask,flags);
}

TCPlusObject BOutlineListView_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPOutlineListView(PasObject, data);
}


/***********************************************************************
 *  Method: BOutlineListView::~BOutlineListView
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BOutlineListView_Free(BOutlineListView *OutlineListView)
{
   delete OutlineListView;
}


/***********************************************************************
 *  Method: BOutlineListView::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BOutlineListView_Instantiate(BOutlineListView *OutlineListView, BMessage *data)
{
   return OutlineListView->Instantiate(data);
}


/***********************************************************************
 *  Method: BOutlineListView::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BOutlineListView_Archive(BOutlineListView *OutlineListView, BMessage *data, bool deep) 
{
   return OutlineListView->Archive(data, deep);
}


/***********************************************************************
 *  Method: BOutlineListView::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_MouseDown(BOutlineListView *OutlineListView, BPoint where)
{
   OutlineListView->MouseDown(where);
}


/***********************************************************************
 *  Method: BOutlineListView::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_KeyDown(BOutlineListView *OutlineListView, const char *bytes, int32 numBytes)
{
   OutlineListView->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BOutlineListView::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_FrameMoved(BOutlineListView *OutlineListView, BPoint new_position)
{
   OutlineListView->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BOutlineListView::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_FrameResized(BOutlineListView *OutlineListView, float new_width, float new_height)
{
   OutlineListView->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BOutlineListView::MouseUp
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_MouseUp(BOutlineListView *OutlineListView, BPoint where)
{
   OutlineListView->MouseUp(where);
}


/***********************************************************************
 *  Method: BOutlineListView::AddUnder
 *  Params: BListItem *item, BListItem *underItem
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_AddUnder(BOutlineListView *OutlineListView, BListItem *item, BListItem *underItem)
{
   return OutlineListView->AddUnder(item, underItem);
}


/***********************************************************************
 *  Method: BOutlineListView::AddItem
 *  Params: BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_AddItem(BOutlineListView *OutlineListView, BListItem *item)
{
   return OutlineListView->AddItem(item);
}


/***********************************************************************
 *  Method: BOutlineListView::AddItem
 *  Params: BListItem *item, int32 fullListIndex
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_AddItem_1
(BOutlineListView *OutlineListView, BListItem *item, int32 fullListIndex)
{
   return OutlineListView->AddItem(item, fullListIndex);
}


/***********************************************************************
 *  Method: BOutlineListView::AddList
 *  Params: BList *newItems
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_AddList(BOutlineListView *OutlineListView, BList *newItems)
{
   return OutlineListView->AddList(newItems);
}


/***********************************************************************
 *  Method: BOutlineListView::AddList
 *  Params: BList *newItems, int32 fullListIndex
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_AddList_1
(BOutlineListView *OutlineListView, BList *newItems, int32 fullListIndex)
{
   return OutlineListView->AddList(newItems, fullListIndex);
}


/***********************************************************************
 *  Method: BOutlineListView::RemoveItem
 *  Params: BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_RemoveItem(BOutlineListView *OutlineListView, BListItem *item)
{
   return OutlineListView->RemoveItem(item);
}


/***********************************************************************
 *  Method: BOutlineListView::RemoveItem
 *  Params: int32 fullListIndex
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BOutlineListView_RemoveItem_1
(BOutlineListView *OutlineListView, int32 fullListIndex)
{
   return OutlineListView->RemoveItem(fullListIndex);
}


/***********************************************************************
 *  Method: BOutlineListView::RemoveItems
 *  Params: int32 fullListIndex, int32 count
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_RemoveItems
(BOutlineListView *OutlineListView, int32 fullListIndex, int32 count)
{
   return OutlineListView->RemoveItems(fullListIndex, count);
}


/***********************************************************************
 *  Method: BOutlineListView::FullListItemAt
 *  Params: int32 fullListIndex
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BOutlineListView_FullListItemAt(BOutlineListView *OutlineListView, int32 fullListIndex) 
{
   return OutlineListView->FullListItemAt(fullListIndex);
}


/***********************************************************************
 *  Method: BOutlineListView::FullListIndexOf
 *  Params: BPoint point
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BOutlineListView_FullListIndexOf(BOutlineListView *OutlineListView, BPoint point) 
{
   return OutlineListView->FullListIndexOf(point);
}


/***********************************************************************
 *  Method: BOutlineListView::FullListIndexOf
 *  Params: BListItem *item
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BOutlineListView_FullListIndexOf_1
(BOutlineListView *OutlineListView, BListItem *item) 
{
   return OutlineListView->FullListIndexOf(item);
}


/***********************************************************************
 *  Method: BOutlineListView::FullListFirstItem
 *  Params: 
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BOutlineListView_FullListFirstItem(BOutlineListView *OutlineListView) 
{
   return OutlineListView->FullListFirstItem();
}


/***********************************************************************
 *  Method: BOutlineListView::FullListLastItem
 *  Params: 
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BOutlineListView_FullListLastItem(BOutlineListView *OutlineListView) 
{
   return OutlineListView->FullListLastItem();
}


/***********************************************************************
 *  Method: BOutlineListView::FullListHasItem
 *  Params: BListItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_FullListHasItem(BOutlineListView *OutlineListView, BListItem *item) 
{
   return OutlineListView->FullListHasItem(item);
}


/***********************************************************************
 *  Method: BOutlineListView::FullListCountItems
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BOutlineListView_FullListCountItems(BOutlineListView *OutlineListView) 
{
   return OutlineListView->FullListCountItems();
}


/***********************************************************************
 *  Method: BOutlineListView::FullListCurrentSelection
 *  Params: int32 index
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BOutlineListView_FullListCurrentSelection(BOutlineListView *OutlineListView, int32 index) 
{
   return OutlineListView->FullListCurrentSelection(index);
}


/***********************************************************************
 *  Method: BOutlineListView::MakeEmpty
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_MakeEmpty(BOutlineListView *OutlineListView)
{
   OutlineListView->MakeEmpty();
}


/***********************************************************************
 *  Method: BOutlineListView::FullListIsEmpty
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_FullListIsEmpty(BOutlineListView *OutlineListView) 
{
   return OutlineListView->FullListIsEmpty();
}


/***********************************************************************
 *  Method: BOutlineListView::Superitem
 *  Params: const BListItem *item
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BOutlineListView_Superitem(BOutlineListView *OutlineListView, const BListItem *item)
{
   return OutlineListView->Superitem(item);
}


/***********************************************************************
 *  Method: BOutlineListView::Expand
 *  Params: BListItem *item
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_Expand(BOutlineListView *OutlineListView, BListItem *item)
{
   OutlineListView->Expand(item);
}


/***********************************************************************
 *  Method: BOutlineListView::Collapse
 *  Params: BListItem *item
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_Collapse(BOutlineListView *OutlineListView, BListItem *item)
{
   OutlineListView->Collapse(item);
}


/***********************************************************************
 *  Method: BOutlineListView::IsExpanded
 *  Params: int32 fullListIndex
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BOutlineListView_IsExpanded(BOutlineListView *OutlineListView, int32 fullListIndex)
{
   return OutlineListView->IsExpanded(fullListIndex);
}


/***********************************************************************
 *  Method: BOutlineListView::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BOutlineListView_ResolveSpecifier(BOutlineListView *OutlineListView, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return OutlineListView->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BOutlineListView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BOutlineListView_GetSupportedSuites(BOutlineListView *OutlineListView, BMessage *data)
{
   return OutlineListView->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BOutlineListView::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BOutlineListView_Perform(BOutlineListView *OutlineListView, perform_code d, void *arg)
{
   return OutlineListView->Perform(d, arg);
}


/***********************************************************************
 *  Method: BOutlineListView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_ResizeToPreferred(BOutlineListView *OutlineListView)
{
   OutlineListView->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BOutlineListView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_GetPreferredSize(BOutlineListView *OutlineListView, float *width, float *height)
{
   OutlineListView->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BOutlineListView::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_MakeFocus(BOutlineListView *OutlineListView, bool state)
{
   OutlineListView->MakeFocus(state);
}


/***********************************************************************
 *  Method: BOutlineListView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_AllAttached(BOutlineListView *OutlineListView)
{
   OutlineListView->AllAttached();
}


/***********************************************************************
 *  Method: BOutlineListView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_AllDetached(BOutlineListView *OutlineListView)
{
   OutlineListView->AllDetached();
}


/***********************************************************************
 *  Method: BOutlineListView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BOutlineListView_DetachedFromWindow(BOutlineListView *OutlineListView)
{
   OutlineListView->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BOutlineListView::CountItemsUnder
 *  Params: BListItem *under, bool oneLevelOnly
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BOutlineListView_CountItemsUnder(BOutlineListView *OutlineListView, BListItem *under, bool oneLevelOnly) 
{
   return OutlineListView->CountItemsUnder(under, oneLevelOnly);
}


/***********************************************************************
 *  Method: BOutlineListView::ItemUnderAt
 *  Params: BListItem *underItem, bool oneLevelOnly, int32 index
 * Returns: BListItem *
 * Effects: 
 ***********************************************************************/
BListItem *
BOutlineListView_ItemUnderAt(BOutlineListView *OutlineListView, BListItem *underItem, bool oneLevelOnly, int32 index) 
{
   return OutlineListView->ItemUnderAt(underItem, oneLevelOnly, index);
}


/***********************************************************************
 *  Method: BOutlineListView::DoMiscellaneous
 *  Params: MiscCode code, MiscData *data
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BOutlineListView_DoMiscellaneous(BOutlineListView *OutlineListView, MiscCode code, MiscData *data)
{
   return OutlineListView->DoMiscellaneous(code, data);
}
*/

/***********************************************************************
 *  Method: BOutlineListView::MessageReceived
 *  Params: BMessage *
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BOutlineListView_MessageReceived(BOutlineListView *OutlineListView, BMessage *)
{
   OutlineListView->MessageReceived();
}*/





#if defined(__cplusplus)
}
#endif

#endif /* _OUTLINELISTVIEW_CPP_ */
