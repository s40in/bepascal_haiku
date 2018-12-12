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
unit menubar;

interface

uses
  beobj, menu, SupportDefs, Message, Rect, archivable, handler;

type
	Menu_Bar_Border = (B_BORDER_FRAME,
											B_BORDER_CONTENTS,
											B_BORDER_EACH_ITEM);
  BMenuBar = class(BMenu)
  private
  public
    constructor Create(aframe : BRect; viewName : PChar; sresizingMode : Cardinal; layout : Menu_Layout; resizeToFit : boolean);  
    constructor Create; 
    destructor Destroy; override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure SetBorder(aBorder : Menu_Bar_Border);
    function Border : Menu_Bar_Border;
    procedure Draw(updateRect : BRect); override;
    procedure AttachedToWindow; override;
    procedure DetachedFromWindow; override;
    procedure MessageReceived(msg : BMessage); override;
    procedure MouseDown(where : BPoint); override;
    procedure WindowActivated(state : boolean); override;
    procedure MouseUp(where : BPoint); override;
    procedure FrameMoved(new_position : BPoint); override;
    procedure FrameResized(new_width : double; new_height : double); override;
    procedure Show;
    procedure Hide;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    procedure ResizeToPreferred; override;
    procedure GetPreferredSize(width : double; height : double);
    procedure MakeFocus(state : boolean);
    procedure AllAttached; override;
    procedure AllDetached; override;
  end;

function BMenuBar_Create(AObject : TBeObject; frame : TCPlusObject; viewName : PChar; resizingMode : Cardinal; layout : Integer; resizeToFit : boolean) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuBar_Create';
//function BMenuBar_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuBar_Create';
procedure BMenuBar_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_Free';
function BMenuBar_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BMenuBar_Instantiate';
function BMenuBar_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BMenuBar_Archive';
procedure BMenuBar_SetBorder(AObject : TCPlusObject; aBorder : Menu_Bar_Border); cdecl; external BePascalLibName name 'BMenuBar_SetBorder';
function BMenuBar_Border(AObject : TCPlusObject) : Menu_Bar_Border; cdecl; external BePascalLibName name 'BMenuBar_Border';
procedure BMenuBar_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_Draw';
procedure BMenuBar_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_AttachedToWindow';
procedure BMenuBar_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_DetachedFromWindow';
procedure BMenuBar_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_MessageReceived';
procedure BMenuBar_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_MouseDown';
procedure BMenuBar_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenuBar_WindowActivated';
procedure BMenuBar_MouseUp(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_MouseUp';
procedure BMenuBar_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_FrameMoved';
procedure BMenuBar_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BMenuBar_FrameResized';
procedure BMenuBar_Show(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_Show';
procedure BMenuBar_Hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_Hide';
function BMenuBar_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; aProperty : PChar) : BHandler; cdecl; external BePascalLibName name 'BMenuBar_ResolveSpecifier';
function BMenuBar_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenuBar_GetSupportedSuites';
procedure BMenuBar_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_ResizeToPreferred';
procedure BMenuBar_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BMenuBar_GetPreferredSize';
procedure BMenuBar_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenuBar_MakeFocus';
procedure BMenuBar_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_AllAttached';
procedure BMenuBar_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuBar_AllDetached';

implementation

constructor BMenuBar.Create(aframe : BRect; viewName : PChar; sresizingMode : Cardinal; layout : Menu_Layout; resizeToFit : boolean);
begin
  CPlusObject := BMenuBar_Create(Self, aframe.CPlusObject, viewName, sresizingMode, 0, resizeToFit);
end;

constructor BMenuBar.Create;
begin
	CreatePas;
//  CPlusObject := BMenuBar_Create_1(Self);
end;

destructor BMenuBar.Destroy;
begin
  BMenuBar_Free(CPlusObject);
end;

function BMenuBar.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BMenuBar_Instantiate(CPlusObject, data.CPlusObject);
end;

function BMenuBar.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BMenuBar_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BMenuBar.SetBorder(aBorder : Menu_Bar_Border);
begin
  BMenuBar_SetBorder(CPlusObject, aBorder);
end;

function BMenuBar.Border : Menu_Bar_Border;
begin
  Result := BMenuBar_Border(CPlusObject);
end;

procedure BMenuBar.Draw(updateRect : BRect);
begin
//  BMenuBar_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure BMenuBar.AttachedToWindow;
begin
//  BMenuBar_AttachedToWindow(CPlusObject);
end;

procedure BMenuBar.DetachedFromWindow;
begin
//  BMenuBar_DetachedFromWindow(CPlusObject);
end;

procedure BMenuBar.MessageReceived(msg : BMessage);
begin
//  BMenuBar_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BMenuBar.MouseDown(where : BPoint);
begin
//  BMenuBar_MouseDown(CPlusObject, where.CPlusObject);
end;

procedure BMenuBar.WindowActivated(state : boolean);
begin
//  BMenuBar_WindowActivated(CPlusObject, state);
end;

procedure BMenuBar.MouseUp(where : BPoint);
begin
//  BMenuBar_MouseUp(CPlusObject, where.CPlusObject);
end;

procedure BMenuBar.FrameMoved(new_position : BPoint);
begin
//  BMenuBar_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BMenuBar.FrameResized(new_width : double; new_height : double);
begin
//  BMenuBar_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BMenuBar.Show;
begin
  BMenuBar_Show(CPlusObject);
end;

procedure BMenuBar.Hide;
begin
  BMenuBar_Hide(CPlusObject);
end;

function BMenuBar.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler;
begin
  Result := BMenuBar_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, aProperty);
