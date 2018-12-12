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
unit messenger;

interface

uses
  beobj, os, Handler, Looper, Message, SupportDefs;

type
  BMessenger = class(TBeObject)
  private
  public
    constructor Create; override;
    constructor Create(mime_sig : PChar; aTeam : Team_id; var err : Status_t);
    constructor Create(handler : BHandler; looper : BLooper; var err : Status_t);
    constructor Create(from : BMessenger);
    destructor Destroy; override;
    function IsTargetLocal : boolean;
    function Target(looper : BLooper) : BHandler;
    function LockTarget : boolean;
//    function LockTargetWithTimeout(timeout : Bigtime_t) : Status_t;
    function SendMessage(command : Cardinal; reply_to : BHandler) : Status_t;
    function SendMessage(a_message : BMessage; reply_to : BHandler; timeout : Bigtime_t) : Status_t;
    function SendMessage(a_message : BMessage; reply_to : BMessenger; timeout : Bigtime_t) : Status_t;
    function SendMessage(command : Cardinal; reply : BMessage) : Status_t;
    function SendMessage(a_message : BMessage; reply : BMessage; send_timeout : Bigtime_t; reply_timeout : Bigtime_t) : Status_t;

    function IsValid : boolean;
    function Team : Team_id;

  end;

function BMessenger_Create(AObject : TBeObject) : TCplusObject; cdecl; external BePascalLibName name 'BMessenger_Create';
function BMessenger_Create_1(AObject : TBeObject; mime_sig : PChar; team : Team_id; var err : Status_t) : TCplusObject; cdecl; external BePascalLibName name 'BMessenger_Create_1';
function BMessenger_Create_2(AObject : TBeObject; handler : TCplusObject; looper : TCplusObject; var err : Status_t) : TCplusObject; cdecl; external BePascalLibName name 'BMessenger_Create_2';
function BMessenger_Create_3(AObject : TBeObject; from : TCplusObject) : TCplusObject; cdecl; external BePascalLibName name 'BMessenger_Create_3';
procedure BMessenger_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_Free';
function BMessenger_IsTargetLocal(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMessenger_IsTargetLocal';
function BMessenger_Target(AObject : TCPlusObject; looper : TCplusObject) : BHandler; cdecl; external BePascalLibName name 'BMessenger_Target';
function BMessenger_LockTarget(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMessenger_LockTarget';
//function BMessenger_LockTargetWithTimeout(AObject : TCPlusObject; timeout : Bigtime_t) : Status_t; cdecl; external BePascalLibName name 'BMessenger_LockTargetWithTimeout';
function BMessenger_SendMessage(AObject : TCPlusObject; command : Cardinal; reply_to : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMessenger_SendMessage';
function BMessenger_SendMessage_1(AObject : TCPlusObject; a_message : TCplusObject; reply_to : TCplusObject; timeout : Bigtime_t) : Status_t; cdecl; external BePascalLibName name 'BMessenger_SendMessage_1';
// How to handle this ? (remove the comment to see what to fix)
function BMessenger_SendMessage_2(AObject : TCPlusObject; a_message : TCplusObject; reply_to : TCplusObject; timeout : Bigtime_t) : Status_t; cdecl; external BePascalLibName name 'BMessenger_SendMessage_2';
function BMessenger_SendMessage_3(AObject : TCPlusObject; command : Cardinal; reply : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BMessenger_SendMessage_3';
function BMessenger_SendMessage_4(AObject : TCPlusObject; a_message : TCplusObject; reply : TCplusObject; send_timeout : Bigtime_t; reply_timeout : Bigtime_t) : Status_t; cdecl; external BePascalLibName name 'BMessenger_SendMessage_4';
//function BMessenger_operator=(AObject : TCPlusObject; from : BMessenger) : BMessenger; cdecl; external BePascalLibName name 'BMessenger_operator=';
//function BMessenger_operator==(AObject : TCPlusObject; other : BMessenger) : boolean; cdecl; external BePascalLibName name 'BMessenger_operator==';
function BMessenger_IsValid(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMessenger_IsValid';
function BMessenger_Team(AObject : TCPlusObject) : Team_id; cdecl; external BePascalLibName name 'BMessenger_Team';
//function BMessenger_Create(AObject : TBeObject; team : Team_id; port : TPort_id; token : integer; preferred : boolean) : TCplusObject; cdecl; external BePascalLibName name 'BMessenger_Create';
//procedure BMessenger_InitData(AObject : TCPlusObject; mime_sig : PChar; team : Team_id; perr : PStatus_t); cdecl; external BePascalLibName name 'BMessenger_InitData';
//procedure BMessenger_port_id fPort(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_port_id fPort';
//procedure BMessenger_int32 fHandlerToken(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_int32 fHandlerToken';
//procedure BMessenger_team_id fTeam(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_team_id fTeam';
//procedure BMessenger_int32 extra0(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_int32 extra0';
//procedure BMessenger_int32 extra1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_int32 extra1';
//procedure BMessenger_bool fPreferredTarget(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_bool fPreferredTarget';
//procedure BMessenger_bool extra2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_bool extra2';
//procedure BMessenger_bool extra3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_bool extra3';
//procedure BMessenger_bool extra4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMessenger_bool extra4';

var
  be_app_BMessenger : BMessenger;
  be_app_messengerCPlus : TCPlusObject; cvar; external;
  
implementation

constructor BMessenger.Create;
begin
  BMessenger_Create(Self);
end;

constructor BMessenger.Create(mime_sig : PChar; aTeam : Team_id; var err : Status_t);
begin
  CPlusObject := BMessenger_Create_1(Self, mime_sig, aTeam, err);
end;

constructor BMessenger.Create(handler : BHandler; looper : BLooper; var err : Status_t);
begin
  if Assigned(handler) and Assigned(looper) then
    CPlusObject := BMessenger_Create_2(Self, handler.CPlusObject, 
                                       looper.CPlusObject, err)
  else if Assigned(handler) and not(Assigned(looper)) then
    CPlusObject := BMessenger_Create_2(Self, handler.CPlusObject, 
                                       nil, err)
  else if not(Assigned(handler)) and Assigned(looper) then
    CPlusObject := BMessenger_Create_2(Self, nil, looper.CPlusObject, 
                                       err)
end;

constructor BMessenger.Create(from : BMessenger);
begin
  CPlusObject := BMessenger_Create_3(Self, from);
end;

destructor BMessenger.Destroy;
begin
  BMessenger_Free(CPlusObject);
end;

function BMessenger.IsTargetLocal : boolean;
begin
  Result := BMessenger_IsTargetLocal(CPlusObject);
end;

function BMessenger.Target(looper : BLooper) : BHandler;
begin
  Result := BMessenger_Target(CPlusObject, looper.CPlusObject);
end;

function BMessenger.LockTarget : boolean;
begin
  Result := BMessenger_LockTarget(CPlusObject);
end;

//function BMessenger.LockTargetWithTimeout(timeout : Bigtime_t) : Status_t;
//begin
//  BMessenger_LockTargetWithTimeout(CPlusObject, timeout);
//end;

function BMessenger.SendMessage(command : Cardinal; reply_to : BHandler) : Status_t;
begin
  Result := BMessenger_SendMessage(CPlusObject, command, reply_to.CPlusObject);
end;

function BMessenger.SendMessage(a_message : BMessage; reply_to : BHandler; timeout : Bigtime_t) : Status_t;
begin
  if reply_to = nil then
    Result := BMessenger_SendMessage_1(CPlusObject, a_message.CPlusObject, nil, timeout)
  else 
    Result := BMessenger_SendMessage_1(CPlusObject, a_message.CPlusObject, reply_to.CPlusObject, timeout);
end;

function BMessenger.SendMessage(a_message : BMessage; reply_to : BMessenger; timeout : Bigtime_t) : Status_t;
begin
  if reply_to = nil then
  begin
    WriteLn('BMessenger.SendMessage');
    Result := BMessenger_SendMessage_2(CPlusObject, a_message.CPlusObject, nil, timeout);
    WriteLn('BMessenger.AfterSendMessage');    
  end
  else 
    Result := BMessenger_SendMessage_2(CPlusObject, a_message.CPlusObject, reply_to.CPlusObject, timeout);
end;

function BMessenger.SendMessage(command : Cardinal; reply : BMessage) : Status_t;
begin
  Result := BMessenger_SendMessage_3(CPlusObject, command, reply.CPlusObject);
end;

function BMessenger.SendMessage(a_message : BMessage; reply : BMessage; send_timeout : Bigtime_t; reply_timeout : Bigtime_t) : Status_t;
begin
  Result := BMessenger_SendMessage_4(CPlusObject, a_message.CPlusObject, reply.CPlusObject, send_timeout, reply_timeout);
end;

//function BMessenger.operator=(from : BMessenger) : BMessenger;
//begin
//  BMessenger_operator=(CPlusObject, from);
//end;
//
//function BMessenger.operator==(other : BMessenger) : boolean;
//begin
//  BMessenger_operator==(CPlusObject, other);
//end;

function BMessenger.IsValid : boolean;
begin
  Result := BMessenger_IsValid(CPlusObject);
end;

function BMessenger.Team : Team_id;
begin
  Result := BMessenger_Team(CPlusObject);
end;

//constructor BMessenger.Create(aTeam : Team_id; port : TPort_id; token : integer; preferred : boolean);
//begin
//  CPlusObject := BMessenger_Create(Self, aTeam, port, token, preferred);
//end;

//procedure BMessenger.InitData(mime_sig : PChar; aTeam : Team_id; perr : PStatus_t);
//begin
//  BMessenger_InitData(CPlusObject, mime_sig, aTeam, perr);
//end;

//procedure BMessenger.port_id fPort;
//begin
//  BMessenger_port_id fPort(CPlusObject);
//end;
//
//procedure BMessenger.int32 fHandlerToken;
//begin
//  BMessenger_int32 fHandlerToken(CPlusObject);
//end;
//
//procedure BMessenger.team_id fTeam;
//begin
//  BMessenger_team_id fTeam(CPlusObject);
//end;
//
//procedure BMessenger.int32 extra0;
//begin
//  BMessenger_int32 extra0(CPlusObject);
//end;
//
//procedure BMessenger.int32 extra1;
//begin
//  BMessenger_int32 extra1(CPlusObject);
//end;
//
//procedure BMessenger.bool fPreferredTarget;
//begin
//  BMessenger_bool fPreferredTarget(CPlusObject);
//end;
//
//procedure BMessenger.bool extra2;
//begin
//  BMessenger_bool extra2(CPlusObject);
//end;
//
//procedure BMessenger.bool extra3;
//begin
//  BMessenger_bool extra3(CPlusObject);
//end;
//
//procedure BMessenger.bool extra4;
//begin
//  BMessenger_bool extra4(CPlusObject);
//end;

initialization
  be_app_BMessenger := nil;

finalization
	be_app_BMessenger := nil;

end.
