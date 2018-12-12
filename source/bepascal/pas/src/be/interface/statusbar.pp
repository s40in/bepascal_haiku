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
unit statusbar;

interface

uses
     beobj, view, message, archivable, SupportDefs, rect, list,
  handler, messenger,interfacedefs,font,graphicdefs;

type
  BStatusBar = class(BView)
  private
  public
    constructor Create( aframe : BRect; 
                                        name : pchar;
								       alabel : Pchar;
								       trailing_label : Pchar);virtual;
    constructor Create(data : BMessage);virtual;
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure AttachedToWindow;override;
    procedure MessageReceived(msg : BMessage);override;
    procedure Draw(updateRect : BRect);override;
    procedure SetBarColor(color : rgb_color);
    procedure SetBarHeight(height : double);
    procedure SetText(str : PChar);
    procedure SetTrailingText(str : PChar);
    procedure SetMaxValue(max : double);
    procedure Update(delta : single; main_text : PChar; trailing_text : PChar);
    procedure Reset(alabel : PChar; trailing_label : PChar);
    function CurrentValue : double;
    function MaxValue : double;
    function BarColor : rgb_color;
    function BarHeight : double;
    function Text : PChar;
    function TrailingText : PChar;
    function GetLabel : PChar;
    function TrailingLabel : PChar;
    procedure MouseDown(pt : BPoint);override;
    procedure MouseUp(pt : BPoint);override;
    procedure WindowActivated(state : boolean);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(new_width : double; new_height : double);override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    procedure ResizeToPreferred;override;
    procedure GetPreferredSize(width : double; height : double);
    procedure MakeFocus(state : boolean);
    procedure AllAttached;override;
    procedure AllDetached;override;
  
  end;

function BStatusBar_Create(AObject : TBeObject;frame : TCPlusObject; 
                                        name : pchar;
								       slabel : Pchar;
								       trailing_label : Pchar): TCPlusObject; cdecl; external BePascalLibName name 'BStatusBar_Create';
