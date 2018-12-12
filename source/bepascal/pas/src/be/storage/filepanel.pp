{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere
                            Eric Jourde
                            Oscar Lesta

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
}
unit FilePanel;

interface

uses
  BeObj, Classes, OS, Entry, StorageDefs, Message, Messenger, Window, SupportDefs;

type
  BRefFilter = class(TBeObject)
  private
  public
    procedure Filter;
  end;

  file_panel_mode = (
    B_OPEN_PANEL,
    B_SAVE_PANEL
  );

  file_panel_button = (
    B_CANCEL_BUTTON,
    B_DEFAULT_BUTTON
  );

  BFilePanel = class(TBeObject)
  public
    constructor Create(mode : file_panel_mode; target : BMessenger;
                       const start_directory : entry_ref; node_flavors : integer;
                       allow_multiple_selection : Boolean; message : BMessage;
                       filter : BRefFilter; modal, hide_when_done : Boolean);
    destructor Destroy; override;
    procedure Show;
    procedure Hide;
    function IsShowing : Boolean;
    procedure WasHidden;
    procedure SelectionChanged;
    procedure SendMessage(Messager: BMessenger; Message : BMessage);
    function Window : BWindow;
    function Messenger : BMessenger;
    function RefFilter : BRefFilter;
    procedure GetPanelDirectory(entry: entry_ref);
    function PanelMode : file_panel_mode;
    procedure SetTarget(Mess: BMessenger);
    procedure SetMessage(msg : BMessage);
    procedure SetRefFilter(filter : BRefFilter);
    procedure SetSaveText(text : PChar);
    procedure SetButtonLabel(button : file_panel_button; alabel : PChar);
{
    procedure SetPanelDirectory(new_directory : );
    procedure SetPanelDirectory(new_directory : );
}
    procedure SetPanelDirectory(new_directory : entry_ref);
    procedure SetPanelDirectory(new_directory : PChar);
    procedure SetHideWhenDone(ahide: Boolean);
    function HidesWhenDone : Boolean;
    procedure Refresh;
    procedure Rewind;
    function GetNextSelectedRef(var ref : entry_ref) : status_t;
  end;

