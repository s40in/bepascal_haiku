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
unit RadioButton;

interface

uses
  BeObj, Archivable, Control, Handler, Message, SupportDefs, Rect;

type
  BRadioButton = class(BControl)
  public
	constructor Create(aframe : BRect; name, aLabel : PChar; message : BMessage;
	                   resizingMode_ : Longword {$ifndef VER1_0}= B_FOLLOW_LEFT or B_FOLLOW_TOP{$endif};
	                   flags : Longword {$ifndef VER1_0}= B_WILL_DRAW or B_NAVIGABLE{$endif}); virtual;
    constructor Create(data : BMessage); override;
    destructor Destroy; override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : Boolean {$ifndef VER1_0}= true{$endif}) : status_t;
    procedure Draw(updateRect : BRect); override;
    procedure MouseDown(where : BPoint); override;
    procedure AttachedToWindow; override;
    procedure KeyDown(bytes : PChar; numBytes : Longint); override;
    procedure SetValue(aValue : Longint);
    procedure GetPreferredSize(width, height : Single);
    procedure ResizeToPreferred; override;
    function Invoke(msg : BMessage {$ifndef VER1_0}= nil{$endif}) : status_t;
    procedure MessageReceived(msg : BMessage); override;
    procedure WindowActivated(state : Boolean); override;
    procedure MouseUp(pt : BPoint); override;
    procedure MouseMoved(pt : BPoint; code : Longword; msg : BMessage); override;
    procedure DetachedFromWindow; override;
    procedure FrameMoved(new_position : BPoint); override;
    procedure FrameResized(new_width, new_height : Single);// override;
    function ResolveSpecifier(msg : BMessage; index : Longint;
                              specifier : BMessage; form : Longint;
                              properti : PChar) : BHandler;
    procedure MakeFocus(state : Boolean {$ifndef VER1_0}= true{$endif});
    procedure AllAttached; override;
    procedure AllDetached; override;
    function GetSupportedSuites(data : BMessage) : status_t;
    function Perform(d : Perform_code; arg : Pointer) : status_t;
  end;

function BRadioButton_Create(AObject : TBeObject; frame : TCPlusObject;
                             name, aLabel : PChar; message : TCPlusObject;
                             resizingMode, flags : Longword) : TCPlusObject;
         cdecl; external BePascalLibName name 'BRadioButton_Create';
