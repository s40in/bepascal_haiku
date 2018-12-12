{  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere

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

unit looper;

interface

uses
  beobj, handler, message, os, SupportDefs;

const
  B_LOOPER_PORT_DEFAULT_CAPACITY = 100;
  
type
  BLooper = class(BHandler)
  private
  public
    procedure DispatchMessage(aMessage : BMessage; aTarget : BHandler); virtual;
    function QuitRequested() : boolean; virtual;
    function GetSupportedSuites(aMessage : BMessage) : Status_t;
    function PostMessage(command : Cardinal) : Status_t;
  end;

//function BLooper_Create(AObject : TObject);
function BLooper_GetSupportedSuites(Looper : TCplusObject; aMessage : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BLooper_GetSupportedSuites';
function BLooper_PostMessage(Looper : TCPlusObject; command : Cardinal) : Status_t; cdecl; external BePascalLibName  name 'BLooper_PostMessage_2';

implementation

var
  Looper_DispatchMessage_hook : Pointer; cvar; external;
  Looper_QuitRequested_hook : Pointer; cvar; external;

procedure BLooper.DispatchMessage(aMessage : BMessage; aTarget : BHandler);
begin
end;

function BLooper.QuitRequested() : boolean;
begin
  Result := True;
end;

function BLooper.GetSupportedSuites(aMessage : BMessage) : Status_t;
begin
  result := BLooper_GetSupportedSuites(CPlusObject, aMessage.CPlusObject);    
end;

function BLooper.PostMessage(command : Cardinal) : Status_t;
begin
  result := BLooper_PostMessage(CPlusObject, command);
end;

// hooks

procedure Looper_DispatchMessage_hook_func(Looper : BLooper; 
  aMessage : TCPlusObject; aTarget : TCPlusObject); cdecl;
var
  Message : BMessage;
  Target : BHandler;
begin
  Message := BMessage.Wrap(aMessage);
  try
    Target := BHandler.Wrap(aTarget);
    try
      Looper.DispatchMessage(Message, Target);
    finally
      Target.UnWrap;
    end;
  finally
    Message.UnWrap;
  end;
end;

function Looper_QuitRequested_hook_func(Looper : BLooper) : boolean; cdecl;
begin
  if Looper <> nil then
    Result := Looper.QuitRequested();
end;

initialization
  Looper_DispatchMessage_hook := @Looper_DispatchMessage_hook_func;
  Looper_QuitRequested_hook := @Looper_QuitRequested_hook_func;

finalization
  Looper_DispatchMessage_hook := nil;
  Looper_QuitRequested_hook := nil;

end.
