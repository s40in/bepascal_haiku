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
unit control;

interface

uses
  beobj, View, Message, Archivable, Rect, Handler, SupportDefs, Invoker;

type
  BControl = class(BView)
  private
  protected
    FInvoker : BInvoker;
    function GeBInvoker : BInvoker;
  public
    constructor Create(aframe : TCPlusObject; name, aLabel : PChar; message : TCPlusObject; sresizingMode, sflags : Cardinal); virtual;
    destructor Destroy; override;
    constructor Create(data : BMessage); virtual;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure WindowActivated(state : boolean); override;
    procedure AttachedToWindow; override;
    procedure MessageReceived(msg : BMessage); override;
    procedure MakeFocus(state : boolean); 
    procedure KeyDown(bytes : PChar; numBytes : integer); override;
    procedure MouseDown(pt : BPoint); override;
    procedure MouseUp(pt : BPoint); override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage); override;
    procedure DetachedFromWindow; override;
    procedure SetLabel(text : PChar);
    function Labl : PChar;
    procedure SetValue(aValue : integer);
    function Value : integer;
    procedure SetEnabled(aOn : boolean);
    function IsEnabled : boolean;
    procedure GetPreferredSize(width : double; height : double);
    procedure ResizeToPreferred; override;
    function Invoke(msg : BMessage) : Status_t;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti{;-)} : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    procedure AllAttached; override;
    procedure AllDetached; override;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    property Invoker : BInvoker read GeBInvoker;
  end;