end;

function BMenuBar.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BMenuBar_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

procedure BMenuBar.ResizeToPreferred;
begin
//  BMenuBar_ResizeToPreferred(CPlusObject);
end;

procedure BMenuBar.GetPreferredSize(width : double; height : double);
begin
//  BMenuBar_GetPreferredSize(CPlusObject, width, height);
end;

procedure BMenuBar.MakeFocus(state : boolean);
begin
//  BMenuBar_MakeFocus(CPlusObject, state);
end;

procedure BMenuBar.AllAttached;
begin
//  BMenuBar_AllAttached(CPlusObject);
end;

procedure BMenuBar.AllDetached;
begin
//  BMenuBar_AllDetached(CPlusObject);
end;

{function BMenuBar.Perform(d : TPerform_code; arg : Pointer) : Status_t;
begin
  Result := BMenuBar_Perform(CPlusObject, d, arg);
end;

procedure BMenuBar._ReservedMenuBar1;
begin
  BMenuBar__ReservedMenuBar1(CPlusObject);
end;

procedure BMenuBar._ReservedMenuBar2;
begin
  BMenuBar__ReservedMenuBar2(CPlusObject);
end;

procedure BMenuBar._ReservedMenuBar3;
begin
  BMenuBar__ReservedMenuBar3(CPlusObject);
end;

procedure BMenuBar._ReservedMenuBar4;
begin
  BMenuBar__ReservedMenuBar4(CPlusObject);
end;

function BMenuBar.operator=( : BMenuBar) : BMenuBar;
begin
  Result := BMenuBar_operator=(CPlusObject, );
end;

procedure BMenuBar.StarBMenuBar(menuIndex : integer; sticky : boolean; show_menu : boolean; special_rect : BRect);
begin
  BMenuBar_StarBMenuBar(CPlusObject, menuIndex, sticky, show_menu, special_rect.CPlusObject);
end;

function BMenuBar.TrackTask(arg : Pointer) : integer;
begin
  Result := BMenuBar_TrackTask(CPlusObject, arg);
end;

function BMenuBar.Track(action : ^integer; startIndex : integer; showMenu : boolean) : TMenuItem;
begin
  Result := BMenuBar_Track(CPlusObject, action, startIndex, showMenu);
end;

procedure BMenuBar.StealFocus;
begin
  BMenuBar_StealFocus(CPlusObject);
end;

procedure BMenuBar.RestoreFocus;
begin
  BMenuBar_RestoreFocus(CPlusObject);
end;

procedure BMenuBar.InitData(layout : BMenu_Layout);
begin
  BMenuBar_InitData(CPlusObject, layout);
end;

procedure BMenuBar.menu_bar_border fBorder;
begin
  BMenuBar_menu_bar_border fBorder(CPlusObject);
end;

procedure BMenuBar.thread_id fTrackingPID;
begin
  BMenuBar_thread_id fTrackingPID(CPlusObject);
end;

procedure BMenuBar.int32 fPrevFocusToken;
begin
  BMenuBar_int32 fPrevFocusToken(CPlusObject);
end;

procedure BMenuBar.sem_id fMenuSem;
begin
  BMenuBar_sem_id fMenuSem(CPlusObject);
end;

procedure BMenuBar.BRect *fLastBounds;
begin
  BMenuBar_BRect *fLastBounds(CPlusObject);
end;

procedure BMenuBar.uint32 _reserved[2];
begin
  BMenuBar_uint32 _reserved[2](CPlusObject);
end;

procedure BMenuBar.bool fTracking;
begin
  BMenuBar_bool fTracking(CPlusObject);
end;
}

end.
