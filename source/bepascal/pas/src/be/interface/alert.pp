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
unit Alert;

interface

uses
  BeObj, Archivable, Button, InterfaceDefs, Invoker, Handler, Message, Rect,
  SupportDefs, TextView, Window;

type
  alert_type = (
    B_EMPTY_ALERT,
    B_INFO_ALERT,
    B_IDEA_ALERT,
    B_WARNING_ALERT,
    B_STOP_ALERT
  );

  button_spacing = (B_EVEN_SPACING, B_OFFSET_SPACING);

  BAlert = class(BWindow)
  private
  public
    constructor Create(title : PChar; text : PChar; button1 : PChar;
                       button2 : PChar {$ifndef VER1_0}= nil{$endif};
                       button3 : PChar {$ifndef VER1_0}= nil{$endif};
                       width : button_width {$ifndef VER1_0}= B_WIDTH_AS_USUAL{$endif};
                       type_ : alert_type {$ifndef VER1_0}= B_INFO_ALERT{$endif});
    constructor Create(title : PChar; text : PChar; button1 : PChar;
                       button2 : PChar; button3 : PChar; width : button_width;
                       spacing : button_spacing;
                       type_ : alert_type {$ifndef VER1_0}= B_INFO_ALERT{$endif});
    constructor Create(data : BMessage);

    destructor Destroy; override;

    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : Boolean {$ifndef VER1_0}= true{$endif}) : status_t;
    procedure SetShortcut(button_index : Longint; key : Char);
    function Shortcut(button_index : Longint) : Char;
    function Go : Longint;
    function Go(invoker : BInvoker) : status_t;
    procedure MessageReceived(an_event : BMessage); override;
    procedure FrameResized(new_width, new_height : Single);
    function ButtonAt(index : Longint) : BButton;
    function TextView : BTextView;
    function ResolveSpecifier(msg : BMessage; index : Longint; specifier : BMessage; form : Longint; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : status_t;
    procedure DispatchMessage(msg : BMessage; handler : BHandler); override;
    procedure Quit;
    function QuitRequested : Boolean; override;
    function AlertPosition(width, height : Single) : BPoint;
  end;

function BAlert_Create(AObject : TBeObject; title : PChar; text : PChar;
                       button1 : PChar; button2 : PChar; button3 : PChar;
                       width : Button_Width; kind{type} : alert_type)
         : TCPlusObject; cdecl;  external BePascalLibName name 'BAlert_Create';

function BAlert_Create_1(AObject : TBeObject; title : PChar; text : PChar;
                         button1 : PChar; button2 : PChar; button3 : PChar;
                         width : button_width;  spacing : button_spacing;
                         kind{type} : Alert_Type) : TCPlusObject;
         cdecl;  external BePascalLibName name 'BAlert_Create_1';

function BAlert_Create_2(AObject : TBeObject; data : TCPlusObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BAlert_Create_2';

procedure BAlert_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BAlert_Free';

function BAlert_Instantiate(AObject : TCPlusObject; data : TCPlusObject)
         : BArchivable; cdecl; external BePascalLibName name 'BAlert_Instantiate';
function BAlert_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean)
         : Status_t; cdecl; external BePascalLibName name 'BAlert_Archive';
procedure BAlert_SetShortcut(AObject : TCPlusObject; button_index : Longint; key : Char);
          cdecl; external BePascalLibName name 'BAlert_SetShortcut';
function BAlert_Shortcut(AObject : TCPlusObject; button_index : Longint) : Char;
         cdecl; external BePascalLibName name 'BAlert_Shortcut';
function BAlert_Go(AObject : TCPlusObject) : Longint;
         cdecl; external BePascalLibName name 'BAlert_Go';
function BAlert_Go(AObject : TCPlusObject; invoker : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BAlert_Go';
procedure BAlert_MessageReceived(AObject : TCPlusObject; an_event : TCPlusObject);
          cdecl; external BePascalLibName name 'BAlert_MessageReceived';
procedure BAlert_FrameResized(AObject : TCPlusObject; new_width, new_height : Single);
          cdecl; external BePascalLibName name 'BAlert_FrameResized';
function BAlert_ButtonAt(AObject : TCPlusObject; index : Longint) : BButton;
         cdecl; external BePascalLibName name 'BAlert_ButtonAt';
function BAlert_TextView(AObject : TCPlusObject) : BTextView;
         cdecl; external BePascalLibName name 'BAlert_TextView';
function BAlert_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject;
                                 index : Longint; specifier : TCPlusObject;
                                 form : Longint; properti : PChar) : BHandler;
         cdecl; external BePascalLibName name 'BAlert_ResolveSpecifier';
function BAlert_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject)
         : status_t; cdecl; external BePascalLibName name 'BAlert_GetSupportedSuites';
