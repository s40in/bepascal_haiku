#ifndef _MENU_CPP_
#define _MENU_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Menu.cpp
 *   DATE: Sat Jan 11 16:55:14 2003
 *  DESCR: 
 ***********************************************************************/

#include "Menu.h"
#include "menu.h"
#include "Messenger.h"
#include "view.h"
#include <beobj.h>

#include "MenuItem.h"


BPMenu::BPMenu(TPasObject PasObject, const char *name, menu_layout layout)
		:BMenu(name, layout),
          BPView(PasObject, BRect(0, 0, 0, 0), "", 0, 0),
          BPHandler(PasObject)
//       BPasObject(PasObject)
{
}

BPMenu::BPMenu(TPasObject PasObject, const char *name, float width, float height)
		:BMenu(name, width, height),
          BPView(PasObject, BRect(0, 0, 0, 0), "", 0, 0),
          BPHandler(PasObject)
//       BPasObject(PasObject)
{
}

BPMenu::BPMenu(TPasObject PasObject, BMessage *archive)
		:BMenu(archive),
          BPView(PasObject, BRect(0, 0, 0, 0), "", 0, 0),
          BPHandler(PasObject)
//       BPasObject(PasObject)
{
}

BPMenu::BPMenu(TPasObject PasObject, BRect frame, const char *name, uint32 resizingMode, uint32 flags, menu_layout layout, bool resizeToFit)
		:BMenu(frame, name, resizingMode, flags, layout, resizeToFit),
          BPView(PasObject, BRect(0, 0, 0, 0), "", 0, 0),
          BPHandler(PasObject)
//       BPasObject(PasObject)
{
}

void BPMenu::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BMenu::MessageReceived(message);
}

void BPMenu::AllAttached(void)
{
//	AllAttached_hookCall(message);
}

void BPMenu::AttachedToWindow(void)
{
	BMenu::AttachedToWindow();
//	AttachedToWindow_hookCall();	
}

void BPMenu::AllDetached(void)
{
//	View_AllDetached_hook(GetPasObject());
}

void BPMenu::DetachedFromWindow(void)
{
//	View_DetachedFromWindow_hook(GetPasObject());
}

void BPMenu::Draw(BRect updateRect)
{
	BMenu::Draw(updateRect);
	Draw_hookCall(updateRect);	
}

void BPMenu::DrawAfterChildren(BRect updateRect)
{
//	View_DrawAfterChildren_hook(GetPasObject(), &updateRect);
}

void BPMenu::FrameMoved(BPoint parentPoint)
{
//	View_FrameMoved_hook(GetPasObject(), &parentPoint);
}

void BPMenu::FrameResized(float width, float height)
{
//	View_FrameResized_hook(GetPasObject(), width, height);
}

void BPMenu::GetPreferredSize(float *width, float *height)
{
//	View_GetPreferredSize_hook(GetPasObject(), width, height);
}

void BPMenu::ResizeToPreferred(void)
{
//	View_ResizeToPreferred_hook(GetPasObject());
}

void BPMenu::KeyDown(const char *bytes, int32 numBytes)
{
//	View_KeyDown_hook(GetPasObject(), bytes, numBytes);
}

void BPMenu::KeyUp(const char *bytes, int32 numBytes)
{
//	View_KeyUp_hook(GetPasObject(), bytes, numBytes);
}

void BPMenu::MouseDown(BPoint point)
{
//	View_MouseDown_hook(GetPasObject(), &point);
}

void BPMenu::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
//	View_MouseMoved_hook(GetPasObject(), &point, transit, &message);
}

void BPMenu::MouseUp(BPoint point)
{
//	View_MouseUp_hook(GetPasObject(), &point);
}

void BPMenu::Pulse(void)
{
//	View_Pulse_hook(GetPasObject());
}

//void BPMenu::TargetedByScrollView(BScrollView *scroller)
//{
//	View_TargetedByScrollView(GetPasObject(), scroller);
//}

void BPMenu::WindowActivated(bool active)
{
//	View_WindowActivated_hook(GetPasObject(), active);
}

