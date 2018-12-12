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
unit scrollview;

interface

uses
     beobj, view, message, archivable, SupportDefs, rect, list,
  handler, messenger,interfacedefs,font,graphicdefs,scrollbar;

type
  BScrollView = class(BView)
  private
  public
    constructor Create(name : pchar;
								atarget :BView;
								 resizeMask : longint;
								sflags : longint;
								horizontal,
								vertical : boolean;
								aborder :border_style ); virtual;
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure Draw(updateRect : BRect);override;
    procedure AttachedToWindow;override;
    function ScrollBar(flag : Orientation) :  BScrollBar;
    procedure SetBorder(aborder : border_style);
    function Border : border_style;
    function SetBorderHighlighted(state : boolean) : Status_t;
    function IsBorderHighlighted : boolean;
    procedure SetTarget(new_target : BView);
    function Target : BView;
    procedure MessageReceived(msg : BMessage);override;
    procedure MouseDown(pt : BPoint);override;
    procedure WindowActivated(state : boolean);override;
    procedure MouseUp(pt : BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
    procedure AllAttached;override;
    procedure AllDetached;override;
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(new_width : double; new_height : double);override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    procedure ResizeToPreferred;override;
    procedure GetPreferredSize(width : double; height : double);
    procedure MakeFocus(state : boolean);
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
  end;

function BScrollView_Create(AObject : TBeObject;name : pchar;target :TCPlusObject; resizeMask : longint;	flags : longint;horizontal,vertical : boolean;border :border_style ):TCPlusObject; cdecl; external BePascalLibName name 'BScrollView_Create';
//function BScrollView_Create_1(AObject : TBeObject):TCPlusObject; cdecl; external BePascalLibName name 'BScrollView_Create_1';
procedure BScrollView_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_Free';
function BScrollView_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BScrollView_Instantiate';
function BScrollView_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BScrollView_Archive';
procedure BScrollView_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_Draw';
procedure BScrollView_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_AttachedToWindow';
function BScrollView_ScrollBar(AObject : TCPlusObject; flag : Orientation) :  BScrollBar; cdecl; external BePascalLibName name 'BScrollView_ScrollBar';
procedure BScrollView_SetBorder(AObject : TCPlusObject; border : border_style); cdecl; external BePascalLibName name 'BScrollView_SetBorder';
function BScrollView_Border(AObject : TCPlusObject) : border_style; cdecl; external BePascalLibName name 'BScrollView_Border';
function BScrollView_SetBorderHighlighted(AObject : TCPlusObject; state : boolean) : Status_t; cdecl; external BePascalLibName name 'BScrollView_SetBorderHighlighted';
function BScrollView_IsBorderHighlighted(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BScrollView_IsBorderHighlighted';
procedure BScrollView_SetTarget(AObject : TCPlusObject; new_target : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_SetTarget';
function BScrollView_Target(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BScrollView_Target';
procedure BScrollView_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_MessageReceived';
procedure BScrollView_MouseDown(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_MouseDown';
procedure BScrollView_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BScrollView_WindowActivated';
procedure BScrollView_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_MouseUp';
procedure BScrollView_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_MouseMoved';
procedure BScrollView_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_DetachedFromWindow';
procedure BScrollView_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_AllAttached';
procedure BScrollView_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_AllDetached';
procedure BScrollView_FrameMoved(AObject : TCPlusObject; new_position : BPoint); cdecl; external BePascalLibName name 'BScrollView_FrameMoved';
procedure BScrollView_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BScrollView_FrameResized';
function BScrollView_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BScrollView_ResolveSpecifier';
procedure BScrollView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollView_ResizeToPreferred';
procedure BScrollView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BScrollView_GetPreferredSize';
procedure BScrollView_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BScrollView_MakeFocus';
function BScrollView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BScrollView_GetSupportedSuites';
function BScrollView_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BScrollView_Perform';

implementation

constructor BScrollView.Create(name : pchar;
								atarget :BView;
								 resizeMask : longint;
								sflags : longint;
								horizontal,
								vertical : boolean;
								aborder :border_style ); 
begin
  CreatePas;
  CPlusObject := BScrollView_Create(Self,name,atarget.CplusObject,resizeMask,sflags,horizontal,vertical,aborder);

end;								



destructor BScrollView.Destroy;
begin
  BScrollView_Free(CPlusObject);
  inherited;
end;

function BScrollView.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BScrollView_Instantiate(CPlusObject, data.CPlusObject);
end;

function BScrollView.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BScrollView_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BScrollView.Draw(updateRect : BRect);
begin
//  BScrollView_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure BScrollView.AttachedToWindow;
begin
  //BScrollView_AttachedToWindow(CPlusObject);
end;

function BScrollView.ScrollBar(flag : Orientation) :  BScrollBar;
begin
  Result := BScrollView_ScrollBar(CPlusObject, flag);
end;

procedure BScrollView.SetBorder(aborder : border_style);
begin
  BScrollView_SetBorder(CPlusObject, aborder);
end;

function BScrollView.Border : border_style;
begin
  Result := BScrollView_Border(CPlusObject);
end;

function BScrollView.SetBorderHighlighted(state : boolean) : Status_t;
begin
  Result := BScrollView_SetBorderHighlighted(CPlusObject, state);
end;

function BScrollView.IsBorderHighlighted : boolean;
begin
  Result := BScrollView_IsBorderHighlighted(CPlusObject);
end;

procedure BScrollView.SetTarget(new_target : BView);
begin
  BScrollView_SetTarget(CPlusObject, new_target.CPlusObject);
end;

function BScrollView.Target : BView;
begin
  Result := BScrollView_Target(CPlusObject);
end;

procedure BScrollView.MessageReceived(msg : BMessage);
begin
 inherited;
  //BScrollView_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BScrollView.MouseDown(pt : BPoint);
begin
//  BScrollView_MouseDown(CPlusObject, pt.CPlusObject);
end;

procedure BScrollView.WindowActivated(state : boolean);
begin
  //BScrollView_WindowActivated(CPlusObject, state);
end;

procedure BScrollView.MouseUp(pt : BPoint);
begin
  //BScrollView_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BScrollView.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  //BScrollView_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BScrollView.DetachedFromWindow;
begin
  //BScrollView_DetachedFromWindow(CPlusObject);
end;

procedure BScrollView.AllAttached;
begin
  //BScrollView_AllAttached(CPlusObject);
end;

procedure BScrollView.AllDetached;
begin
  //BScrollView_AllDetached(CPlusObject);
end;

procedure BScrollView.FrameMoved(new_position : BPoint);
begin
//  BScrollView_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BScrollView.FrameResized(new_width : double; new_height : double);
begin
  //BScrollView_FrameResized(CPlusObject, new_width, new_height);
end;

function BScrollView.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BScrollView_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

procedure BScrollView.ResizeToPreferred;
begin
  BScrollView_ResizeToPreferred(CPlusObject);
end;

procedure BScrollView.GetPreferredSize(width : double; height : double);
begin
  BScrollView_GetPreferredSize(CPlusObject, width, height);
end;

procedure BScrollView.MakeFocus(state : boolean);
begin
  BScrollView_MakeFocus(CPlusObject, state);
end;

function BScrollView.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BScrollView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BScrollView.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BScrollView_Perform(CPlusObject, d, arg);
end;


end.
