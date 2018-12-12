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

#ifndef _MENUITEM_CPP_
#define _MENUITEM_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: MenuItem.cpp
 *   DATE: Sat Jan 11 18:24:08 2003
 *  DESCR: 
 ***********************************************************************/
#include "MenuItem.h"
#include "menuitem.h"
#include <beobj.h>

BPMenuItem::BPMenuItem(TPasObject PasObject, const char *label, BMessage *message, char shortcut, uint32 modifiers)
		:BMenuItem(label, message, shortcut, modifiers),
		BPasObject(PasObject)
{
}

BPMenuItem::BPMenuItem(TPasObject PasObject, BMenu *submenu, BMessage *message)
		:BMenuItem(submenu, message),
		BPasObject(PasObject)
{
}

BPMenuItem::BPMenuItem(TPasObject PasObject, BMessage *data)
		:BMenuItem(data),
		BPasObject(PasObject)
{
}

void BPMenuItem::Draw(void)
{
	BMenuItem::Draw();
}

void BPMenuItem::DrawContent(void)
{
	BMenuItem::DrawContent();
}

void BPMenuItem::GetContentSize(float *width, float *height)
{
	BMenuItem::GetContentSize(width, height);
}

void BPMenuItem::TruncateLabel(float max, char *new_label)
{
	BMenuItem::TruncateLabel(max, new_label);
}

void BPMenuItem::Highlight(bool on)
{
	BMenuItem::Highlight(on);
}

bool BPMenuItem::IsSelected() const
{
	return BMenuItem::IsSelected();
}

BPoint BPMenuItem::ContentLocation() const
{
	return BMenuItem::ContentLocation();
}

BPSeparatorItem::BPSeparatorItem(TPasObject PasObject)
		:BSeparatorItem(),
		BPMenuItem(PasObject, "", NULL),
		BPasObject(PasObject)
{
}

BPSeparatorItem::BPSeparatorItem(TPasObject PasObject, BMessage *data)
		:BSeparatorItem(data),
		BPMenuItem(PasObject, data),
		BPasObject(PasObject)
{
}

void BPSeparatorItem::Draw(void)
{
	BSeparatorItem::Draw();
}

void BPSeparatorItem::DrawContent(void)
{
	BSeparatorItem::DrawContent();
}


#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BMenuItem::BMenuItem
 *  Params: const char *label, BMessage *message, char shortcut, uint32 modifiers
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenuItem_Create(TPasObject PasObject, const char *label, BMessage *message, char shortcut, uint32 modifiers)
{
	return new BPMenuItem(PasObject, label, message, shortcut, modifiers);
}


/***********************************************************************
 *  Method: BMenuItem::BMenuItem
 *  Params: BMenu *menu, BMessage *message
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenuItem_Create_1
(TPasObject PasObject, BMenu *menu, BMessage *message)
{
	return new BPMenuItem(PasObject, menu, message);
}


/***********************************************************************
 *  Method: BMenuItem::BMenuItem
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenuItem_Create_2
(TPasObject PasObject, BMessage *data)
{
	return new BPMenuItem(PasObject, data);
}


/***********************************************************************
 *  Method: BMenuItem::~BMenuItem
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BMenuItem_Free(BMenuItem *MenuItem)
{
   delete MenuItem;
}


/***********************************************************************
 *  Method: BMenuItem::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BMenuItem_Instantiate(BMenuItem *MenuItem, BMessage *data)
{
   return MenuItem->Instantiate(data);
}


/***********************************************************************
 *  Method: BMenuItem::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenuItem_Archive(BMenuItem *MenuItem, BMessage *data, bool deep) 
{
   return MenuItem->Archive(data, deep);
}


/***********************************************************************
 *  Method: BMenuItem::SetLabel
 *  Params: const char *name
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuItem_SetLabel(BMenuItem *MenuItem, const char *name)
{
   MenuItem->SetLabel(name);
}


/***********************************************************************
 *  Method: BMenuItem::SetEnabled
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuItem_SetEnabled(BMenuItem *MenuItem, bool state)
{
   MenuItem->SetEnabled(state);
}


/***********************************************************************
 *  Method: BMenuItem::SetMarked
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuItem_SetMarked(BMenuItem *MenuItem, bool state)
{
   MenuItem->SetMarked(state);
}


/***********************************************************************
 *  Method: BMenuItem::SetTrigger
 *  Params: char ch
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuItem_SetTrigger(BMenuItem *MenuItem, char ch)
{
   MenuItem->SetTrigger(ch);
}


/***********************************************************************
 *  Method: BMenuItem::SetShortcut
 *  Params: char ch, uint32 modifiers
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenuItem_SetShortcut(BMenuItem *MenuItem, char ch, uint32 modifiers)
{
   MenuItem->SetShortcut(ch, modifiers);
}


/***********************************************************************
 *  Method: BMenuItem::Label
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BMenuItem_Label(BMenuItem *MenuItem) 
{
   return MenuItem->Label();
}


/***********************************************************************
 *  Method: BMenuItem::IsEnabled
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenuItem_IsEnabled(BMenuItem *MenuItem) 
{
   return MenuItem->IsEnabled();
}


/***********************************************************************
 *  Method: BMenuItem::IsMarked
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenuItem_IsMarked(BMenuItem *MenuItem) 
{
   return MenuItem->IsMarked();
}


/***********************************************************************
 *  Method: BMenuItem::Trigger
 *  Params: 
 * Returns: char
 * Effects: 
 ***********************************************************************/
