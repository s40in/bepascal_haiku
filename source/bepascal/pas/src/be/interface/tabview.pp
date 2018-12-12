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
unit tabview;

interface

uses
  beobj, interfacedefs,view,Message, Archivable, SupportDefs, Rect, Handler,font;

const
	B_TAB_FIRST = 999;
	B_TAB_FRONT=1;
	B_TAB_ANY=2;
type
  BTab = class(TBeObject)
  private
  public
    constructor Create(View : BView);virtual;
    constructor Create_1(data : BMessage);virtual;
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    function Perform(d : Cardinal; arg : Pointer) : Status_t;
    function GetLabel : PChar;
    procedure SetLabel(alabel : PChar);
    function IsSelected : boolean;
    procedure Select(owner : BView);
    procedure Deselect;
    procedure SetEnabled(aon : boolean);
    function IsEnabled : boolean;
    procedure MakeFocus(infocus : boolean);
    function IsFocus : boolean;
    procedure SeBView(contents : BView);
    function GeBView : BView;
    procedure DrawFocusMark(owner : BView; tabFrame : BRect);
    procedure DrawLabel(owner : BView; tabFrame : BRect);
    procedure DrawTab(owner : BView; tabFrame : BRect; position : byte; full : boolean);
  end;


type
  BTabView = class(BView)
  private
  public
    destructor Destroy;override;
    constructor Create(aframe : BRect; name : Pchar; width : button_width; sresizingMode : cardinal; sflags : cardinal);virtual;
    constructor Create(msg : BMessage);virtual;
    function Instantiate( msg: BMessage) : BArchivable;
    function Archive( msg : BMessage; deep : boolean) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    procedure WindowActivated(state : boolean);override;
    procedure AttachedToWindow;override;
    procedure AllAttached;override;
    procedure AllDetached;override;
    procedure DetachedFromWindow;override;
    procedure MessageReceived(msg : BMessage);override;
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(w : double; h : double);override;
    procedure KeyDown(bytes : PChar; n : integer);override;
    procedure MouseDown( pt: BPoint);override;
    procedure MouseUp( pt: BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure Pulse;override;
    procedure Select(tabIndex : integer);
    function Selection : integer;
    procedure MakeFocus(focusState : boolean);
    procedure SetFocusTab(tabIndex : integer; focusState : boolean);
    function FocusTab : integer;
    procedure Draw( rect: BRect);override;
    function DrawTabs : BRect;
    procedure DrawBox(selectedTabFrame : BRect);
    function TabFrame(tabIndex : integer) : BRect;
    procedure SetFlags(sflags : Cardinal);
    procedure SetResizingMode(mode : Cardinal);
    procedure GetPreferredSize(width : double; height : double);
    procedure ResizeToPreferred;override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    procedure AddTab(tabContents : BView; tab : BTab);
    function RemoveTab(tabIndex : integer) : BTab;
    function TabAt(tabIndex : integer) : BTab;
    procedure SetTabWidth(s : button_width);
    function TabWidth : button_width;
    procedure SetTabHeight(height : double);
    function TabHeight : double;
    function ContainerView : BView;
    function CountTabs : integer;
    function ViewForTab(tabIndex : integer) : BView;
  end;

function BTab_Create(AObject : TBeObject;View : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BTab_Create';
procedure BTab_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTab_Free';
function BTab_Create_1(AObject : TBeObject; data : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BTab_Create_1';
function BTab_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BTab_Instantiate';
function BTab_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BTab_Archive';
function BTab_Perform(AObject : TCPlusObject; d : Cardinal; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BTab_Perform';
function BTab_Label(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BTab_Label';
procedure BTab_SetLabel(AObject : TCPlusObject; alabel : PChar); cdecl; external BePascalLibName name 'BTab_SetLabel';
function BTab_IsSelected(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTab_IsSelected';
procedure BTab_Select(AObject : TCPlusObject; owner : TCPlusObject); cdecl; external BePascalLibName name 'BTab_Select';
procedure BTab_Deselect(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTab_Deselect';
procedure BTab_SetEnabled(AObject : TCPlusObject; aon : boolean); cdecl; external BePascalLibName name 'BTab_SetEnabled';
function BTab_IsEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTab_IsEnabled';
procedure BTab_MakeFocus(AObject : TCPlusObject; infocus : boolean); cdecl; external BePascalLibName name 'BTab_MakeFocus';
function BTab_IsFocus(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTab_IsFocus';
procedure BTab_SeBView(AObject : TCPlusObject; contents : TCPlusObject); cdecl; external BePascalLibName name 'BTab_SetView';
function BTab_View(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BTab_View';
procedure BTab_DrawFocusMark(AObject : TCPlusObject; owner : TCPlusObject; tabFrame : TCPlusObject); cdecl; external BePascalLibName name 'BTab_DrawFocusMark';
procedure BTab_DrawLabel(AObject : TCPlusObject; owner : TCPlusObject; tabFrame : TCPlusObject); cdecl; external BePascalLibName name 'BTab_DrawLabel';
procedure BTab_DrawTab(AObject : TCPlusObject; owner : TCPlusObject; tabFrame : TCPlusObject; position : byte; full : boolean); cdecl; external BePascalLibName name 'BTab_DrawTab';

procedure BTabView_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_Free';
function BTabView_Create(AObject : TBeObject;frame : TCPlusObject; name : Pchar; width : Integer; resizingMode : cardinal; flags : cardinal): TCPlusObject; cdecl; external BePascalLibName name 'BTabView_Create';
function BTabView_Create_1(AObject : TBeObject; msg : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BTabView_Create_1';
function BTabView_Instantiate(AObject : TCPlusObject; msg : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BTabView_Instantiate';
function BTabView_Archive(AObject : TCPlusObject; msg : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BTabView_Archive';
function BTabView_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BTabView_Perform';
procedure BTabView_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BTabView_WindowActivated';
procedure BTabView_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_AttachedToWindow';
procedure BTabView_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_AllAttached';
procedure BTabView_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_AllDetached';
procedure BTabView_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_DetachedFromWindow';
procedure BTabView_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_MessageReceived';
procedure BTabView_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_FrameMoved';
procedure BTabView_FrameResized(AObject : TCPlusObject; w : double; h : double); cdecl; external BePascalLibName name 'BTabView_FrameResized';
procedure BTabView_KeyDown(AObject : TCPlusObject; bytes : PChar; n : integer); cdecl; external BePascalLibName name 'BTabView_KeyDown';
procedure BTabView_MouseDown(AObject : TCPlusObject;  pt: TCPlusObject); cdecl; external BePascalLibName name 'BTabView_MouseDown';
procedure BTabView_MouseUp(AObject : TCPlusObject;  pt: TCPlusObject); cdecl; external BePascalLibName name 'BTabView_MouseUp';
procedure BTabView_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_MouseMoved';
procedure BTabView_Pulse(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_Pulse';
procedure BTabView_Select(AObject : TCPlusObject; tabIndex : integer); cdecl; external BePascalLibName name 'BTabView_Select';
//function BTabView_Selection(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTabView_Selection';
procedure BTabView_MakeFocus(AObject : TCPlusObject; focusState : boolean); cdecl; external BePascalLibName name 'BTabView_MakeFocus';
procedure BTabView_SetFocusTab(AObject : TCPlusObject; tabIndex : integer; focusState : boolean); cdecl; external BePascalLibName name 'BTabView_SetFocusTab';
function BTabView_FocusTab(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTabView_FocusTab';
procedure BTabView_Draw(AObject : TCPlusObject; rect : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_Draw';
//function BTabView_DrawTabs(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BTabView_DrawTabs';
procedure BTabView_DrawBox(AObject : TCPlusObject; selectedTabFrame : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_DrawBox';
function BTabView_TabFrame(AObject : TCPlusObject; tabIndex : integer) : BRect; cdecl; external BePascalLibName name 'BTabView_TabFrame';
procedure BTabView_SetFlags(AObject : TCPlusObject; flags : Cardinal); cdecl; external BePascalLibName name 'BTabView_SetFlags';
procedure BTabView_SetResizingMode(AObject : TCPlusObject; mode : Cardinal); cdecl; external BePascalLibName name 'BTabView_SetResizingMode';
procedure BTabView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BTabView_GetPreferredSize';
procedure BTabView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_ResizeToPreferred';
function BTabView_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properto : PChar) : BHandler; cdecl; external BePascalLibName name 'BTabView_ResolveSpecifier';
function BTabView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BTabView_GetSupportedSuites';
procedure BTabView_AddTab(AObject : TCPlusObject; tabContents : TCPlusObject; tab : TCPlusObject); cdecl; external BePascalLibName name 'BTabView_AddTab';
function BTabView_RemoveTab(AObject : TCPlusObject; tabIndex : integer) : BTab; cdecl; external BePascalLibName name 'BTabView_RemoveTab';
function BTabView_TabAt(AObject : TCPlusObject; tabIndex : integer) : BTab; cdecl; external BePascalLibName name 'BTabView_TabAt';
procedure BTabView_SetTabWidth(AObject : TCPlusObject; s : button_width); cdecl; external BePascalLibName name 'BTabView_SetTabWidth';
function BTabView_TabWidth(AObject : TCPlusObject) : button_width; cdecl; external BePascalLibName name 'BTabView_TabWidth';
procedure BTabView_SetTabHeight(AObject : TCPlusObject; height : double); cdecl; external BePascalLibName name 'BTabView_SetTabHeight';
function BTabView_TabHeight(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BTabView_TabHeight';
function BTabView_ContainerView(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BTabView_ContainerView';
function BTabView_CountTabs(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTabView_CountTabs';
function BTabView_ViewForTab(AObject : TCPlusObject; tabIndex : integer) : BView; cdecl; external BePascalLibName name 'BTabView_ViewForTab';

implementation

var
 TabView_AddTab_hook : Pointer; cvar; external;
 TabView_Draw_hook : Pointer; cvar; external;
 TabView_DrawBox_hook : Pointer; cvar; external;
 TabView_DrawTabs_hook : Pointer; cvar; external;
 TabView_MakeFocus_hook : Pointer; cvar; external;
 TabView_RemoveTab_hook : Pointer; cvar; external;
 TabView_Select_hook: Pointer; cvar; external;
 TabView_SetFocusTab_hook : Pointer; cvar; external;
 TabView_SetTabHeight_hook : Pointer; cvar; external;
 TabView_SetTabWidth_hook : Pointer; cvar; external;
 TabView_TabAt_hook : Pointer; cvar; external;
 TabView_TabFrame_hook : Pointer; cvar; external;


constructor BTab.Create(View : BView);
begin
  CreatePas;
  CPlusObject := BTab_Create(Self,View.CPlusObject);
end;

destructor BTab.Destroy;
begin
  BTab_Free(CPlusObject);
  inherited;
end;

constructor BTab.Create_1(data : BMessage);
begin
  CreatePas;
  CPlusObject := BTab_Create_1(Self, data.CPlusObject);
end;

function BTab.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BTab_Instantiate(CPlusObject, data.CPlusObject);
end;

function BTab.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BTab_Archive(CPlusObject, data.CPlusObject, deep);
end;

function BTab.Perform(d : Cardinal; arg : Pointer) : Status_t;
begin
  Result := BTab_Perform(CPlusObject, d, arg);
end;

function BTab.GetLabel : PChar;
begin
  Result := BTab_Label(CPlusObject);
end;

procedure BTab.SetLabel(alabel : PChar);
begin
  BTab_SetLabel(CPlusObject, alabel);
end;

function BTab.IsSelected : boolean;
begin
  Result := BTab_IsSelected(CPlusObject);
end;

procedure BTab.Select(owner : BView);
begin
  BTab_Select(CPlusObject, owner.CPlusObject);
end;

procedure BTab.Deselect;
begin
  BTab_Deselect(CPlusObject);
end;

procedure BTab.SetEnabled(aon : boolean);
begin
  BTab_SetEnabled(CPlusObject, aon);
end;

function BTab.IsEnabled : boolean;
begin
  Result := BTab_IsEnabled(CPlusObject);
end;

procedure BTab.MakeFocus(infocus : boolean);
begin
  BTab_MakeFocus(CPlusObject, infocus);
end;

function BTab.IsFocus : boolean;
begin
  Result := BTab_IsFocus(CPlusObject);
end;

procedure BTab.SeBView(contents : BView);
begin
  BTab_SeBView(CPlusObject, contents.CPlusObject);
end;

function BTab.GeBView : BView;
begin
  Result := BTab_View(CPlusObject);
end;

procedure BTab.DrawFocusMark(owner : BView; tabFrame : BRect);
begin
  BTab_DrawFocusMark(CPlusObject, owner.CPlusObject, tabFrame.CPlusObject);
end;

procedure BTab.DrawLabel(owner : BView; tabFrame : BRect);
begin
  BTab_DrawLabel(CPlusObject, owner.CPlusObject, tabFrame.CPlusObject);
end;

procedure BTab.DrawTab(owner : BView; tabFrame : BRect;  position: byte; full : boolean);
begin
  BTab_DrawTab(CPlusObject, owner.CPlusObject, tabFrame.CPlusObject, position, full);
end;


//--------------------BTabView

destructor BTabView.Destroy;
begin
  BTabView_Free(CPlusObject);
  inherited;
end;

constructor BTabView.Create( aframe : BRect; name : Pchar; width : button_width; sresizingMode : cardinal; sflags : cardinal);
begin
  createPas;
  CPlusObject := BTabView_Create(Self, aframe.CPlusObject, name, Integer(width),sresizingMode,sflags);
end;


constructor BTabView.Create( msg: BMessage);
begin
  createPas;
  CPlusObject := BTabView_Create_1(Self, msg.CPlusObject);
end;

function BTabView.Instantiate( msg : BMessage) : BArchivable;
begin
  Result := BTabView_Instantiate(CPlusObject, msg.CPlusObject);
end;

function BTabView.Archive( msg : BMessage; deep : boolean) : Status_t;
begin
  Result := BTabView_Archive(CPlusObject, msg.CPlusObject, deep);
end;

function BTabView.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
 // Result := BTabView_Perform(CPlusObject, d, arg);
end;

procedure BTabView.WindowActivated(state : boolean);
begin
  //BTabView_WindowActivated(CPlusObject, state);
end;

procedure BTabView.AttachedToWindow;
begin
  //BTabView_AttachedToWindow(CPlusObject);
end;

procedure BTabView.AllAttached;
begin
  //BTabView_AllAttached(CPlusObject);
end;

procedure BTabView.AllDetached;
begin
  //BTabView_AllDetached(CPlusObject);
end;

procedure BTabView.DetachedFromWindow;
begin
//  BTabView_DetachedFromWindow(CPlusObject);
end;

procedure BTabView.MessageReceived(msg : BMessage);
begin
 // BTabView_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BTabView.FrameMoved(new_position : BPoint);
begin
  //BTabView_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BTabView.FrameResized(w : double; h : double);
begin
//  BTabView_FrameResized(CPlusObject, w, h);
end;

procedure BTabView.KeyDown(bytes : PChar; n : integer);
begin
 // BTabView_KeyDown(CPlusObject, bytes, n);
end;

procedure BTabView.MouseDown( pt: BPoint);
begin
  //BTabView_MouseDown(CPlusObject, pt.CPlusObject);
end;

procedure BTabView.MouseUp( pt: BPoint);
begin
  //BTabView_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BTabView.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  //BTabView_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BTabView.Pulse;
begin
 // BTabView_Pulse(CPlusObject);
end;

procedure BTabView.Select(tabIndex : integer);
begin
  BTabView_Select(CPlusObject, tabIndex);
end;

function BTabView.Selection : integer;
begin
//  Result := BTabView_Selection(CPlusObject);
end;

procedure BTabView.MakeFocus(focusState : boolean);
begin
  BTabView_MakeFocus(CPlusObject, focusState);
end;

procedure BTabView.SetFocusTab(tabIndex : integer; focusState : boolean);
begin
  BTabView_SetFocusTab(CPlusObject, tabIndex, focusState);
end;

function BTabView.FocusTab : integer;
begin
  Result := BTabView_FocusTab(CPlusObject);
end;

procedure BTabView.Draw( rect: BRect);
begin
 // BTabView_Draw(CPlusObject, rect.CPlusObject);
end;

function BTabView.DrawTabs : BRect;
begin
//  Result := BTabView_DrawTabs(CPlusObject);
end;

procedure BTabView.DrawBox(selectedTabFrame : BRect);
begin
  //BTabView_DrawBox(CPlusObject, selectedTabFrame.CPlusObject);
end;

function BTabView.TabFrame(tabIndex : integer) : BRect;
begin
  Result := BTabView_TabFrame(CPlusObject, tabIndex);
end;

procedure BTabView.SetFlags(sflags : Cardinal);
begin
  BTabView_SetFlags(CPlusObject, sflags);
end;

procedure BTabView.SetResizingMode(mode : Cardinal);
begin
  BTabView_SetResizingMode(CPlusObject, mode);
end;

procedure BTabView.GetPreferredSize(width : double; height : double);
begin
//  BTabView_GetPreferredSize(CPlusObject, width, height);
end;

procedure BTabView.ResizeToPreferred;
begin
 // BTabView_ResizeToPreferred(CPlusObject);
end;

function BTabView.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  //Result := BTabView_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BTabView.GetSupportedSuites(data : BMessage) : Status_t;
begin
  //Result := BTabView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

procedure BTabView.AddTab(tabContents : BView; tab : BTab);
begin
  BTabView_AddTab(CPlusObject, tabContents.CPlusObject, tab.CPlusObject);
end;

function BTabView.RemoveTab(tabIndex : integer) : BTab;
begin
  Result := BTabView_RemoveTab(CPlusObject, tabIndex);
end;


function BTabView.TabAt(tabIndex : integer) : BTab;
begin
  Result := BTabView_TabAt(CPlusObject, tabIndex);
end;

procedure BTabView.SetTabWidth(s : button_width);
begin
  BTabView_SetTabWidth(CPlusObject, s);
end;

function BTabView.TabWidth : button_width;
begin
  Result := BTabView_TabWidth(CPlusObject);
end;

procedure BTabView.SetTabHeight(height : double);
begin
  BTabView_SetTabHeight(CPlusObject, height);
end;

function BTabView.TabHeight : double;
begin
  Result := BTabView_TabHeight(CPlusObject);
end;

function BTabView.ContainerView : BView;
begin
  Result := BTabView_ContainerView(CPlusObject);
end;

function BTabView.CountTabs : integer;
begin
  Result := BTabView_CountTabs(CPlusObject);
end;

function BTabView.ViewForTab(tabIndex : integer) : BView;
begin
  Result := BTabView_ViewForTab(CPlusObject, tabIndex);
end;


////////////////////////////////////////////////////////////////////////////
// Hook
////////////////////////////////////////////////////////////////////////////

procedure BTabView_AddTab_hook_func(tabw : BTabView; target : TCPlusObject; tab : TCPlusObject); cdecl;
Var targetv : BView;
	   tabtab : BTab;
begin
	targetv:=BView.Wrap(target);
	tabtab:=BTab.Wrap(tab);
	if Tabw <> nil Then Tabw.AddTab(targetv,tabtab);
	targetv.UnWrap;
	tabtab.UNWrap;
end;

procedure BTabView_Draw_hook_func(tabw : BTabView; updaterect : TCPlusObject);cdecl;
var rect : BRect;
begin
	rect:=BRect.Wrap(updaterect);
	if tabw <> nil then tabw.draw(rect);
	rect.UnWrap;
end;

procedure BTabView_DrawBox_hook_func(tabw : BTabView; updaterect : TCPlusObject);cdecl;
var rect : BRect;
begin
	rect:=BRect.Wrap(updaterect);
	if tabw <> nil then tabw.drawBox(rect);
	rect.UnWrap;
end;

procedure BTabView_DrawTabs_hook_func(tabw : BTabView);cdecl;
begin
	if tabw <> nil then tabw.drawTabs;
end;

procedure BTabView_MakeFocus_hook_func;cdecl;
begin
end;

procedure BTabView_RemoveTab_hook_func;cdecl;
begin
end;

procedure BTabView_Select_hook_func;cdecl;
begin
end;

procedure BTabView_SetFocusTab_hook_func;cdecl;
begin
end;

procedure BTabView_SetTabHeight_hook_func;cdecl;
begin
end;

procedure BTabView_SetTabWidth_hook_func;cdecl;
begin
end;

procedure BTabView_TabAt_hook_func;cdecl;
begin
end;

procedure BTabView_TabFrame_hook_func;cdecl;
begin
end;


initialization

 {TabView_AddTab_hook := @BTabView_AddTab_hook_func; 
 TabView_Draw_hook :=@BTabView_Draw_hook_func;
 TabView_DrawBox_hook :=@BTabView_DrawBox_hook_func;
 TabView_DrawTabs_hook :=@BTabView_DrawTabs_hook_func;
 TabView_MakeFocus_hook :=@BTabView_MakeFocus_hook_func;
 TabView_RemoveTab_hook :=@BTabView_RemoveTab_hook_func;
 TabView_Select_hook:=@BTabView_Select_hook_func;
 TabView_SetFocusTab_hook :=@BTabView_SetFocusTab_hook_func;
 TabView_SetTabHeight_hook :=@BTabView_SetTabHeight_hook_func;
 TabView_SetTabWidth_hook :=@BTabView_SetTabWidth_hook_func;
 TabView_TabAt_hook :=@BTabView_TabAt_hook_func;
 TabView_TabFrame_hook :=@BTabView_TabFrame_hook_func;
 }
end.
