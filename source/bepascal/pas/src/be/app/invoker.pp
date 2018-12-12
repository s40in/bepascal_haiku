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
unit invoker;

interface

uses
  beobj, Message, Handler, Looper, SupportDefs, Messenger;

type
  BInvoker = class(TBeObject)
  private
  public
    constructor Create; override;
    constructor Create(aMessage : BMessage; handler : BHandler; looper : BLooper);
    constructor Create(aMessage : BMessage; aTarget : BMessenger);
    destructor Destroy; override;
    function SeBMessage(aMessage : BMessage) : Status_t;
    function Message : BMessage;
    function Command : Cardinal;
    function SetTarget(h : BHandler; loop : BLooper) : Status_t;
    function SetTarget(aMessenger : BMessenger) : Status_t;
    function IsTargetLocal : boolean;
    function Target(looper : BLooper) : BHandler;
    function Messenger : BMessenger;
    function SeBHandlerForReply(handler : BHandler) : Status_t;
    function HandlerForReply : BHandler;
    function Invoke(msg : BMessage) : Status_t;
//    function InvokeNotify(msg : BMessage; kind : Cardinal) : Status_t;
    function SetTimeout(aTimeout : Bigtime_t) : Status_t;
    function Timeout : Bigtime_t;

  end;

function BInvoker_Create(AObject : TBeObject) : TCplusObject; cdecl; external BePascalLibName name 'BInvoker_Create';
function BInvoker_Create(AObject : TBeObject; message : TCplusObject; handler : TCplusObject; looper : TCPlusObject) : TCplusObject; cdecl; external BePascalLibName name 'BInvoker_Create_1';
function BInvoker_Create(AObject : TBeObject; message : TCplusObject; target : TCplusObject) : TCplusObject; cdecl; external BePascalLibName name 'BInvoker_Create_2';
procedure BInvoker_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_Free';
function BInvoker_SeBMessage(AObject : TCPlusObject; message : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BInvoker_SetMessage';
function BInvoker_Message(AObject : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BInvoker_Message';
function BInvoker_Command(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BInvoker_Command';
function BInvoker_SetTarget(AObject : TCPlusObject; h : TCPlusObject; loop : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BInvoker_SetTarget';
function BInvoker_SetTarget(AObject : TCPlusObject; messenger : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BInvoker_SetTarget_1';
function BInvoker_IsTargetLocal(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BInvoker_IsTargetLocal';
function BInvoker_Target(AObject : TCPlusObject; looper : TCplusObject) : BHandler; cdecl; external BePascalLibName name 'BInvoker_Target';
function BInvoker_Messenger(AObject : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BInvoker_Messenger';
function BInvoker_SeBHandlerForReply(AObject : TCPlusObject; handler : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BInvoker_SetHandlerForReply';
function BInvoker_HandlerForReply(AObject : TCPlusObject) : BHandler; cdecl; external BePascalLibName name 'BInvoker_HandlerForReply';
function BInvoker_Invoke(AObject : TCPlusObject; msg : TCplusObject) : Status_t; cdecl; external BePascalLibName name 'BInvoker_Invoke';
//function BInvoker_InvokeNotify(AObject : TCPlusObject; msg : TCplusObject; kind : Cardinal) : Status_t; cdecl; external BePascalLibName name 'BInvoker_InvokeNotify';
function BInvoker_SetTimeout(AObject : TCPlusObject; timeout : Bigtime_t) : Status_t; cdecl; external BePascalLibName name 'BInvoker_SetTimeout';
function BInvoker_Timeout(AObject : TCPlusObject) : Bigtime_t; cdecl; external BePascalLibName name 'BInvoker_Timeout';
//function BInvoker_InvokeKind(AObject : TCPlusObject; notify : boolean) : Cardinal; cdecl; external BePascalLibName name 'BInvoker_InvokeKind';
//procedure BInvoker_BeginInvokeNotify(AObject : TCPlusObject; kind : Cardinal); cdecl; external BePascalLibName name 'BInvoker_BeginInvokeNotify';
//procedure BInvoker_EndInvokeNotify(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_EndInvokeNotify';
//procedure BInvoker__ReservedInvoker1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker__ReservedInvoker1';
//procedure BInvoker__ReservedInvoker2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker__ReservedInvoker2';
//procedure BInvoker__ReservedInvoker3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker__ReservedInvoker3';
function BInvoker_Create(AObject : TBeObject; aInvoker : TCPlusObject) : TCplusObject; cdecl; external BePascalLibName name 'BInvoker_Create';
//function BInvoker_operator=(AObject : TCPlusObject;  : BInvoker) : BInvoker; cdecl; external BePascalLibName name 'BInvoker_operator=';
//procedure BInvoker_BMessage *fMessage(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_BMessage *fMessage';
//procedure BInvoker_BMessenger fMessenger(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_BMessenger fMessenger';
//procedure BInvoker_BHandler *fReplyTo(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_BHandler *fReplyTo';
//procedure BInvoker_uint32 fTimeout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_uint32 fTimeout';
//procedure BInvoker_uint32 fNotifyKind(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_uint32 fNotifyKind';
//procedure BInvoker_uint32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BInvoker_uint32 _reserved[2]';

implementation

constructor BInvoker.Create;
begin
  BInvoker_Create(Self);
end;

constructor BInvoker.Create(aMessage : BMessage; handler : BHandler; looper : BLooper);
begin
  CPlusObject := BInvoker_Create(Self, aMessage.CPlusObject, handler, looper);
end;

constructor BInvoker.Create(aMessage : BMessage; aTarget : BMessenger);
begin
  CPlusObject := BInvoker_Create(Self, aMessage.CPlusObject, aTarget.CPlusObject);
end;

destructor BInvoker.Destroy;
begin
  BInvoker_Free(CPlusObject);
end;

function BInvoker.SeBMessage(aMessage : BMessage) : Status_t;
begin
  Result := BInvoker_SeBMessage(CPlusObject, aMessage.CPlusObject);
end;

function BInvoker.Message : BMessage;
begin
  Result := BMessage.Wrap(BInvoker_Message(CPlusObject));
end;

function BInvoker.Command : Cardinal;
begin
  Result := BInvoker_Command(CPlusObject);
end;

function BInvoker.SetTarget(h : BHandler; loop : BLooper) : Status_t;
begin
  if loop <> nil then
  begin
    Result := BInvoker_SetTarget(CPlusObject, h.CPlusObject, loop.CPlusObject);
  end
  else if h <> nil then
  begin
//    Result := BInvoker_SetTarget(CPlusObject, h.CPlusObject, nil);   
  end
  else
  begin  
    Result := BInvoker_SetTarget(CPlusObject, nil, nil);
  end;
end;

function BInvoker.SetTarget(aMessenger : BMessenger) : Status_t;
begin
  Result := BInvoker_SetTarget(CPlusObject, aMessenger.CPlusObject);
end;

function BInvoker.IsTargetLocal : boolean;
begin
  Result := BInvoker_IsTargetLocal(CPlusObject);
end;

function BInvoker.Target(looper : BLooper) : BHandler;
begin
  Result := BInvoker_Target(CPlusObject, looper.CPlusObject);
end;

function BInvoker.Messenger : BMessenger;
begin
  Result := BMessenger.Wrap(BInvoker_Messenger(CPlusObject));
end;

function BInvoker.SeBHandlerForReply(handler : BHandler) : Status_t;
begin
  Result := BInvoker_SeBHandlerForReply(CPlusObject, handler.CPlusObject);
end;

function BInvoker.HandlerForReply : BHandler;
begin
  Result := BInvoker_HandlerForReply(CPlusObject);
end;

function BInvoker.Invoke(msg : BMessage) : Status_t;
begin
  Result := BInvoker_Invoke(CPlusObject, msg.CPlusObject);
end;

//function BInvoker.InvokeNotify(msg : BMessage; kind : Cardinal) : Status_t;
//begin
//  BInvoker_InvokeNotify(CPlusObject, msg.CPlusObject, kind);
//end;

function BInvoker.SetTimeout(aTimeout : Bigtime_t) : Status_t;
begin
  Result := BInvoker_SetTimeout(CPlusObject, timeout);
end;

function BInvoker.Timeout : Bigtime_t;
begin
  Result := BInvoker_Timeout(CPlusObject);
end;

//function BInvoker.InvokeKind(notify : boolean) : Cardinal;
//begin
//  BInvoker_InvokeKind(CPlusObject, notify);
//end;
//
//procedure BInvoker.BeginInvokeNotify(kind : Cardinal);
//begin
//  BInvoker_BeginInvokeNotify(CPlusObject, kind);
//end;
//
//procedure BInvoker.EndInvokeNotify;
//begin
//  BInvoker_EndInvokeNotify(CPlusObject);
//end;

//procedure BInvoker._ReservedInvoker1;
//begin
//  BInvoker__ReservedInvoker1(CPlusObject);
//end;
//
//procedure BInvoker._ReservedInvoker2;
//begin
//  BInvoker__ReservedInvoker2(CPlusObject);
//end;
//
//procedure BInvoker._ReservedInvoker3;
//begin
//  BInvoker__ReservedInvoker3(CPlusObject);
//end;


//function BInvoker.operator=( : BInvoker) : BInvoker;
//begin
//  BInvoker_operator=(CPlusObject, );
//end;

//procedure BInvoker.BMessage *fMessage;
//begin
//  BInvoker_BMessage *fMessage(CPlusObject);
//end;
//
//procedure BInvoker.BMessenger fMessenger;
//begin
//  BInvoker_BMessenger fMessenger(CPlusObject);
//end;
//
//procedure BInvoker.BHandler *fReplyTo;
//begin
//  BInvoker_BHandler *fReplyTo(CPlusObject);
//end;
//
//procedure BInvoker.uint32 fTimeout;
//begin
//  BInvoker_uint32 fTimeout(CPlusObject);
//end;
//
//procedure BInvoker.uint32 fNotifyKind;
//begin
//  BInvoker_uint32 fNotifyKind(CPlusObject);
//end;
//
//procedure BInvoker.uint32 _reserved[2];
//begin
//  BInvoker_uint32 _reserved[2](CPlusObject);
//end;


end.
