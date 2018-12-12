{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 - 2003 Olivier Coursière
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
unit Flattenable;

interface

uses
  BeObj, SupportDefs, OS;

type
  BFlattenable = class(TBeObject)
  public
    constructor Create; override;
    destructor Destroy; override;

    function IsFixedSize : Boolean;
    function TypeCode : type_code;
    function Flatten(buffer : Pointer; size : ssize_t) : status_t;
    function AllowsTypeCode(code : Type_code) : Boolean;
    function Unflatten(c : type_code; buf : Pointer; size : ssize_t) : status_t;
 end;

procedure BFlattenable_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFlattenable_Free';

function BFlattenable_IsFixedSize(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BFlattenable_IsFixedSize';
function BFlattenable_TypeCode(AObject : TCPlusObject) : type_code;
         cdecl; external BePascalLibName name 'BFlattenable_TypeCode';
function BFlattenable_Flatten(AObject : TCPlusObject; buffer : Pointer;
                              size : ssize_t) : status_t;
         cdecl; external BePascalLibName name 'BFlattenable_Flatten';
function BFlattenable_AllowsTypeCode(AObject : TCPlusObject;code : type_code)
         : boolean;
         cdecl; external BePascalLibName name 'BFlattenable_AllowsTypeCode';
function BFlattenable_Unflatten(AObject : TCPlusObject; c : type_code;
                                buf : Pointer; size : ssize_t) : Status_t;
         cdecl; external BePascalLibName name 'BFlattenable_Unflatten';

implementation

constructor BFlattenable.Create;
begin
  CreatePas;
  CPlusObject := self;
end;

destructor BFlattenable.Destroy;
begin
  if CPlusObject <> nil then
    BFlattenable_Free(CPlusObject);
  inherited;
end;

function BFlattenable.IsFixedSize : Boolean;
begin
  Result := BFlattenable_IsFixedSize(CPlusObject);
end;

function BFlattenable.TypeCode : type_code;
begin
  Result := BFlattenable_TypeCode(CPlusObject);
end;

function BFlattenable.Flatten(buffer : Pointer; size : ssize_t) : status_t;
begin
  Result := BFlattenable_Flatten(CPlusObject, buffer, size);
end;

function BFlattenable.AllowsTypeCode(code : type_code) : Boolean;
begin
  Result := BFlattenable_AllowsTypeCode(CPlusObject, code);
end;

function BFlattenable.Unflatten(c : type_code; buf : Pointer; size : ssize_t) : status_t;
begin
  Result := BFlattenable_Unflatten(CPlusObject, c, buf, size);
end;

end.