procedure BRefFilter_Filter(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRefFilter_Filter';
function BFilePanel_Create(AObject : TBeObject; mode : file_panel_mode; target : TCPlusObject;
                           const start_directory : entry_ref; node_flavors : integer;
                           allow_multiple_selection : Boolean; message : TCPlusObject;
                           filter : TCPlusObject; modal, hide_when_done : Boolean)
         : TCPlusObject; cdecl; external BePascalLibName name 'BFilePanel_Create';

procedure BFilePanel_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFilePanel_Free';
procedure BFilePanel_Show(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFilePanel_Show';
procedure BFilePanel_Hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFilePanel_Hide';

function BFilePanel_IsShowing(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BFilePanel_IsShowing';
procedure BFilePanel_WasHidden(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_WasHidden';
procedure BFilePanel_SelectionChanged(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_SelectionChanged';
procedure BFilePanel_SendMessage(AObject : TCPlusObject; mess : TCPlusObject; message : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_SendMessage';
function BFilePanel_Window(AObject : TCPlusObject) : BWindow;
         cdecl; external BePascalLibName name 'BFilePanel_Window';
//function BFilePanel_Messenger(AObject : TCPlusObject) : BMessenger; cdecl; external BePascalLibName name 'BFilePanel_Messenger';
function BFilePanel_RefFilter(AObject : TCPlusObject) : BRefFilter;
         cdecl; external BePascalLibName name 'BFilePanel_RefFilter';
procedure BFilePanel_GetPanelDirectory(AObject : TCPlusObject; entry : entry_ref);
          cdecl; external BePascalLibName name 'BFilePanel_GetPanelDirectory';
function BFilePanel_PanelMode(AObject : TCPlusObject) : BRefFilter;
         cdecl; external BePascalLibName name 'BFilePanel_PanelMode';
//procedure BFilePanel_SetTarget(AObject : TCPlusObject; Mess : TCPlusObject); cdecl; external BePascalLibName name 'BFilePanel_SetTarget';
procedure BFilePanel_SetMessage(AObject : TCPlusObject; msg : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_SetMessage';
procedure BFilePanel_SetRefFilter(AObject : TCPlusObject; filter : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_SetRefFilter';
procedure BFilePanel_SetSaveText(AObject : TCPlusObject; text : PChar);
          cdecl; external BePascalLibName name 'BFilePanel_SetSaveText';
procedure BFilePanel_SetButtonLabel(AObject : TCPlusObject; button : file_panel_button; alabel : PChar);
          cdecl; external BePascalLibName name 'BFilePanel_SetButtonLabel';
{
procedure BFilePanel_SetPanelDirectory(AObject : TCPlusObject; new_directory : ); cdecl; external BePascalLibName name 'BFilePanel_SetPanelDirectory';
procedure BFilePanel_SetPanelDirectory(AObject : TCPlusObject; new_directory : ); cdecl; external BePascalLibName name 'BFilePanel_SetPanelDirectory';
}
procedure BFilePanel_SetPanelDirectory(AObject : TCPlusObject; new_directory : entry_ref);
           cdecl; external BePascalLibName name 'BFilePanel_SetPanelDirectory';
procedure BFilePanel_SetPanelDirectory(AObject : TCPlusObject; new_directory : PChar);
          cdecl; external BePascalLibName name 'BFilePanel_SetPanelDirectory';
procedure BFilePanel_SetHideWhenDone(AObject : TCPlusObject;  hiden: Boolean);
          cdecl; external BePascalLibName name 'BFilePanel_SetHideWhenDone';
function BFilePanel_HidesWhenDone(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BFilePanel_HidesWhenDone';
procedure BFilePanel_Refresh(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_Refresh';
procedure BFilePanel_Rewind(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFilePanel_Rewind';
function BFilePanel_GetNextSelectedRef(AObject : TCPlusObject; var entry : entry_ref) : status_t;
         cdecl; external BePascalLibName name 'BFilePanel_GetNextSelectedRef';

implementation

procedure BRefFilter.Filter;
begin
//  BRefFilter_Filter(CPlusObject);
end;

constructor BFilePanel.Create(mode : file_panel_mode; target : BMessenger;
                              const start_directory : entry_ref; node_flavors : integer;
                              allow_multiple_selection : Boolean; message : BMessage;
                              filter : BRefFilter; modal  : Boolean;
                              hide_when_done : Boolean);
begin
  CreatePas;
  CPlusObject := BFilePanel_Create(Self, mode, GetCPlusObj(target), start_directory,
                                   node_flavors, allow_multiple_selection,
                                   GetCPlusObj(message), GetCPlusObj(filter), modal, hide_when_done);
end;

destructor BFilePanel.Destroy;
begin
  BFilePanel_Free(CPlusObject);
  inherited;
end;

procedure BFilePanel.Show;
begin
  BFilePanel_Show(CPlusObject);
end;

procedure BFilePanel.Hide;
begin
  BFilePanel_Hide(CPlusObject);
end;

function BFilePanel.IsShowing : Boolean;
begin
  Result := BFilePanel_IsShowing(CPlusObject);
end;

procedure BFilePanel.WasHidden;
begin
  BFilePanel_WasHidden(CPlusObject);
end;

procedure BFilePanel.SelectionChanged;
begin
  BFilePanel_SelectionChanged(CPlusObject);
end;

procedure BFilePanel.SendMessage(Messager : BMessenger; Message : BMessage);
begin
  BFilePanel_SendMessage(CPlusObject, Messager, Message.CPlusObject);
end;

function BFilePanel.Window : BWindow;
begin
  Result := BFilePanel_Window(CPlusObject);
end;

function BFilePanel.Messenger : BMessenger;
begin
//  Result := BFilePanel_Messenger(CPlusObject);
end;

function BFilePanel.RefFilter : BRefFilter;
begin
  Result := BFilePanel_RefFilter(CPlusObject);
end;

procedure BFilePanel.GetPanelDirectory(entry : entry_ref);
begin
  BFilePanel_GetPanelDirectory(CPlusObject, entry);
end;

function BFilePanel.PanelMode : file_panel_mode;
begin
//  Result := BFilePanel_PanelMode(CPlusObject);
end;

procedure BFilePanel.SetTarget(Mess : BMessenger);
begin
//  BFilePanel_SetTarget(CPlusObject, Mess.CPlusObject);
end;

procedure BFilePanel.SetMessage(msg : BMessage);
begin
  BFilePanel_SetMessage(CPlusObject, msg.CPlusObject);
end;

procedure BFilePanel.SetRefFilter(filter : BRefFilter);
begin
//  BFilePanel_SetRefFilter(CPlusObject, filter.CPlusObject);
end;

procedure BFilePanel.SetSaveText(text : PChar);
begin
  BFilePanel_SetSaveText(CPlusObject, text);
end;

procedure BFilePanel.SetButtonLabel(button : file_panel_button; alabel : PChar);
begin
  BFilePanel_SetButtonLabel(CPlusObject, button, alabel);
end;

{
procedure BFilePanel.SetPanelDirectory(new_directory : );
begin
  BFilePanel_SetPanelDirectory(CPlusObject, new_directory);
end;

procedure BFilePanel.SetPanelDirectory(new_directory : );
begin
  BFilePanel_SetPanelDirectory(CPlusObject, new_directory);
end;
}

procedure BFilePanel.SetPanelDirectory(new_directory : entry_ref);
begin
  BFilePanel_SetPanelDirectory(CPlusObject, new_directory);
end;

procedure BFilePanel.SetPanelDirectory(new_directory : PChar);
begin
  BFilePanel_SetPanelDirectory(CPlusObject, new_directory);
end;

procedure BFilePanel.SetHideWhenDone(ahide : Boolean);
begin
  BFilePanel_SetHideWhenDone(CPlusObject, ahide);
end;

function BFilePanel.HidesWhenDone : Boolean;
begin
  Result := BFilePanel_HidesWhenDone(CPlusObject);
end;

procedure BFilePanel.Refresh;
begin
  BFilePanel_Refresh(CPlusObject);
end;

procedure BFilePanel.Rewind;
begin
  BFilePanel_Rewind(CPlusObject);
end;

function BFilePanel.GetNextSelectedRef(var ref : entry_ref) : status_t;
begin
  Result := BFilePanel_GetNextSelectedRef(CPlusObject, ref);
end;

end.
