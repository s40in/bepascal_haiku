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

unit message;

interface

uses
  beobj, supportdefs, typeconstants, dataio, entry;
  
const
	B_NO_SPECIFIER 				= 0;
	B_DIRECT_SPECIFIER 			= 1;
	B_INDEX_SPECIFIER 			= 2;
	B_REVERSE_INDEX_SPECIFIER 	= 3;
	B_RANGE_SPECIFIER 			= 4;
	B_REVERSE_RANGE_SPECIFIER 	= 5;
	B_NAME_SPECIFIER 			= 6; 
	B_ID_SPECIFIER 				= 7;

	B_SPECIFIERS_END 			= 128;

	B_FIELD_NAME_LENGTH 		= 255;
	B_PROPERTY_NAME_LENGTH		= 255;
	
type
	BMessage = class(TBeObject)
	private
	  function GetWhat : Cardinal;
	  procedure SetWhat(aWhat : Cardinal);
	public
	  constructor Create; override;
	  constructor Create(Command : Cardinal); virtual;
	  constructor Create(var Message : BMessage); virtual;
	  destructor Destroy; override;
      function AddData(const Name : PChar; aType : Type_Code; const Data : Pointer; FixedSize : Cardinal; NumItems : Integer) : Status_t;
      function AddBool(const Name : PChar; aBool : boolean) : Status_t;
      function AddInt8(const Name : PChar; anInt8 : Shortint) : Status_t;
      function FindInt8(const Name : PChar; var anInt8 : Shortint) : Status_t;
      function AddInt16(const Name : PChar; anInt16 : Smallint) : Status_t;
      function AddInt32(const Name : PChar; anInt32 : Integer) : Status_t;
      function AddInt64(const Name : PChar; anInt64 : int64) : Status_t;
      function AddFloat(const Name : PChar; aFloat : Single) : Status_t;
      function AddDouble(const Name : PChar; aDouble : Double) : Status_t;
      function AddString(const Name : PChar; aString : PChar) : Status_t; 
      function FindString(const Name : PChar; var aString : PChar) : Status_t; 
      function FindRef(const Name : PChar; var ref : Entry_Ref) : Status_t; 
      function FindRef(const Name : PChar;aindex: integer; var ref : entry_ref) : Status_t; 
      function AddMessage(const Name : PChar; aMessage : TCPlusObject) : Status_t;	  
      function CountNames(aType : Type_Code) : Integer; 
      function HasSpecifiers : boolean;
      function IsSystem : boolean;
      function MakeEmpty : Status_t;
      function IsEmpty : boolean;
      function RemoveName(const Name : PChar) : Status_t;
      procedure PrintToStream;
      function RemoveData(const name : PChar; index : Integer) : Status_t;
      function WasDelivered : boolean;
      function IsSourceRemote : boolean;
      function IsSourceWaiting : boolean;
      function IsReply : boolean;
      function Previous : BMessage;
      function WasDropped : boolean;
	  property What : Cardinal read GetWhat write SetWhat;
	  function	Unflatten( stream : BDataIO ):status_t;
	  
	end;