void BPMenu::SetEnabled(bool enabled)
{
}

void BPMenu::SetValue(int32 value)
{
}

void BPMenu::MakeDefault(bool)
{

}

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BMenu::BMenu
 *  Params: const char *title, menu_layout layout
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenu_Create(TPasObject PasObject, const char *title, menu_layout layout)
{
	return new BPMenu(PasObject, title, layout);
}


/***********************************************************************
 *  Method: BMenu::BMenu
 *  Params: const char *title, float width, float height
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenu_Create_1
(TPasObject PasObject, const char *title, float width, float height)
{
	return new BPMenu(PasObject, title, width, height);
}


/***********************************************************************
 *  Method: BMenu::~BMenu
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BMenu_Free(BMenu *Menu)
{
   delete Menu;
}


/***********************************************************************
 *  Method: BMenu::BMenu
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenu_Create_2(TPasObject PasObject, BMessage *data)
{
	return new BPMenu(PasObject, data);
}


/***********************************************************************
 *  Method: BMenu::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BMenu_Instantiate(BMenu *Menu, BMessage *data)
{
   return Menu->Instantiate(data);
}


/***********************************************************************
 *  Method: BMenu::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenu_Archive(BMenu *Menu, BMessage *data, bool deep)
{
   return Menu->Archive(data, deep);
}


/***********************************************************************
 *  Method: BMenu::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_AttachedToWindow(BMenu *Menu)
{
   Menu->AttachedToWindow();
}


/***********************************************************************
 *  Method: BMenu::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_DetachedFromWindow(BMenu *Menu)
{
   Menu->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BMenu::AddItem
 *  Params: BMenuItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddItem(BMenu *Menu, BMenuItem *item)
{
   return Menu->AddItem(item);
}


/***********************************************************************
 *  Method: BMenu::AddItem
 *  Params: BMenuItem *item, int32 index
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddItem_1
(BMenu *Menu, BMenuItem *item, int32 index)
{
   return Menu->AddItem(item, index);
}


/***********************************************************************
 *  Method: BMenu::AddItem
 *  Params: BMenuItem *item, BRect frame
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddItem_2
(BMenu *Menu, BMenuItem *item, BRect frame)
{
   return Menu->AddItem(item, frame);
}


/***********************************************************************
 *  Method: BMenu::AddItem
 *  Params: BMenu *menu
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddItem_3
(BMenu *Menu, BMenu *menu)
{
   return Menu->AddItem(menu);
}


/***********************************************************************
 *  Method: BMenu::AddItem
 *  Params: BMenu *menu, int32 index
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddItem_4
(BMenu *Menu, BMenu *menu, int32 index)
{
   return Menu->AddItem(menu, index);
}


/***********************************************************************
 *  Method: BMenu::AddItem
 *  Params: BMenu *menu, BRect frame
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddItem_5
(BMenu *Menu, BMenu *menu, BRect frame)
{
   return Menu->AddItem(menu, frame);
}


/***********************************************************************
 *  Method: BMenu::AddList
 *  Params: BList *list, int32 index
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddList(BMenu *Menu, BList *list, int32 index)
{
   return Menu->AddList(list, index);
}


/***********************************************************************
 *  Method: BMenu::AddSeparatorItem
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AddSeparatorItem(BMenu *Menu)
{
   return Menu->AddSeparatorItem();
}


/***********************************************************************
 *  Method: BMenu::RemoveItem
 *  Params: BMenuItem *item
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_RemoveItem(BMenu *Menu, BMenuItem *item)
{
   return Menu->RemoveItem(item);
}


/***********************************************************************
 *  Method: BMenu::RemoveItem
 *  Params: int32 index
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
BMenuItem *
BMenu_RemoveItem_1
(BMenu *Menu, int32 index)
{
   return Menu->RemoveItem(index);
}


/***********************************************************************
 *  Method: BMenu::RemoveItems
 *  Params: int32 index, int32 count, bool del
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_RemoveItems_2
(BMenu *Menu, int32 index, int32 count, bool del)
{
   return Menu->RemoveItems(index, count, del);
}


/***********************************************************************
 *  Method: BMenu::RemoveItem
 *  Params: BMenu *menu
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_RemoveItem_2(BMenu *Menu, BMenu *menu)
{
   return Menu->RemoveItem(menu);
}


/***********************************************************************
 *  Method: BMenu::ItemAt
 *  Params: int32 index
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
BMenuItem *
BMenu_ItemAt(BMenu *Menu, int32 index) 
{
   return Menu->ItemAt(index);
}


/***********************************************************************
 *  Method: BMenu::SubmenuAt
 *  Params: int32 index
 * Returns: BMenu *
 * Effects: 
 ***********************************************************************/