procedure BAlert_DispatchMessage(AObject : TCPlusObject; msg : TCPlusObject;
                                 handler : TCPlusObject);
          cdecl; external BePascalLibName name 'BAlert_DispatchMessage';
procedure BAlert_Quit(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BAlert_Quit';
function BAlert_QuitRequested(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BAlert_QuitRequested';
function BAlert_AlertPosition(AObject : TCPlusObject; width, height : Single)
         : BPoint; cdecl; external BePascalLibName name 'BAlert_AlertPosition';

implementation

constructor BAlert.Create(title : PChar; text : PChar; button1 : PChar;
                          button2 : PChar; button3 : PChar; width : button_width;
                          type_ : alert_type);
begin
	CPlusObject := BAlert_Create(Self, title, text, button1, button2, button3,
	                             width, type_);
end;

constructor BAlert.Create(title : PChar; text : PChar; button1 : PChar;
                          button2 : PChar; button3 : PChar; width : button_width;
                          spacing : button_spacing; type_ : alert_type);
begin
  CPlusObject := BAlert_Create_1(Self, title, text, button1, button2, button3,
                                 width, spacing, type_);
end;

constructor BAlert.Create(data : BMessage);
begin
  CPlusObject := BAlert_Create_2(Self, data.CPlusObject);
end;

destructor BAlert.Destroy;
begin
  BAlert_Free(CPlusObject);
end;

function BAlert.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BAlert_Instantiate(CPlusObject, data.CPlusObject);
end;

function BAlert.Archive(data : BMessage; deep : Boolean) : status_t;
begin
  Result := BAlert_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BAlert.SetShortcut(button_index : Longint; key : Char);
begin
  BAlert_SetShortcut(CPlusObject, button_index, key);
end;

function BAlert.Shortcut(button_index : Longint) : Char;
begin
  Result := BAlert_Shortcut(CPlusObject, button_index);
end;

function BAlert.Go : Longint;
begin
  Result := BAlert_Go(CPlusObject);
end;

function BAlert.Go(invoker : BInvoker) : status_t;
begin
  Result := BAlert_Go(CPlusObject, invoker.CPlusObject);
end;

procedure BAlert.MessageReceived(an_event : BMessage);
begin
  BAlert_MessageReceived(CPlusObject, an_event.CPlusObject);
end;

procedure BAlert.FrameResized(new_width, new_height : Single);
begin
  BAlert_FrameResized(CPlusObject, new_width, new_height);
end;

function BAlert.ButtonAt(index : Longint) : BButton;
begin
  Result := BAlert_ButtonAt(CPlusObject, index);
end;

function BAlert.TextView : BTextView;
begin
  Result := BAlert_TextView(CPlusObject);
end;

function BAlert.ResolveSpecifier(msg : BMessage; index : Longint; specifier : BMessage; form : Longint; properti : PChar) : BHandler;
begin
  Result := BAlert_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BAlert.GetSupportedSuites(data : BMessage) : status_t;
begin
  Result := BAlert_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

procedure BAlert.DispatchMessage(msg : BMessage; handler : BHandler);
begin
  BAlert_DispatchMessage(CPlusObject, msg.CPlusObject, handler.CPlusObject);
end;

procedure BAlert.Quit;
begin
  BAlert_Quit(CPlusObject);
end;

function BAlert.QuitRequested : Boolean;
begin
  Result := BAlert_QuitRequested(CPlusObject);
end;

function BAlert.AlertPosition(width : Single; height : Single) : BPoint;
begin
  Result := BAlert_AlertPosition(CPlusObject, width, height);
end;

end.