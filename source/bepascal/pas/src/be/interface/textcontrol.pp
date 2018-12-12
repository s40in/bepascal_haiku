{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere
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
unit TextControl;

interface

uses
  beobj, Control, Message, Archivable, SupportDefs, Rect, Handler,interfacedefs;

type
  BTextControl = class(BControl)
  private
  public
    destructor Destroy;override;
	constructor Create(aframe : BRect; name, aLabel,initial : PChar; message : BMessage; sresizingMode, sflags : Cardinal); virtual;
    constructor Create(data : BMessage);override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure SetText(texte : PChar);
    function Text : PChar;
    procedure SetValue(valu : integer);
    function Invoke(msg : BMessage) : Status_t;
    function TextView : BTextControl;
    procedure SetModificationMessage(message : BMessage);
    function ModificationMessage : BMessage;
    procedure SetAlignment(alabel :  Alignment; texte :  Alignment);
    procedure GeAlignment(alabel : Alignment; texte : Alignment);
    procedure SetDivider(dividing_line : single);
    function Divider : single;
    procedure Draw(updateRect : BRect);override;
    procedure MouseDown(where : BPoint);override;
    procedure AttachedToWindow;override;
    procedure MakeFocus(focusState : boolean);
    procedure SetEnabled(state : boolean);
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(new_width : double; new_height : double);override;
    procedure WindowActivated(active : boolean);override;
    procedure GetPreferredSize(width : double; height : double);
    procedure ResizeToPreferred;override;
    procedure MessageReceived(msg : BMessage);override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    procedure MouseUp(pt : BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
    procedure AllAttached;override;
    procedure AllDetached;override;
    function GetSupportedSuites(data : BMessage) : Status_t;
    procedure SetFlags(flags : Cardinal);
    {$ifndef HAIKU}    
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    {$endif}
  {  procedure _ReservedTextControl1;
    procedure _ReservedTextControl2;
    procedure _ReservedTextControl3;
    procedure _ReservedTextControl4;
    function operator=( : BTextControl) : BTextControl;
    procedure CommitValue;
    procedure InitData(label : PChar; initial_text : PChar; data : BMessage);
    procedure _BTextInput_ *fText;
    procedure char *fLabel;
    procedure BMessage *fModificationMessage;
    procedure alignment fLabelAlign;
    procedure float fDivider;
    procedure uint16 fPrevWidth;
    procedure uint16 fPrevHeight;
    procedure uint32 _reserved[3];
    procedure uint32 _more_reserved[4];
    procedure bool fClean;
    procedure bool fSkipSetFlags;
    procedure bool fUnusedBool1;
    procedure bool fUnusedBool2;
  }
  end;

procedure BTextControl_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_Free';
function BTextControl_Create(AObject : TBeObject; aframe : TCPlusObject; name, aLabel ,initial: PChar; message : TCPlusObject; sresizingMode, flags : Cardinal): TCPlusObject; cdecl; external BePascalLibName name 'BTextControl_Create';
function BTextControl_Create(AObject : TBeObject; data : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BTextControl_Create_1';
function BTextControl_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BTextControl_Instantiate';
function BTextControl_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BTextControl_Archive';
procedure BTextControl_SetText(AObject : TCPlusObject; text : PChar); cdecl; external BePascalLibName name 'BTextControl_SetText';
function BTextControl_Text(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BTextControl_Text';
procedure BTextControl_SetValue(AObject : TCPlusObject; value : integer); cdecl; external BePascalLibName name 'BTextControl_SetValue';
function BTextControl_Invoke(AObject : TCPlusObject; msg : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BTextControl_Invoke';
function BTextControl_TextView(AObject : TCPlusObject) : BTextControl; cdecl; external BePascalLibName name 'BTextControl_TextView';
procedure BTextControl_SetModificationMessage(AObject : TCPlusObject; message : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_SetModificationMessage';
function BTextControl_ModificationMessage(AObject : TCPlusObject) : BMessage; cdecl; external BePascalLibName name 'BTextControl_ModificationMessage';
procedure BTextControl_SeAlignment(AObject : TCPlusObject; alabel :  Alignment; texte :  Alignment); cdecl; external BePascalLibName name 'BTextControl_SetAlignment';
procedure BTextControl_GeAlignment(AObject : TCPlusObject; alabel : Alignment; texte : Alignment); cdecl; external BePascalLibName name 'BTextControl_GetAlignment';
procedure BTextControl_SetDivider(AObject : TCPlusObject; dividing_line : single); cdecl; external BePascalLibName name 'BTextControl_SetDivider';
function BTextControl_Divider(AObject : TCPlusObject) : single; cdecl; external BePascalLibName name 'BTextControl_Divider';
procedure BTextControl_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_Draw';
procedure BTextControl_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_MouseDown';
procedure BTextControl_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_AttachedToWindow';
procedure BTextControl_MakeFocus(AObject : TCPlusObject; focusState : boolean); cdecl; external BePascalLibName name 'BTextControl_MakeFocus';
procedure BTextControl_SetEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BTextControl_SetEnabled';
procedure BTextControl_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_FrameMoved';
procedure BTextControl_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BTextControl_FrameResized';
procedure BTextControl_WindowActivated(AObject : TCPlusObject; active : boolean); cdecl; external BePascalLibName name 'BTextControl_WindowActivated';
procedure BTextControl_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BTextControl_GetPreferredSize';
procedure BTextControl_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_ResizeToPreferred';
procedure BTextControl_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_MessageReceived';
function BTextControl_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BTextControl_ResolveSpecifier';
procedure BTextControl_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_MouseUp';
procedure BTextControl_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_MouseMoved';
procedure BTextControl_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_DetachedFromWindow';
procedure BTextControl_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_AllAttached';
procedure BTextControl_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_AllDetached';
function BTextControl_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BTextControl_GetSupportedSuites';
procedure BTextControl_SetFlags(AObject : TCPlusObject; flags : Cardinal); cdecl; external BePascalLibName name 'BTextControl_SetFlags';
function BTextControl_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BTextControl_Perform';



{procedure BTextControl__ReservedTextControl1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl__ReservedTextControl1';
procedure BTextControl__ReservedTextControl2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl__ReservedTextControl2';
procedure BTextControl__ReservedTextControl3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl__ReservedTextControl3';
procedure BTextControl__ReservedTextControl4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl__ReservedTextControl4';
function BTextControl_operator=(AObject : TCPlusObject;  : BTextControl) : BTextControl; cdecl; external BePascalLibName name 'BTextControl_operator=';
procedure BTextControl_CommitValue(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_CommitValue';
procedure BTextControl_InitData(AObject : TCPlusObject; label : PChar; initial_text : PChar; data : BMessage); cdecl; external BePascalLibName name 'BTextControl_InitData';
procedure BTextControl__BTextInput_ *fText(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl__BTextInput_ *fText';
procedure BTextControl_char *fLabel(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_char *fLabel';
procedure BTextControl_BMessage *fModificationMessage(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_BMessage *fModificationMessage';
procedure BTextControl_alignment fLabelAlign(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_alignment fLabelAlign';
procedure BTextControl_float fDivider(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_float fDivider';
procedure BTextControl_uint16 fPrevWidth(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_uint16 fPrevWidth';
procedure BTextControl_uint16 fPrevHeight(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_uint16 fPrevHeight';
procedure BTextControl_uint32 _reserved[3](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_uint32 _reserved[3]';
procedure BTextControl_uint32 _more_reserved[4](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_uint32 _more_reserved[4]';
procedure BTextControl_bool fClean(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_bool fClean';
procedure BTextControl_bool fSkipSetFlags(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_bool fSkipSetFlags';
procedure BTextControl_bool fUnusedBool1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_bool fUnusedBool1';
procedure BTextControl_bool fUnusedBool2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextControl_bool fUnusedBool2';
}
implementation

destructor BTextControl.Destroy;
begin
  BTextControl_Free(CPlusObject);
  inherited;
end;

constructor BTextControl.Create(aframe : BRect; name, aLabel,initial : PChar; message : BMessage; sresizingMode, sflags : Cardinal);
begin
  CreatePas;
  CPlusObject := BTextControl_Create(Self, aframe.CPlusObject, name, aLabel,initial, message.CPlusObject, sresizingMode, sflags);
end;


constructor BTextControl.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BTextControl_Create(Self, data.CPlusObject);
end;

function BTextControl.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BTextControl_Instantiate(CPlusObject, data.CPlusObject);
end;

function BTextControl.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BTextControl_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BTextControl.SetText(texte : PChar);
begin
  BTextControl_SetText(CPlusObject, texte);
end;

function BTextControl.Text : PChar;
begin
  Result := BTextControl_Text(CPlusObject);
end;

procedure BTextControl.SetValue(valu : integer);
begin
  BTextControl_SetValue(CPlusObject, valu);
end;

function BTextControl.Invoke(msg : BMessage) : Status_t;
begin
  Result := BTextControl_Invoke(CPlusObject, msg.CPlusObject);
end;

function BTextControl.TextView : BTextControl;
begin
  Result := BTextControl_TextView(CPlusObject);
end;

procedure BTextControl.SetModificationMessage(message : BMessage);
begin
  BTextControl_SetModificationMessage(CPlusObject, message.CPlusObject);
end;

function BTextControl.ModificationMessage : BMessage;
begin
  Result := BTextControl_ModificationMessage(CPlusObject);
end;

procedure BTextControl.SetAlignment(alabel :  Alignment; texte :  Alignment);
begin
  BTextControl_SeAlignment(CPlusObject, alabel, texte);
end;

procedure BTextControl.GeAlignment(alabel : Alignment; texte : Alignment);
begin
  BTextControl_GeAlignment(CPlusObject, alabel, texte);
end;

procedure BTextControl.SetDivider(dividing_line : single);
begin
  BTextControl_SetDivider(CPlusObject, dividing_line);
end;

function BTextControl.Divider : single;
begin
  Result := BTextControl_Divider(CPlusObject);
end;

procedure BTextControl.Draw(updateRect : BRect);
begin
end;

procedure BTextControl.MouseDown(where : BPoint);
begin
end;

procedure BTextControl.AttachedToWindow;
begin
end;

procedure BTextControl.MakeFocus(focusState : boolean);
begin
  BTextControl_MakeFocus(CPlusObject, focusState);
end;

procedure BTextControl.SetEnabled(state : boolean);
begin
  BTextControl_SetEnabled(CPlusObject, state);
end;

procedure BTextControl.FrameMoved(new_position : BPoint);
begin
end;

procedure BTextControl.FrameResized(new_width : double; new_height : double);
begin
//  BTextControl_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BTextControl.WindowActivated(active : boolean);
begin
  //BTextControl_WindowActivated(CPlusObject, active);
end;

procedure BTextControl.GetPreferredSize(width : double; height : double);
begin
  //BTextControl_GetPreferredSize(CPlusObject, width, height);
end;

procedure BTextControl.ResizeToPreferred;
begin
  //BTextControl_ResizeToPreferred(CPlusObject);
end;

procedure BTextControl.MessageReceived(msg : BMessage);
begin
  //BTextControl_MessageReceived(CPlusObject, msg.CPlusObject);
end;

function BTextControl.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BTextControl_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

procedure BTextControl.MouseUp(pt : BPoint);
begin
  //BTextControl_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure BTextControl.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  //BTextControl_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure BTextControl.DetachedFromWindow;
begin
  //BTextControl_DetachedFromWindow(CPlusObject);
end;

procedure BTextControl.AllAttached;
begin
  //BTextControl_AllAttached(CPlusObject);
end;

procedure BTextControl.AllDetached;
begin
  //BTextControl_AllDetached(CPlusObject);
end;

function BTextControl.GetSupportedSuites(data : BMessage) : Status_t;
begin

  Result := BTextControl_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

procedure BTextControl.SetFlags(flags : Cardinal);
begin
  BTextControl_SetFlags(CPlusObject, flags);
end;

{$ifndef HAIKU}
function BTextControl.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BTextControl_Perform(CPlusObject, d, arg);
end;
{$endif}

{procedure BTextControl._ReservedTextControl1;
begin
  BTextControl__ReservedTextControl1(CPlusObject);
end;

procedure BTextControl._ReservedTextControl2;
begin
  BTextControl__ReservedTextControl2(CPlusObject);
end;

procedure BTextControl._ReservedTextControl3;
begin
  BTextControl__ReservedTextControl3(CPlusObject);
end;

procedure BTextControl._ReservedTextControl4;
begin
  BTextControl__ReservedTextControl4(CPlusObject);
end;

function BTextControl.operator=( : BTextControl) : BTextControl;
begin
  Result := BTextControl_operator=(CPlusObject, );
end;

procedure BTextControl.CommitValue;
begin
  BTextControl_CommitValue(CPlusObject);
end;

procedure BTextControl.InitData(label : PChar; initial_text : PChar; data : BMessage);
begin
  BTextControl_InitData(CPlusObject, label, initial_text, data.CPlusObject);
end;

procedure BTextControl._BTextInput_ *fText;
begin
  BTextControl__BTextInput_ *fText(CPlusObject);
end;

procedure BTextControl.char *fLabel;
begin
  BTextControl_char *fLabel(CPlusObject);
end;

procedure BTextControl.BMessage *fModificationMessage;
begin
  BTextControl_BMessage *fModificationMessage(CPlusObject);
end;

procedure BTextControl.alignment fLabelAlign;
begin
  BTextControl_alignment fLabelAlign(CPlusObject);
end;

procedure BTextControl.float fDivider;
begin
  BTextControl_float fDivider(CPlusObject);
end;

procedure BTextControl.uint16 fPrevWidth;
begin
  BTextControl_uint16 fPrevWidth(CPlusObject);
end;

procedure BTextControl.uint16 fPrevHeight;
begin
  BTextControl_uint16 fPrevHeight(CPlusObject);
end;

procedure BTextControl.uint32 _reserved[3];
begin
  BTextControl_uint32 _reserved[3](CPlusObject);
end;

procedure BTextControl.uint32 _more_reserved[4];
begin
  BTextControl_uint32 _more_reserved[4](CPlusObject);
end;

procedure BTextControl.bool fClean;
begin
  BTextControl_bool fClean(CPlusObject);
end;

procedure BTextControl.bool fSkipSetFlags;
begin
  BTextControl_bool fSkipSetFlags(CPlusObject);
end;

procedure BTextControl.bool fUnusedBool1;
begin
  BTextControl_bool fUnusedBool1(CPlusObject);
end;

procedure BTextControl.bool fUnusedBool2;
begin
  BTextControl_bool fUnusedBool2(CPlusObject);
end;
}

end.
