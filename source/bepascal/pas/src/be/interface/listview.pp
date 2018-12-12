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
unit listview;

interface

uses
     beobj, view, message, archivable, SupportDefs, rect, list,
  handler, messenger,interfacedefs,font,graphicdefs,scrollview,listitem;

type
list_view_type =(
	B_SINGLE_SELECTION_LIST,
	B_MULTIPLE_SELECTION_LIST
);


type
  BListView = class(BView)
  private
  public
    constructor Create(aframe : BRect; name : pchar; atype : list_view_type; resizeMask: longint; sflags : longint); virtual;
    constructor Create(data : BMessage);
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure Draw(updateRect : BRect);override;
    procedure MessageReceived(msg : BMessage);override;
    procedure MouseDown(where : BPoint);override;
    procedure KeyDown(bytes : PChar; numBytes : integer);override;
    procedure MakeFocus(state : boolean);
    procedure FrameResized(newWidth : double; newHeight : double);override;
    procedure TargetedByScrollView(scroller : BScrollView);
    procedure ScrollTo(x : double; y : double);
    procedure ScrollTo(where : BPoint);
    function AddItem(item : BListItem) : boolean;
    function AddItem(item : BListItem; atIndex : integer) : boolean;
    function AddList(newItems : BList) : boolean;
    function AddList(newItems : BList; atIndex : integer) : boolean;
    function RemoveItem(item : BListItem) : boolean;
    function RemoveItem(index : integer) : BListItem;
    function RemoveItems(index : integer; count : integer) : boolean;
    procedure SetSelectionMessage(message : BMessage);
    procedure SetInvocationMessage(message : BMessage);
    function SelectionMessage : BMessage;
    function SelectionCommand : Cardinal;
    function InvocationMessage : BMessage;
    function InvocationCommand : Cardinal;
    procedure SetListType(atype : list_view_type);
    function ListType : list_view_type;
    function ItemAt(index : integer) : BListItem;
    function IndexOf(point : BPoint) : integer;
    function IndexOf(item : BListItem) : integer;
    function FirstItem : BListItem;
    function LastItem : BListItem;
    function HasItem(item : BListItem) : boolean;
    function CountItems : integer;
    procedure MakeEmpty;
    function IsEmpty : boolean;
    function Items : BListView;
    procedure InvalidateItem(index : integer);
    procedure ScrollToSelection;
    procedure Select(index : integer; extend : boolean);
    procedure Select(from : integer; ato : integer; extend : boolean);
    function IsItemSelected(index : integer) : boolean;
    function CurrentSelection(index : integer) : integer;
    function Invoke(msg : BMessage) : Status_t;
    procedure DeselectAll;
    procedure DeselectExcept(except_from : integer; except_to : integer);
    procedure Deselect(index : integer);
    procedure SelectionChanged; virtual;
    function SwapItems(a : integer; b : integer) : boolean;
    function MoveItem(from : integer; ato : integer) : boolean;
    function ReplaceItem(index : integer; item : BListItem) : boolean;
    procedure AttachedToWindow;override;
    procedure FrameMoved(new_position : BPoint);override;
    function ItemFrame(index : integer) : BRect;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    procedure WindowActivated(state : boolean);override;
    procedure MouseUp(pt : BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
    function InitiateDrag(pt : BPoint; itemIndex : integer; initialySelected : boolean) : boolean;
    procedure ResizeToPreferred;override;
    procedure GetPreferredSize(width : double; height : double);
    procedure AllAttached;override;
    procedure AllDetached;override;
//    procedure enum MiscCode { B_NO_OP, B_REPLACE_OP, B_MOVE_OP, B_SWAP_OP };
  end;


function BListView_Create(AObject : TBeObject;frame : TCPlusObject; name : pchar; atype : list_view_type; resizeMask: longint; flags : longint): TCPlusObject; cdecl; external BePascalLibName name 'BListView_Create';
function BListView_Create(AObject : TBeObject;data : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BListView_Create_1';
procedure BListView_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_Free';
function BListView_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BListView_Instantiate';
function BListView_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BListView_Archive';
procedure BListView_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BListView_Draw';
procedure BListView_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BListView_MessageReceived';
procedure BListView_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BListView_MouseDown';
procedure BListView_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BListView_KeyDown';
procedure BListView_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BListView_MakeFocus';
procedure BListView_FrameResized(AObject : TCPlusObject; newWidth : double; newHeight : double); cdecl; external BePascalLibName name 'BListView_FrameResized';
procedure BListView_TargetedByScrollView(AObject : TCPlusObject; scroller : TCPlusObject); cdecl; external BePascalLibName name 'BListView_TargetedByScrollView';
procedure BListView_ScrollTo(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BListView_ScrollTo';
procedure BListView_ScrollTo(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BListView_ScrollTo';
function BListView_AddItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BListView_AddItem';
function BListView_AddItem(AObject : TCPlusObject; item : TCPlusObject; atIndex : integer) : boolean; cdecl; external BePascalLibName name 'BListView_AddItem';
function BListView_AddList(AObject : TCPlusObject; newItems : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BListView_AddList';
function BListView_AddList(AObject : TCPlusObject; newItems : TCPlusObject; atIndex : integer) : boolean; cdecl; external BePascalLibName name 'BListView_AddList';
function BListView_RemoveItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BListView_RemoveItem';
function BListView_RemoveItem(AObject : TCPlusObject; index : integer) : BListItem; cdecl; external BePascalLibName name 'BListView_RemoveItem_1';
function BListView_RemoveItems(AObject : TCPlusObject; index : integer; count : integer) : boolean; cdecl; external BePascalLibName name 'BListView_RemoveItems_2';
procedure BListView_SetSelectionMessage(AObject : TCPlusObject; message : TCPlusObject); cdecl; external BePascalLibName name 'BListView_SetSelectionMessage';
procedure BListView_SetInvocationMessage(AObject : TCPlusObject; message : TCPlusObject); cdecl; external BePascalLibName name 'BListView_SetInvocationMessage';
function BListView_SelectionMessage(AObject : TCPlusObject) : BMessage; cdecl; external BePascalLibName name 'BListView_SelectionMessage';
function BListView_SelectionCommand(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BListView_SelectionCommand';
function BListView_InvocationMessage(AObject : TCPlusObject) : BMessage; cdecl; external BePascalLibName name 'BListView_InvocationMessage';
function BListView_InvocationCommand(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BListView_InvocationCommand';
procedure BListView_SetListType(AObject : TCPlusObject; atype : list_view_type); cdecl; external BePascalLibName name 'BListView_SetListType';
function BListView_ListType(AObject : TCPlusObject) : list_view_type; cdecl; external BePascalLibName name 'BListView_ListType';
function BListView_ItemAt(AObject : TCPlusObject; index : integer) : BListItem; cdecl; external BePascalLibName name 'BListView_ItemAt';
function BListView_IndexOf(AObject : TCPlusObject; point : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BListView_IndexOf';
function BListView_IndexOf_1(AObject : TCPlusObject; item : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BListView_IndexOf';
function BListView_FirstItem(AObject : TCPlusObject) : BListItem; cdecl; external BePascalLibName name 'BListView_FirstItem';
function BListView_LastItem(AObject : TCPlusObject) : BListItem; cdecl; external BePascalLibName name 'BListView_LastItem';
function BListView_HasItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BListView_HasItem';
function BListView_CountItems(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BListView_CountItems';
procedure BListView_MakeEmpty(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_MakeEmpty';
function BListView_IsEmpty(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BListView_IsEmpty';
function BListView_Items(AObject : TCPlusObject) : BListView; cdecl; external BePascalLibName name 'BListView_Items';
procedure BListView_InvalidateItem(AObject : TCPlusObject; index : integer); cdecl; external BePascalLibName name 'BListView_InvalidateItem';
procedure BListView_ScrollToSelection(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_ScrollToSelection';
procedure BListView_Select(AObject : TCPlusObject; index : integer; extend : boolean); cdecl; external BePascalLibName name 'BListView_Select';
procedure BListView_Select(AObject : TCPlusObject; from : integer; ato : integer; extend : boolean); cdecl; external BePascalLibName name 'BListView_Select';
function BListView_IsItemSelected(AObject : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BListView_IsItemSelected';
function BListView_CurrentSelection(AObject : TCPlusObject; index : integer) : integer; cdecl; external BePascalLibName name 'BListView_CurrentSelection';
function BListView_Invoke(AObject : TCPlusObject; msg : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BListView_Invoke';
procedure BListView_DeselectAll(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_DeselectAll';
procedure BListView_DeselectExcept(AObject : TCPlusObject; except_from : integer; except_to : integer); cdecl; external BePascalLibName name 'BListView_DeselectExcept';
procedure BListView_Deselect(AObject : TCPlusObject; index : integer); cdecl; external BePascalLibName name 'BListView_Deselect';
procedure BListView_SelectionChanged(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_SelectionChanged';
function BListView_SwapItems(AObject : TCPlusObject; a : integer; b : integer) : boolean; cdecl; external BePascalLibName name 'BListView_SwapItems';
function BListView_MoveItem(AObject : TCPlusObject; from : integer; ato : integer) : boolean; cdecl; external BePascalLibName name 'BListView_MoveItem';
function BListView_ReplaceItem(AObject : TCPlusObject; index : integer; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BListView_ReplaceItem';
procedure BListView_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_AttachedToWindow';
procedure BListView_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BListView_FrameMoved';
function BListView_ItemFrame(AObject : TCPlusObject; index : integer) : BRect; cdecl; external BePascalLibName name 'BListView_ItemFrame';
function BListView_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BListView_ResolveSpecifier';
function BListView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BListView_GetSupportedSuites';
function BListView_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BListView_Perform';
procedure BListView_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BListView_WindowActivated';
procedure BListView_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BListView_MouseUp';
procedure BListView_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BListView_MouseMoved';
procedure BListView_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_DetachedFromWindow';
function BListView_InitiateDrag(AObject : TCPlusObject; pt : TCPlusObject; itemIndex : integer; initialySelected : boolean) : boolean; cdecl; external BePascalLibName name 'BListView_InitiateDrag';
procedure BListView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_ResizeToPreferred';
procedure BListView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BListView_GetPreferredSize';
procedure BListView_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_AllAttached';
procedure BListView_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_AllDetached';
//procedure BListView_enum MiscCode { B_NO_OP, B_REPLACE_OP, B_MOVE_OP, B_SWAP_OP }(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BListView_enum MiscCode { B_NO_OP, B_REPLACE_OP, B_MOVE_OP, B_SWAP_OP }';
//procedure Replace_int32 index(AObject : TCPlusObject); cdecl; external BePascalLibName name 'Replace_int32 index';
//procedure Replace_BListItem *item(AObject : TCPlusObject); cdecl; external BePascalLibName name 'Replace_BListItem *item';
//procedure Move_int32 from(AObject : TCPlusObject); cdecl; external BePascalLibName name 'Move_int32 from';
//procedure Move_int32 to(AObject : TCPlusObject); cdecl; external BePascalLibName name 'Move_int32 to';
//procedure Swap_int32 a(AObject : TCPlusObject); cdecl; external BePascalLibName name 'Swap_int32 a';
//procedure Swap_int32 b(AObject : TCPlusObject); cdecl; external BePascalLibName name 'Swap_int32 b';

implementation
var
	ListItem_SelectionChanged_hook: Pointer; cvar; external;
	ListString_InitiateDrag_hook: Pointer; cvar; external;

constructor BListView.Create(aframe : BRect; name : pchar; atype : list_view_type; resizeMask: longint; sflags : longint);
begin
  CreatePas;
  CPlusObject := BListView_Create(Self,aframe.CPlusObject,name,atype,resizeMask,sflags);
end;

constructor BListView.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BListView_Create(Self,data.CPlusObject);
end;

destructor BListView.Destroy;
begin
  BListView_Free(CPlusObject);
  inherited;
end;

function BListView.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BListView_Instantiate(CPlusObject, data.CPlusObject);
end;

function BListView.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BListView_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BListView.Draw(updateRect : BRect);
begin
  //BListView_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure BListView.MessageReceived(msg : BMessage);
begin
  //BListView_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BListView.MouseDown(where : BPoint);
begin
  //BListView_MouseDown(CPlusObject, where.CPlusObject);
end;

procedure BListView.KeyDown(bytes : PChar; numBytes : integer);
begin
  //BListView_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure BListView.MakeFocus(state : boolean);
begin
  //BListView_MakeFocus(CPlusObject, state);
end;

procedure BListView.FrameResized(newWidth : double; newHeight : double);
begin
  //BListView_FrameResized(CPlusObject, newWidth, newHeight);
end;

procedure BListView.TargetedByScrollView(scroller : BScrollView);
begin
  BListView_TargetedByScrollView(CPlusObject, scroller.CPlusObject);
end;

procedure BListView.ScrollTo(x : double; y : double);
begin
  BListView_ScrollTo(CPlusObject, x, y);
end;

procedure BListView.ScrollTo(where : BPoint);
begin
  BListView_ScrollTo(CPlusObject, where.CPlusObject);
end;

function BListView.AddItem(item : BListItem) : boolean;
begin
  Result := BListView_AddItem(CPlusObject, item.CPlusObject);
end;

function BListView.AddItem(item : BListItem; atIndex : integer) : boolean;
begin
  Result := BListView_AddItem(CPlusObject, item.CPlusObject, atIndex);
end;

function BListView.AddList(newItems : BList) : boolean;
begin
  Result := BListView_AddList(CPlusObject, newItems.CPlusObject);
end;

function BListView.AddList(newItems : BList; atIndex : integer) : boolean;
begin
  Result := BListView_AddList(CPlusObject, newItems.CPlusObject, atIndex);
end;

function BListView.RemoveItem(item : BListItem) : boolean;
begin
  Result := BListView_RemoveItem(CPlusObject, item.CPlusObject);
end;

function BListView.RemoveItem(index : integer) : BListItem;
begin
  Result := BListView_RemoveItem(CPlusObject, index);
end;

function BListView.RemoveItems(index : integer; count : integer) : boolean;
begin
  Result := BListView_RemoveItems(CPlusObject, index, count);
end;

procedure BListView.SetSelectionMessage(message : BMessage);
begin
  BListView_SetSelectionMessage(CPlusObject, message.CPlusObject);
end;

procedure BListView.SetInvocationMessage(message : BMessage);
begin
  BListView_SetInvocationMessage(CPlusObject, message.CPlusObject);
end;

function BListView.SelectionMessage : BMessage;
begin
  Result := BListView_SelectionMessage(CPlusObject);
end;

function BListView.SelectionCommand : Cardinal;
begin
  Result := BListView_SelectionCommand(CPlusObject);
end;

function BListView.InvocationMessage : BMessage;
begin
  Result := BListView_InvocationMessage(CPlusObject);
end;

function BListView.InvocationCommand : Cardinal;
begin
  Result := BListView_InvocationCommand(CPlusObject);
end;

procedure BListView.SetListType(atype : list_view_type);
begin
  BListView_SetListType(CPlusObject, atype);
end;

function BListView.ListType : list_view_type;
begin
  Result := BListView_ListType(CPlusObject);
end;

function BListView.ItemAt(index : integer) : BListItem;
begin
  Result := BListView_ItemAt(CPlusObject, index);
end;

function BListView.IndexOf(point : BPoint) : integer;
begin
  Result := BListView_IndexOf(CPlusObject, point.CPlusObject);
end;

function BListView.IndexOf(item : BListItem) : integer;
begin
  Result := BListView_IndexOf(CPlusObject, item.CPlusObject);
end;

function BListView.FirstItem : BListItem;
begin
  Result := BListView_FirstItem(CPlusObject);
end;

function BListView.LastItem : BListItem;
begin
  Result := BListView_LastItem(CPlusObject);
end;

function BListView.HasItem(item : BListItem) : boolean;
begin
  Result := BListView_HasItem(CPlusObject, item.CPlusObject);
end;

function BListView.CountItems : integer;
begin
  Result := BListView_CountItems(CPlusObject);
end;

procedure BListView.MakeEmpty;
begin
  BListView_MakeEmpty(CPlusObject);
end;

function BListView.IsEmpty : boolean;
begin
  Result := BListView_IsEmpty(CPlusObject);
end;

function BListView.Items : BListView;
begin
  Result := BListView_Items(CPlusObject);
end;

procedure BListView.InvalidateItem(index : integer);
begin
  BListView_InvalidateItem(CPlusObject, index);
end;

procedure BListView.ScrollToSelection;
begin
  BListView_ScrollToSelection(CPlusObject);
end;

procedure BListView.Select(index : integer; extend : boolean);
begin
  BListView_Select(CPlusObject, index, extend);
end;

procedure BListView.Select(from : integer; ato : integer; extend : boolean);
begin
  BListView_Select(CPlusObject, from, ato, extend);
end;

function BListView.IsItemSelected(index : integer) : boolean;
begin
  Result := BListView_IsItemSelected(CPlusObject, index);
end;

function BListView.CurrentSelection(index : integer) : integer;
begin
  Result := BListView_CurrentSelection(CPlusObject, index);
end;

function BListView.Invoke(msg : BMessage) : Status_t;
begin
  Result := BListView_Invoke(CPlusObject, msg.CPlusObject);
end;

procedure BListView.DeselectAll;
begin
  BListView_DeselectAll(CPlusObject);
end;

procedure BListView.DeselectExcept(except_from : integer; except_to : integer);
begin
  BListView_DeselectExcept(CPlusObject, except_from, except_to);
end;

procedure BListView.Deselect(index : integer);
begin
  BListView_Deselect(CPlusObject, index);
end;

procedure BListView.SelectionChanged;
begin
  //BListView_SelectionChanged(CPlusObject);
end;

function BListView.SwapItems(a : integer; b : integer) : boolean;
begin
  Result := BListView_SwapItems(CPlusObject, a, b);
end;

function BListView.MoveItem(from : integer; ato : integer) : boolean;
begin
  Result := BListView_MoveItem(CPlusObject, from, ato);
end;

function BListView.ReplaceItem(index : integer; item : BListItem) : boolean;
begin
  Result := BListView_ReplaceItem(CPlusObject, index, item.CPlusObject);
end;

procedure BListView.AttachedToWindow;
begin
  //BListView_AttachedToWindow(CPlusObject);
end;

procedure BListView.FrameMoved(new_position : BPoint);
begin
  //BListView_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

function BListView.ItemFrame(index : integer) : BRect;
begin
  Result := BListView_ItemFrame(CPlusObject, index);
end;

function BListView.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BListView_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BListView.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BListView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BListView.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BListView_Perform(CPlusObject, d, arg);
end;

procedure BListView.WindowActivated(state : boolean);
begin
  //BListView_WindowActivated(CPlusObject, state);
end;

procedure BListView.MouseUp(pt : BPoint);
begin
  //BListView_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BListView.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  //BListView_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BListView.DetachedFromWindow;
begin
  //BListView_DetachedFromWindow(CPlusObject);
end;

function BListView.InitiateDrag(pt : BPoint; itemIndex : integer; initialySelected : boolean) : boolean;
begin
  Result := BListView_InitiateDrag(CPlusObject, pt.CPlusObject, itemIndex, initialySelected);
end;

procedure BListView.ResizeToPreferred;
begin
  //BListView_ResizeToPreferred(CPlusObject);
end;

procedure BListView.GetPreferredSize(width : double; height : double);
begin
 // BListView_GetPreferredSize(CPlusObject, width, height);
end;

procedure BListView.AllAttached;
begin
  //BListView_AllAttached(CPlusObject);
end;

procedure BListView.AllDetached;
begin
  //BListView_AllDetached(CPlusObject);
end;

procedure ListItem_SelectionChanged_hook_func(Liste : BListView); cdecl;
begin
  try
 	 if Liste <> nil then
 	 begin
	    Liste.SelectionChanged;
	  end;  
   finally
   end; 
end;

procedure ListString_InitiateDrag_hook_func(Liste : BListView); cdecl;
begin
  try
 	 if Liste <> nil then
 	 begin
	    Liste.SelectionChanged;
	  end;  
   finally
   end; 
end;

initialization
 ListItem_SelectionChanged_hook:=@ListItem_SelectionChanged_hook_func;
 ListString_InitiateDrag_hook:=@ListString_InitiateDrag_hook_func;
end.