BMenu *
BMenu_SubmenuAt(BMenu *Menu, int32 index) 
{
   return Menu->SubmenuAt(index);
}


/***********************************************************************
 *  Method: BMenu::CountItems
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BMenu_CountItems(BMenu *Menu) 
{
   return Menu->CountItems();
}


/***********************************************************************
 *  Method: BMenu::IndexOf
 *  Params: BMenuItem *item
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BMenu_IndexOf(BMenu *Menu, BMenuItem *item) 
{
   return Menu->IndexOf(item);
}


/***********************************************************************
 *  Method: BMenu::IndexOf
 *  Params: BMenu *menu
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BMenu_IndexOf_1
(BMenu *Menu, BMenu *menu) 
{
   return Menu->IndexOf(menu);
}


/***********************************************************************
 *  Method: BMenu::FindItem
 *  Params: uint32 command
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
BMenuItem *
BMenu_FindItem(BMenu *Menu, uint32 command) 
{
   return Menu->FindItem(command);
}


/***********************************************************************
 *  Method: BMenu::FindItem
 *  Params: const char *name
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
BMenuItem *
BMenu_FindItem_1
(BMenu *Menu, const char *name) 
{
   return Menu->FindItem(name);
}


/***********************************************************************
 *  Method: BMenu::SetTargetForItems
 *  Params: BHandler *target
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenu_SetTargetForItems(BMenu *Menu, BHandler *target)
{
   return Menu->SetTargetForItems(target);
}


/***********************************************************************
 *  Method: BMenu::SetTargetForItems
 *  Params: BMessenger messenger
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenu_SetTargetForItems_1
(BMenu *Menu, BMessenger messenger)
{
   return Menu->SetTargetForItems(messenger);
}


/***********************************************************************
 *  Method: BMenu::SetEnabled
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_SetEnabled(BMenu *Menu, bool state)
{
   Menu->SetEnabled(state);
}


/***********************************************************************
 *  Method: BMenu::SetRadioMode
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_SetRadioMode(BMenu *Menu, bool state)
{
   Menu->SetRadioMode(state);
}


/***********************************************************************
 *  Method: BMenu::SetTriggersEnabled
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_SetTriggersEnabled(BMenu *Menu, bool state)
{
   Menu->SetTriggersEnabled(state);
}


/***********************************************************************
 *  Method: BMenu::SetMaxContentWidth
 *  Params: float max
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_SetMaxContentWidth(BMenu *Menu, float max)
{
   Menu->SetMaxContentWidth(max);
}


/***********************************************************************
 *  Method: BMenu::SetLabelFromMarked
 *  Params: bool on
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_SetLabelFromMarked(BMenu *Menu, bool on)
{
   Menu->SetLabelFromMarked(on);
}


/***********************************************************************
 *  Method: BMenu::IsLabelFromMarked
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_IsLabelFromMarked(BMenu *Menu)
{
   return Menu->IsLabelFromMarked();
}


/***********************************************************************
 *  Method: BMenu::IsEnabled
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_IsEnabled(BMenu *Menu) 
{
   return Menu->IsEnabled();
}


/***********************************************************************
 *  Method: BMenu::IsRadioMode
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_IsRadioMode(BMenu *Menu) 
{
   return Menu->IsRadioMode();
}


/***********************************************************************
 *  Method: BMenu::AreTriggersEnabled
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_AreTriggersEnabled(BMenu *Menu) 
{
   return Menu->AreTriggersEnabled();
}


/***********************************************************************
 *  Method: BMenu::IsRedrawAfterSticky
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMenu_IsRedrawAfterSticky(BMenu *Menu) 
{
   return Menu->IsRedrawAfterSticky();
}


/***********************************************************************
 *  Method: BMenu::MaxContentWidth
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BMenu_MaxContentWidth(BMenu *Menu) 
{
   return Menu->MaxContentWidth();
}


/***********************************************************************
 *  Method: BMenu::FindMarked
 *  Params: 
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
BMenuItem *
BMenu_FindMarked(BMenu *Menu)
{
   return Menu->FindMarked();
}


/***********************************************************************
 *  Method: BMenu::Supermenu
 *  Params: 
 * Returns: BMenu *
 * Effects: 
 ***********************************************************************/
