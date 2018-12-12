{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 - 2003 Olivier Coursiere
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
{
This is an implementation of fdblib in pascal for BePascal.
When this unit is used in a BePascal project, the SendText function
in beobj.pp send a "dbug" message to a fdb client.
When fdblib is not in the project, SendText in beobj just do nothing.
}
unit fdblib;

interface 

procedure force;

implementation

uses
  BeObj, Application, Handler, Message, Messenger, OS, SupportDefs;
  
const
  B_DEBUG = 'dbug';
  
procedure SendMessage(message : BMessage);
var
  Messenger : BMessenger;
  signature : PChar;
  err : Status_t;
begin
  signature := 'application/x-vnd.befpc-debugconsole';
  if be_app <> nil then
  begin
    Messenger := BMessenger.Create(signature, - 1, err);
    try
      if Messenger.IsValid then
      begin
        // BHandler(nil) is needed to call the right SendMessage function
        // Here, we call SendMessage with one parameter (message)
        // and  2 default parameters.
        messenger.SendMessage(message, BHandler(nil), B_INFINITE_TIMEOUT);
      end;
    finally
      Messenger.Free;
    end;
  end;
end;

procedure InternalSendText(text : string);
var
  message : BMessage;
  local : string;
begin
  if be_app <> nil then
  begin
    local := text + #0;
    message := BMessage.Create(Longword(B_DEBUG));
    try
      message.AddString(PChar('dbstring'), @local[1]);
      SendMessage(message);
    finally
      message.Free;
    end;  
  end
  else
    WriteLn(text);
end;

{
procedure SendText(text : string);
var
  local : string;
begin
  local := text + #0;
  SendText(@local[1]);
end;
}

procedure force;
begin
  writeln('force');
end;

initialization
  SetSendTextProc(@InternalSendText);
  SendText('----------------------');
  SendText('App start');

finalization
  SendText('App end');
end.