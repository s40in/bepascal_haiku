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
unit checkbox;

interface

uses
  beobj, Control, Message, Archivable, SupportDefs, Rect, Handler;

type BCheckBox  = class(BControl)
  private
  public
    destructor Destroy;override;
	constructor Create(aframe : BRect; name, aLabel : PChar; message : BMessage; sresizingMode, sflags : Cardinal); virtual;
    constructor Create(data : BMessage) ;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure Draw(updateRect : BRect);override;
    procedure AttachedToWindow;override;
    procedure MouseDown(where : BPoint);override;
    procedure MessageReceived(msg : BMessage);override;
    procedure WindowActivated(state : boolean);override;
    procedure KeyDown(bytes : PChar; numBytes : integer);override;
    procedure MouseUp(pt : BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
    procedure SetValue(avalue : integer);
    procedure GetPreferredSize(width : double; height : double);
    procedure ResizeToPreferred;override;
    function Invoke(msg : BMessage) : Status_t;
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(new_width : double; new_height : double);override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    procedure MakeFocus(state : boolean);
    procedure AllAttached;override;
    procedure AllDetached;override;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
  end;

procedure BCheckBox_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_FREE';
function BCheckBox_Create(AObject : TBeObject; frame : TCPlusObject; name, aLabel : PChar; message : TCPlusObject; resizingMode, flags : Cardinal) : TCPlusObject; cdecl; external BePascalLibName name 'BCheckBox_Create';
function BCheckBox_Create_1(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BCheckBox_Create_1';
function BCheckBox_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BCheckBox_Instantiate';
function BCheckBox_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BCheckBox_Archive';
procedure BCheckBox_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_Draw';
procedure BCheckBox_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_AttachedToWindow';
procedure BCheckBox_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_MouseDown';
procedure BCheckBox_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_MessageReceived';
procedure BCheckBox_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BCheckBox_WindowActivated';
procedure BCheckBox_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BCheckBox_KeyDown';
procedure BCheckBox_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_MouseUp';
procedure BCheckBox_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : BMessage); cdecl; external BePascalLibName name 'BCheckBox_MouseMoved';
procedure BCheckBox_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_DetachedFromWindow';
procedure BCheckBox_SetValue(AObject : TCPlusObject; value : integer); cdecl; external BePascalLibName name 'BCheckBox_SetValue';
procedure BCheckBox_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BCheckBox_GetPreferredSize';
procedure BCheckBox_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_ResizeToPreferred';
function BCheckBox_Invoke(AObject : TCPlusObject; msg : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BCheckBox_Invoke';
procedure BCheckBox_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_FrameMoved';
procedure BCheckBox_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BCheckBox_FrameResized';
function BCheckBox_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BCheckBox_ResolveSpecifier';
function BCheckBox_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BCheckBox_GetSupportedSuites';
procedure BCheckBox_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BCheckBox_MakeFocus';
procedure BCheckBox_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_AllAttached';
procedure BCheckBox_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BCheckBox_AllDetached';
function BCheckBox_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BCheckBox_Perform';

implementation

destructor BCheckBox.Destroy;
begin
  BCheckBox_Free(CPlusObject);
  inherited;
end;

constructor BCheckBox.Create(aframe : BRect; name, aLabel : PChar; message : BMessage; sresizingMode, sflags : Cardinal);
begin
  CreatePas;
  CPlusObject := BCheckBox_Create(Self, aframe.CPlusObject, name, aLabel, message.CPlusObject, sresizingMode, sflags);
end;

constructor BCheckBox.Create(data : BMessage) ;
begin
  CreatePas;
  CPlusObject := BCheckBox_Create_1(Self, data.CPlusObject);
end;

function BCheckBox.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BCheckBox_Instantiate(CPlusObject, data.CPlusObject);
end;

function BCheckBox.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BCheckBox_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BCheckBox.Draw(updateRect : BRect);
begin
  //BCheckBox_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure BCheckBox.AttachedToWindow;
begin
  //BCheckBox_AttachedToWindow(CPlusObject);
end;

procedure BCheckBox.MouseDown(where : BPoint);
begin
  //BCheckBox_MouseDown(CPlusObject, where.CPlusObject);
end;

procedure BCheckBox.MessageReceived(msg : BMessage);
begin
  //BCheckBox_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BCheckBox.WindowActivated(state : boolean);
begin
 // BCheckBox_WindowActivated(CPlusObject, state);
end;

procedure BCheckBox.KeyDown(bytes : PChar; numBytes : integer);
begin
  //BCheckBox_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure BCheckBox.MouseUp(pt : BPoint);
begin
  //BCheckBox_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BCheckBox.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  //BCheckBox_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BCheckBox.DetachedFromWindow;
begin
  //BCheckBox_DetachedFromWindow(CPlusObject);
end;

procedure BCheckBox.SetValue(avalue : integer);
begin
  BCheckBox_SetValue(CPlusObject, avalue);
end;

procedure BCheckBox.GetPreferredSize(width : double; height : double);
begin
  BCheckBox_GetPreferredSize(CPlusObject, width, height);
end;

procedure BCheckBox.ResizeToPreferred;
begin
  BCheckBox_ResizeToPreferred(CPlusObject);
end;

function BCheckBox.Invoke(msg : BMessage) : Status_t;
begin
  Result := BCheckBox_Invoke(CPlusObject, msg.CPlusObject);
end;

procedure BCheckBox.FrameMoved(new_position : BPoint);
begin
  BCheckBox_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BCheckBox.FrameResized(new_width : double; new_height : double);
begin
  BCheckBox_FrameResized(CPlusObject, new_width, new_height);
end;

function BCheckBox.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BCheckBox_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BCheckBox.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BCheckBox_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

procedure BCheckBox.MakeFocus(state : boolean);
begin
  BCheckBox_MakeFocus(CPlusObject, state);
end;

procedure BCheckBox.AllAttached;
begin
  BCheckBox_AllAttached(CPlusObject);
end;

procedure BCheckBox.AllDetached;
begin
  BCheckBox_AllDetached(CPlusObject);
end;

function BCheckBox.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BCheckBox_Perform(CPlusObject, d, arg);
end;

{procedure ._ReservedCheckBox1;
begin
  BCheckBox__ReservedCheckBox1(CPlusObject);
end;

procedure ._ReservedCheckBox2;
begin
  BCheckBox__ReservedCheckBox2(CPlusObject);
end;

procedure ._ReservedCheckBox3;
begin
  BCheckBox__ReservedCheckBox3(CPlusObject);
end;

function .operator=( : ) : ;
begin
  Result := BCheckBox_operator=(CPlusObject, );
end;

procedure .bool fOutlined;
begin
  BCheckBox_bool fOutlined(CPlusObject);
end;

procedure .uint32 _reserved[2];
begin
  BCheckBox_uint32 _reserved[2](CPlusObject);
end;

}
end.
