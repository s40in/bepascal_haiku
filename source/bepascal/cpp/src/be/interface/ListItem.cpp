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

#ifndef _LISTITEM_CPP_
#define _LISTITEM_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include "ListItem.h"
#include <beobj.h>



typedef void (*BListItem_DrawItem_hook) (TPasObject PasObject, TCPlusObject owner, TCPlusObject frame, bool complete );
typedef void (*BListString_DrawItem_hook) (TPasObject PasObject, TCPlusObject owner, TCPlusObject frame, bool complete );

typedef void (*BListItem_Update_hook) (TPasObject PasObject, TCPlusObject owner, TCPlusObject font);
typedef void (*BListString_Update_hook) (TPasObject PasObject, TCPlusObject owner, TCPlusObject font);


#if defined(__cplusplus)
extern "C" {
#endif

BListItem_DrawItem_hook ListItem_DrawItem_hook;
BListString_DrawItem_hook ListString_DrawItem_hook;
BListItem_Update_hook ListItem_Update_hook;
BListString_Update_hook ListString_Update_hook;

#if defined(__cplusplus)
}
#endif
////////////////////////////////////////
// BPListItem
////////////////////////////////////////
class BPListItem : public BListItem, virtual public BPasObject
{
	public:
		BPListItem(TPasObject PasObject,BMessage *data);
		BPListItem(TPasObject PasObject,uint32 outlineLevel = 0, bool expanded = true);

		virtual	void DrawItem(BView *owner, BRect frame, bool complete = false);
		virtual	void Update(BView *owner, const BFont *font);
	private:
};



BPListItem::BPListItem(TPasObject PasObject,BMessage *data)
					:BListItem(data),
					BPasObject(PasObject)
					
{
}

BPListItem::BPListItem(TPasObject PasObject, uint32 outlineLevel, bool expanded)
					:BListItem(outlineLevel,expanded),
					BPasObject(PasObject)
{
}

void BPListItem::Update(BView *owner, const BFont *font)
{
    ListItem_Update_hook(GetPasObject(), &owner, &font);
}

void BPListItem::DrawItem(BView *owner, BRect frame, bool complete)
{
	//BListItem::DrawItem(owner, frame, complete);
    ListItem_DrawItem_hook(GetPasObject(), &owner, &frame, complete);
}


////////////////////////////////////////
// BPStringItem
////////////////////////////////////////

class BPStringItem : public BStringItem , virtual  public BPasObject
{
	public:
		BPStringItem(TPasObject PasObject,const char *text,uint32 outlineLevel = 0, bool expanded = true);
		BPStringItem(TPasObject PasObject,BMessage *data);
		virtual	void DrawItem(BView *owner, BRect frame, bool complete = false);
		virtual	void Update(BView *owner, const BFont *font);
	private:
};

BPStringItem::BPStringItem(TPasObject PasObject,const char *text,uint32 outlineLevel, bool expanded)
				:BStringItem(text,outlineLevel,expanded),
					//BPListItem(PasObject,outlineLevel,expanded),
		BPasObject(PasObject)
{
}

BPStringItem::BPStringItem(TPasObject PasObject,BMessage *data)
				:BStringItem(data),
					//BPListItem(PasObject),
		BPasObject(PasObject)
{
}

void BPStringItem::DrawItem(BView *owner, BRect frame, bool complete)
{
	BStringItem::DrawItem(owner, frame, complete);
    ListString_DrawItem_hook(GetPasObject(), &owner, &frame, complete);
    
}

void BPStringItem::Update(BView *owner, const BFont *font)
{
	BStringItem::Update(owner, font);
    ListString_Update_hook(GetPasObject(), &owner, &font);
}

