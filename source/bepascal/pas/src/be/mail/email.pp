{  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Eric Jourde

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

unit Email;

interface

uses
  beobj, SupportDefs, os,utf8;

// null because begin at 1 form e-mail.h
type mail_flags =(B_Mail_null,B_MAIL_PENDING,B_MAIL_SENT,B_MAIL_SAVE);

Const
  B_MAIL_ATTR_NAME='MAIL:name';
  B_MAIL_ATTR_STATUS='MAIL:status';		
  B_MAIL_ATTR_PRIORITY='MAIL:priority';	
  B_MAIL_ATTR_TO='MAIL:to';			
  B_MAIL_ATTR_CC='MAIL:cc';			
  B_MAIL_ATTR_FROM='MAIL:from';			
  B_MAIL_ATTR_SUBJECT='MAIL:subject';		
  B_MAIL_ATTR_REPLY='MAIL:reply';		
  B_MAIL_ATTR_WHEN='MAIL:when';			
  B_MAIL_ATTR_FLAGS='MAIL:flags';		
  B_MAIL_ATTR_RECIPIENTS='MAIL:recipients';	
  B_MAIL_ATTR_MIME='MAIL:mime';			
  B_MAIL_ATTR_HEADER='MAIL:header_length';	
  B_MAIL_ATTR_CONTENT='MAIL:content_length';  


type BEMail = class(TbeObject)
   private
   public
    constructor Create; override;
    destructor Destroy; override;
  
  function Add_Content(text : PChar;length: cardinal;encoding : TCharSet; clobber : boolean) : Status_t; 
  function Add_Content(text : PChar;length: cardinal;encoding : Pchar; clobber : boolean) : Status_t; 
  function AddEnclosure( path : Pchar; clobber:boolean) : Status_t;
  function AddEnclosure(MIME_type : Pchar;data : pointer;len : cardinal; clobber:boolean) : Status_t;
  function AddHeaderField( encoding: TCharSet; field_name : Pchar; str : PChar;clobber:boolean) : Status_t;
  function AddHeaderField(  field_name : Pchar; str : PChar;clobber:boolean) : Status_t;
  function Send( send_now : boolean; remove_when_I_have_completed_sending_this_message_to_your_preferred_SMTP_server : boolean) : Status_t;
end;

function BMailMessage_Create() : TCPlusObject;cdecl; external BePascalLibName name 'BMailMessage_Create';
procedure BMail_Free(AObject : TCPlusObject);cdecl; external BePascalLibName name 'BMail_Free';
function BMailMessage_AddContent(AObject : TCPlusObject;text : PChar;length: cardinal;encoding : cardinal; clobber : boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddContent';
function BMailMessage_AddContent_1(AObject : TCPlusObject;text : PChar;length: cardinal;encoding : Pchar; clobber : boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddContent_1';
//function BMailMessage_AddEnclosure(AObject : TCPlusObject; entry_ref *ref,  bool clobber) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddEnclosure';
function BMailMessage_AddEnclosure_1(AObject : TCPlusObject; path : Pchar; clobber:boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddEnclosure_1';
function BMailMessage_AddEnclosure_2(AObject : TCPlusObject; MIME_type : Pchar;data : pointer;len : cardinal; clobber:boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddEnclosure_2';
function BMailMessage_AddHeaderField(AObject : TCPlusObject; encoding: cardinal; field_name : Pchar; str : PChar;clobber:boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddHeaderField';
function BMailMessage_AddHeaderField_1(AObject : TCPlusObject;  field_name : Pchar; str : PChar;clobber:boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_AddHeaderField_1';
function BMailMessage_Send(AObject : TCPlusObject;  send_now : boolean; remove_when_I_have_completed_sending_this_message_to_your_preferred_SMTP_server : boolean) : Status_t;cdecl; external BePascalLibName name 'BMailMessage_Send';


implementation

constructor BEMail.Create; 
begin
  inherited;
  CPlusObject := BMailMessage_Create();
end;

destructor BEMail.Destroy;
begin
  if CPlusObject <> nil then
    BMail_Free(CPlusObject);
  inherited;
end;

function BEMail.Add_Content(text : PChar;length: cardinal;encoding : TCharSet; clobber : boolean) : Status_t; 
begin
  result:=BMailMessage_AddContent(CPlusObject,text,length,cardinal(encoding),clobber );
end;

function BEMail.Add_Content(text : PChar;length: cardinal;encoding : Pchar; clobber : boolean) : Status_t; 
begin
  result:=BMailMessage_AddContent_1(CPlusObject,text,length,encoding,clobber );
end;

function BEMail.AddEnclosure( path : Pchar; clobber:boolean) : Status_t;
begin
  result:=BMailMessage_AddEnclosure_1(CPlusObject,path,clobber);
end;

function BEMail.AddEnclosure(MIME_type : Pchar;data : pointer;len : cardinal; clobber:boolean) : Status_t;
begin
  result:=BMailMessage_AddEnclosure_2(CPlusObject,MIME_type,data,len,clobber);
end;

function BEMail.AddHeaderField( encoding: TCharSet; field_name : Pchar; str : PChar;clobber:boolean) : Status_t;
begin
  result:=BMailMessage_AddHeaderField(CPlusObject, cardinal(encoding), field_name , str,clobber);
end;
  
function BEMail.AddHeaderField(  field_name : Pchar; str : PChar;clobber:boolean) : Status_t;
begin
  result:=BMailMessage_AddHeaderField_1(CPlusObject,  field_name, str,clobber) ;
end;
  
function BEMail.Send( send_now : boolean; remove_when_I_have_completed_sending_this_message_to_your_preferred_SMTP_server : boolean) : Status_t;
begin
  result:=BMailMessage_Send(CPlusObject,  send_now, remove_when_I_have_completed_sending_this_message_to_your_preferred_SMTP_server );
end;
  


end.
