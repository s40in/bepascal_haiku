{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003 Olivier Coursiere
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
unit box;

interface

uses
  BeObj, Archivable, Control, Handler, Message, Rect, SupportDefs,
  InterfaceDefs, View;

type

  BBox = class(BView)
  private
  public
    constructor Create(aFrame : BRect; Name : PChar; sResizingMode, sFlags : Cardinal; BorderStyle : border_style);
    constructor Create(data : BMessage);
    destructor Destroy; override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure SetBorder(style : border_style);
    function Border : border_style;
    procedure SetLabel(aLabel : PChar);
    function SetLabel(view_label : BView) : Status_t;
    // Conflicting Name: Label is a reserved word in Pascal.
    // I will use: GetLabel
    function GetLabel : PChar;

    function LabelView : BView;
    procedure Draw(abounds : BRect); override;
    procedure AttachedToWindow; override;
    procedure DetachedFromWindow; override;
    procedure AllAttached; override;
    procedure AllDetached; override;
    procedure FrameResized(new_width : double; new_height : double); override;
    procedure MessageReceived(msg : BMessage); override;
    procedure MouseDown(pt : BPoint); override;
    procedure MouseUp(pt : BPoint); override;
    procedure WindowActivated(state : boolean); override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage); override;
    procedure FrameMoved(new_position : BPoint); override;
    function ResolveSpecifier(msg : BMessage; index : integer;
                              specifier : BMessage; form : integer;
                              properti : PChar) : BHandler;
    procedure ResizeToPreferred; override;
    procedure GetPreferredSize(width : double; height : double);
    procedure MakeFocus(state : boolean);
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
  end;

function BBox_Create(AObject : TBeObject; Frame : TCPlusObject;Name : PChar; ResizingMode, Flags : Cardinal; BorderStyle : border_style) : TCPlusObject; cdecl; external BePascalLibName name 'BBox_Create';

function BBox_Create_1(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BBox_Create_1';
procedure BBox_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BBox_Free';
function BBox_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BBox_Instantiate';
function BBox_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BBox_Archive';
procedure BBox_SetBorder(AObject : TCPlusObject; style :  border_style); cdecl; external BePascalLibName name 'BBox_SetBorder';
function BBox_Border(AObject : TCPlusObject) :  border_style; cdecl; external BePascalLibName name 'BBox_Border';

// Conflicting name Label --> aLabel.
procedure BBox_SetLabel(AObject : TCPlusObject; aLabel : PChar); cdecl; external BePascalLibName name 'BBox_SetLabel';

function BBox_SetLabel(AObject : TCPlusObject; view_label : BView) : Status_t; cdecl; external BePascalLibName name 'BBox_SetLabel';
function BBox_Label(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BBox_Label';

function BBox_LabelView(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BBox_LabelView_1';

procedure BBox_Draw(AObject : TCPlusObject; bounds : BRect); cdecl; external BePascalLibName name 'BBox_Draw';
procedure BBox_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BBox_AttachedToWindow';
procedure BBox_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BBox_DetachedFromWindow';
procedure BBox_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BBox_AllAttached';
procedure BBox_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BBox_AllDetached';
procedure BBox_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BBox_FrameResized';
procedure BBox_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BBox_MessageReceived';
procedure BBox_MouseDown(AObject : TCPlusObject; pt : BPoint); cdecl; external BePascalLibName name 'BBox_MouseDown';
procedure BBox_MouseUp(AObject : TCPlusObject; pt : BPoint); cdecl; external BePascalLibName name 'BBox_MouseUp';
procedure BBox_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BBox_WindowActivated';
procedure BBox_MouseMoved(AObject : TCPlusObject; pt : BPoint; code : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BBox_MouseMoved';
procedure BBox_FrameMoved(AObject : TCPlusObject; new_position : BPoint); cdecl; external BePascalLibName name 'BBox_FrameMoved';
function BBox_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BBox_ResolveSpecifier';
procedure BBox_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BBox_ResizeToPreferred';
procedure BBox_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BBox_GetPreferredSize';
procedure BBox_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BBox_MakeFocus';
function BBox_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BBox_GetSupportedSuites';
function BBox_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BBox_Perform';


implementation


constructor BBox.Create(aFrame : BRect; Name : PChar; sResizingMode, sFlags : Cardinal; BorderStyle : border_style);
begin
  CreatePas;
  CPlusObject := BBox_Create(Self, aFrame.CPlusObject, Name, sResizingMode, sFlags, BorderStyle);
end;

constructor BBox.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BBox_Create_1(Self, data.CPlusObject);
end;

destructor BBox.Destroy;
begin
  BBox_Free(CPlusObject);
  inherited;
end;

function BBox.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BBox_Instantiate(CPlusObject, data.CPlusObject);
end;

function BBox.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BBox_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BBox.SetBorder(style : border_style);
begin
  BBox_SetBorder(CPlusObject, style);
end;

function BBox.Border : border_style;
begin
  Result := BBox_Border(CPlusObject);
end;

procedure BBox.SetLabel(aLabel : PChar);
begin
  BBox_SetLabel(CPlusObject, aLabel);
end;

function BBox.SetLabel(view_label : BView) : Status_t;
begin
  Result := BBox_SetLabel(CPlusObject, view_label{.CPlusObject});
end;

// Conflicting Name: Label is a reserved word in Pascal.
// I will use: GetLabel
function BBox.GetLabel : PChar;
begin
  Result := BBox_Label(CPlusObject);
end;


function BBox.LabelView : BView;
begin
  Result := BBox_LabelView(CPlusObject);
end;


procedure BBox.Draw(abounds : BRect);
begin
  BBox_Draw(CPlusObject, abounds{.CPlusObject});
end;

procedure BBox.AttachedToWindow;
begin
  BBox_AttachedToWindow(CPlusObject);
end;

procedure BBox.DetachedFromWindow;
begin
  BBox_DetachedFromWindow(CPlusObject);
end;

procedure BBox.AllAttached;
begin
  BBox_AllAttached(CPlusObject);
end;

procedure BBox.AllDetached;
begin
  BBox_AllDetached(CPlusObject);
end;

procedure BBox.FrameResized(new_width : double; new_height : double);
begin
  BBox_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BBox.MessageReceived(msg : BMessage);
begin
  BBox_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BBox.MouseDown(pt : BPoint);
begin
  BBox_MouseDown(CPlusObject, pt{.CPlusObject});
end;

procedure BBox.MouseUp(pt : BPoint);
begin
  BBox_MouseUp(CPlusObject, pt{.CPlusObject});
end;

procedure BBox.WindowActivated(state : boolean);
begin
  BBox_WindowActivated(CPlusObject, state);
end;

procedure BBox.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  BBox_MouseMoved(CPlusObject, pt{.CPlusObject}, code, msg);
end;

procedure BBox.FrameMoved(new_position : BPoint);
begin
  BBox_FrameMoved(CPlusObject, new_position{.CPlusObject});
end;

function BBox.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BBox_ResolveSpecifier(CPlusObject, msg{.CPlusObject}, index, specifier{.CPlusObject}, form, properti);
end;

procedure BBox.ResizeToPreferred;
begin
  BBox_ResizeToPreferred(CPlusObject);
end;

procedure BBox.GetPreferredSize(width : double; height : double);
begin
  BBox_GetPreferredSize(CPlusObject, width, height);
end;

procedure BBox.MakeFocus(state : boolean);
begin
  BBox_MakeFocus(CPlusObject, state);
end;

function BBox.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BBox_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BBox.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BBox_Perform(CPlusObject, d, arg);
end;


end.