char
BMenuItem_Trigger(BMenuItem *MenuItem) 
{
   return MenuItem->Trigger();
}


/***********************************************************************
 *  Method: BMenuItem::Shortcut
 *  Params: uint32 *modifiers
 * Returns: char
 * Effects: 
 ***********************************************************************/
char
BMenuItem_Shortcut(BMenuItem *MenuItem, uint32 *modifiers) 
{
   return MenuItem->Shortcut(modifiers);
}


/***********************************************************************
 *  Method: BMenuItem::Submenu
 *  Params: 
 * Returns: BMenu *
 * Effects: 
 ***********************************************************************/
BMenu *
BMenuItem_Submenu(BMenuItem *MenuItem) 
{
   return MenuItem->Submenu();
}


/***********************************************************************
 *  Method: BMenuItem::Menu
 *  Params: 
 * Returns: BMenu *
 * Effects: 
 ***********************************************************************/
BMenu *
BMenuItem_Menu(BMenuItem *MenuItem) 
{
   return MenuItem->Menu();
}


/***********************************************************************
 *  Method: BMenuItem::Frame
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BMenuItem_Frame(BMenuItem *MenuItem) 
{
   return MenuItem->Frame();
}


/***********************************************************************
 *  Method: BSeparatorItem::BSeparatorItem
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BSeparatorItem_Create(TPasObject PasObject)
{
	return new BPSeparatorItem(PasObject);
}


/***********************************************************************
 *  Method: BSeparatorItem::BSeparatorItem
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BSeparatorItem_Create_1
(TPasObject PasObject, BMessage *data)
{
	return new BPSeparatorItem(PasObject, data);
}


/***********************************************************************
 *  Method: BSeparatorItem::~BSeparatorItem
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BSeparatorItem_Free(BSeparatorItem *SeparatorItem)
{
   delete SeparatorItem;
}


/***********************************************************************
 *  Method: BSeparatorItem::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BSeparatorItem_Archive(BSeparatorItem *SeparatorItem, BMessage *data, bool deep) 
{
   return SeparatorItem->Archive(data, deep);
}


/***********************************************************************
 *  Method: BSeparatorItem::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BSeparatorItem_Instantiate(BSeparatorItem *SeparatorItem, BMessage *data)
{
   return SeparatorItem->Instantiate(data);
}


/***********************************************************************
 *  Method: BSeparatorItem::SetEnabled
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BSeparatorItem_SetEnabled(BSeparatorItem *SeparatorItem, bool state)
{
   SeparatorItem->SetEnabled(state);
}



#if defined(__cplusplus)
}
#endif

#endif /* _MENUITEM_CPP_ */
