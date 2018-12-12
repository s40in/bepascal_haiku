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

#ifndef _FILEPANEL_CPP_
#define _FILEPANEL_CPP_


/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: FilePanel.cpp
 *   DATE: Thu Feb 13 22:49:35 2003
 *  DESCR: 
 ***********************************************************************/
#include "FilePanel.h"
#include <beobj.h>


class BPFilePanel : public BFilePanel, public virtual  BPasObject
{

public:
						BPFilePanel(TPasObject PasObject,
						    file_panel_mode mode = B_OPEN_PANEL,
							BMessenger *target = 0,
							const entry_ref *start_directory = 0,
							uint32 node_flavors = 0,
							bool allow_multiple_selection = true,
							BMessage *message = 0, 
							BRefFilter * = 0,
							bool modal = false,
							bool hide_when_done = true);

					~BPFilePanel();
};

BPFilePanel::BPFilePanel(TPasObject PasObject,
                            file_panel_mode mode,
							BMessenger *target,
							const entry_ref *start_directory,
							uint32 node_flavors,
							bool allow_multiple_selection,
							BMessage *message, 
							BRefFilter *reg,
							bool modal,
							bool hide_when_done)
			:BFilePanel(mode,target,start_directory,node_flavors,allow_multiple_selection,	message, reg,modal,	hide_when_done ),
			BPasObject(PasObject)
{
}										

BPFilePanel::~BPFilePanel()
{
}


#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BFilePanel::BFilePanel
 *  Params: file_panel_mode mode, BMessenger *target, const entry_ref *start_directory, uint32 node_flavors, bool allow_multiple_selection, BMessage *message, BRefFilter *, bool modal, bool hide_when_done
 * Effects: 
 ***********************************************************************/
TCPlusObject BFilePanel_Create(TPasObject PasObject, file_panel_mode mode, BMessenger *target, const entry_ref *start_directory, uint32 node_flavors, bool allow_multiple_selection, BMessage *message, BRefFilter *reg, bool modal, bool hide_when_done)
{
//	return new BPFilePanel(PasObject, mode, target, start_directory, node_flavors, allow_multiple_selection, message, reg, modal, hide_when_done);
	return new BPFilePanel(PasObject, mode, target, 0, 0, false, 0, 0, true, true);
}


/***********************************************************************
 *  Method: BFilePanel::~BFilePanel
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BFilePanel_Free(BFilePanel *FilePanel)
{
   delete FilePanel;
}


/***********************************************************************
 *  Method: BFilePanel::Show
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_Show(BFilePanel *FilePanel)
{
   FilePanel->Show();
}


/***********************************************************************
 *  Method: BFilePanel::Hide
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_Hide(BFilePanel *FilePanel)
{
   FilePanel->Hide();
}


/***********************************************************************
 *  Method: BFilePanel::IsShowing
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFilePanel_IsShowing(BFilePanel *FilePanel) 
{
   return FilePanel->IsShowing();
}


/***********************************************************************
 *  Method: BFilePanel::WasHidden
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_WasHidden(BFilePanel *FilePanel)
{
   FilePanel->WasHidden();
}


/***********************************************************************
 *  Method: BFilePanel::SelectionChanged
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SelectionChanged(BFilePanel *FilePanel)
{
   FilePanel->SelectionChanged();
}


/***********************************************************************
 *  Method: BFilePanel::SendMessage
 *  Params: const BMessenger *, BMessage *
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SendMessage(BFilePanel *FilePanel, const BMessenger *messenger, BMessage *msg)
{
   FilePanel->SendMessage(messenger, msg);
}


/***********************************************************************
 *  Method: BFilePanel::Window
 *  Params: 
 * Returns: BWindow *
 * Effects: 
 ***********************************************************************/
BWindow *
BFilePanel_Window(BFilePanel *FilePanel) 
{
   return FilePanel->Window();
}


/***********************************************************************
 *  Method: BFilePanel::Messenger
 *  Params: 
 * Returns: BMessenger
 * Effects: 
 ***********************************************************************/
/*BMessenger
BFilePanel_Messenger(BFilePanel *FilePanel) 
{
   return FilePanel->Messenger();
}*/


/***********************************************************************
 *  Method: BFilePanel::RefFilter
 *  Params: 
 * Returns: BRefFilter *
 * Effects: 
 ***********************************************************************/