#if defined(__cplusplus)
extern "C" {
#endif



/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: ListItem.cpp
 *   DATE: Mon Feb  3 20:25:49 2003
 *  DESCR: 
 ***********************************************************************/




TCPlusObject BListItem_Create(TPasObject PasObject, uint32 outlineLevel, bool expanded)
{
	return new BPListItem(PasObject, outlineLevel, expanded);
}


/***********************************************************************
 *  Method: BListItem::BListItem
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BListItem_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPListItem(PasObject, data);
}


/***********************************************************************
 *  Method: BListItem::~BListItem
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BListItem_Free(BListItem *ListItem)
{
   delete ListItem;
}


/***********************************************************************
 *  Method: BListItem::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BListItem_Archive(BListItem *ListItem, BMessage *data, bool deep) 
{
   return ListItem->Archive(data, deep);
}


/***********************************************************************
 *  Method: BListItem::Height
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BListItem_Height(BListItem *ListItem) 
{
   return ListItem->Height();
}


/***********************************************************************
 *  Method: BListItem::Width
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BListItem_Width(BListItem *ListItem) 
{
   return ListItem->Width();
}


/***********************************************************************
 *  Method: BListItem::IsSelected
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListItem_IsSelected(BListItem *ListItem) 
{
   return ListItem->IsSelected();
}


/***********************************************************************
 *  Method: BListItem::Select
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_Select(BListItem *ListItem)
{
   ListItem->Select();
}


/***********************************************************************
 *  Method: BListItem::Deselect
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_Deselect(BListItem *ListItem)
{
   ListItem->Deselect();
}


/***********************************************************************
 *  Method: BListItem::SetEnabled
 *  Params: bool on
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_SetEnabled(BListItem *ListItem, bool on)
{
   ListItem->SetEnabled(on);
}


/***********************************************************************
 *  Method: BListItem::IsEnabled
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListItem_IsEnabled(BListItem *ListItem) 
{
   return ListItem->IsEnabled();
}


/***********************************************************************
 *  Method: BListItem::SetHeight
 *  Params: float height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_SetHeight(BListItem *ListItem, float height)
{
   ListItem->SetHeight(height);
}


/***********************************************************************
 *  Method: BListItem::SetWidth
 *  Params: float width
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_SetWidth(BListItem *ListItem, float width)
{
   ListItem->SetWidth(width);
}


/***********************************************************************
 *  Method: BListItem::Update
 *  Params: BView *owner, const BFont *font
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_Update(BListItem *ListItem, BView *owner, const BFont *font)
{
   ListItem->Update(owner, font);
}


/***********************************************************************
 *  Method: BListItem::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BListItem_Perform(BListItem *ListItem, perform_code d, void *arg)
{
   return ListItem->Perform(d, arg);
}


/***********************************************************************
 *  Method: BListItem::IsExpanded
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BListItem_IsExpanded(BListItem *ListItem) 
{
   return ListItem->IsExpanded();
}


/***********************************************************************
 *  Method: BListItem::SetExpanded
 *  Params: bool expanded
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BListItem_SetExpanded(BListItem *ListItem, bool expanded)
{
   ListItem->SetExpanded(expanded);
}


/***********************************************************************
 *  Method: BListItem::OutlineLevel
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BListItem_OutlineLevel(BListItem *ListItem) 
{
   return ListItem->OutlineLevel();
}


void BListItem_DrawItem(BListItem *ListItem, BView *owner, BRect frame, bool complete)
{
   ListItem->DrawItem(owner, frame, complete);
}

TCPlusObject BStringItem_Create(TPasObject PasObject, const char *text, uint32 outlineLevel, bool expanded)
{
 	return new BPStringItem(PasObject, text, outlineLevel, expanded);
}


/***********************************************************************
 *  Method: BStringItem::~BStringItem
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BStringItem_Free(BStringItem *StringItem)
{
   return StringItem->~BStringItem();
}


/***********************************************************************
 *  Method: BStringItem::BStringItem
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BStringItem_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPStringItem(PasObject, data);
}


/***********************************************************************
 *  Method: BStringItem::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BStringItem_Instantiate(BStringItem *StringItem, BMessage *data)
{
   return StringItem->Instantiate(data);
}


/***********************************************************************
 *  Method: BStringItem::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStringItem_Archive(BStringItem *StringItem, BMessage *data, bool deep) 
{
   return StringItem->Archive(data, deep);
}


/***********************************************************************
 *  Method: BStringItem::DrawItem
 *  Params: BView *owner, BRect frame, bool complete
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringItem_DrawItem(BStringItem *StringItem, BView *owner, BRect frame, bool complete)
{
   StringItem->DrawItem(owner, frame, complete);
}


/***********************************************************************
 *  Method: BStringItem::SetText
 *  Params: const char *text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringItem_SetText(BStringItem *StringItem, const char *text)
{
   StringItem->SetText(text);
}


/***********************************************************************
 *  Method: BStringItem::Text
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BStringItem_Text(BStringItem *StringItem) 
{
   return StringItem->Text();
}


/***********************************************************************
 *  Method: BStringItem::Update
 *  Params: BView *owner, const BFont *font
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BStringItem_Update(BStringItem *StringItem, BView *owner, const BFont *font)
{
   StringItem->Update(owner, font);
}


/***********************************************************************
 *  Method: BStringItem::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BStringItem_Perform(BStringItem *StringItem, perform_code d, void *arg)
{
   return StringItem->Perform(d, arg);
}



#if defined(__cplusplus)
}
#endif

#endif /* _LISTITEM_CPP_ */