function BMessage_Create(AObject : TObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMessage_Create_1';
function BMessage_Create(AObject : TObject; command : Cardinal) : TCPlusObject; cdecl; external BePascalLibName name 'BMessage_Create_2';
function BMessage_Create(AObject : TObject; var Message : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMessage_Create_3';
procedure BMessage_Free(Message : TCPlusObject); cdecl; external BePascalLibName;
function BMessage_GetWhat(Message : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BMessage_Getwhat';
procedure BMessage_SetWhat(Message : TCPlusObject; What : Cardinal); cdecl; external BePascalLibName name 'BMessage_Setwhat';
function BMessage_AddData(Message : TCPlusObject; const Name : PChar; aType : Type_Code; const Data : Pointer; FixedSize : Cardinal; NumItems : Integer) : Status_t; cdecl; external BePascalLibName; 
function BMessage_AddBool(Message : TCPlusObject; const Name : PChar; aBool : boolean) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddInt8(Message : TCPlusObject; const Name : PChar; anInt8 : Shortint) : Status_t; cdecl; external BePascalLibName;
function BMessage_FindInt8(Message : TCPlusObject; const Name : PChar; var anInt8 : Shortint) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddInt16(Message : TCPlusObject; const Name : PChar; anInt16 : Smallint) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddInt32(Message : TCPlusObject; const Name : PChar; anInt32 : Integer) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddInt64(Message : TCPlusObject; const Name : PChar; anInt64 : int64) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddFloat(Message : TCPlusObject; const Name : PChar; aFloat : Single) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddDouble(Message : TCPlusObject; const Name : PChar; aDouble : Double) : Status_t; cdecl; external BePascalLibName;
function BMessage_AddString(Message : TCPlusObject; const Name : PChar; aString : PChar) : Status_t; cdecl; external BePascalLibName;
function BMessage_FindString(Message : TCPlusObject; const Name : PChar;var aString : PChar) : Status_t; cdecl; external BePascalLibName;
function BMessage_FindRef(Message : TCPlusObject;const Name : PChar; var ref : entry_ref) : Status_t; cdecl; external BePascalLibName name 'BMessage_FindRef';
function BMessage_FindRef(Message : TCPlusObject;const Name : PChar;aindex: integer; var ref : entry_ref) : Status_t; cdecl; external BePascalLibName name 'BMessage_FindRef_1';
function BMessage_AddMessage(Message : TCPlusObject; const Name : PChar; aMessage : TCPlusObject) : Status_t; cdecl; external BePascalLibName;
function BMessage_CountNames(Message : TCPlusObject; aType : Type_Code) : Integer; cdecl; external BePascalLibName;
function BMessage_HasSpecifiers(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_IsSystem(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_MakeEmpty(Message : TCPlusObject) : Status_t; cdecl; external BePascalLibName;
function BMessage_IsEmpty(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_RemoveName(Message : TCPlusObject; const Name : PChar) : Status_t; cdecl; external BePascalLibName;
procedure BMessage_PrintToStream(Message : TCPlusObject); cdecl; external BePascalLibName;
function BMessage_RemoveData(Message : TCPlusObject; const name : PChar; index : Integer) : Status_t; cdecl; external BePascalLibName;
function BMessage_WasDelivered(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_IsSourceRemote(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_IsSourceWaiting(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_IsReply(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function BMessage_Previous(Message : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName;
function BMessage_WasDropped(Message : TCPlusObject) : boolean; cdecl; external BePascalLibName;
function	BMessage_Unflatten(Message : TCPlusObject; stream : BDataIO ):status_t;cdecl; external BePascalLibName name 'BMessage_Unflatten';

implementation

  // start BMessage
constructor BMessage.Create;
begin
  inherited Create; 
  CPlusObject := BMessage_Create(Self);  
end;

constructor BMessage.Create(Command : Cardinal);
begin
  inherited Create;
  CPlusObject := BMessage_Create(Self, Command);	
end;

constructor BMessage.Create(var Message : BMessage);
begin
  inherited Create;
  CPlusObject := BMessage_Create(Self, Message.FCPlusObject);
end;

destructor BMessage.Destroy;
begin
  if CPlusObject <> nil then
    BMessage_Free(CPlusObject);
  inherited;	
end;

function BMessage.GetWhat : Cardinal;
begin
  Result := BMessage_GetWhat(CPlusObject);
end;

procedure BMessage.SetWhat(aWhat : Cardinal);
begin
  BMessage_SetWhat(CPlusObject, aWhat);
end;

function BMessage.AddData(const Name : PChar; aType : Type_Code; const Data : Pointer; FixedSize : Cardinal; NumItems : Integer) : Status_t;
begin
  result := BMessage_AddData(CPlusObject, Name, aType, Data, FixedSize, NumItems);
end;

function BMessage.AddBool(const Name : PChar; aBool : boolean) : Status_t;
begin
  result := BMessage_AddBool(CPlusObject, Name, aBool);
end;

function BMessage.AddInt8(const Name : PChar; anInt8 : Shortint) : Status_t;
begin
  result := BMessage_AddInt8(CPlusObject, Name, anInt8);
end;

function BMessage.FindInt8(const Name : PChar; var anInt8 : Shortint) : Status_t;
begin
  result := BMessage_FindInt8(CPlusObject, Name, anInt8);
end;

function BMessage.AddInt16(const Name : PChar; anInt16 : Smallint) : Status_t;
begin
  result := BMessage_AddInt16(CPlusObject, Name, anInt16);
end;

function BMessage.AddInt32(const Name : PChar; anInt32 : Integer) : Status_t;
begin
  result := BMessage_AddInt32(CPlusObject, Name, anInt32);
end;

function BMessage.AddInt64(const Name : PChar; anInt64 : int64) : Status_t;
begin
  result := BMessage_AddInt64(CPlusObject, Name, anInt64);
end;

function BMessage.AddFloat(const Name : PChar; aFloat : Single) : Status_t;
begin
  result := BMessage_AddFloat(CPlusObject, Name, aFloat);
end;

function BMessage.AddDouble(const Name : PChar; aDouble : Double) : Status_t;
begin
  result := BMessage_AddDouble(CPlusObject, Name, aDouble);
end;

function BMessage.AddString(const Name : PChar; aString : PChar) : Status_t; 
begin
  result := BMessage_AddString(CPlusObject, Name, aString);
end;

function BMessage.FindString(const Name : PChar;var aString : PChar) : Status_t; 
begin
  result := BMessage_FindString(CPlusObject, Name, aString);
end;

function BMessage.FindRef(const Name : PChar; var ref : Entry_Ref) : Status_t; 
begin
	result:=BMessage_FindRef(CPlusObject,Name,ref);
end;

function BMessage.FindRef(const Name : PChar;aindex: integer; var ref : entry_ref) : Status_t;
begin
	result:=BMessage_FindRef(CPlusObject,Name,aindex,ref);
end;

function BMessage.AddMessage(const Name : PChar; aMessage : TCPlusObject) : Status_t;	  
begin
  result := BMessage_AddMessage(CPlusObject, Name, aMessage);
end;

function BMessage.CountNames(aType : Type_Code) : Integer; 
begin
  result := BMessage_CountNames(CPlusObject, aType);
end;

function BMessage.HasSpecifiers : boolean;
begin
  result := BMessage_HasSpecifiers(CPlusObject);
end;

function BMessage.IsSystem : boolean;
begin
  result := BMessage_IsSystem(CPlusObject);
end;

function BMessage.MakeEmpty : Status_t;
begin
  result := BMessage_MakeEmpty(CPlusObject);
end;

function BMessage.IsEmpty : boolean;
begin
  result := BMessage_IsEmpty(CPlusObject);
end;

function BMessage.RemoveName(const Name : PChar) : Status_t;
begin
  result := BMessage_RemoveName(CPlusObject, Name);
end;

procedure BMessage.PrintToStream;
begin
  BMessage_PrintToStream(CPlusObject);
end;

function BMessage.RemoveData(const name : PChar; index : Integer) : Status_t;
begin
  result := BMessage_RemoveData(CPlusObject, name, index);
end;

function BMessage.WasDelivered : boolean;
begin
  result := BMessage_WasDelivered(CPlusObject);
end;

function BMessage.IsSourceRemote : boolean;
begin
  result := BMessage_IsSourceRemote(CPlusObject);
end;

function BMessage.IsSourceWaiting : boolean;
begin
  result := BMessage_IsSourceWaiting(CPlusObject);
end;

function BMessage.IsReply : boolean;
begin
  result := BMessage_IsReply(CPlusObject);
end;

function BMessage.Previous : BMessage;
begin
  result := BMessage.Wrap(BMessage_Previous(CPlusObject));
end;

function BMessage.WasDropped : boolean;
begin
  result := BMessage_WasDropped(CPlusObject);
end;

 function	BMessage.Unflatten( stream : BDataIO ):status_t;
 begin
 	result:=BMessage_Unflatten(CPlusObject,stream);
 end;

end.