BMenu *
BMenu_Supermenu(BMenu *Menu) 
{
   return Menu->Supermenu();
}


/***********************************************************************
 *  Method: BMenu::Superitem
 *  Params: 
 * Returns: BMenuItem *
 * Effects: 
 ***********************************************************************/
BMenuItem *
BMenu_Superitem(BMenu *Menu) 
{
   return Menu->Superitem();
}


/***********************************************************************
 *  Method: BMenu::MessageReceived
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_MessageReceived(BMenu *Menu, BMessage *msg)
{
   Menu->MessageReceived(msg);
}


/***********************************************************************
 *  Method: BMenu::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_KeyDown(BMenu *Menu, const char *bytes, int32 numBytes)
{
   Menu->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BMenu::Draw
 *  Params: BRect updateRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_Draw(BMenu *Menu, BRect updateRect)
{
   Menu->Draw(updateRect);
}


/***********************************************************************
 *  Method: BMenu::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_GetPreferredSize(BMenu *Menu, float *width, float *height)
{
   Menu->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BMenu::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_ResizeToPreferred(BMenu *Menu)
{
   Menu->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BMenu::FrameMoved
 *  Params: BPoint new_position
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_FrameMoved(BMenu *Menu, BPoint new_position)
{
   Menu->FrameMoved(new_position);
}


/***********************************************************************
 *  Method: BMenu::FrameResized
 *  Params: float new_width, float new_height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_FrameResized(BMenu *Menu, float new_width, float new_height)
{
   Menu->FrameResized(new_width, new_height);
}


/***********************************************************************
 *  Method: BMenu::InvalidateLayout
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_InvalidateLayout(BMenu *Menu)
{
   Menu->InvalidateLayout();
}


/***********************************************************************
 *  Method: BMenu::ResolveSpecifier
 *  Params: BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BMenu_ResolveSpecifier(BMenu *Menu, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return Menu->ResolveSpecifier(msg, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BMenu::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenu_GetSupportedSuites(BMenu *Menu, BMessage *data)
{
   return Menu->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BMenu::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMenu_Perform(BMenu *Menu, perform_code d, void *arg)
{
   return Menu->Perform(d, arg);
}


/***********************************************************************
 *  Method: BMenu::MakeFocus
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_MakeFocus(BMenu *Menu, bool state)
{
   Menu->MakeFocus(state);
}


/***********************************************************************
 *  Method: BMenu::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_AllAttached(BMenu *Menu)
{
   Menu->AllAttached();
}


/***********************************************************************
 *  Method: BMenu::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMenu_AllDetached(BMenu *Menu)
{
   Menu->AllDetached();
}


/***********************************************************************
 *  Method: BMenu::BMenu
 *  Params: BRect frame, const char *viewName, uint32 resizeMask, uint32 flags, menu_layout layout, bool resizeToFit
 * Effects: 
 ***********************************************************************/
TCPlusObject BMenu_Create_3(TPasObject PasObject, BRect frame, const char *viewName, uint32 resizeMask, uint32 flags, menu_layout layout, bool resizeToFit)
{
	return new BPMenu(PasObject, frame, viewName, resizeMask, flags, layout, resizeToFit);
}

#if defined(__cplusplus)
}
#endif

#endif /* _MENU_CPP_ */