//function BControl_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BControl_Create';
function BControl_Create(AObject : TBeObject; frame : TCPlusObject; name, aLabel : PChar; message : TCPlusObject; resizingMode, flags : Cardinal) : TCPlusObject; cdecl; external BePascalLibName name 'BControl_Create';
procedure BControl_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BControl_Free';
function BControl_Create(AObject : TBeObject; data : TCplusObject) : TCplusObject; cdecl; external BePascalLibName name 'BControl_Create';
function BControl_Instantiate(AObject : TCPlusObject; data : TCplusObject) : BArchivable; cdecl; external BePascalLibName name 'BControl_Instantiate';
function BControl_Archive(AObject : TCPlusObject; data : TCplusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BControl_Archive';
procedure BControl_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BControl_WindowActivated';
procedure BControl_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BControl_AttachedToWindow';
procedure BControl_MessageReceived(AObject : TCPlusObject; msg : TCplusObject); cdecl; external BePascalLibName name 'BControl_MessageReceived';
procedure BControl_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BControl_MakeFocus';
procedure BControl_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BControl_KeyDown';
procedure BControl_MouseDown(AObject : TCPlusObject; pt : TCplusObject); cdecl; external BePascalLibName name 'BControl_MouseDown';
procedure BControl_MouseUp(AObject : TCPlusObject; pt : TCplusObject); cdecl; external BePascalLibName name 'BControl_MouseUp';
procedure BControl_MouseMoved(AObject : TCPlusObject; pt : TCplusObject; code : Cardinal; msg : TCplusObject); cdecl; external BePascalLibName name 'BControl_MouseMoved';
procedure BControl_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BControl_DetachedFromWindow';
procedure BControl_SetLabel(AObject : TCPlusObject; text : PChar); cdecl; external BePascalLibName name 'BControl_SetLabel';
function BControl_Labl(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BControl_Label';
procedure BControl_SetValue(AObject : TCPlusObject; value : integer); cdecl; external BePascalLibName name 'BControl_SetValue';
function BControl_Value(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BControl_Value';
procedure BControl_SetEnabled(AObject : TCPlusObject; aOn : boolean); cdecl; external BePascalLibName name 'BControl_SetEnabled';
function BControl_IsEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BControl_IsEnabled';
procedure BControl_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BControl_GetPreferredSize';
procedure BControl_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BControl_ResizeToPreferred';
function BControl_Invoke(AObject : TCPlusObject; msg : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BControl_Invoke';
function BControl_ResolveSpecifier(AObject : TCPlusObject; msg : TCplusObject; index : integer; specifier : TCplusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BControl_ResolveSpecifier';
function BControl_GetSupportedSuites(AObject : TCPlusObject; data : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BControl_GetSupportedSuites';
procedure BControl_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BControl_AllAttached';
procedure BControl_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BControl_AllDetached';
function BControl_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BControl_Perform';
procedure BControl_InitData(AObject : TCPlusObject; data : TCplusObject); cdecl; external BePascalLibName name 'BControl_InitData';

implementation

constructor BControl.Create(aframe : TCPlusObject; name, aLabel : PChar; message : TCPlusObject; sresizingMode, sflags : Cardinal);
begin
  CPlusObject := BControl_Create(Self, aframe, name, aLabel, message, sresizingMode, sflags);
end;

destructor BControl.Destroy;
begin
  if FInvoker <> nil then
    FInvoker.UnWrap;
  BControl_Free(CPlusObject);
end;

constructor BControl.Create(data : BMessage);
begin
  CPlusObject := BControl_Create(Self, data.CPlusObject);
end;

function BControl.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BControl_Instantiate(CPlusObject, data.CPlusObject);
end;

function BControl.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BControl_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BControl.WindowActivated(state : boolean);
begin
//  BControl_WindowActivated(CPlusObject, state);
end;

procedure BControl.AttachedToWindow;
begin
//  BControl_AttachedToWindow(CPlusObject);
end;

procedure BControl.MessageReceived(msg : BMessage);
begin
//  BControl_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BControl.MakeFocus(state : boolean);
begin
//  BControl_MakeFocus(CPlusObject, state);
end;

procedure BControl.KeyDown(bytes : PChar; numBytes : integer);
begin
//  BControl_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure BControl.MouseDown(pt : BPoint);
begin
//  BControl_MouseDown(CPlusObject, pt.CPlusObject);
end;

procedure BControl.MouseUp(pt : BPoint);
begin
//  BControl_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BControl.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
//  BControl_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BControl.DetachedFromWindow;
begin
//  BControl_DetachedFromWindow(CPlusObject);
end;

procedure BControl.SetLabel(text : PChar);
begin
  BControl_SetLabel(CPlusObject, text);
end;

function BControl.Labl : PChar;
begin
  Result := BControl_Labl(CPlusObject);
end;

procedure BControl.SetValue(aValue : integer);
begin
  BControl_SetValue(CPlusObject, aValue);
end;

function BControl.Value : integer;
begin
  Result := BControl_Value(CPlusObject);
end;

procedure BControl.SetEnabled(aOn : boolean);
begin
  BControl_SetEnabled(CPlusObject, aOn);
end;

function BControl.IsEnabled : boolean;
begin
  Result := BControl_IsEnabled(CPlusObject);
end;

procedure BControl.GetPreferredSize(width : double; height : double);
begin
//  BControl_GetPreferredSize(CPlusObject, width, height);
end;

procedure BControl.ResizeToPreferred;
begin
//  BControl_ResizeToPreferred(CPlusObject);
end;

function BControl.Invoke(msg : BMessage) : Status_t;
begin
  Result := BControl_Invoke(CPlusObject, msg.CPlusObject);
end;

function BControl.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BControl_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BControl.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BControl_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

procedure BControl.AllAttached;
begin
//  BControl_AllAttached(CPlusObject);
end;

procedure BControl.AllDetached;
begin
//  BControl_AllDetached(CPlusObject);
end;

function BControl.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := bControl_Perform(CPlusObject, d, arg);
end;

//function BControl.IsFocusChanging : boolean;
//begin
//  Result := BControl_IsFocusChanging(CPlusObject);
//end;
//
//function BControl.IsTracking : boolean;
//begin
//  Result := BControl_IsTracking(CPlusObject);
//end;
//
//procedure BControl.SetTracking(state : boolean);
//begin
//  BControl_SetTracking(CPlusObject, state);
//end;
//
//procedure BControl.SetValueNoUpdate(aValue : integer);
//begin
//  BControl_SetValueNoUpdate(CPlusObject, aValue);
//end;

//procedure BControl._ReservedControl1;
//begin
//  BControl__ReservedControl1(CPlusObject);
//end;
//
//procedure BControl._ReservedControl2;
//begin
//  BControl__ReservedControl2(CPlusObject);
//end;
//
//procedure BControl._ReservedControl3;
//begin
//  BControl__ReservedControl3(CPlusObject);
//end;
//
//procedure BControl._ReservedControl4;
//begin
//  BControl__ReservedControl4(CPlusObject);
//end;

//function BControl.operator=( : BControl) : BControl;
//begin
//  Result := BControl_operator=(CPlusObject, );
//end;

//procedure BControl.InitData(data : BMessage);
//begin
//  BControl_InitData(CPlusObject, data.CPlusObject);
//end;

//procedure BControl.char *fLabel;
//begin
//  BControl_char *fLabel(CPlusObject);
//end;
//
//procedure BControl.int32 fValue;
//begin
//  BControl_int32 fValue(CPlusObject);
//end;
//
//procedure BControl.bool fEnabled;
//begin
//  BControl_bool fEnabled(CPlusObject);
//end;
//
//procedure BControl.bool fFocusChanging;
//begin
//  BControl_bool fFocusChanging(CPlusObject);
//end;
//
//procedure BControl.bool fTracking;
//begin
//  BControl_bool fTracking(CPlusObject);
//end;
//
//procedure BControl.bool fWantsNav;
//begin
//  BControl_bool fWantsNav(CPlusObject);
//end;
//
//procedure BControl.uint32 _reserved[4];
//begin
//  BControl_uint32 _reserved[4](CPlusObject);
//end;

function BControl.GeBInvoker : BInvoker;
begin
  if FInvoker = nil then
  begin
    Result := BInvoker.Wrap(CPlusObject);
  end;
  Result := FInvoker;
end;

end.