function BRadioButton_Create_1(AObject : TBeObject; data : TCPlusObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BRadioButton_Create_1';

procedure BRadioButton_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_FREE';

function BRadioButton_Instantiate(AObject : TCPlusObject; data : TCPlusObject)
         : BArchivable; cdecl; external BePascalLibName name 'BRadioButton_Instantiate';
function BRadioButton_Archive(AObject : TCPlusObject; data : TCPlusObject;
                              deep : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BRadioButton_Archive';
procedure BRadioButton_Draw(AObject : TCPlusObject; updateRect : BRect);
          cdecl; external BePascalLibName name 'BRadioButton_Draw';
procedure BRadioButton_MouseDown(AObject : TCPlusObject; where : BPoint);
          cdecl; external BePascalLibName name 'BRadioButton_MouseDown';
procedure BRadioButton_AttachedToWindow(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_AttachedToWindow';
procedure BRadioButton_KeyDown(AObject : TCPlusObject; bytes : PChar;
                               numBytes : Longint);
          cdecl; external BePascalLibName name 'BRadioButton_KeyDown';
procedure BRadioButton_SetValue(AObject : TCPlusObject; value : Longint);
          cdecl; external BePascalLibName name 'BRadioButton_SetValue';
procedure BRadioButton_GetPreferredSize(AObject : TCPlusObject; width, height : Single);
          cdecl; external BePascalLibName name 'BRadioButton_GetPreferredSize';
procedure BRadioButton_ResizeToPreferred(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_ResizeToPreferred';
function BRadioButton_Invoke(AObject : TCPlusObject; msg : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BRadioButton_Invoke';
procedure BRadioButton_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_MessageReceived';
procedure BRadioButton_WindowActivated(AObject : TCPlusObject; state : Boolean);
          cdecl; external BePascalLibName name 'BRadioButton_WindowActivated';
procedure BRadioButton_MouseUp(AObject : TCPlusObject; pt : BPoint);
          cdecl; external BePascalLibName name 'BRadioButton_MouseUp';
procedure BRadioButton_MouseMoved(AObject : TCPlusObject; pt : BPoint;
                                  code : Longword; msg : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_MouseMoved';
procedure BRadioButton_DetachedFromWindow(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_DetachedFromWindow';
procedure BRadioButton_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_FrameMoved';
procedure BRadioButton_FrameResized(AObject : TCPlusObject; new_width, new_height : Single);
          cdecl; external BePascalLibName name 'BRadioButton_FrameResized';
function BRadioButton_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject;
                                       index : Longint; specifier : TCPlusObject;
                                       form : Longint; properti : PChar)
         : BHandler; cdecl; external BePascalLibName name 'BRadioButton_ResolveSpecifier';
procedure BRadioButton_MakeFocus(AObject : TCPlusObject; state : Boolean);
          cdecl; external BePascalLibName name 'BRadioButton_MakeFocus';
procedure BRadioButton_AllAttached(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_AllAttached';
procedure BRadioButton_AllDetached(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BRadioButton_AllDetached';
function BRadioButton_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject)
         : status_t; cdecl; external BePascalLibName name 'BRadioButton_GetSupportedSuites';
function BRadioButton_Perform(AObject : TCPlusObject; d : perform_code; arg : Pointer) : status_t;
         cdecl; external BePascalLibName name 'BRadioButton_Perform';

implementation

constructor BRadioButton.Create(aframe : BRect; name, aLabel : PChar;
                                message : BMessage; resizingMode_, flags : Longword);
begin
  CreatePas;
  CPlusObject := BRadioButton_Create(Self, aframe.CPlusObject, name, aLabel,
                                     message.CPlusObject, resizingMode_, flags);
end;

constructor BRadioButton.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BRadioButton_Create_1(Self, data.CPlusObject);
end;

destructor BRadioButton.Destroy;
begin
  BRadioButton_Free(CPlusObject);
  inherited;
end;

function  BRadioButton.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BRadioButton_Instantiate(CPlusObject, data.CPlusObject);
end;

function  BRadioButton.Archive(data : BMessage; deep : Boolean) : status_t;
begin
  Result := BRadioButton_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure  BRadioButton.Draw(updateRect : BRect);
begin
//  BRadioButton_Draw(CPlusObject, updateRect{.CPlusObject});
end;

procedure  BRadioButton.MouseDown(where : BPoint);
begin
  BRadioButton_MouseDown(CPlusObject, where{.CPlusObject});
end;

procedure  BRadioButton.AttachedToWindow;
begin
//  BRadioButton_AttachedToWindow(CPlusObject);
end;

procedure  BRadioButton.KeyDown(bytes : PChar; numBytes : Longint);
begin
  BRadioButton_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure  BRadioButton.SetValue(aValue : Longint);
begin
  BRadioButton_SetValue(CPlusObject, aValue);
end;

procedure  BRadioButton.GetPreferredSize(width, height : Single);
begin
  BRadioButton_GetPreferredSize(CPlusObject, width, height);
end;

procedure  BRadioButton.ResizeToPreferred;
begin
  BRadioButton_ResizeToPreferred(CPlusObject);
end;

function  BRadioButton.Invoke(msg : BMessage) : status_t;
begin
  Result := BRadioButton_Invoke(CPlusObject, msg.CPlusObject);
end;

procedure  BRadioButton.MessageReceived(msg : BMessage);
begin
  BRadioButton_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure  BRadioButton.WindowActivated(state : Boolean);
begin
  BRadioButton_WindowActivated(CPlusObject, state);
end;

procedure  BRadioButton.MouseUp(pt : BPoint);
begin
  BRadioButton_MouseUp(CPlusObject, pt{.CPlusObject});
end;

procedure  BRadioButton.MouseMoved(pt : BPoint; code : Longword; msg : BMessage);
begin
  BRadioButton_MouseMoved(CPlusObject, pt{.CPlusObject}, code, msg);
end;

procedure  BRadioButton.DetachedFromWindow;
begin
//  BRadioButton_DetachedFromWindow(CPlusObject);
end;

procedure  BRadioButton.FrameMoved(new_position : BPoint);
begin
  BRadioButton_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure  BRadioButton.FrameResized(new_width, new_height : Single);
begin
  BRadioButton_FrameResized(CPlusObject, new_width, new_height);
end;

function  BRadioButton.ResolveSpecifier(msg : BMessage; index : Longint;
                                        specifier : BMessage; form : Longint;
                                        properti : PChar) : BHandler;
begin
  Result := BRadioButton_ResolveSpecifier(CPlusObject, msg.CPlusObject, index,
                                          specifier.CPlusObject, form, properti);
end;

procedure  BRadioButton.MakeFocus(state : Boolean);
begin
  BRadioButton_MakeFocus(CPlusObject, state);
end;

procedure  BRadioButton.AllAttached;
begin
  BRadioButton_AllAttached(CPlusObject);
end;

procedure  BRadioButton.AllDetached;
begin
  BRadioButton_AllDetached(CPlusObject);
end;

function  BRadioButton.GetSupportedSuites(data : BMessage) : status_t;
begin
  Result := BRadioButton_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function  BRadioButton.Perform(d : Perform_code; arg : Pointer) : status_t;
begin
  Result := BRadioButton_Perform(CPlusObject, d, arg);
end;

end.