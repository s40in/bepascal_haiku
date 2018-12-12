{   BePascal - A pascal wrapper around the BeOS API
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
}                                                                               
unit outlinelistview;

interface

uses
     beobj, view, message, archivable, SupportDefs, rect, list,
  handler, messenger,interfacedefs,font,graphicdefs,scrollview,listitem,listview;

type
  BOutlineListView = class(BListView)
  private
  public
    constructor Create(aframe : BRect; name : pchar; atype : List_view_type; resizeMask: longint; aflags : longint); override;
    constructor Create(data : BMessage); 
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure MouseDown(where : BPoint);override;
    procedure KeyDown(bytes : PChar; numBytes : integer);override;
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(new_width : double; new_height : double);override;
    procedure MouseUp(where : BPoint);override;
    function AddUnder(item : BListItem; underItem : BListItem) : boolean;
    function AddItem(item : BListItem) : boolean;
    function AddItem(item : BListItem; fullListIndex : integer) : boolean;
    function AddList(newItems : BList) : boolean;
    function AddList(newItems : BList; fullListIndex : integer) : boolean;
    function RemoveItem(item : BListItem) : boolean;
    function RemoveItem(fullListIndex : integer) : BListItem;
    function RemoveItems(fullListIndex : integer; count : integer) : boolean;
    function FullListItemAt(fullListIndex : integer) : BListItem;
    function FullListIndexOf(point : BPoint) : integer;
    function FullListIndexOf(item : BListItem) : integer;
    function FullListFirstItem : BListItem;
    function FullListLastItem : BListItem;
    function FullListHasItem(item : BListItem) : boolean;
    function FullListCountItems : integer;
    function FullListCurrentSelection(index : integer) : integer;
    procedure MakeEmpty;
    function FullListIsEmpty : boolean;
    function Superitem(item : BListItem) : BListItem;
    procedure Expand(item : BListItem);
    procedure Collapse(item : BListItem);
    function IsExpanded(fullListIndex : integer) : boolean;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    procedure ResizeToPreferred;override;
    procedure GetPreferredSize(width : double; height : double);
    procedure MakeFocus(state : boolean);
    procedure AllAttached;override;
    procedure AllDetached;override;
    procedure DetachedFromWindow;override;
    function CountItemsUnder(under : BListItem; oneLevelOnly : boolean) : integer;
    function ItemUnderAt(underItem : BListItem; oneLevelOnly : boolean; index : integer) : BListItem;
//    function DoMiscellaneous(code : ; data : ) : boolean;
//    procedure MessageReceived( : BMessage);
  end;