function BStatusBar_Create_1(AObject : TBeObject; data : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BStatusBar_Create_1';
procedure BStatusBar_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_Free';
function BStatusBar_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BStatusBar_Instantiate';
function BStatusBar_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BStatusBar_Archive';
procedure BStatusBar_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_AttachedToWindow';
procedure BStatusBar_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_MessageReceived';
procedure BStatusBar_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_Draw';
procedure BStatusBar_SetBarColor(AObject : TCPlusObject; color : rgb_color); cdecl; external BePascalLibName name 'BStatusBar_SetBarColor';
procedure BStatusBar_SetBarHeight(AObject : TCPlusObject; height : double); cdecl; external BePascalLibName name 'BStatusBar_SetBarHeight';
procedure BStatusBar_SetText(AObject : TCPlusObject; str : PChar); cdecl; external BePascalLibName name 'BStatusBar_SetText';
procedure BStatusBar_SetTrailingText(AObject : TCPlusObject; str : PChar); cdecl; external BePascalLibName name 'BStatusBar_SetTrailingText';
procedure BStatusBar_SetMaxValue(AObject : TCPlusObject; max : double); cdecl; external BePascalLibName name 'BStatusBar_SetMaxValue';
procedure BStatusBar_Update(AObject : TCPlusObject; delta : single; main_text : PChar; trailing_text : PChar); cdecl; external BePascalLibName name 'BStatusBar_Update';
procedure BStatusBar_Reset(AObject : TCPlusObject; alabel : PChar; trailing_label : PChar); cdecl; external BePascalLibName name 'BStatusBar_Reset';
function BStatusBar_CurrentValue(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BStatusBar_CurrentValue';
function BStatusBar_MaxValue(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BStatusBar_MaxValue';
function BStatusBar_BarColor(AObject : TCPlusObject) : rgb_color; cdecl; external BePascalLibName name 'BStatusBar_BarColor';
function BStatusBar_BarHeight(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BStatusBar_BarHeight';
function BStatusBar_Text(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BStatusBar_Text';
function BStatusBar_TrailingText(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BStatusBar_TrailingText';
function BStatusBar_Label(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BStatusBar_Label';
function BStatusBar_TrailingLabel(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BStatusBar_TrailingLabel';
procedure BStatusBar_MouseDown(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_MouseDown';
procedure BStatusBar_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_MouseUp';
procedure BStatusBar_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BStatusBar_WindowActivated';
procedure BStatusBar_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : BMessage); cdecl; external BePascalLibName name 'BStatusBar_MouseMoved';
procedure BStatusBar_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_DetachedFromWindow';
procedure BStatusBar_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_FrameMoved';
procedure BStatusBar_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BStatusBar_FrameResized';
function BStatusBar_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BStatusBar_ResolveSpecifier';
procedure BStatusBar_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_ResizeToPreferred';
procedure BStatusBar_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BStatusBar_GetPreferredSize';
procedure BStatusBar_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BStatusBar_MakeFocus';
procedure BStatusBar_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_AllAttached';
procedure BStatusBar_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStatusBar_AllDetached';
function BStatusBar_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BStatusBar_GetSupportedSuites';

implementation

constructor BStatusBar.Create(aframe : BRect; 
                              name : pchar;
                              alabel : Pchar;
                              trailing_label : Pchar);
begin
  CreatePas;
  CPlusObject := BStatusBar_Create(Self, aframe.CPlusObject, name, alabel, trailing_label);
end;

constructor BStatusBar.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BStatusBar_Create_1(Self, data.CPlusObject);
end;

destructor BStatusBar.Destroy;
begin
  BStatusBar_Free(CPlusObject);
  inherited;
end;

function BStatusBar.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BStatusBar_Instantiate(CPlusObject, data.CPlusObject);
end;

function BStatusBar.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BStatusBar_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BStatusBar.AttachedToWindow;
begin
  //BStatusBar_AttachedToWindow(CPlusObject);
end;

procedure BStatusBar.MessageReceived(msg : BMessage);
begin
  //BStatusBar_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BStatusBar.Draw(updateRect : BRect);
begin
//  BStatusBar_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure BStatusBar.SetBarColor(color : rgb_color);
begin
  BStatusBar_SetBarColor(CPlusObject, color);
end;

procedure BStatusBar.SetBarHeight(height : double);
begin
  BStatusBar_SetBarHeight(CPlusObject, height);
end;

procedure BStatusBar.SetText(str : PChar);
begin
  BStatusBar_SetText(CPlusObject, str);
end;

procedure BStatusBar.SetTrailingText(str : PChar);
begin
  BStatusBar_SetTrailingText(CPlusObject, str);
end;

procedure BStatusBar.SetMaxValue(max : double);
begin
  BStatusBar_SetMaxValue(CPlusObject, max);
end;

procedure BStatusBar.Update(delta : single; main_text : PChar; trailing_text : PChar);
begin
  BStatusBar_Update(CPlusObject, delta, main_text, trailing_text);
end;

procedure BStatusBar.Reset(alabel : PChar; trailing_label : PChar);
begin
  BStatusBar_Reset(CPlusObject, alabel, trailing_label);
end;

function BStatusBar.CurrentValue : double;
begin
  Result := BStatusBar_CurrentValue(CPlusObject);
end;

function BStatusBar.MaxValue : double;
begin
  Result := BStatusBar_MaxValue(CPlusObject);
end;

function BStatusBar.BarColor : rgb_color;
begin
  Result := BStatusBar_BarColor(CPlusObject);
end;

function BStatusBar.BarHeight : double;
begin
  Result := BStatusBar_BarHeight(CPlusObject);
end;

function BStatusBar.Text : PChar;
begin
  Result := BStatusBar_Text(CPlusObject);
end;

function BStatusBar.TrailingText : PChar;
begin
  Result := BStatusBar_TrailingText(CPlusObject);
end;

function BStatusBar.GetLabel : PChar;
begin
  Result := BStatusBar_Label(CPlusObject);
end;

function BStatusBar.TrailingLabel : PChar;
begin
  Result := BStatusBar_TrailingLabel(CPlusObject);
end;

procedure BStatusBar.MouseDown(pt : BPoint);
begin
//  BStatusBar_MouseDown(CPlusObject, pt.CPlusObject);
end;

procedure BStatusBar.MouseUp(pt : BPoint);
begin
//  BStatusBar_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BStatusBar.WindowActivated(state : boolean);
begin
//  BStatusBar_WindowActivated(CPlusObject, state);
end;

procedure BStatusBar.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
//  BStatusBar_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BStatusBar.DetachedFromWindow;
begin
//  BStatusBar_DetachedFromWindow(CPlusObject);
end;

procedure BStatusBar.FrameMoved(new_position : BPoint);
begin
//  BStatusBar_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BStatusBar.FrameResized(new_width : double; new_height : double);
begin
// BStatusBar_FrameResized(CPlusObject, new_width, new_height);
end;

function BStatusBar.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
//  Result := BStatusBar_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

procedure BStatusBar.ResizeToPreferred;
begin
  BStatusBar_ResizeToPreferred(CPlusObject);
end;

procedure BStatusBar.GetPreferredSize(width : double; height : double);
begin
  BStatusBar_GetPreferredSize(CPlusObject, width, height);
end;

procedure BStatusBar.MakeFocus(state : boolean);
begin
  BStatusBar_MakeFocus(CPlusObject, state);
end;

procedure BStatusBar.AllAttached;
begin
  BStatusBar_AllAttached(CPlusObject);
end;

procedure BStatusBar.AllDetached;
begin
  BStatusBar_AllDetached(CPlusObject);
end;


end.