BRefFilter *
BFilePanel_RefFilter(BFilePanel *FilePanel) 
{
   return FilePanel->RefFilter();
}


/***********************************************************************
 *  Method: BFilePanel::GetPanelDirectory
 *  Params: entry_ref *
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_GetPanelDirectory(BFilePanel *FilePanel, entry_ref *ref) 
{
   FilePanel->GetPanelDirectory(ref);
}


/***********************************************************************
 *  Method: BFilePanel::PanelMode
 *  Params: 
 * Returns: file_panel_mode
 * Effects: 
 ***********************************************************************/
file_panel_mode
BFilePanel_PanelMode(BFilePanel *FilePanel) 
{
//   return FilePanel->PanelMode();
}


/***********************************************************************
 *  Method: BFilePanel::SetTarget
 *  Params: BMessenger
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BFilePanel_SetTarget(BFilePanel *FilePanel, BMessenger *mess)
{
   FilePanel->SetTarget(mess);
}*/


/***********************************************************************
 *  Method: BFilePanel::SetMessage
 *  Params: BMessage *msg
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetMessage(BFilePanel *FilePanel, BMessage *msg)
{
   FilePanel->SetMessage(msg);
}


/***********************************************************************
 *  Method: BFilePanel::SetRefFilter
 *  Params: BRefFilter *filter
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetRefFilter(BFilePanel *FilePanel, BRefFilter *filter)
{
   FilePanel->SetRefFilter(filter);
}


/***********************************************************************
 *  Method: BFilePanel::SetSaveText
 *  Params: const char *text
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetSaveText(BFilePanel *FilePanel, const char *text)
{
   FilePanel->SetSaveText(text);
}


/***********************************************************************
 *  Method: BFilePanel::SetButtonLabel
 *  Params: file_panel_button, const char *label
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetButtonLabel(BFilePanel *FilePanel, file_panel_button z, const char *label)
{
   FilePanel->SetButtonLabel(z, label);
}


/***********************************************************************
 *  Method: BFilePanel::SetPanelDirectory
 *  Params: const BEntry *new_directory
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetPanelDirectory(BFilePanel *FilePanel, const BEntry *new_directory)
{
   FilePanel->SetPanelDirectory(new_directory);
}


/***********************************************************************
 *  Method: BFilePanel::SetPanelDirectory
 *  Params: const BDirectory *new_directory
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetPanelDirectory_1
(BFilePanel *FilePanel, const BDirectory *new_directory)
{
   FilePanel->SetPanelDirectory(new_directory);
}


/***********************************************************************
 *  Method: BFilePanel::SetPanelDirectory
 *  Params: const entry_ref *new_directory
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetPanelDirectory_2
(BFilePanel *FilePanel, const entry_ref *new_directory)
{
   FilePanel->SetPanelDirectory(new_directory);
}


/***********************************************************************
 *  Method: BFilePanel::SetPanelDirectory
 *  Params: const char *new_directory
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetPanelDirectory_3
(BFilePanel *FilePanel, const char *new_directory)
{
   FilePanel->SetPanelDirectory(new_directory);
}


/***********************************************************************
 *  Method: BFilePanel::SetHideWhenDone
 *  Params: bool
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_SetHideWhenDone(BFilePanel *FilePanel, bool z)
{
   FilePanel->SetHideWhenDone(z);
}


/***********************************************************************
 *  Method: BFilePanel::HidesWhenDone
 *  Params: void
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFilePanel_HidesWhenDone(BFilePanel *FilePanel) 
{
   return FilePanel->HidesWhenDone();
}


/***********************************************************************
 *  Method: BFilePanel::Refresh
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_Refresh(BFilePanel *FilePanel)
{
   FilePanel->Refresh();
}


/***********************************************************************
 *  Method: BFilePanel::Rewind
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFilePanel_Rewind(BFilePanel *FilePanel)
{
   FilePanel->Rewind();
}


/***********************************************************************
 *  Method: BFilePanel::GetNextSelectedRef
 *  Params: entry_ref *
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFilePanel_GetNextSelectedRef(BFilePanel *FilePanel, entry_ref *ref)
{
   return FilePanel->GetNextSelectedRef(ref);
}



#if defined(__cplusplus)
}
#endif

#endif /* _FILEPANEL_CPP_ */



