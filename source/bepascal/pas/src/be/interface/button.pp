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
unit button;

interface

uses
  beobj, Control, Message, Archivable, SupportDefs, Rect, Handler;

type
  BButton = class(BControl)
  private
  public
    destructor Destroy; override;
	constructor Create(aframe : BRect; name, aLabel : PChar; message : BMessage; sresizingMode, sflags : Cardinal); virtual;
    constructor Create(data : BMessage); override; 
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure Draw(updateRect : BRect); override;
    procedure MouseDown(where : BPoint); override;
    procedure AttachedToWindow; override;
    procedure KeyDown(bytes : PChar; numBytes : integer); override;
    // Hook functions
    procedure MakeDefault(state : boolean); 
    procedure SetLabel(text : PChar);
    function IsDefault : boolean;
    procedure MessageReceived(msg : BMessage); override;
    procedure WindowActivated(state : boolean); override;
    procedure MouseUp(pt : BPoint); override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage); override;
    procedure DetachedFromWindow; override;
    procedure SetValue(aValue : integer);
    procedure GetPreferredSize(width : double; height : double);
    procedure ResizeToPreferred; override;
    function Invoke(msg : BMessage) : Status_t;
    procedure FrameMoved(new_position : BPoint); override;
    procedure FrameResized(new_width : double; new_height : double); override;
    procedure MakeFocus(state : boolean); 
    procedure AllAttached; override;
    procedure AllDetached; override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
//    procedure _ReservedButton1;
//    procedure _ReservedButton2;
//    procedure _ReservedButton3;
//    function operator=( : BButton) : BButton;
//    function DrawDefault(bounds : BRect; enabled : boolean) : BRect;
//    function Execute : Status_t;
//    procedure float fCachedWidth;
//    procedure bool fDrawAsDefault;
//    procedure uint32 _reserved[3];
//    procedure MakeDefault(flag : boolean); virtual;    
  end;

procedure BButton_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BButton_Free';
function BButton_Create(AObject : TBeObject; frame : TCPlusObject; name, aLabel : PChar; message : TCPlusObject; resizingMode, flags : Cardinal) : TCPlusObject; cdecl; external BePascalLibName name 'BButton_Create';
function BButton_Create(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BButton_Create';
function BButton_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BButton_Instantiate';
function BButton_Archive(AObject : TCPlusObject; data : TCplusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BButton_Archive';
procedure BButton_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BButton_Draw';
procedure BButton_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BButton_MouseDown';
procedure BButton_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BButton_AttachedToWindow';
procedure BButton_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BButton_KeyDown';
procedure BButton_MakeDefault(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BButton_MakeDefault';
procedure BButton_SetLabel(AObject : TCPlusObject; text : PChar); cdecl; external BePascalLibName name 'BButton_SetLabel';
function BButton_IsDefault(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BButton_IsDefault';
procedure BButton_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BButton_MessageReceived';
procedure BButton_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BButton_WindowActivated';
procedure BButton_MouseUp(AObject : TCPlusObject; pt : TCplusObject); cdecl; external BePascalLibName name 'BButton_MouseUp';
procedure BButton_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : BMessage); cdecl; external BePascalLibName name 'BButton_MouseMoved';
procedure BButton_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BButton_DetachedFromWindow';
procedure BButton_SetValue(AObject : TCPlusObject; aValue : integer); cdecl; external BePascalLibName name 'BButton_SetValue';
procedure BButton_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BButton_GetPreferredSize';
procedure BButton_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BButton_ResizeToPreferred';
function BButton_Invoke(AObject : TCPlusObject; msg : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BButton_Invoke';
procedure BButton_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BButton_FrameMoved';
procedure BButton_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BButton_FrameResized';
procedure BButton_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BButton_MakeFocus';
procedure BButton_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BButton_AllAttached';
procedure BButton_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BButton_AllDetached';
function BButton_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BButton_ResolveSpecifier';
function BButton_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BButton_GetSupportedSuites';
function BButton_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BButton_Perform';

implementation

var
  Button_MakeDefault_hook : Pointer; cvar; external;

destructor BButton.Destroy;
begin
  BButton_Free(CPlusObject);
  inherited;
end;

constructor BButton.Create(aframe : BRect; name, aLabel : PChar; message : BMessage; sresizingMode, sflags : Cardinal);
begin
  CreatePas;
  CPlusObject := BButton_Create(Self, aframe.CPlusObject, name, aLabel, message.CPlusObject, sresizingMode, sflags);
end;

constructor BButton.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BButton_Create(Self, data.CPlusObject);
end;

function BButton.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BButton_Instantiate(CPlusObject, data.CPlusObject);
end;

function BButton.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BButton_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BButton.Draw(updateRect : BRect);
begin

end;

procedure BButton.MouseDown(where : BPoint);
begin

end;

procedure BButton.AttachedToWindow;
begin

end;

procedure BButton.KeyDown(bytes : PChar; numBytes : integer);
begin

end;

procedure BButton.MakeDefault(state : boolean);
begin

end;

procedure BButton.SetLabel(text : PChar);
begin
  BButton_SetLabel(CPlusObject, text);
end;

function BButton.IsDefault : boolean;
begin
  Result := BButton_IsDefault(CPlusObject);
end;

procedure BButton.MessageReceived(msg : BMessage);
begin
//  BButton_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BButton.WindowActivated(state : boolean);
begin
//  BButton_WindowActivated(CPlusObject, state);
end;

procedure BButton.MouseUp(pt : BPoint);
begin
//  BButton_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BButton.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
//  BButton_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BButton.DetachedFromWindow;
begin
//  BButton_DetachedFromWindow(CPlusObject);
end;

procedure BButton.SetValue(aValue : integer);
begin
//  BButton_SetValue(CPlusObject, aValue);
end;

procedure BButton.GetPreferredSize(width : double; height : double);
begin
//  BButton_GetPreferredSize(CPlusObject, width, height);
end;

procedure BButton.ResizeToPreferred;
begin
//  BButton_ResizeToPreferred(CPlusObject);
end;

function BButton.Invoke(msg : BMessage) : Status_t;
begin
  Result := BButton_Invoke(CPlusObject, msg.CPlusObject);
end;

procedure BButton.FrameMoved(new_position : BPoint);
begin
//  BButton_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BButton.FrameResized(new_width : double; new_height : double);
begin
//  BButton_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BButton.MakeFocus(state : boolean);
begin
  BButton_MakeFocus(CPlusObject, state);
end;

procedure BButton.AllAttached;
begin
//  BButton_AllAttached(CPlusObject);
end;

procedure BButton.AllDetached;
begin
//  BButton_AllDetached(CPlusObject);
end;

function BButton.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BButton_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BButton.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BButton_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BButton.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BButton_Perform(CPlusObject, d, arg);
end;


procedure Button_MakeDefault_hook_func(Button : BButton; flag : boolean); cdecl;
begin
  if Button <> nil then
    Button.MakeDefault(flag);
end;

initialization
  Button_MakeDefault_hook := @Button_MakeDefault_hook_func;

end.