function BOutlineListView_Create(AObject : TBeObject; frame : TCPlusObject; name : pchar; atype : list_view_type; resizeMask: longint; flags : longint):TCPlusObject; cdecl; external BePascalLibName name 'BOutlineListView_Create';
function BOutlineListView_Create_1(AObject : TBeObject;data : TCPlusObject):TCPlusObject; cdecl; external BePascalLibName name 'BOutlineListView_Create_1';
procedure BOutlineListView_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_Free';
function BOutlineListView_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BOutlineListView_Instantiate';
function BOutlineListView_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BOutlineListView_Archive';
procedure BOutlineListView_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_MouseDown';
procedure BOutlineListView_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BOutlineListView_KeyDown';
procedure BOutlineListView_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_FrameMoved';
procedure BOutlineListView_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BOutlineListView_FrameResized';
procedure BOutlineListView_MouseUp(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_MouseUp';
function BOutlineListView_AddUnder(AObject : TCPlusObject; item : TCPlusObject; underItem : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_AddUnder';
function BOutlineListView_AddItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_AddItem';
function BOutlineListView_AddItem(AObject : TCPlusObject; item : TCPlusObject; fullListIndex : integer) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_AddItem';
function BOutlineListView_AddList(AObject : TCPlusObject; newItems : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_AddList';
function BOutlineListView_AddList(AObject : TCPlusObject; newItems : TCPlusObject; fullListIndex : integer) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_AddList';
function BOutlineListView_RemoveItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_RemoveItem';
function BOutlineListView_RemoveItem_1(AObject : TCPlusObject; fullListIndex : integer) : TCPlusObject; cdecl; external BePascalLibName name 'BOutlineListView_RemoveItem_1';
function BOutlineListView_RemoveItems(AObject : TCPlusObject; fullListIndex : integer; count : integer) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_RemoveItems';
function BOutlineListView_FullListItemAt(AObject : TCPlusObject; fullListIndex : integer) : BListItem; cdecl; external BePascalLibName name 'BOutlineListView_FullListItemAt';
function BOutlineListView_FullListIndexOf(AObject : TCPlusObject; point : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BOutlineListView_FullListIndexOf';
function BOutlineListView_FullListIndexOf_1(AObject : TCPlusObject; item : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BOutlineListView_FullListIndexOf_1';
function BOutlineListView_FullListFirstItem(AObject : TCPlusObject) : BListItem; cdecl; external BePascalLibName name 'BOutlineListView_FullListFirstItem';
function BOutlineListView_FullListLastItem(AObject : TCPlusObject) : BListItem; cdecl; external BePascalLibName name 'BOutlineListView_FullListLastItem';
function BOutlineListView_FullListHasItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_FullListHasItem';
function BOutlineListView_FullListCountItems(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BOutlineListView_FullListCountItems';
function BOutlineListView_FullListCurrentSelection(AObject : TCPlusObject; index : integer) : integer; cdecl; external BePascalLibName name 'BOutlineListView_FullListCurrentSelection';
procedure BOutlineListView_MakeEmpty(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_MakeEmpty';
function BOutlineListView_FullListIsEmpty(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_FullListIsEmpty';
function BOutlineListView_Superitem(AObject : TCPlusObject; item : TCPlusObject) : BListItem; cdecl; external BePascalLibName name 'BOutlineListView_Superitem';
procedure BOutlineListView_Expand(AObject : TCPlusObject; item : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_Expand';
procedure BOutlineListView_Collapse(AObject : TCPlusObject; item : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_Collapse';
function BOutlineListView_IsExpanded(AObject : TCPlusObject; fullListIndex : integer) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_IsExpanded';
function BOutlineListView_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BOutlineListView_ResolveSpecifier';
function BOutlineListView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BOutlineListView_GetSupportedSuites';
function BOutlineListView_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BOutlineListView_Perform';
procedure BOutlineListView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_ResizeToPreferred';
procedure BOutlineListView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BOutlineListView_GetPreferredSize';
procedure BOutlineListView_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BOutlineListView_MakeFocus';
procedure BOutlineListView_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_AllAttached';
procedure BOutlineListView_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_AllDetached';
procedure BOutlineListView_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_DetachedFromWindow';
function BOutlineListView_CountItemsUnder(AObject : TCPlusObject; under : TCPlusObject; oneLevelOnly : boolean) : integer; cdecl; external BePascalLibName name 'BOutlineListView_CountItemsUnder';
function BOutlineListView_ItemUnderAt(AObject : TCPlusObject; underItem : TCPlusObject; oneLevelOnly : boolean; index : integer) : BListItem; cdecl; external BePascalLibName name 'BOutlineListView_ItemUnderAt';
//function BOutlineListView_DoMiscellaneous(AObject : TCPlusObject; code : ; data : ) : boolean; cdecl; external BePascalLibName name 'BOutlineListView_DoMiscellaneous';
//procedure BOutlineListView_MessageReceived(AObject : TCPlusObject;  : TCPlusObject); cdecl; external BePascalLibName name 'BOutlineListView_MessageReceived';

implementation


constructor BOutlineListView.Create(aframe : BRect; name : pchar; atype : list_view_type; resizeMask: longint; aflags : longint);
begin
  CreatePas;
  CPlusObject := BOutlineListView_Create(Self,aframe.CPlusObject,name,atype,resizeMask,aflags);
end;

constructor BOutlineListView.Create(data : BMessage); 
begin
  CreatePas;
  CPlusObject := BOutlineListView_Create_1(Self,data.CPlusObject);
end;

destructor BOutlineListView.Destroy;
begin
  BOutlineListView_Free(CPlusObject);
  inherited;
end;

function BOutlineListView.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BOutlineListView_Instantiate(CPlusObject, data.CPlusObject);
end;

function BOutlineListView.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BOutlineListView_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BOutlineListView.MouseDown(where : BPoint);
begin
//  BOutlineListView_MouseDown(CPlusObject, where.CPlusObject);
end;

procedure BOutlineListView.KeyDown(bytes : PChar; numBytes : integer);
begin
 // BOutlineListView_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure BOutlineListView.FrameMoved(new_position : BPoint);
begin
//  BOutlineListView_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BOutlineListView.FrameResized(new_width : double; new_height : double);
begin
//  BOutlineListView_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BOutlineListView.MouseUp(where : BPoint);
begin
//  BOutlineListView_MouseUp(CPlusObject, where.CPlusObject);
end;

function BOutlineListView.AddUnder(item : BListItem; underItem : BListItem) : boolean;
begin
  Result := BOutlineListView_AddUnder(CPlusObject, item.CPlusObject, underItem.CPlusObject);
end;

function BOutlineListView.AddItem(item : BListItem) : boolean;
begin
  Result := BOutlineListView_AddItem(CPlusObject, item.CPlusObject);
end;

function BOutlineListView.AddItem(item : BListItem; fullListIndex : integer) : boolean;
begin
  Result := BOutlineListView_AddItem(CPlusObject, item.CPlusObject, fullListIndex);
end;

function BOutlineListView.AddList(newItems : BList) : boolean;
begin
  Result := BOutlineListView_AddList(CPlusObject, newItems.CPlusObject);
end;

function BOutlineListView.AddList(newItems : BList; fullListIndex : integer) : boolean;
begin
  Result := BOutlineListView_AddList(CPlusObject, newItems.CPlusObject, fullListIndex);
end;

function BOutlineListView.RemoveItem(item : BListItem) : boolean;
begin
  Result := BOutlineListView_RemoveItem(CPlusObject, item.CPlusObject);
end;

function BOutlineListView.RemoveItem(fullListIndex : integer) : BListItem;
begin
//  Result := BOutlineListView_RemoveItem_1(CPlusObject, fullListIndex);
end;

function BOutlineListView.RemoveItems(fullListIndex : integer; count : integer) : boolean;
begin
  Result := BOutlineListView_RemoveItems(CPlusObject, fullListIndex, count);
end;

function BOutlineListView.FullListItemAt(fullListIndex : integer) : BListItem;
begin
  Result := BOutlineListView_FullListItemAt(CPlusObject, fullListIndex);
end;

function BOutlineListView.FullListIndexOf(point : BPoint) : integer;
begin
  Result := BOutlineListView_FullListIndexOf(CPlusObject, point.CPlusObject);
end;

function BOutlineListView.FullListIndexOf(item : BListItem) : integer;
begin
  Result := BOutlineListView_FullListIndexOf(CPlusObject, item.CPlusObject);
end;

function BOutlineListView.FullListFirstItem : BListItem;
begin
  Result := BOutlineListView_FullListFirstItem(CPlusObject);
end;

function BOutlineListView.FullListLastItem : BListItem;
begin
  Result := BOutlineListView_FullListLastItem(CPlusObject);
end;

function BOutlineListView.FullListHasItem(item : BListItem) : boolean;
begin
  Result := BOutlineListView_FullListHasItem(CPlusObject, item.CPlusObject);
end;

function BOutlineListView.FullListCountItems : integer;
begin
  Result := BOutlineListView_FullListCountItems(CPlusObject);
end;

function BOutlineListView.FullListCurrentSelection(index : integer) : integer;
begin
  Result := BOutlineListView_FullListCurrentSelection(CPlusObject, index);
end;

procedure BOutlineListView.MakeEmpty;
begin
  BOutlineListView_MakeEmpty(CPlusObject);
end;

function BOutlineListView.FullListIsEmpty : boolean;
begin
  Result := BOutlineListView_FullListIsEmpty(CPlusObject);
end;

function BOutlineListView.Superitem(item : BListItem) : BListItem;
begin
  Result := BOutlineListView_Superitem(CPlusObject, item);
end;

procedure BOutlineListView.Expand(item : BListItem);
begin
  BOutlineListView_Expand(CPlusObject, item.CPlusObject);
end;

procedure BOutlineListView.Collapse(item : BListItem);
begin
  BOutlineListView_Collapse(CPlusObject, item.CPlusObject);
end;

function BOutlineListView.IsExpanded(fullListIndex : integer) : boolean;
begin
  Result := BOutlineListView_IsExpanded(CPlusObject, fullListIndex);
end;

function BOutlineListView.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BOutlineListView_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BOutlineListView.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BOutlineListView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BOutlineListView.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BOutlineListView_Perform(CPlusObject, d, arg);
end;

procedure BOutlineListView.ResizeToPreferred;
begin
  BOutlineListView_ResizeToPreferred(CPlusObject);
end;

procedure BOutlineListView.GetPreferredSize(width : double; height : double);
begin
  BOutlineListView_GetPreferredSize(CPlusObject, width, height);
end;

procedure BOutlineListView.MakeFocus(state : boolean);
begin
  BOutlineListView_MakeFocus(CPlusObject, state);
end;

procedure BOutlineListView.AllAttached;
begin
  BOutlineListView_AllAttached(CPlusObject);
end;

procedure BOutlineListView.AllDetached;
begin
  BOutlineListView_AllDetached(CPlusObject);
end;

procedure BOutlineListView.DetachedFromWindow;
begin
  BOutlineListView_DetachedFromWindow(CPlusObject);
end;

function BOutlineListView.CountItemsUnder(under : BListItem; oneLevelOnly : boolean) : integer;
begin
  Result := BOutlineListView_CountItemsUnder(CPlusObject, under.CPlusObject, oneLevelOnly);
end;

function BOutlineListView.ItemUnderAt(underItem : BListItem; oneLevelOnly : boolean; index : integer) : BListItem;
begin
  Result := BOutlineListView_ItemUnderAt(CPlusObject, underItem.CPlusObject, oneLevelOnly, index);
end;

{function BOutlineListView.DoMiscellaneous(code : ; data : ) : boolean;
begin
  Result := BOutlineListView_DoMiscellaneous(CPlusObject, code, data);
end;

procedure BOutlineListView.MessageReceived( : BMessage);
begin
  BOutlineListView_MessageReceived(CPlusObject, .CPlusObject);
end;
}


end.
